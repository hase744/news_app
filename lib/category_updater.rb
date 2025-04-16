class CategoryUpdater
  CATEGORIES_URL = Rails.application.credentials.news_app_constants_path + "/#{Rails.env.downcase}/data/categories.json"

  def self.update_categories
    categories_json = URI.open(CATEGORIES_URL).read
    categories_hash = JSON.parse(categories_json)

    category_keys = categories_hash.keys
    existing_categories = Category
      .where(name: category_keys)
      .pluck(:name, :id, :parent_category_id)
      .to_h do |name, id, parent_category_id| [
          name, 
          { 
            id: id, 
            parent_category_id: parent_category_id 
          }
        ] 
      end

    # categories_hashにIDとparent_category_idを追加
    categories_hash.each do |name, data|
      if existing_categories[name]
        data['id'] = existing_categories[name][:id]
        data['parent_category_id'] = existing_categories[name][:parent_category_id]
      end
    end

    # IDの有無で配列を分ける
    existing_categories_array = []
    new_categories_array = []

    categories_hash.each do |name, data|
      category = {
        name: name,
        japanese_name: data['japanese_name'],
        start_at: data['start_at'],
        is_default: data['is_default'],
        is_formal: data['is_formal'],
        emoji: data['emoji'],
        parent_category_id: data['parent_category_id']
      }

      if data['id'] # IDがある場合は既存レコードとして扱う
        category[:id] = data['id'] if data['id']
        existing_categories_array << category
      else # IDがない場合は新規レコードとして扱う
        new_categories_array << category
      end
    end

    Category.upsert_all(existing_categories_array) unless existing_categories_array.empty?
    Category.insert_all(new_categories_array) unless new_categories_array.empty?
  end
end