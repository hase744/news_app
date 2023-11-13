#{sort: "", words: %w()}
currency = {sort:"currency",words:%w(
    為替 円安 急騰 暴落 円高 値上 値下 ドル安 ドル高 ユーロ ポンド 人民元 ウォン 通貨)}
investment = {sort:"investment",words:%w(
    債  社債 国債 再投資 機関投資家 分散投資 長期投資 投資信託 不動産投資 利回り 株 株価 株式 債券 証券 ETF
    新株 増資 増収 減収 増益 減益 優先株 IPO 信用取引 制裁 資本 NISA nisa 積立 S&P index 利息 買い
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
fx_general = {sort: 'fx_general', words:%w(
    FX 相場
)}

@fx_trade = [fx_general, currency]
@equity_investment = [investment]
crypro_currency = {sort:"crypro_currency",words:%w(ビッドコイン 仮想通貨 暗号通貨 イーサリアム)}
@economy = [currency, investment, macro_economy, unique_noun, unique_noun, economy_general]

technology_general = {sort:"technology_general",words:%w(
    テクノロジー テック 発明 ノーベル 自動化 自動翻訳 全自動 自動追跡 自動検出 3Dプリンタ)}
technology_phrase = {sort:"technology_phrase",words:%w(
    技術力 新技術 技術国 新型 次世代 新機能 新端末 新サービス 自動化 自動翻訳 全自動 自動追跡 3Dプリンタ)}
technology_companies = {sort: "", words: %w(GAFA メタ Meta テスラ Tesla Microsoft マイクロソフト Google グーグル Apple アップル TSMC Nvidea)}
space = {sort:"space",words:%w(ロケット 宇宙船 推進剤 エンジン 推力 探査機 探査船 有人
        軌道 宇宙空間 宇宙飛行士 有人宇宙飛行 無人宇宙探査 宇宙ミッション 打ち上げ台 空力学 地球周回軌道
        静止軌道 ペイロード ペイロードフェアリング コントロールシステム スターリンク コンステレーション
        遠隔操作 再使用型ロケット 宇宙開発 火星探査 月面着陸)}
it = {sort:"IT",words:%w(IT AI 人工知能 VR メタバース ワイヤレス ロボット ロボ コンピューター ソフトウェア ハードウェア
        プログラム データ コンピューティング データベース 半導体 サイバー サーバー チップ 暗号資産 暗号通貨 センサ センシ
        プログラミング ファイアウォール ウイルス マルウェア ハッカー テクノロジー 顔認証 指紋認証 声認証
        インターフェース ブラウザ Iot インターネット・オブ・シングス 人工知能 機械学習 システム メタ スマートビル スマートハウス
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
    ドローン 空飛ぶ 超電導 無人機 無人レジ 無人店舗 無人自動車 無人車 無人ヘリ 無人タクシー
    無人航空 自動運転 急速充電)}
tech_person = {sort:"tech_person",words:%w(イーロン マスク氏 ザッカーバーグ ティムクック サム・アルトマン)}
@technology = [technology_general, space, it, biotech, energy, vehicle, technology_companies]

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

life_general = {sort:"general",words:%w(グッズ 商品 アイテム 便利 小物 生活 対策グッズ 用品 コスパ 掘り出し物 ベストバイ 防寒 用品) }
life_item = {sort:"item",words:%w(文具 文房具 手帳 ノート ボールペン 財布 靴 ホルダー 家電)}
life_phrase = {sort:"phrase",words:%w(買うべき 買ってよかった 買って良かった 買わないと損 購入 買った これ１台 これ１冊 これ１本 おすすめ オススメ 一推し イチオシ 激推し ベスバイ)}
brand_brand = {sort:"brand",words:%w(無印 ニトリ ダイソー DAISO キャンドゥ セリア Seria ワークマン ドンキ コストコ 百均 100均 100円 )}
@necessity = [life_general, life_item, life_phrase, brand_brand]

lifehack_method = {sort:"method",words:%w(活用法 活用術 生活術 裏技 収納法 ミニマ 機能 用途 方法 使い方 習慣 コツ )}
lifehack_phrase = {sort:"lifehack_phrase",words:%w(買うべき 買ってよかった 買って良かった 買わないと損 これ１台 これ１冊 おすすめ 激推し ラク 時短 )}
lifehack_brand = {sort:"brand",words:%w(無印 ニトリ ダイソー DAISO Seria セリア キャンドゥー ワークマン IKEA イケア 百均 100均 100円)}
lifehack_tool = {sort:'lifehack_tool', words: %w(Excel エクセル Word Powerpoint パワポ)}
@lifehack = [lifehack_method, lifehack_phrase, lifehack_brand, life_general, lifehack_tool]

money_finance = {sort:"money", words:%w(お金 貯金 家計 節約 手取り 貯め 収入 月収 年収 NISA iDeCo 積立 貯蓄 蓄え 出費 生活費 食費 衣食住 雑費 服代 家賃 納税 節税 節電 節水 セール 半額 安い 割引)}

@money_finance = [money_finance]

real_estate = {real_estate: 'real_estate', words: %w(
    不動産 物件 住宅 マンション アパート 賃貸 持ち家 空き家 一軒家 新築 持ち家 ワンルーム
    )}
@real_estate_investment = [real_estate]
cosmetic = {sort:"cosmetic",words:%w(化粧 美容 コスメ メイク ファンデーション リップスティック アイシャドウ マスカラ ブラッシュ アイライナー 
    リップグロス コンシーラー メイクアップリムーバー ファセットナー リップバーム ネイル フェイスマスク シートマスク シャンプー コンディショナ
    ボディローション ハイライト コントゥアリング メイクブラシ 日焼け止め 洗顔 ケアパウダ ファンデ アイプチ 乳液 クレンジング
    ピテラ トリートメント レチノール アイクリーム グリセリン ハンドクリーム ソープ 石鹸
    )}
body = {sort:"body",words:%w(肌 髪 スキン 皮膚 しわ シワ しみ シミ たるみ 鼻 毛穴 角栓 皮脂 まつ毛 まつげ ニキビ にきび ほうれい線)}
shape = {sort:"shape",words:%w(整形 2重 ツルツル すべすべ つや ツヤ 美白 癖毛 剛毛 軟毛 さらさら サラサラ 赤み 墨 乾燥)}
fashion = {sort:"fashion",words:%w(ファッション コーデ トレンド 着せ替え 着こな トップス ボトムス)}
@beauty = [cosmetic, body, shape, fashion]

fashion_general = {sort: "fashion_general", words: %w(
    ファッション アパレル コーデ トレンド 着せ替え 着こな トップス ボトムス ブランド 服 衣 着 バッグ
)}
fashion_brand = {sort: "fashion_brand", words: %w(ユニクロ UNIQLO GU ZARA H&M SHEIN GRL)}

@fashion = [fashion_general, fashion_brand]
gadget_general = {sort:"general",words:%w(
        機器 端末 デバイス ガジェット バッテリー スマートフォン スマホ ラップトップ デスクトップ PC パソコン 充電 Bluetooth ブルートゥース wi-fi wifi 加湿器
        イヤホン ヘッドフォン スピーカー ウォッチ カメラ プロジェクター モバイル マウス キーボード タッチスクリーン USB lightning コントローラー スタンド ノイズキャンセリング ノイキャン
    )}
gadget_brand = {sort:"gadget_brand",words:%w(Apple Samsung Huawei Xiaomi Oppo Vivo Sony LG Google OnePlus Motorola Nokia)}
gadget_seris = {sotrt:"gadget_seris",words:%w(iPhone iPad MacBook AirPods Galaxy Mata Redmi AQUOS ChromeBook Xperia Pixel Anker GoPro Switch スイッチ ps5 プレステ プレイステーション)}
gadget_phrase = {sort:"gadget_phrase",words:%w(高音質 高画質 高性能 高容量 大容量 高出力 大出力)}
@gadget = [gadget_general, gadget_brand, gadget_seris, gadget_phrase]

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
@business = [sales, accounting, management, marketing, business_model, business_general]

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
@world = [treaty, two_countries, abbreviation, country, organization]

war = {sort:"war",words:
        %w(軍 戦争 戦闘 兵役 軍隊 戦場 攻撃 空爆 防御 兵士 戦艦 航空戦 戦術 戦勝 敗戦 戦争犯罪 非戦闘員
        平和 武器 軍事 講和 軍備拡張 軍縮 占領 戦争賠償 内戦 国際紛争 戦時国際法 戦争犠牲者 戦争孤児 捕虜
       核戦争 世界大戦 派兵 布告 宣戦布告 戦争中立 徴兵 戦争記念日 軍事演習 武装解除 停戦協定 戦争 軍隊 戦闘
       軍事 攻撃 侵攻 防御 反撃 戦術 兵士 戦犯 武器 戦争責任 占領 休戦 和平交渉
       軍事同盟 争い 戦禍 戦時 軍備 無差別攻撃 戦闘員 戦地 戦場 軍事作戦 徴兵 軍事力
       )}
war_spot = {sort:"weopon",words:
            %w(ウクライナ イスラエル ガザ ハマス)
        }
weopon = {sort:"weopon",words:
            %w()
        }
military_general = {sort:"military_general",words:
            %w(安全保障 陸自 陸上自衛隊 海自 自衛隊 空自 航空自衛隊)
        }
@military = [weopon, war, military_general, war_spot]

soccer_general = {sort:"soccer_general", words:
            %w(サッカー フリーキック ペナルティキック オフサイド)
        }
soccer_competition = {sort:"soccer_competition", words:
            %w(FIFA ワールドカップ W杯 AFC イングリッシュ・プレミアリーグ UEFAチャンピオンズリーグ コパ・リベルタドーレス)
        }
soccer_league = {sort:"soccer_league", words:
            %w(プレミアリーグ  ラ・リーガ セリエA ブンデスリーガ エールディヴィジ プリメイラ・リーガ プリメーラ・ディビシオン
            リーガMX 中国超級リーグ スュペル・リグ ロシア・プレミアリーガ スコティッシュ・プレミアシップ ジュピラー・プロ・リーグ
            スーパーリーグ エクストラクラサ
            )
        }
soccer_team = {sort:"soccer_team", words:
            %w(バルセロナFC レアル・マドリード マンチェスター・ユナイテッド リヴァプールFC マンチェスター・シティ 
            バイエルン・ミュンヘン パリ・サンジェルマン ユヴェントスFC ACミラン インテル・ミラノ チェルシーFC 
            アーセナルFC トッテナム・ホットスパー ボルシア・ドルトムント アトレティコ・マドリード リヨン ボカ・ジュニアーズ 
            リーヴァル・プレート アヤックス・アムステルダム ベンフィカ 侍ジャパン)
        }
@soccer = [soccer_general, soccer_competition, soccer_league, soccer_team]

baseball_general = {sort:"baseball_general", words:
        %w(野球 ベースボール ピッチャー バッター キャッチャー 野手 代打 ホームラン 塁)
    }
baseball_competition = {sort:"baseball_competition", words:
        %w(メジャーリーグ MLB ワールドシリーズ オールスターゲーム NPB 日本シリーズ 
        セ・リーグ パ・リーグ WBC カリビアンシリーズ リトルリーグワールドシリーズ 
        カレッジワールドシリーズ 甲子園)
    }

baseball_team = {sort:"baseball_team", words:
        %w(ニューヨーク・ヤンキース ボストン・レッドソックス ロサンゼルス・ドジャース トロント・ブルージェイズ
        読売ジャイアンツ 中日ドラゴンズ 東京ヤクルトスワローズ 阪神タイガース 福岡ソフトバンクホークス 
        埼玉西武ライオンズ 北海道日本ハムファイターズ 千葉ロッテマリーンズ
        )
    }
baseball_players = {sort:"baseball_competition", words:
        %w(大谷翔平 王貞治 長嶋茂雄 野茂英雄 原辰徳 松井秀喜 松坂大輔 福田淳一 青木宣親 菊池涼介 坂本勇人)
    }

minor_sports = {sorts:'minor_sports', words:
        %w(テニス 陸上 卓球 ラグビー バレー バドミントン)
}
@baseball = [baseball_general, baseball_general, baseball_competition, baseball_team, baseball_players]
@sports = [minor_sports].concat(@soccer).concat(@baseball).concat()

love_general = {sorts: 'love_general',  words:
        %w(恋 愛 好 抱 モテ 落とす 惚れ 付き合 本気 本命 デート キス イケメン あざと ボディ カップル 別れ 浮気 彼氏 彼女 男 女)
    }
male_love = {sorts: 'male_love',  words:
    %w(女 ラブホ ホテル 誘う 誘い)
    }
female_love = {sorts: 'female_love',  words:
    %w(彼氏 男)
    }
@love =  [love_general, male_love, female_love]