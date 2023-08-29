# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
economy = [
    {sort:"exchange",words:["為替","円安","急騰","暴落","円高","値上","値下","ドル安","ドル高","ユーロ","ポンド","人民元","ウォン","通過"]},
    {sort:"invest",words:[
        "再投資","機関投資家","分散投資","長期投資","投資信託","不動産投資","利回り","株","株価","株式","債券","証券","ETF","社債","国債",
        "新株","増資","増収","減収","増益","減益","優先株","IPO","信用取引","制裁","資本",
        "証拠金取引","信用リスク","流動性リスク","配当","信託","米国株","買収","資産","運用",
        "ファンド","普通株","償還","取引所","空売り","買い付け","売買","先物取引"]},
    {sort:"macro_economy",words:[
    "GDP","国内総生産","国民総生産","GNP","インフレ","デフレ","財政","金利","景気","収支","マーケット",
    "恐慌","失業率","失業率","貿易収支","貿易統計","貿易赤字","財政黒字","財政赤字","貿易黒字","市場経済","計画経済","関税","雇用",
    "財務","格付け","バブル","不況","市場","生産性","格差","賃金","賃上げ","石油価格","原油価格","ガソリン価格","小麦価格","米価格","トウモロコシ価格","食料価格"]},
    {sort:"unique_noun",words:["アベノミクス","リーマンショック","バフェット","フォール街"]},
    {sort:"仮想通貨",words:["ビッドコイン","仮想通貨"]},
    {sort:"general",words:[
        "金融","年金","決算","破綻","銀行","日銀","連邦準備","FRB"
    ]},
    {sort:"crypro_currency",words:["ビッドコイン","仮想通貨","暗号通貨","イーサリアム"]}
]

technology = [
    {sort:"general",words:["技術","新技術","テクノロジー","テック","新型","次世代"]},
    {sort:"space",words:["ロケット","宇宙船","推進剤","エンジン","推力",
    "軌道","宇宙空間","宇宙飛行士","有人宇宙飛行","無人宇宙探査","宇宙ミッション","打ち上げ台","空力学","地球周回軌道",
    "静止軌道","ロケットエンジンのブースター","ロケットのペイロード","ロケットのペイロードフェアリング","ロケットのコントロールシステム",
    "ロケットの遠隔操作","再使用型ロケット","宇宙開発","火星探査","月面着陸","ロケット科学"]},
    {sort:"IT",words:["IT","AI","人工知能","VR","メタバース","ワイヤレス","ロボット","コンピューター","ソフトウェア","ハードウェア",
    "プログラム","データ","クラウドコンピューティング","データベース","半導体",
    "プログラミング","ファイアウォール","ウイルス","マルウェア","ハッカー","テクノロジー",
    "インターフェース","ブラウザ","スマートフォン","タブレット","インターネット・オブ・シングス","人工知能","機械学習",
    "ビッグデータ","仮想化","ブロックチェーン","コーディング","デジタル","ハイパーテキスト","API","GUI","UI","UX","クリプトグラフィ"
    ]},
    {sort:"energy",words:["核融合","全個体","全樹脂","燃料電池"]},
    {sort:"vehicle",words:["ドローン","空飛ぶ","超電導"]},
    {sort:"company",words:["テスラ","アップル","Apple","マイクロソフト","Microsoft","グーグル","Google","メタ","Meta","TSMC","CATL"]},
    {sort:"person",words:["イーロン","ザッカーバーグ","ティムクック"]},
]

politics = [
    {sort:"general",words:[
        "政治","内閣","政府","政策","法律","参議院","衆議院","議員","議会","選挙","与党","野党","首相","大統領",
        "政治思想","自由主義","保守主義","社会主義","共産主義","ポピュリズム",
        "連立政権","一党制","多党制","政治的な信念","政治的な運動","政治犯","投票","投票権","投票率",
        "政治寄付","ロビー","有権者","選挙制度","選挙区","内政","対外政策","規制","対抗措置",
        "戦争","平和","軍備""安全","安全保障","自治","国際関係","司法","最高裁","憲法",
        "人権","侵害","公共","統治","行政","福祉","国民"]},
    {sort:"peson",words:["岸田","河野","麻生","高市"]},
    {sort:"party",words:["自民党","民主党","公明党","維新","共産党","国民党"]}
]

