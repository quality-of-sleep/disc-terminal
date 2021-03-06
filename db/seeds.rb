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

27.times do |n|
	name = "item-#{n+2}"
	image_id = "0940a025bb93acb4117f8d505eeca15723063cd491ffdcf6ae2c5c868448"
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
27.times do |n|
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
							  email: email,
							  postal_code: postal_code,
							  address: address,
							  payment: payment.sample,
							  password: password,
							  password_confirmation: password,
							  # is_quit: is_quit
							  )
end

# テストCartを生成
User.all.each do |user|
	Item.all.each do |item|
		Cart.create!( user_id: user.id,
									item_id: item.id,
									amount: rand(0..3)
							  )
	end
end

# テストDeliveryAddressを生成
User.all.each do |user|
	rand(1..2).times do |i|
		DeliveryAddress.create!(
			user_id: user.id,
			recipient: [user.last_name,"受取人"][i],
			postal_code: [user.postal_code,"受取郵便番号"][i],
			details: [user.address,"受取住所"][i],
			telephone_number: [user.telephone_number,"受取電話番号"][i]
		)
	end
end

# テストOrderを生成
User.all.each do |user|
	person = user.delivery_addresses[[0].sample]
	subtotal_price = rand(2..6)*rand(2..6)*100
	carriage = 500
	Order.create!(
		user_id: user.id,
		user_name: person.recipient,
		postal_code: person.postal_code,
		address: person.details,
		telephone_number: person.telephone_number,
		payment: [1,2,3].sample,
		subtotal_price: subtotal_price,
		carriage: carriage,
		tax: subtotal_price*0.08,
		total_price: subtotal_price*1.08 + carriage,
		delivery_status: [1,2,3,4].sample
		)
end

Order.all.length.times do |n|
	item = Item.find(n+1)
	OrderDetail.create!(
		order_id: n+1,
		item_id: item.id,
		item_name: item.name,
		artist: item.artist,
		price: item.price,
		amount: 2
	)
end

# テストReviewを生成
27.times do |n|
	title = "title-#{n+1}"
	body = "body-#{(n+1)}"*100
	Review.create!( item_id: rand(1..Item.all.length),
									user_id: rand(1..User.all.length),
									title: title,
									body: body,
							  )
end

