# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者を生成
Admin.create!( name: "Administrater",
							 email: "admin@disc.com",
							 password: 'password',
							 password_confirmation: 'password'
	)


# ジャンルを生成
Genre.create!(name: "未定")
genres = %w[J-Pop ロック/ポップス HIP-HOP R&B/ソウル Jazz/ブルース K-Pop/ワールド
					クラシック アニメ/ゲーム サウンドトラック 演歌 その他]
genres.each { |w| Genre.create!(name: w) }

# テストArtistを生成
Artist.create!(name: "未定")
artists = %w[RADWIMPS 浜崎あゆみ 米津玄師 Mr.Children 嵐 スピッツ あいみょん B'z
				椎名林檎 aiko 関ジャニ∞]
artists.each { |w| Artist.create!(name: w) }

# テストLabelを生成
Label.create!(name: "未定")
labels = %w[Sony ワーナー avex キングレコード ランティス ジェネオン ポニーキャニオン
	 			メディアファクトリー コロムビア]
labels.each	{ |w| Label.create!(name: w) }

# テストItemを生成
Item.create!( genre_id: 2,
							artist_id: 3,
							label_id: 4,
							name: 'Artistic!',
							price: 2020,
							sales_status: 0,
							stock: 99,
							image_id: "0d00591663ac382e9b9445144b53a62f00b4ab61459333b4ab6b8965aebd"
						  )

25.times do |n|
	name = "item-#{n+2}"
	image_id = "1009e3af54e95f69b46cb7f924da6c08395df162eab8c68007644bf13948"
	Item.create!( genre_id: rand(1..genres.length),
								artist_id: rand(1..artists.length),
								label_id: rand(1..labels.length),
								name: name,
								price: (rand (1..10)) *1000,
								sales_status: [0,1,2,3].sample,
								stock: rand(0..50),
								image_id: image_id
							  )
end

# テストDiscを生成
Item.all.length.times do |n|
	3.times do |i| # 商品毎に3つディスク持つ
		Disc.create!(item_id: n+1, number: i+1)
	end
end

# テストSongを生成
Disc.all.length.times do |n|
	rand(5..10).times do |i| # ディスク毎に5曲から10曲
		Song.create!(disc_id: n+1, number: i+1, name: "song-#{i+1}")
	end
end

# テストUserを生成
25.times do |n|
	last_name = %w[山口 安倍 後藤 伊藤 斎藤 高橋 高田 高山 山田 藤本 藤井 藤崎 東久邇宮 プルースト]
	first_name = %w[家康 義経 家光 光圀 忠家 義久 阿弖流為 サルヴァドール]
	last_name_kana = %w[ヤマグチ アベ イトウ タカハシ フジモト プルースト]
	first_name_kana = %w[イエヤス ミツクニ ヨシヒサ サルヴァドール]
	telephone_number = format('%011d',(rand(10..19))**7) # 適当な11桁
	email = "#{(0...8).map{ ('A'..'Z').to_a[rand(26)] }.join}@seeds.com"
	postal_code = format('%07d',(rand(10..19))**5) # 適当な7桁
	address = "東京都渋谷区神南1丁目19番11号パークウェースクエア#{rand(100)}-#{rand(100)}"
	payment = [1,2,3]
	password = "password"
	# is_quit = [false, true]
	User.create!( last_name: last_name.sample,
								first_name: first_name.sample,
								last_name_kana: last_name_kana.sample,
								first_name_kana: first_name_kana.sample,
								telephone_number: telephone_number,
							  email:email,
							  postal_code: postal_code,
							  address: address,
							  payment: payment.sample,
							  password:password,
							  password_confirmation:password,
							  # is_quit: false
							  )
end

# テストReviewを生成
25.times do |n|
	title = "title-#{n+1}"
	body = "body-#{(n+1)}"*100
	Review.create!( item_id: rand(1..Item.all.length),
									user_id: rand(1..User.all.length),
									title: title,
									body: body,
							  )
end

# テストOrderを生成
# User.all.each do |user|
# 	Order.create!( user_id: rand(1..User.all.length),
# 								 user_name: user.delivery_addresses.recipient,
# 								 postal_code: user.delivery_addresses.recipient,
# 							 	 address: user.delivery_addresses.details,
# 							 	 telephone_number: user.delivery_addresses.telephone_number,
# 							 	 subtotal_price: 
# 							  )
#end