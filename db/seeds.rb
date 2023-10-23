# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

currency = {sort:"currency",words:%w(
    為替 円安 急騰 暴落 円高 値上 値下 ドル安 ドル高 ユーロ ポンド 人民元 ウォン 通貨)}
investment = {sort:"investment",words:%w(
    再投資 機関投資家 分散投資 長期投資 投資信託 不動産投資 利回り 株 株価 株式 債券 証券 ETF 社債 国債
    新株 増資 増収 減収 増益 減益 優先株 IPO 信用取引 制裁 資本
    証拠金取引 信用リスク 流動性リスク 配当 信託 米国株 買収 資産 運用
    ファンド 普通株 償還 取引所 空売り 買い付け 売買 先物取引)}
macro_economy = {sort:"macro_economy",words:%w(
    GDP 国内総生産 国民総生産 GNP インフレ デフレ 財政 金利 景気 収支 マーケット
    恐慌 失業率 失業率 貿易収支 貿易統計 貿易赤字 財政黒字 財政赤字 貿易黒字 市場経済 計画経済 関税 雇用
    財務 格付け バブル 不況 市場 生産性 格差 賃金 賃上げ 石油価格 原油価格 ガソリン価格 小麦価格 米価格 トウモロコシ価格 食料価格)}
unique_noun = {sort:"unique_noun",words:%w(
    アベノミクス リーマンショック バフェット フォール街)}
economy_general = {sort:"general",words:%w(
   金融 年金 決算 破綻 銀行 日銀 連邦準備 FRB
   )}
crypro_currency = {sort:"crypro_currency",words:%w(ビッドコイン 仮想通貨 暗号通貨 イーサリアム)}
economy = [currency, investment, macro_economy, unique_noun, unique_noun, economy_general]

technology_general = {sort:"technology_general",words:%w(
    テクノロジー テック 発明 ノーベル 自動化 自動翻訳 全自動 自動追跡 自動検出 3Dプリンタ)}
technology_phrase = {sort:"technology_phrase",words:%w(
    技術力 新技術 技術国 新型 次世代 新機能 新端末 新サービス 自動化 自動翻訳 全自動 自動追跡 3Dプリンタ)}
space = {sort:"space",words:%w(ロケット 宇宙船 推進剤 エンジン 推力 探査機 探査船
        軌道 宇宙空間 宇宙飛行士 有人宇宙飛行 無人宇宙探査 宇宙ミッション 打ち上げ台 空力学 地球周回軌道
        静止軌道 ペイロード ペイロードフェアリング コントロールシステム スターリンク コンステレーション
        遠隔操作 再使用型ロケット 宇宙開発 火星探査 月面着陸)}
it = {sort:"IT",words:%w(IT AI 人工知能 VR メタバース ワイヤレス ロボット ロボ コンピューター ソフトウェア ハードウェア
        プログラム データ コンピューティング データベース 半導体 サイバー サーバー チップ 暗号資産 暗号通貨
        プログラミング ファイアウォール ウイルス マルウェア ハッカー テクノロジー 顔認証 指紋認証 声認証
        インターフェース ブラウザ Iot インターネット・オブ・シングス 人工知能 機械学習 システム メタ
        ビッグデータ 仮想化 ブロックチェーン コーディング デジタル ハイパーテキスト API GUI UI UX クリプトグラフィ IOWN
        )}
biotech = {sort:"biotech",words:%w(
        細胞 不老不死 老化 IPS細胞 ES細胞 ゲノム ゲノム編集 クローニング DNA合成 RNA編集 タンパク質合成 遺伝子発現 プラスミド
         クリスパー-Cas9 PCR プロテオミクス ゲノム解析 バイオインフォマティクス タンパク質異常 シーケンシング 細胞培養
          バイオセンサー シークエンシング ゲノムマッピング 分子クローニング 分子生物学 ゲノムシーケンシング 遺伝子療法
           転写因子 分子診断 ゲノム研究 クロマトグラフィー 生物学的工学 細胞工学 シクロトロン ゲノムプロジェクト
            ナノバイオテクノロジー ゲノム改変 分子診療 遺伝子変異解析 脳内チップ 医療ベンチャー
            )}
energy = {sort:"energy",words:%w(核融合 全個体 全樹脂 燃料電池 太陽電池 再生エネルギー 再生可能 合成燃料)}
vehicle = {sort:"vehicle",words:%w(
    ドローン 空飛ぶ 超電導 無人機 無人レジ 無人店舗 無人自動車 無人車 無人ヘリ 
    無人航空 自動運転 電動 急速充電)}
tech_person = {sort:"tech_person",words:%w(イーロン マスク氏 ザッカーバーグ ティムクック サム・アルトマン)}
technology = [technology_general, space, it, biotech, energy, vehicle]

politics_general = {sort:"politics_general",words:%w(
    政治 内閣 政府 政策 法律 参議院 衆議院 議員 議会 選挙 与党 野党 首相 大統領 大臣 補佐官 担当官 官庁 省庁
    政治思想 自由主義 保守主義 社会主義 共産主義 ポピュリズム 
    連立政権 一党制 多党制 政治的な信念 政治的な運動 政治犯 投票 投票権 投票率
    政治寄付 ロビー 有権者 選挙制度 選挙区 内政 対外政策 規制 対抗措置
    戦争 平和 軍備 安全 安全保障 自治 国際関係 司法 最高裁 憲法
    人権 侵害 公共 統治 行政 福祉 国民)}