gadget = [
    {sort:"brand",words:["Apple","Samsung","Huawei","Xiaomi","Oppo","Vivo","Sony","LG","Google","OnePlus","Motorola","Nokia"]},
    {sort:"seris",words:["iPhone","Galaxy","Mate","Redmi","AQUOS"]},
    {sort:"general",words:["折りたたみ","iPhone","Galaxy","Mate","Redmi"]},
]

business = [
    {sort:"general",words:[
        "経営","ビジネス","フランチャイズ","ターゲット市場","マーケット","セグメンテーション","プロモーション","事業",
    "営業","顧客","収益","コスト","利益","ROI","ターゲット","ターゲティング","SWOT","リサーチ","アウトソーシング",
    "チームビルディング","リーダーシップ","ビジョン","ミッションステートメント","グロースハック","バリュープロポジション","マネジメント",
    "KPI","バリューチェーン","ステークホルダー","パートナーシップ","プロジェクトマネジメント","キャッシュフロー",
    "資産","負債","経営戦略","ビジネスプラン","フランチャイズ","ライセンス","コーポレートガバナンス","リスクマネジメント","バリュエーション",
    "マージン","シェアホルダー","ピッチ","起業","マーケティング","マーケティングミックス","マーケティング戦略","ブランディング","ターゲット市場",
    "ニッチ市場","マーケットセグメンテーション","マーケットリサーチ","市場シェア","顧客満足度","顧客ロイヤルティ","チャネル戦略","供給チェーン",
    "販売促進","販売戦略","プロモーション","コンバージョン率","収益","利益","コスト削減","コスト効率","リーダーシップ","組織文化","ミッションステートメント",
    "ビジョン","戦略計画","目標設定","プロジェクトマネジメント","リスクマネジメント","パフォーマンス評価","バランススコアカード","キーパフォーマンスインディケーター",
    "SWOT分析","グローバル戦略","コアコンピタンス","オペレーション","サプライチェーンマネジメント","ログイスティクス","グリーンビジネス","サステナビリティ","単価"]}
]

