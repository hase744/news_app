# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative 'enumerations.rb'
require_relative 'channels.rb'

def save_categories(categories)
    categories.each do |category_hash|
        start_at = category_hash[:is_started] ? DateTime.new(2023, 1, 1) : nil
        category = Category.find_by(name: category_hash[:name])
        if category.present?
            category.update(
                japanese_name:category_hash[:japanese_name],
                emoji:category_hash[:emoji],
                is_default:category_hash[:is_default],
                is_formal:category_hash[:is_formal],
                start_at: start_at,
                parent_category: Category.find_by(name: category_hash[:parent_category])
                )
        else
            category = Category.create(
                name: category_hash[:name], 
                japanese_name:category_hash[:japanese_name],
                emoji:category_hash[:emoji],
                is_default:category_hash[:is_default],
                is_formal:category_hash[:is_formal],
                start_at: start_at,
                parent_category: Category.find_by(name: category_hash[:parent_category])
                )
        end
        puts "カテゴリ : " + category_hash[:name]
        if category_hash[:variable]
            category_hash[:variable].each do |words_hash|
                enum = Enumeration.find_by(sort: words_hash[:sort])
                if enum.present?
                    enum.update(
                        sort:words_hash[:sort],
                        words:words_hash[:words].join(",")
                    )
                    CategoryEnumeration.find_or_create_by!(
                        enumeration: enum,
                        category: category
                    )
                else
                    enum = Enumeration.create(
                        sort:words_hash[:sort],
                        words:words_hash[:words].join(",")
                    )
                    enum.category_enumerations.create(
                        category:category,
                    )
                end
            end
        end
    end
end

parent_categories = [
    {name:"business", japanese_name:"ビジネス", variable: @business, is_started: true, is_default: true, is_formal:true, emoji:'💼'},
    {name:"politics", japanese_name:"政治", variable: @politics, is_started: true, is_default: true, is_formal:true, emoji:'🏛️'},
    {name:"technology", japanese_name:"テクノロジー", variable: @technology, is_started: true, is_default: true, is_formal:true, emoji:'🤖'},
    {name:"economy", japanese_name:"経済", variable: @economy, is_started: true, is_default: true, is_formal:true, emoji:'🏦'},
    {name:"world", japanese_name:"世界", variable: @world, is_started: true, is_default: true, is_formal:true, emoji:'🌍'},
    {name:"equity_investment", japanese_name:"株式投資", variable: @equity_investment, is_started: true, is_default: true, is_formal:true, emoji:'📈'},
    {name:"real_estate_investment", japanese_name:"不動産投資", variable: @real_estate_investment, is_started: true, is_default: true, is_formal:true, emoji:'🏢'},
    {name:"fx_trade", japanese_name:"FX", variable: @fx_trade, is_started: true, is_default: false, is_formal:true, emoji:'💱'},
    {name:"cryptocurrency", japanese_name:"仮想通貨", variable: @cryptocurrency, is_started: true, is_default: false, is_formal:true, emoji:'₿'},
    {name:"military", japanese_name:"軍事", variable: @military, is_started: true, is_default: true, is_formal:true, emoji:'🪖'},
    {name:"game", japanese_name:"ゲーム", is_started: true, is_default: true, is_formal:true, emoji:'🎮'},
    {name:"trend", japanese_name:"話題", is_started: true, is_default: true, is_formal:true, emoji:'💬'},
    {name:"necessity", japanese_name:"日用品", variable: @necessity, is_started: true, is_default: true, is_formal:true, emoji:'🛒'},
    {name:"lifehack", japanese_name:"ライフハック", variable:@lifehack, is_started: true, is_default: true, is_formal:true, emoji:'🔧'},
    {name:"beauty", japanese_name:"美容",variable: @beauty, is_started: true, is_default: true, is_formal:true, emoji:'💄'},
    {name:"mobility", japanese_name:"自動車", is_started: true, is_default: true, is_formal:true, emoji:'🚙'},
    {name:"gadget", japanese_name:"ガジェット", variable: @gadget, is_started: true, is_default: true, is_formal:true, emoji:'🖥'},
    {name:"sports", japanese_name:"スポーツ", variable: @sports, is_started: true, is_default: true, is_formal:true, emoji:'🏃'},
    {name:"male_love", japanese_name:"男性恋愛", variable:@love, is_started: true, is_default: true,variable: @fashion, is_formal:true, emoji:'💙'},
    {name:"female_love", japanese_name:"女性恋愛", variable:@love, is_started: true, is_default: true, is_formal:true, emoji:'💜'},
    {name:"womens_fashion", japanese_name:"女性ファッション",variable: @fashion, is_started: true, is_default: true, is_formal:true, emoji:'👗'},
    {name:"mens_fashion", japanese_name:"男性ファッション",variable: @fashion, is_started: true, is_default: true, is_formal:true, emoji:'👕'},
    {name:"money_finance", japanese_name:"家計", variable: @money_finance, is_started: true, is_default: true, is_formal:true, emoji:'💸'},
    {name:"stationary", japanese_name:"文房具", variable: @stationary, is_started: true, is_default: false, parent_category: 'necessity', is_formal:true, emoji:'✒️'},
    {name:"cooking", japanese_name:"料理", variable: @cooking, is_started: true, is_default: true, is_formal:true, emoji:'🍳'},
    {name:"gourmet", japanese_name:"グルメ", variable: @gourmet, is_started: true, is_default: true, is_formal:true, emoji:'🍽️'},
    {name:"it_tool", japanese_name:"ITツール", variable: @it_tool, is_started: true, is_default: true, is_formal:true, emoji:'📱'},
    {name:"sweets_gourmet", japanese_name:"スイーツグルメ", variable: @sweets_gourmet, is_started: true, is_default: false, is_formal:true, emoji:'🧋'},
    {name:"new_job", japanese_name:"副業・自営業", variable: @new_job, is_started: true, is_default: true, is_formal: false, emoji:'🈺'},
    {name:"carrior", japanese_name:"キャリア", variable: @carrior, is_started: true, is_default: true, is_formal:true, emoji:'🧑‍💼'},
]