cabinet = {sort:"cabinet",words:%w(
    財務省 国税庁 防衛省 警察庁 外務省 文部科学省 文科省 スポーツ庁 文化庁 文部省 経済産業省 経産省 環境省 厚生労働省 厚生省 農林水産省 農水省 国土交通省
     国交省 観光庁 内閣府 法務省 総務省 国立公安委員会 消防庁 消防庁 内閣官房 防災省 復興庁 デジタル庁
     )}
politics_person = {sort:"politics_person",words:%w(岸田 河野 麻生 高市)}
party = {sort:"party",words:%w(自民党 民主党 公明党 日本維新 共産党 れいわ新選組 賛成党 政治家女子48党 総裁 幹事長 総務会長 政務調査会長 特別補佐)}
politics = [politics_general, cabinet, politics_person, party]

life_general = {sort:"general",words:%w(グッズ 便利 小物 生活 対策グッズ 用品 コスパ 掘り出し物 ベストバイ アイテム 防寒 用品) }
life_item = {sort:"item",words:%w(文具 文房具 手帳 ノート ボールペン 財布 靴 ホルダー 家電)}
life_phrase = {sort:"phrase",words:%w(買うべき 買ってよかった 買って良かった 買わないと損 これ１台 これ１冊 これ１本 おすすめ オススメ 一推し イチオシ 激推し)}
brand_brand = {sort:"brand",words:%w(無印 ニトリ ダイソー DAISO キャンドゥ セリア Seria ワークマン 百均 100均 100円 )}
life_goods = [life_general, life_item, life_phrase, brand_brand]

lifehack_method = {sort:"method",words:%w(活用法 活用術 生活術 裏技 収納法 ミニマル ミニマリスト 機能 用途 方法 使い方 習慣 コツ)}
lifehack_phrase = {sort:"lifehack_phrase",words:%w(買うべき 買ってよかった 買って良かった 買わないと損 これ１台 これ１冊 おすすめ 激推し ラク 時短)}
lifehack_brand = {sort:"brand",words:%w(無印 ニトリ ダイソー DAISO Seria セリア キャンドゥー ワークマン IKEA イケア 百均 100均 100円)}
lifehack = [lifehack_method,lifehack_phrase,lifehack_brand,life_general]

cosmetic = {sort:"cosmetic",words:%w(化粧 美容 コスメ メイク ファンデーション リップスティック アイシャドウ マスカラ ブラッシュ アイライナー 
    リップグロス コンシーラー メイクアップリムーバー ファセットナー リップバーム ネイル フェイスマスク シートマスク シャンプー コンディショナ
    ボディローション ハイライト コントゥアリング メイクブラシ 日焼け止め 洗顔 ケアパウダ ファンデ アイプチ 乳液 クレンジング
    ピテラ トリートメント レチノール アイクリーム グリセリン ハンドクリーム ソープ 石鹸
    )}
body = {sort:"body",words:%w(肌 スキン 皮膚 しわ シワ しみ シミ たるみ 鼻 毛穴 角栓 皮脂 まつ毛 まつげ ニキビ にきび ほうれい線)}
shape = {sort:"shape",words:%w(整形 2重 ツルツル すべすべ つや ツヤ 美白 癖毛 剛毛 軟毛 さらさら サラサラ 赤み 墨 乾燥)}
fashion = {sort:"fashion",words:%w(ファッション)}
beauty = [cosmetic, body, shape, fashion]

gadget_general = {sort:"general",words:%w(
        機器 端末 デバイス ガジェット バッテリー スマートフォン スマホ ラップトップ デスクトップ PC パソコン 充電 Bluetooth ブルートゥース wi-fi wifi 加湿器
        イヤホン ヘッドフォン スピーカー ウォッチ カメラ プロジェクター モバイル マウス キーボード タッチスクリーン USB lightning コントローラー スタンド ノイズキャンセリング ノイキャン
    )}
gadget_brand = {sort:"gadget_brand",words:%w(Apple Samsung Huawei Xiaomi Oppo Vivo Sony LG Google OnePlus Motorola Nokia)}
gadget_seris = {sort:"gadget_seris",words:%w(iPhone iPad MacBook AirPods Galaxy Mata Redmi AQUOS ChromeBook Xperia Pixel Anker GoPro Switch スイッチ ps5 プレステ プレイステーション)}
gadget_phrase = {sort:"gadget_phrase",words:%w(高音質 高画質 高性能 高容量 大容量 高出力 大出力)}
gadget = [gadget_general, gadget_brand, gadget_seris, gadget_phrase]

