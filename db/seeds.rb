# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  {email: 'admin@admin',password: 'testtest'}
)

categories = Category.create!(
 [
  {name: '抽象'},
  {name: '動物・野生生物'},
  {name: '芸術'},
  {name: '背景・テクスチャ'},
  {name: '美容・ファッション'},
  {name: '建物・都市'},
  {name: 'ビジネス・金融'},
  {name: '有名人'},
  {name: '教育'},
  {name: '食べ物・飲み物'},
  {name: 'ヘルスケア・医療'},
  {name: '祝祭日・年中行事'},
  {name: 'イラスト・挿絵'},
  {name: '産業・工業'},
  {name: 'インテリア'},
  {name: '風景・アウトドア'},
  {name: '自然'},
  {name: '物'},
  {name: '人物'},
  {name: '宗教'},
  {name: 'スポーツ・娯楽'},
  {name: '交通'},
  {name: '科学'},
  {name: 'テクノロジー'},
  {name: 'アイコン・記号・標識'},
  {name: 'レトロ・ビンテージ'},
  {name: 'その他'},
 ]
)

genres = Genre.create!(
 [
  {name: '写真',contents_status: 0},
  {name: 'イラスト',contents_status: 0},
  {name: '人物画像',contents_status: 0},
  {name: 'その他',contents_status: 0},
  {name: 'ドット絵',contents_status: 0},
  {name: 'イメージ画像',contents_status: 0},
  {name: '動画',contents_status: 1},
 ]
)

users = EndUser.create!(
 [
  {email: 'olivia@test', name: 'Olivia', password: 'Olivia123'},
  {email: 'james@test', name: 'James', password: 'James123'},
  {email: 'lucas@test', name: 'Lucas', password: 'Lucas123'},
  {email: 'Marianne@test', name: 'Marianne', password: 'Marianne123'},
  {email: 'Nina@test', name: 'Nina', password: 'Nina123'},
  {email: 'Hamilton@test', name: 'Hamilton', password: 'Hamilton123'},
  {email: 'Pamela@test', name: 'Pamela', password: 'Pamela123'},
  {email: 'Gilbert@test', name: 'Gilbert', password: 'Gilbert123'},
  {email: 'Fred@test', name: 'Fred', password: 'Fred123'},
  {email: 'Rose@test', name: 'Rose', password: 'Rose123'},
  {email: 'Shirley@test', name: 'Shirley', password: 'Shirley123'},
  {email: 'Elvis@test', name: 'Elvis', password: 'Elvis123'},
  {email: 'Daniel@test', name: 'Daniel', password: 'Daniel123'},
  {email: 'Cedric@test', name: 'Cedric', password: 'Cedric123'},
  {email: 'Tammy@test', name: 'Tammy', password: 'Tammy123'},
  {email: 'Brandon@test', name: 'Brandon	', password: 'Brandon123'},
  {email: 'Vivian@test', name: 'Vivian', password: 'Vivian123'},
  {email: 'Zoe@test', name: 'Zoe', password: 'Zoe123'},
 ]
)

Item.create!(
 [
  {name: 'アルプスの雪山', content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/image2.jpg"), filename:"image2.jpg"), introduction: 'アルプスの雪山を映しました。test', end_user_id: users[17].id,category_id: categories[16].id,genre_id: genres[0].id,is_active: "true"},
  {name: '偉大な自然', content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/mv.jpg"), filename:"mv.jpg"), introduction: 'オセアニア地域の海で神秘的な風景を見ました。test', end_user_id: users[7].id,category_id: categories[15].id,genre_id: genres[0].id,is_active: "true"},
  {name: 'ヨーロッパの街道', content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/image3.jpg"), filename:"image3.jpg"), introduction: 'ヨーロッパの街道です。test', end_user_id: users[3].id,category_id: categories[15].id,genre_id: genres[0].id,is_active: "true"},
  {name: '灰色の森', content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/image4.jpg"), filename:"image4.jpg"), introduction: '綺麗な森林を加工してモノクロにしあげました。test', end_user_id: users[3].id,category_id: categories[16].id,genre_id: genres[0].id,is_active: "true"},
  {name: 'イタリアの谷底', content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/italy.jpg"), filename:"italy.jpg"), introduction: 'イタリアの田舎の風景です。test', end_user_id: users[3].id,category_id: categories[15].id,genre_id: genres[0].id,is_active: "true"},
  {name: '赤い鳥居', content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/japan2.jpg"), filename:"japan2.jpg"), introduction: '日本の伝統的な鳥居です。test', end_user_id: users[6].id,category_id: categories[19].id,genre_id: genres[0].id,is_active: "true"},
  {name: '華麗な雪景色', content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/snow.jpg"), filename:"snow.jpg"), introduction: 'とても綺麗な雪景色です。test', end_user_id: users[7].id,category_id: categories[16].id,genre_id: genres[0].id,is_active: "true"},
  {name: '星空の下の砂漠', content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/desert.jpg"), filename:"desert.jpg"), introduction: '砂漠の上で輝く星空が魅力的です。test', end_user_id: users[15].id,category_id: categories[15].id,genre_id: genres[0].id,is_active: "true"},
  {name: '光指す森林', content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/forest.jpg"), filename:"forest.jpg"), introduction: '森林の中に一筋の光が差し込む様子が神秘的です。test', end_user_id: users[15].id,category_id: categories[16].id,genre_id: genres[0].id,is_active: "true"},
 
 ]
)

Item.find_each do |item|
 if item.content.content_type.include?('image/')
  tags = Vision.get_image_data(item.content)
  tags.each do |tag|
    item.tags.create(name: tag)
  end
 end
end