save_categories(parent_categories)

child_categories = [
    {name:"soccer", japanese_name:"サッカー", variable: @soccer, is_started: true, is_default: true, parent_category: 'sports', is_formal:true, emoji:'⚽'},
    {name:"baseball", japanese_name:"野球", variable: @baseball, is_started: true, is_default: true, parent_category: 'sports', is_formal:true, emoji:'⚾'},
    {name:"sweets_cooking", japanese_name:"スイーツ作り", variable: @sweets_cooking, is_started: true, is_default: false, is_formal:true, emoji:'🍰'},
    {name:"bread_cooking", japanese_name:"パン作り", variable: @bread_cooking, is_started: true, is_default: false, is_formal:false, emoji:'🍞'},
    {name:"reselling", japanese_name:"転売・せどり", variable: @reselling, is_started: true, is_default: false, parent_category: 'new_job', is_formal:false, emoji:''},
    {name:"sns", japanese_name:"SNS", variable: @sns, is_started: true, is_default: false, parent_category: 'new_job', is_formal:false, emoji:''},
]

save_categories(child_categories)


exceptions = {
    "common" => %(報告 銀の盾 金の盾),
    "ノート" => %(ノートパソコン)
}

@channel_seeds.each do |channel|
    channels = @channel_seeds.select {|hash| hash["url"] == channel["url"]}
    puts "被り" + channel["url"] if channels.length > 1
end


Parallel.each(@channel_seeds) do |seed|
    category_names = seed["categories"]
    categories = Category.where(name: category_names).map { |category| { "id" => category.id, "name" => category.name } }
    channel = Channel.find_or_create_by(url:seed["url"])
    #puts channel.youtube_id
    puts channel.id
    categories.each do |c|
        if category_names.length == 1 || (seed["absolute"].present? && seed["absolute"].include?(c["name"]))
            ChannelCategory.find_or_create_by!(channel: channel, category_id:c["id"], is_absolute: true)
        else
            ChannelCategory.find_or_create_by!(channel: channel, category_id:c["id"])
        end
    end
end

#被りを取得
duplicates = Channel.select(:youtube_id).group(:youtube_id).having('count(*) > 1')
puts "被り : #{duplicates}"
#channel_seeds.each do |seed|
#    category_names = seed["categories"]
#    categories = Category.where(name: category_names).map { |category| { "id" => category.id, "name" => category.name } }
#    channel = Channel.find_by(url:seed["url"])
#end

AdminUser.create(email: ENV["EMAIL1"], password: ENV["PASSWORD"], password_confirmation: ENV["PASSWORD"]) if not AdminUser.exists?(email:ENV["EMAIL1"])