sales = {sort:"sales",words:%w(営業 セールス 商談 売る 売れる 客 クロージング アポ プレゼン)}
accounting = {sort:"accounting",words:%w(収益 コスト 利益 ROI 資産 負債 利益 コスト キャッシュフロー マージン 単価)}
management = {sort:"management",words:%w(経営 マネジメント チームビルディング リーダーシップ  組織文化 ガバナンス オペレーション 戦略計画 目標設定)}
marketing = {sort:"marketing",words:%w(
        マーケティング  ターゲット ターゲティング マーケット プロモーション ブランディング 事業 セグメンテーション フランチャイズ SWOT
        ニッチ市場 マーケットリサーチ 市場シェア 顧客満足度 顧客ロイヤルティ チャネル戦略 供給チェーン バリュエーション
        販売戦略 コアコンピタンス 販売促進 販促 グローバル戦略 コンバージョン率
    )}
business_model = {sort:"business_model",words:%w(
        アウトソーシング パートナーシップ ライセンス
    )}
business_general = {sort:"business_general",words:%w(
    ビジネス KPI  顧客 リサーチ ミッションステートメント グロースハック バリュープロポジション バリューチェーン ステークホルダー
    シェアホルダー ピッチ 起業 ビジョン  パフォーマンス
)}
business = [sales, accounting, management, marketing, business_model, business_general]

work = [sales]

treaty = {sort:"treaty",words:%w(協定 クアッド 条約 ASEAN EU RCEP NATO TPP Quad)}
two_countries = {sort:"two_countries",words:%w(日印 日英 日韓 日豪 日中 日朝 日独 日仏 日米 日露 米中 米露)}
abbreviation = {sort:"abbreviation",words:%w(
       アラブ 北朝鮮 コンゴ バチカン ボリバル ボリビア
       モルドバ マケドニア ユーゴスラビア ラオス ロシア
       )}
country = {sort:"country",words:%w(アイスランド アイルランド アゼルバイジャン アフガニスタン
       ヴァージン諸島 サモア アラブ首長国連邦 アルジェリア アルゼンチン アルバ アルバニア
      アルメニア アンギラ アンゴラ アンティグア・バーブーダ アンドラ イエメン イギリス
      インド洋地域 ヴァージン諸島 イスラエル イタリア イラク イラン・イスラム共和国 インド
      インドネシア ウォリス・フツナ ウガンダ ウクライナ ウズベキスタン ウルグアイ エクアドル
      エジプト エストニア エチオピア エリトリア エルサルバドル オーストラリア オーストリア オーランド諸島
      オマーン オランダ ガーナ カーボベルデ ガーンジー ガイアナ カザフスタン カタール 合衆国領有小離島
      カナダ ガボン カメルーン ガンビア カンボジア 北マリアナ諸島 ギニア ギニアビサウ キプロス キューバ
      キュラソー ギリシャ キリバス キルギス グアテマラ グアドループ グアム クウェート クック諸島
      グリーンランド クリスマス島 グレナダ クロアチア ケイマン諸島 ケニア コートジボワール ココス諸島
      キーリング諸島 コスタリカ コモロ コロンビア コンゴ共和国 コンゴ民主共和国 サウジアラビア
      サウスジョージア・サウスサンドウィッチ諸島 サモア サンンシペ サン・バルテルミー ザンビア サンピエール島・ミクロン島
      サンマリノ サン・マルタン シエラレオネ ジブチ ジブラルタル ジャージー ジャマイカ ジョージア シリア・アラブ共和国
      シンガポール シント・マールテン ジンバブエ スイス スウェーデン スーダン スヴァールバル諸島 ヤンマイエン島 スペイン
      スリナム スリランカ スロバキア スロベニア スワジランド セーシェル 赤道ギニア セネガル セルビア セントクリストファー・ネイビス
      セントビンセント グレナディーン諸島 セントヘレナ・アセンションおよびトリスタンダクーニャ セントルシア ソマリア ソロモン諸島
      タークス・カイコス諸島 タイ 大韓民国 台湾 中華民国 タジキスタン タンザニア チェコ チャド 中央アフリカ共和国
      中華人民共和国 チュニジア 朝鮮民主主義人民共和国 チリ ツバル デンマーク ドイツ トーゴ トケラウ ドミニカ共和国
      ドミニカ国 トリニダード・トバゴ トルクメニスタン トルコ トンガ ナイジェリア ナウル ナミビア 南極 ニウエ ニカラグア
      ニジェール 西サハラ ニューカレドニア ニュージーランド ネパール ノーフォーク島 ノルウェー ハード島 マクドナルド諸島
      バーレーン ハイチ パキスタン バチカン市国 パナマ バヌアツ バハマ パプアニューギニア バミューダ パラオ パラグアイ
      バルバドス パレスチナ ハンガリー バングラデシュ 東ティモール ピトケアン フィジー フィリピン フィンランド ブータン
      ブーベ島 プエルトリコ フェロー諸島 フォークランド諸島 マルビナス諸島 ブラジル フランス ギアナ ポリネシア ブルガリア
      ブルキナファソ ブルネイ・ダルサラーム ブルンジ ベトナム ベナン ベネズエラ・ボリバル共和国 ベラルーシ ベリーズ ペルー
      ベルギー ポーランド ボスニア・ヘルツェゴビナ ボツワナ ボネール、シント・ユースタティウスおよびサバ ボリビア多民族国 ポルトガル
      香港 ホンジュラス マーシャル諸島 マカオ マケドニア旧ユーゴスラビア共和国 マダガスカル マヨット マラウイ マリ マルタ
      マルティニーク マレーシア マン島 ミクロネシア連邦 南アフリカ 南スーダン ミャンマー メキシコ モーリシャス モーリタニア
      モザンビーク モナコ モルディブ モルドバ共和国 モロッコ モンゴル モンテネグロ モントセラト ヨルダン ラオス人民民主共和国
      ラトビア リトアニア リビア リヒテンシュタイン リベリア ルーマニア ルクセンブルク ルワンダ レソト レバノン レユニオン ロシア連邦)}