world = [
    {sort:"条約",words:["協定","クアッド","条約","ASEAN","EU","RCEP","NATO","TPP","Quad"]},
    {sort:"2国間",words:["日印","日英","日韓","日豪","日中","日朝","日独","日仏","日米","日露","米中","米露"]},
    {sort:"略称",words:[
        "アラブ","韓国","北朝鮮","コンゴ","中国","バチカン","ボリバル","ボリビア",
        "モルドバ","マケドニア","ユーゴスラビア","ラオス","ロシア"
        ]},
    {sort:"2国間",words:["アイスランド","アイルランド","アゼルバイジャン","アフガニスタン","アメリカ",
    "ヴァージン諸島","サモア","アラブ首長国連邦","アルジェリア","アルゼンチン","アルバ","アルバニア",
    "アルメニア","アンギラ","アンゴラ","アンティグア・バーブーダ","アンドラ","イエメン","イギリス",
    "インド洋地域","ヴァージン諸島","イスラエル","イタリア","イラク","イラン・イスラム共和国","インド",
    "インドネシア","ウォリス・フツナ","ウガンダ","ウクライナ","ウズベキスタン","ウルグアイ","エクアドル",
    "エジプト","エストニア","エチオピア","エリトリア","エルサルバドル","オーストラリア","オーストリア","オーランド諸島",
    "オマーン","オランダ","ガーナ","カーボベルデ","ガーンジー","ガイアナ","カザフスタン","カタール","合衆国領有小離島",
    "カナダ","ガボン","カメルーン","ガンビア","カンボジア","北マリアナ諸島","ギニア","ギニアビサウ","キプロス","キューバ",
    "キュラソー","ギリシャ","キリバス","キルギス","グアテマラ","グアドループ","グアム","クウェート","クック諸島",
    "グリーンランド","クリスマス島","グレナダ","クロアチア","ケイマン諸島","ケニア","コートジボワール","ココス諸島",
    "キーリング諸島","コスタリカ","コモロ","コロンビア","コンゴ共和国","コンゴ民主共和国","サウジアラビア",
    "サウスジョージア・サウスサンドウィッチ諸島","サモア","サンンシペ","サン・バルテルミー","ザンビア","サンピエール島・ミクロン島",
    "サンマリノ","サン・マルタン","シエラレオネ","ジブチ","ジブラルタル","ジャージー","ジャマイカ","ジョージア","シリア・アラブ共和国",
    "シンガポール","シント・マールテン","ジンバブエ","スイス","スウェーデン","スーダン","スヴァールバル諸島","ヤンマイエン島","スペイン",
    "スリナム","スリランカ","スロバキア","スロベニア","スワジランド","セーシェル","赤道ギニア","セネガル","セルビア","セントクリストファー・ネイビス",
    "セントビンセント","グレナディーン諸島","セントヘレナ・アセンションおよびトリスタンダクーニャ","セントルシア","ソマリア","ソロモン諸島",
    "タークス・カイコス諸島","タイ","大韓民国","台湾","中華民国","タジキスタン","タンザニア","チェコ","チャド","中央アフリカ共和国",
    "中華人民共和国","チュニジア","朝鮮民主主義人民共和国","チリ","ツバル","デンマーク","ドイツ","トーゴ","トケラウ","ドミニカ共和国",
    "ドミニカ国","トリニダード・トバゴ","トルクメニスタン","トルコ","トンガ","ナイジェリア","ナウル","ナミビア","南極","ニウエ","ニカラグア",
    "ニジェール","西サハラ","ニューカレドニア","ニュージーランド","ネパール","ノーフォーク島","ノルウェー","ハード島","マクドナルド諸島",
    "バーレーン","ハイチ","パキスタン","バチカン市国","パナマ","バヌアツ","バハマ","パプアニューギニア","バミューダ","パラオ","パラグアイ",
    "バルバドス","パレスチナ","ハンガリー","バングラデシュ","東ティモール","ピトケアン","フィジー","フィリピン","フィンランド","ブータン",
    "ブーベ島","プエルトリコ","フェロー諸島","フォークランド諸島","マルビナス諸島","ブラジル","フランス","ギアナ","ポリネシア","ブルガリア",
    "ブルキナファソ","ブルネイ・ダルサラーム","ブルンジ","ベトナム","ベナン","ベネズエラ・ボリバル共和国","ベラルーシ","ベリーズ","ペルー",
    "ベルギー","ポーランド","ボスニア・ヘルツェゴビナ","ボツワナ","ボネール、シント・ユースタティウスおよびサバ","ボリビア多民族国","ポルトガル",
    "香港","ホンジュラス","マーシャル諸島","マカオ","マケドニア旧ユーゴスラビア共和国","マダガスカル","マヨット","マラウイ","マリ","マルタ",
    "マルティニーク","マレーシア","マン島","ミクロネシア連邦","南アフリカ","南スーダン","ミャンマー","メキシコ","モーリシャス","モーリタニア",
    "モザンビーク","モナコ","モルディブ","モルドバ共和国","モロッコ","モンゴル","モンテネグロ","モントセラト","ヨルダン","ラオス人民民主共和国",
    "ラトビア","リトアニア","リビア","リヒテンシュタイン","リベリア","ルーマニア","ルクセンブルク","ルワンダ","レソト","レバノン","レユニオン","ロシア連邦"]},
    {sort:"war",words:
        ["軍","戦争","戦闘","兵役","軍隊","戦場","攻撃","防御","兵士","戦艦","航空戦","戦略","戦術","戦勝","敗戦","戦争犯罪","非戦闘員",
        "平和","武器","軍事","講和","軍備拡張","軍縮","占領","戦争賠償","内戦","国際紛争","戦時国際法","戦争犠牲者","戦争孤児","捕虜",
        "核戦争","世界大戦","派兵","布告","宣戦布告","戦争中立","徴兵","戦争記念日","軍事演習","武装解除","停戦協定","戦争","軍隊","戦闘",
        "軍事","攻撃","侵攻","防御","反撃","戦略","戦術","兵士","戦犯","武器","戦争責任","勝利","敗北","平和","占領","休戦","和平交渉",
        "軍事同盟","争い","戦禍","戦時","軍備","無差別攻撃","被害","戦闘員","戦地","戦場","軍事作戦","徴兵","軍事力"]},
    {sort:"organization",words:
        ["国連", "IMF", "世界銀行", "WTO", "WHO", "IAEA", "OECD", "NATO", "UNESCO", "ASEAN", "OPEC", "G7", "G20"]
    }
]
categories = [
    {name:"business", japanese_name:"ビジネス", variable:business},
    {name:"politics", japanese_name:"政治", variable:politics},
    {name:"technology", japanese_name:"テクノロジー", variable:technology},
    {name:"economy", japanese_name:"経済", variable:economy},
    {name:"world", japanese_name:"世界", variable:world},
    {name:"game", japanese_name:"ゲーム"},
    {name:"trend", japanese_name:"トレンド"}
]
categories.each do |category_hash|
    category = Category.create(name: category_hash[:name], japanese_name:category_hash[:japanese_name])
    puts category_hash[:name]
    if category_hash[:variable]
        category_hash[:variable].each do |words_hash|
            WordList.create(
                category:category,
                sort:words_hash[:sort],
                words:words_hash[:words].join(",")
            )
        end
    end
