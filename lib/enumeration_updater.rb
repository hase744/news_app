class EnumerationUpdater
  ENUMULATIONS_URL = Rails.application.credentials.news_app_constants_path + "/#{Rails.env.downcase}/data/enumerations.json"
  CATEGORY_ENUMERATIONS_URL = Rails.application.credentials.news_app_constants_path + "/#{Rails.env.downcase}/data/category_enumerations.json"

  def self.update_enumerations_and_category_enumerations
    enumerations_json = URI.open(ENUMULATIONS_URL).read
    category_enumerations_json = URI.open(CATEGORY_ENUMERATIONS_URL).read

    enumerations_hash = JSON.parse(enumerations_json)
    category_enumerations_hash = JSON.parse(category_enumerations_json)

    update_enumerations(enumerations_hash)
    update_category_enumerations(category_enumerations_hash)
  end

  private
  def self.update_enumerations(enumerations_hash)
    # 既存のEnumerationのnameからidを取得
    existing_enumerations_hash = Enumeration
      .where(sort: enumerations_hash.keys)
      .pluck(:sort, :id)
      .to_h { |sort, id| [sort, id] }

    existing_enumerations_array = []
    new_enumerations_array = []

    enumerations_hash.each do |sort, words|
      data = {
        sort: sort,
        words: words['words']
      }

      if existing_enumerations_hash[sort]
        data[:id] = existing_enumerations_hash[sort]
        existing_enumerations_array << data
      else
        new_enumerations_array << data
      end
    end

    deleting_enumerations = Enumeration
      .where.not(id: existing_enumerations_hash.values)

    Enumeration.where(id: deleting_enumerations.pluck(:id)).destroy_all unless deleting_enumerations.empty?
    Enumeration.upsert_all(existing_enumerations_array) unless existing_enumerations_array.empty?
    Enumeration.insert_all(new_enumerations_array) unless new_enumerations_array.empty?
  end

  def self.update_category_enumerations(category_enumerations_hash)
    # 既存のCategoryとEnumerationのIDを取得
    categories = Category.where(name: category_enumerations_hash.keys).pluck(:name, :id).to_h
    enumerations = Enumeration.where(sort: category_enumerations_hash.values.flatten.uniq).pluck(:sort, :id).to_h

    category_enumerations_array = []
    category_enumerations_hash.each do |category_name, sorts|
      category_id = categories[category_name]
      next if category_id == nil
      sorts.each do |sort|
        enumeration_id = enumerations[sort]
        category_enumerations_array << {
          category_id: category_id,
          enumeration_id: enumeration_id
        }
      end
    end

    conditions = category_enumerations_array.map do |pair|
      CategoryEnumeration.where(pair).arel.constraints.reduce(:and)
    end

    existing_category_enumerations_array = CategoryEnumeration.where(
      conditions.reduce(:or)
    ).map{ |cm|
      {
        id: cm.id,
        category_id: cm.category_id,
        enumeration_id: cm.enumeration_id
      }
    }

    deleting_category_enumerations_array = CategoryEnumeration.where.not(
      id: existing_category_enumerations_array.pluck(:id)
    ).map{ |cm|
      {
        id: cm.id,
        category_id: cm.category_id,
        enumeration_id: cm.enumeration_id
      }
    }
    new_category_enumerations_array = category_enumerations_array - existing_category_enumerations_array.map{ |cm|
      {
        category_id: cm[:category_id],
        enumeration_id: cm[:enumeration_id]
      }
    }

    CategoryEnumeration.where(id: deleting_category_enumerations_array.pluck(:id)).destroy_all unless deleting_category_enumerations_array.empty?
    CategoryEnumeration.insert_all(new_category_enumerations_array) unless new_category_enumerations_array.empty?
  end
end