organization = {sort:"organization",words:
    %w(国連 IMF 世界銀行 WTO WHO IAEA OECD NATO UNESCO ASEAN OPEC G7 G20)
    }
world = [treaty, two_countries, abbreviation, country, organization]

war = {sort:"war",words:
        %w(軍 戦争 戦闘 兵役 軍隊 戦場 攻撃 防御 兵士 戦艦 航空戦 戦略 戦術 戦勝 敗戦 戦争犯罪 非戦闘員
        平和 武器 軍事 講和 軍備拡張 軍縮 占領 戦争賠償 内戦 国際紛争 戦時国際法 戦争犠牲者 戦争孤児 捕虜
       核戦争 世界大戦 派兵 布告 宣戦布告 戦争中立 徴兵 戦争記念日 軍事演習 武装解除 停戦協定 戦争 軍隊 戦闘
       軍事 攻撃 侵攻 防御 反撃 戦略 戦術 兵士 戦犯 武器 戦争責任 占領 休戦 和平交渉
       軍事同盟 争い 戦禍 戦時 軍備 無差別攻撃 戦闘員 戦地 戦場 軍事作戦 徴兵 軍事力
       )}
weopon = {sort:"weopon",words:
            %w()
        }
military_general = {sort:"military_general",words:
            %w(安全保障 陸自 陸上自衛隊 海自 自衛隊 空自 航空自衛隊)
        }
military = [weopon, war, military_general]

