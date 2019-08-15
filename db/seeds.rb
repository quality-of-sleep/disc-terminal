# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# ジャンルを生成
Genre.create!(name: "未定")
genres = %w[J-Pop ロック/ポップス HIP-HOP R&B/ソウル Jazz/ブルース K-Pop/ワールド
					クラシック アニメ/ゲーム サウンドトラック 演歌 その他]
genres.each do |n|
	Genre.create!(name: n)
end

# テストItemを生成
Artist.create!(name: "未定")
Label.create!(name: "未定")
26.times do |n|
	name = "item-#{n+1}"
	price = "#{(n+1)*100}"
	sales_status = 1
	stock = "#{n+1}"
	image_id = "img/img.jpg"
	Item.create!( name: name,
								price: price,
								sales_status: sales_status,
								stock: stock,
								image_id: image_id
							  )
end
# テストUserを生成
26.times do |n|
	last_name = "last-#{n+1}"
	first_name = "first-#{n+1}"
	last_name_kana = "last_kana-#{n+1}"
	first_name_kana = "first_kana-#{n+1}"
	telephone_number = "12345678" + format('%02d',"#{n+1}")
	email = "#{n+1}@seeds.com"
	postal_code = "12345" + format('%02d',"#{n+1}")
	address = "address-#{n+1}"
	payment = 1
	password = "password"
	is_quit = false
	User.create!( last_name: last_name,
								first_name: first_name,
								last_name_kana: last_name_kana,
								first_name_kana: last_name_kana,
								telephone_number: telephone_number,
							  email:email,
							  postal_code: postal_code,
							  address: address,
							  payment: payment,
							  password:password,
							  password_confirmation:password,
							  is_quit: false
							  )
end

# テストReviewを生成
26.times do |n|
	title = "title-#{n+1}"
	body = "body-#{(n+1)+500}"
	Review.create!( item_id: "#{n+1}",
									user_id: "#{n+1}",
									title: title,
									body: body,
							  )
end