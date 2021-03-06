# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


osaka, hyogo, kyoto, siga,nara,wakayama = Area.create(
  [
    { name: '大阪' },
    { name: '兵庫' },
    { name: '京都' },
    { name: '滋賀' },
    { name: '奈良' },
    { name: '和歌山' }
  ]
)

['大阪市','堺市''能勢町','豊能町','池田市','箕面市','豊中市','茨木市','高槻市','島本町', '吹田市','摂津市','枚方市','交野市','寝屋川市','守口市','門真市','四條畷市','大東市','東大阪市','八尾市','柏原市','和泉市','高石市','泉大津市','忠岡町','岸和田市','貝塚市','熊取町','泉佐野市','田尻町','泉南市','阪南市','岬町','松原市','羽曳野市','藤井寺市', '太子町','河南町','千早赤阪村','富田林市','大阪狭山市','河内長野市'].each do |name|
    osaka.children.create(name: name)
end


[ '神戸市','姫路市',
    '尼崎市',
    '明石市',
    '西宮市',
    '洲本市',
    '芦屋市',
    '伊丹市',
    '相生市',
    '豊岡市',
    '加古川市',
    '赤穂市',
    '西脇市',
    '宝塚市',
    '三木市',
    '高砂市',
    '川西市',
    '小野市',
    '三田市',
    '加西市',
    '丹波篠山市',
    '養父市',
    '丹波市',
    '南あわじ市',
    '朝来市',
    '淡路市',
    '宍粟市',
    '加東市',
    'たつの市',
    '猪名川町',
    '多可町',
    '稲美町',
    '播磨町',
    '市川町',
    '福崎町',
    '神河町',
    '太子町',
    '上郡町',
    '佐用町',
    '香美町',
    '新温泉町'].each do |name|
  hyogo.children.create(name: name)
end

['京都市',
    '福知山市',
    '舞鶴市',
    '綾部市',
    '宇治市',
    '宮津市',
    '亀岡市',
    '城陽市',
    '向日市',
    '長岡京市',
    '八幡市',
    '京田辺市',
    '京丹後市',
    '南丹市',
    '木津川市',
    '大山崎町',
    '久御山町',
    '井手町',
    '宇治田原町',
    '笠置町',
    '和束町',
    '南山城村',
    '精華町',
    '京丹波町',
    '伊根町',
    '与謝野町'].each do |name|
  kyoto.children.create(name: name)
end

['大津市',
 '彦根市',
 '長浜市',
 '近江八幡市',
 '草津市',
 '守山市',
 '栗東市',
 '甲賀市',
 '野洲市',
 '湖南市',
 '高島市',
 '東近江市',
 '米原市',
 '日野町',
 '竜王町',
 '愛荘町',
 '豊郷町',
 '甲良町',
 '多賀町'].each do |name|
    siga.children.create(name: name)
  end
['奈良市',
    '大和高田市',
    '大和郡山市',
    '天理市',
    '橿原市',
    '桜井市',
    '五條市',
    '御所市',
    '生駒市',
    '香芝市',
    '葛城市',
    '宇陀市',
    '平群町',
    '三郷町',
    '斑鳩町',
    '安堵町', 
    '川西町',
    '三宅町',
    '田原本町',
    '高取町',
    '上牧町',
    '王寺町',
    '広陵町',
    '河合町',
    '吉野町',
    '大淀町',
    '下市町',
    '山添村',
    '曽爾村',
    '御杖村',
    '明日香村',
    '黒滝村',
    '天川村',
    '野迫川村',
    '十津川村',
    '下北山村',
    '上北山村',
    '川上村',
    '東吉野村'].each do |name|
  nara.children.create(name: name)
end

['和歌山市',
    '海南市',
    '橋本市',
    '有田市',
    '御坊市',
    '田辺市',
    '新宮市',
    '紀の川市',
    '岩出市',
   '紀美野町',
    'かつらぎ町',
    '九度山町',
    '高野町',
    '湯浅町',
    '広川町',
    '有田川町',
    '美浜町',
    '日高町',
    '由良町',
    '印南町',
    'みなべ町',
    '日高川町',
    '白浜町',
    '上富田町',
    'すさみ町',
    '那智勝浦町',
    '太地町',
    '古座川町',
    '串本町',
   '北山村'].each do |name|
    wakayama.children.create(name: name)
  end