categories = [
    {name:"business", japanese_name:"ビジネス", variable:business, is_started: true, is_default: true},
    {name:"politics", japanese_name:"政治", variable:politics, is_started: true, is_default: true},
    {name:"technology", japanese_name:"テクノロジー", variable:technology, is_started: true, is_default: true},
    {name:"economy", japanese_name:"経済", variable:economy, is_started: true, is_default: true},
    {name:"world", japanese_name:"世界", variable:world, is_started: true, is_default: true},
    {name:"military", japanese_name:"軍事", variable:military, is_started: true, is_default: true},
    {name:"game", japanese_name:"ゲーム", is_started: true},
    {name:"trend", japanese_name:"話題", is_started: true, is_default: true},
    {name:"life goods", japanese_name:"ライフグッズ", is_started: true, is_default: true},
    {name:"lifehack", japanese_name:"ライフハック", is_started: true},
    {name:"beauty", japanese_name:"美容", is_started: true},
    {name:"mobility", japanese_name:"自動車", is_started: true},
]
categories.each do |category_hash|
    start_at = category_hash[:is_started] ? DateTime.new(2023, 1, 1) : nil
    category = Category.find_or_create_by(
        name: category_hash[:name], 
        japanese_name:category_hash[:japanese_name],
        start_at: start_at
        )
    puts category_hash[:name]
    if category_hash[:variable]
        category_hash[:variable].each do |words_hash|
            list = Enumeration.find_by(sort: words_hash[:sort])
            if list.present?
                list.update(
                    sort:words_hash[:sort],
                    words:words_hash[:words].join(",")
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

exceptions = {
    "common" => %(報告 銀の盾 金の盾),
    "ノート" => %(ノートパソコン)
}

channel_seeds = [
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@takahashi_yoichi", "categories" => %w(business politics economy world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@mykey-sano", "categories" => %w(business politics technology economy)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@3.0", "categories" => %w(politics economy world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@mitsuhashipress", "categories" => %w(politics economy world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@FIFIchannel", "categories" => %w(politics economy world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kazuyachgx", "categories" => %w(politics economy world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-rb3pn7uz3m", "categories" => %w(politics economy world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ytv_news", "categories" => %w(politics economy world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@DEEPMAX", "categories" => %w(politics economy)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@mofmof-investor", "categories" => %w(politics economy business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@NewsPicks", "categories" => %w(business technology)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@diy4600", "categories" => %w(politics economy)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@tsj_otb", "categories" => %w(world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@milirepo", "categories" => %w(politics economy)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-uy4cr9se8j", "categories" => %w(world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@maomao96363", "categories" => %w(politics world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@oikawa_yukihisa1", "categories" => %w(world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kazuyachgx", "categories" => %w(politics economy)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@WWUK_TV", "categories" => %w(world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ntv_news", "categories" => %w(politics technology economy world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ANNnewsCH", "categories" => %w(politics technology economy world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@FNNnewsCH", "categories" => %w(politics technology economy world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@tbsnewsdig", "categories" => %w(politics technology economy world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@mbsnews", "categories" => %w(politics technology economy)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@prime_ABEMA", "categories" => %w(politics technology economy world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@tvtokyobiz", "categories" => %w(politics technology economy world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@abc6ch", "categories" => %w(politics technology economy world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@takaponjp", "categories" => %w(politics technology economy world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@tvosakanews", "categories" => %w(politics technology economy)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@htbnews", "categories" => %w(politics technology economy)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@CHUKYOTV_NEWS", "categories" => %w(politics technology economy)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@KyodoNews", "categories" => %w(politics technology economy world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@NagoyaTVnewsCH", "categories" => %w(politics technology economy)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@khb", "categories" => %w(politics technology economy)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@habmigochannel", "categories" => %w(politics technology economy)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@cbctv_news", "categories" => %w(politics technology economy)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@SankeiNews", "categories" => %w(politics technology economy)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@news_sokuho", "categories" => %w(politics)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@TsukasaJonen", "categories" => %w(politics)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@BBCNewsJapan", "categories" => %w(world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@Invest_and_Living", "categories" => %w(war)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@primenews/", "categories" => %w(world politics war)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@news_8ch", "categories" => %w(politics)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@JAPANnpj", "categories" => %w(politics)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@suntv_news_Japan", "categories" => %w(politics other)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@Bungeishunju", "categories" => %w(politics war)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@watanabetetuya-show", "categories" => %w(politics economy war)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@News_ABEMA", "categories" => %w(politics economy world war trend)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@seikeidenronTV", "categories" => %w(business politics)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-td7uu8sb7u", "categories" => %w(politics)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ChGrandStrategy", "categories" => %w(politics technology economy world war)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@skoichi", "categories" => %w(politics trend)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@shigoto", "categories" => %w(business work)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@USAMilitaryChannel2", "categories" => %w(military)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@nikkanshunshun", "categories" => %w(politics economy world war trend)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@toranomonnews", "categories" => %w(politics economy world war trend)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-le9qv3yz9r", "categories" => %w(politics economy world war trend)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@gototatsuya", "categories" => %w(economy)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@NikkeiCNBC", "categories" => %w(economy technology war)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ReutersJapan", "categories" => %w(world economy technology)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@aichi-news", "categories" => %w(economy technology business war)},
    
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-du7gi7mt4w", "categories" => %w(world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-xb3px7to3b", "categories" => %w(world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@yoakemaeplayers", "categories" => %w(world)},
    
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@monozukuritarou", "categories" => %w(technology)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@erestage", "categories" => %w(technology)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@Ch-dp9or", "categories" => %w(technology)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@YamatoNadeshiko", "categories" => %w(technology)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@nex.kougyo", "categories" => %w(technology)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@stec1124", "categories" => %w(technology)},
    {"youtube_id"=>"", "url"=>"https://youtube.com/@semiconductor-industry", "categories" => %w(technology)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@AMANOSCOPE", "categories" => %w(technology business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@remote-work", "categories" => %w(technology business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@bouncy", "categories" => %w(technology business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@nikkei", "categories" => %w(business technology)},

    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@manabusiness", "categories" => %w(business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@honmanachannel", "categories" => %w(business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@pivot8935", "categories" => %w(business, technology)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@sam-book", "categories" => %w(business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@sonsera_ch", "categories" => %w(business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@gakushikisaron", "categories" => %w(business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@shin_R25", "categories" => %w(business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@salatame", "categories" => %w(business lifehack)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ryukkebibinnba", "categories" => %w(business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@nensyu_channel", "categories" => %w(business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ryogakucho", "categories" => %w(business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@tabbata", "categories" => %w(business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@MABANK2018", "categories" => %w(business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@rakumachi", "categories" => %w(business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@YoshikiOkamotoWorkshop", "categories" => %w(business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@oohorisouta-doruma", "categories" => %w(business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-cb7xb1lh2m", "categories" => %w(business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@flier6114", "categories" => %w(business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@rehacq", "categories" => %w(business world politics)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-hr1by4lc1w", "categories" => %w(business world politics)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@tomomura", "categories" => %w(business technology)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@webshokutv", "categories" => %w(business technology)},

    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@gunjitsuushin", "categories" => %w(military)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@USAMilitaryChannel2", "categories" => %w(military technology)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@world-military", "categories" => %w(military)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@nihongunji", "categories" => %w(military)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@gunjitimes", "categories" => %w(military)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-wg8yz1iw2m", "categories" => %w(military)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@gunji-puress", "categories" => %w(military)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@yukkurigunjinews", "categories" => %w(military)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@himarianri", "categories" => %w(military)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-bd2zz8di8q", "categories" => %w(military)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-ur6kq7jy2q", "categories" => %w(military)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-ed7kj2yg1y", "categories" => %w(military)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@milirepo", "categories" => %w(military)},

    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-ys8zx2om4s", "categories" => %w(weopon)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@weapondou", "categories" => %w(weopon)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@Dangan_D_March", "categories" => %w(military weopon), "absolute"=> %w(weopon)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@c-labo-japanesemilitaryinf1328", "categories" => %w(weopon)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@YoshikiOkamotoWorkshop", "categories" => %w(weopon)},

    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@cabbage_games", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@YoshikiOkamotoGameCh", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@sora_sakurai_jp", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@OYAYUVI", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@gameyawa", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-ys6bh5zc3k", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@gameyawa", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@dengekionline", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@nakaido", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@midnight_chimau", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@NintendoJP", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@PlayStationJapan", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ichigo_Gamebeat", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@capcom", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@squareenix", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@NayneGamez", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@chomes3104", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@keiji_ch", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@automatonchannel", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@pandaiku", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@steamharachin", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@stmatomato", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@yamachan-game-giriikiteru", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@-ch-qx5lh", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@odesigame", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@omigames", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@akagitotoro", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kotoragame", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kentworldg", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@D_Galle", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@SmithAndGames", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kelloggsan_tv", "categories" => %w(game)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-mv5lu2lq9t", "categories" => %w(game)},
    
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@hiyoko246", "categories" => %w(trend)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@sakki-tvch", "categories" => %w(trend)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ttmtsuyoshi", "categories" => %w(trend)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kasukabesouzoku", "categories" => %w(trend)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ryohin", "categories" => %w(trend)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@sasayan", "categories" => %w(trend)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@motomitsu", "categories" => %w(trend)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@pukujiji", "categories" => %w(trend)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kureanews_2", "categories" => %w(trend)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-yz3ti4lf3m", "categories" => %w(trend)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@gaguru.tubenews", "categories" => %w(trend)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@chouekitarou893", "categories" => %w(trend)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@bunshun_kisha", "categories" => %w(trend)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@Mikoneko2023", "categories" => %w(trend)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ArcTimes1", "categories" => %w(trend world)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@yukoreadman", "categories" => %w(trend politics)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@mobile_game_AK", "categories" => %w(trend politics)},

    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@SonyXperia", "categories" => %w(gadget tour)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kentworldg", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@MrVR", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ArimaxVR", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@mirais_vr", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@YamatoNadeshiko", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@Takomaruuun", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@gizmodojapan", "categories" => %w(gadget technology)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@takahashiyamada", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@yoshidaaaaaaaaaaaaaaaaaaaaaaaa", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ThomasGadgemaga", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@harukanachannel", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@sumasapo", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@masaru1088", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@rbbtodaycom", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@WatanabeKazumasa", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@SGRT3rd", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ToviWorks", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@gazyekichi", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@Yuta_Hiraoka", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@MonogamaGadget", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@tobalog_toba", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@RecPlus", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@masaru1088", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@Usyasuraimu", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kajimack", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@shinkichi39", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@rebecca_miyama", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@yamako_mini_free", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@daiking3", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@monograph_", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@nikostyle_tk", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@mamiyoshi", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@yuji-lifehack", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kisuke", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@monograph_", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@appleshinja-1okuninn", "categories" => %w(gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@imamura4k", "categories" => %w(gadget)},
    
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kazuch0924", "categories" => %w(life gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@sumasapo", "categories" => %w(life gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@thedadsecretbase", "categories" => %w(gadget life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@SagaraGouchi", "categories" => %w(gadget life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@COM_Gadget", "categories" => %w(gadget life)},


    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@oshare_iruka", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@smappy_channel", "categories" => %w(lifehack)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@mori_house", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@mujio_mujirushi", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@MiD.", "categories" => %w(life gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@muji_hayashi", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@resky_ch", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@laffic", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@manmalunaLifeVlog", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@sukinamon", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@mlife.puchipura", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kazokushuno", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@miniminidiarist", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@100-channel", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kurashikata", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@nylonpoly_outdoor", "categories" => %w(life fashion)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@youyaku", "categories" => %w(lifehack business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@booksumbook", "categories" => %w(lifehack business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@abst", "categories" => %w(lifehack business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@nomonomolife", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kurashi_style", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kinocco", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@KUMALOG_YAMAGOYA", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@haruchannel3", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@imasarachannel", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@latte_house", "categories" => %w(life lifehack)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@samia.housework", "categories" => %w(life lifehack)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@nuecohome", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@uchilog", "categories" => %w(life lifehack)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@megulife7223", "categories" => %w(life lifehack)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@nanaoakiko", "categories" => %w(life lifehack)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ichi_mama", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@shinoschannel", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@chi.yu_", "categories" => %w(life lifehack)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@yamamomoda4", "categories" => %w(life fashion)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@MiorinCafe", "categories" => %w(life study)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@takabon", "categories" => %w(life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@COM_Gadget", "categories" => %w(life gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@my-room", "categories" => %w(life gadget)},
    

    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-lp1bg4qq7i", "categories" => %w(mobitity technology), "absolute" => %w(mobility)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@jimny_kozakura", "categories" => %w(mobility technology), "absolute" => %w(mobility)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@wansokutube", "categories" => %w(mobility technology), "absolute" => %w(mobility)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@KG_motors", "categories" => %w(mobility technology)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@AMCacademic", "categories" => %w(mobility technology business economy)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@bokutes", "categories" => %w(mobility technology), "absolute" => %w(mobility)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kuhlracingtv906", "categories" => %w(mobility technology), "absolute" => %w(mobility)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-sw8wr3xq1l", "categories" => %w(mobility)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@yumiyoshida439", "categories" => %w(mobility technology), "absolute" => %w(mobility)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@toyotatimes", "categories" => %w(mobility technology), "absolute" => %w(mobility)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@driverchannel", "categories" => %w(mobility technology), "absolute" => %w(mobility)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@newcarlife", "categories" => %w(mobility technology), "absolute" => %w(mobility)},
    #{"youtube_id"=>"", "url"=>"https://www.youtube.com/@kazokushuno", "categories" => %w(mobility)},
    #{"youtube_id"=>"", "url"=>"https://www.youtube.com/@kazokushuno", "categories" => %w(mobility)},
    #{"youtube_id"=>"", "url"=>"https://www.youtube.com/@kazokushuno", "categories" => %w(mobility)},
    #{"youtube_id"=>"", "url"=>"https://www.youtube.com/@kazokushuno", "categories" => %w(mobility)},
    
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@hayatasuuu", "categories" => %w(sales)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@KiyotoUniv", "categories" => %w(engineer)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@pythonvtuber9917", "categories" => %w(engineer)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@TECHWORLD111", "categories" => %w(engineer)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kentatv2710", "categories" => %w(engineer)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@engineer_first", "categories" => %w(engineer)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@webit7652", "categories" => %w(engineer)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@it_bosatsu_moro", "categories" => %w(engineer)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-pl5cc5hs5m", "categories" => %w(engineer)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ara_sun_", "categories" => %w(engineer)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@SES_CH", "categories" => %w(engineer)},

    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@sokketsu", "categories" => %w(sales)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@SES_CH", "categories" => %w(sales)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@SES_CH", "categories" => %w(sales)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@SES_CH", "categories" => %w(sales)},
    #{"youtube_id"=>"", "url"=>"https://www.youtube.com/@takehana_minds", "categories" => %w(切り抜き)},
    #{"youtube_id"=>"", "url"=>"https://www.youtube.com/@honmanachannel", "categories" => %w(切り抜き)},
    #{"youtube_id"=>"", "url"=>"https://www.youtube.com/@honmanachannel", "categories" => %w(切り抜き)},
    #{"youtube_id"=>"", "url"=>"https://www.youtube.com/@honmanachannel", "categories" => %w(切り抜き)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@youseful_skill", "categories" => %w(lifehack)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@yukipedia", "categories" => %w(lifehack business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@abemutsuki", "categories" => %w(lifehack business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@natsuko271/", "categories" => %w(lifehack life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@yusuke_counselor", "categories" => %w(lifehack business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@king.blog05", "categories" => %w(lifehack life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@hikopro6723", "categories" => %w(lifehack life gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@Lifelogtube", "categories" => %w(lifehack life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-et8nn1rk7i", "categories" => %w(lifehack life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@LifeStyleJournal_saku", "categories" => %w(lifehack life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@mususuma", "categories" => %w(lifehack gadget)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@AppleJapan", "categories" => %w(lifehack other)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@tanapi_fufu385", "categories" => %w(lifehack)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@techoutime", "categories" => %w(lifehack life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@mizuna_mama", "categories" => %w(lifehack)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@soeasy", "categories" => %w(lifehack)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@iamahousewife", "categories" => %w(life lifehack)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@makonari_shacho", "categories" => %w(lifehack business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kazokushuno", "categories" => %w(lifehack)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@taiki007", "categories" => %w(lifehack technology)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@nbaku", "categories" => %w(lifehack work)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@saisuma-yoshida", "categories" => %w(lifehack)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@sinminimallife", "categories" => %w(lifehack)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@curama_univ.", "categories" => %w(lifehack)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@osouji-taro", "categories" => %w(lifehack)},


    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kentaro_saving", "categories" => %w(finance)},


    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@hiroyukikirinuki", "categories" => %w(hiroyuki trend)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@hiroyukimind", "categories" => %w(hiroyuki)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@Hiroyuke", "categories" => %w(hiroyuki trend life carrer)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@hironuki", "categories" => %w(hiroyuki trend)},
    #{"youtube_id"=>"", "url"=>"https://www.youtube.com/@erutorecruit", "categories" => %w(mobilityrer)},
    #{"youtube_id"=>"", "url"=>"https://www.youtube.com/@3utsu", "categories" => %w(lifehack)},
    #{"youtube_id"=>"", "url"=>"https://www.youtube.com/@kazokushuno", "categories" => %w(lifehack)},
    #{"youtube_id"=>"", "url"=>"https://www.youtube.com/@kazokushuno", "categories" => %w(lifehack)},
    #{"youtube_id"=>"", "url"=>"https://www.youtube.com/@kazokushuno", "categories" => %w(lifehack)},
    #{"youtube_id"=>"", "url"=>"https://www.youtube.com/@kazokushuno", "categories" => %w(lifehack)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2ch_yueki_5ch", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2ch-sg6zr", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2ch-matome", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@shuuuukatu", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@d-niki", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ch-nz7yk", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@obaka-matome", "categories" => %w(board carrer)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2ch-matome", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2chlab", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2chyu-eking", "categories" => %w(board lifeevent)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2chNanJ", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ch-lb8yr", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2ch-kisoutengai", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@Tetsujin28hiki", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ch-bs9es", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@yukkuri-waraeru", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@nanJsokutu", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-zl9js6pf9w", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2ch-qt9jp", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2chsyukatu", "categories" => %w(board carrer)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2ch2ch5ch4", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2ch-ga-sukinandao", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@pokomake", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2ch612", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2chNanJ", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2ch2ch5ch4", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@5ch_neko", "categories" => %w(board comedy)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ch-kq2mm", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2ch_dobutsu", "categories" => %w(board animal)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2ch-sukatto", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-en5ci1hs3k", "categories" => %w(board lifehack)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-uj1gt5yj1y", "categories" => %w(board lifehack beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-qm5tv6vs7e", "categories" => %w(board lifehack beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@matomegirlsch", "categories" => %w(board lifehack beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@girls-zarashi-ch", "categories" => %w(board lifehack beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@girls-cosme", "categories" => %w(board beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-rf9ci6tl4r", "categories" => %w(board beauty)},
    
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@unnamedch", "categories" => %w(carrer)},


    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@nanJdx", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@tarutaru2ch", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2chdokaguibu", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@Apparech", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2ch195", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2ch300", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@rice2ch", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@waraerusyo-to", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@rice2ch", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@rice2ch", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@rice2ch", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@horrorro-adshowchannel", "categories" => %w(board)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2ch-omoshiro-short", "categories" => %w(board)},
    

    
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ninninkyo", "categories" => %w(education)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@takashi_ch", "categories" => %w(education)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2ch-omoshiro-short", "categories" => %w(education)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@tokyo-shoten", "categories" => %w(education)},

    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@2ch-omoshiro-short", "categories" => %w(education)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@yoshi-koba", "categories" => %w(education lifehack business)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@Aba_Book_Tuber", "categories" => %w(education)},


    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@featch3622", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@cellbank-TV", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-ng2tp5jm9i", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@aratatomori", "categories" => %w(beauty health)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kazunosuke", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@sakimegu_beauty", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-tu9pg1ct7x", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@hirobeautychannel", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@MarilynFukuseYuuri", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@345chan", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@775nanako", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ashinoura_makeup", "categories" => %w(beauty life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@mizukoshimisato", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-ro6gx4nk9e", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@hashimotobeautychannel452", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@_yoshida_akari", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@sizzle-tv", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@VOCE", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@tsumikibeauty", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@CosmeWotaSara", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@sayuri-makeup", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ASMRCosmeticRepair", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kayoko_yazaki", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ninamori1160", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@pinkbuyer", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@smishow01", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kayocosme", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@beauty-mania-house", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@SHISEIDOofficial", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@cosmemory", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@shushu_223_", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@BMYuya", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@arichan_make", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@aicachannel", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@shokobeautych", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kaorimake", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@_kiiigram_", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kajieri", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@melt__in", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@RaytenorJp", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@fullbody777", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kyon7699", "categories" => %w(beauty lifehack)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@biteki_com", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@harukamakeup", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@saechannelofficial3375", "categories" => %w(beauty life tour)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@ALISA-nh8hq", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@aicachannel", "categories" => %w(beauty life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@MimiTV_official", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@Yuchannel_cosme", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@rihominami", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kapo_025", "categories" => %w(beauty life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@SYKMAKEUP", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@dreamoon_hm", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@shabon_official", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@june1978", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@airi_official", "categories" => %w(beauty life)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@momotao1021", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@yukikirei", "categories" => %w(beauty other)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@kayodoll38", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@tamukun_36", "categories" => %w(beauty)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@biyouseitai-uchiyama", "categories" => %w(beauty health)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@Mitoma_Makeup", "categories" => %w(beauty fashion)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@aoi_ihara", "categories" => %w(beauty fashion tour)},
    #{"youtube_id"=>"", "url"=>"https://www.youtube.com/@emk_oooo", "categories" => %w(beauty life item)},


    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@MarinaTakewaki", "categories" => %w(health)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@tabiwadance", "categories" => %w(health)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-wg1mh5jr4x", "categories" => %w(health)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@naru.enjoy_diet", "categories" => %w(health)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@chillyogadiet3511", "categories" => %w(health)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@yoshi-koba", "categories" => %w(health)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@NiceEar", "categories" => %w(health)},
    
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-jk1yu2mw8e", "categories" => %w(health finance education business)},


    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@jfa", "categories" => %w(sports soccer)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-hf2me2sl1z", "categories" => %w(sports soccer)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@tbs5947", "categories" => %w(sports)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@uwasathefootball", "categories" => %w(sports soccor), 'absolute' => %w(soccor)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@SPOTVNOWJAPAN", "categories" => %w(sports soccor baseball), 'absolute' => %w(sports)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@yoshi-koba", "categories" => %w(sports)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@user-gz7vk2um3w", "categories" => %w(talent)},

    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@NipponFoundationPR", "categories" => %w(documentary)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@cbc_docu", "categories" => %w(documentary)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@gairokuch", "categories" => %w(documentary)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@yoshi-koba", "categories" => %w(documentary)},
    

    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@TBS_geino", "categories" => %w(talent)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@mynavinews-entame", "categories" => %w(talent)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@shuntyantv", "categories" => %w(talent)},
    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@yoshi-koba", "categories" => %w(documentary)},


    {"youtube_id"=>"", "url"=>"https://www.youtube.com/@Variety_ABEMA", "categories" => %w(variety)},
]
Parallel.each(channel_seeds) do |seed|
    category_names = seed["categories"]
    categories = Category.where(name: category_names).map { |category| { "id" => category.id, "name" => category.name } }
    channel = Channel.find_or_create_by(url:seed["url"])
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