end
channel_seeds = [
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@takahashi_yoichi","categories"=>["business","politics","economy"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@mykey-sano","categories"=>["business","politics","technology","economy"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@3.0/videos","categories"=>["politics","economy","world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@mitsuhashipress","categories"=>["politics","economy","world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@FIFIchannel","categories"=>["politics","economy","world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@kazuyachgx","categories"=>["politics","economy","world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@user-rb3pn7uz3m","categories"=>["politics","economy","world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@ytv_news","categories"=>["politics","economy","world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@DEEPMAX","categories"=>["politics","economy"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@mofmof-investor","categories"=>["politics","economy","business"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@NewsPicks","categories"=>["business","technology"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@diy4600","categories"=>["politics","economy"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@tsj_otb/videos","categories"=>["world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@milirepo","categories"=>["politics","economy"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@user-uy4cr9se8j","categories"=>["world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@maomao96363","categories"=>["politics","world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@oikawa_yukihisa1","categories"=>["world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@kazuyachgx","categories"=>["politics","economy"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@WWUK_TV","categories"=>["world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@ntv_news","categories"=>["politics","technology","economy","world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@ANNnewsCH","categories"=>["politics","technology","economy","world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@FNNnewsCH","categories"=>["politics","technology","economy","world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@tbsnewsdig","categories"=>["politics","technology","economy","world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@mbsnews","categories"=>["politics","technology","economy","world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@CHUKYOTV_NEWS","categories"=>["politics","technology","economy","world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@prime_ABEMA","categories"=>["politics","technology","economy","world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@tvtokyobiz","categories"=>["politics","technology","economy","world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@abc6ch","categories"=>["politics","technology","economy","world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@takaponjp","categories"=>["politics","technology","economy","world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@tvosakanews","categories"=>["politics","technology","economy","world"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@htbnews","categories"=>["politics","technology","economy","world"]},

    
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@monozukuritarou","categories"=>["technology"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@erestage","categories"=>["technology"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@Ch-dp9or","categories"=>["technology"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@YamatoNadeshiko","categories"=>["technology"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@htbnews","categories"=>["technology"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@nex.kougyo","categories"=>["technology"]},


    {"youtube_id"=>"","url"=>"https://www.youtube.com/@htbnews","categories"=>["business"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@manabusiness","categories"=>["business"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@honmanachannel","categories"=>["business"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@pivot8935","categories"=>["business"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@sam-book","categories"=>["business"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@sonsera_ch","categories"=>["business"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@gakushikisaron","categories"=>["business"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@shin_R25","categories"=>["business"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@salatame","categories"=>["business"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@ryukkebibinnba","categories"=>["business"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@nensyu_channel","categories"=>["business"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@ryogakucho","categories"=>["business"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@tabbata","categories"=>["business"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@MABANK2018","categories"=>["business"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@rakumachi","categories"=>["business"]},


    {"youtube_id"=>"","url"=>"https://www.youtube.com/@cabbage_games","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@YoshikiOkamotoGameCh","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@sora_sakurai_jp","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@OYAYUVI","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@gameyawa","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@user-ys6bh5zc3k","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@gameyawa","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@dengekionline","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@nakaido","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@midnight_chimau","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@NintendoJP","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@PlayStationJapan","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@ichigo_Gamebeat","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@capcom","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@squareenix","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@NayneGamez","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@chomes3104","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@keiji_ch","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@automatonchannel","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@pandaiku","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@steamharachin","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@stmatomato","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@yamachan-game-giriikiteru","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@-ch-qx5lh","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@odesigame","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@omigames","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@akagitotoro","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@kotoragame","categories"=>["game"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@kentworldg","categories"=>["game"]},
    
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@hiyoko246","categories"=>["trend"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@YoshikiOkamotoGameCh","categories"=>["trend"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@sakki-tvch","categories"=>["trend"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@ttmtsuyoshi","categories"=>["trend"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@kasukabesouzoku","categories"=>["trend"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@ryohin","categories"=>["trend"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@SmithAndGames","categories"=>["trend"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@D_Galle","categories"=>["trend"]},


    {"youtube_id"=>"","url"=>"https://www.youtube.com/@SonyXperia","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@kentworldg","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@MrVR","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@ArimaxVR","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@mirais_vr","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@YamatoNadeshiko","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@Takomaruuun","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@gizmodojapan","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@takahashiyamada","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@yoshidaaaaaaaaaaaaaaaaaaaaaaaa","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@ThomasGadgemaga","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@harukanachannel","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@sumasapo","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@masaru1088","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@rbbtodaycom","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@WatanabeKazumasa","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@SGRT3rd","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@ToviWorks","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@gazyekichi","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@Yuta_Hiraoka","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@MonogamaGadget","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@tobalog_toba","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@RecPlus","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@masaru1088","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@Usyasuraimu","categories"=>["gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@kajimack","categories"=>["gadget"]},

    {"youtube_id"=>"","url"=>"https://www.youtube.com/@kazuch0924","categories"=>["life","gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@sumasapo","categories"=>["life","gadget"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@oshare_iruka","categories"=>["life"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@smappy_channel","categories"=>["life"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@mori_house","categories"=>["life"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@mujio_mujirushi","categories"=>["life"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@MiD.","categories"=>["life"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@muji_hayashi","categories"=>["life"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@resky_ch","categories"=>["life"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@COM_Gadget","categories"=>["life"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@laffic","categories"=>["life"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@manmalunaLifeVlog","categories"=>["life"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@sukinamon","categories"=>["life"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@mlife.puchipura","categories"=>["life"]},
    {"youtube_id"=>"","url"=>"https://www.youtube.com/@kazokushuno","categories"=>["life"]},
    #{"youtube_id"=>"","url"=>"https://www.youtube.com/@takehana_minds","categories"=>["切り抜き"]},
    #{"youtube_id"=>"","url"=>"https://www.youtube.com/@honmanachannel","categories"=>["切り抜き"]},
    #{"youtube_id"=>"","url"=>"https://www.youtube.com/@honmanachannel","categories"=>["切り抜き"]},
    #{"youtube_id"=>"","url"=>"https://www.youtube.com/@honmanachannel","categories"=>["切り抜き"]},
]

channel_seeds.each do |seed|
    category_ids = Category.where(name: seed["categories"]).pluck(:id)
    channel = Channel.create(url:seed["url"])
    puts channel.id
    category_ids.each do |id|
        if category_ids.length == 1
            ChannelCategory.create(channel: channel, category_id:id, is_absolute: true)
        else
            ChannelCategory.create(channel: channel, category_id:id)
        end
    end
end

AdminUser.create!(email: ENV["EMAIL1"], password: ENV["PASSWORD"], password_confirmation: ENV["PASSWORD"]) if Rails.env.development?