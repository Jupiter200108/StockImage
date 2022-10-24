# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'admin@admin3',
   password: 'testtest'
)

Category.create!(
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

Genre.create!(
 [
  {name: '写真',contents_status: 0},
  {name: 'イラスト',contents_status: 0},
  {name: '人物画像',contents_status: 0},
  {name: 'ドット絵',contents_status: 0},
  {name: 'その他',contents_status: 0},
 ]
)

EndUser.create!(
 [
  {email: 'olivia@test.com', name: 'Olivia', password: 'Olivia123'},
  {email: 'james@test.com', name: 'James', password: 'James123'},
  {email: 'lucas@test.com', name: 'Lucas', password: 'Lucas123'}
 ]
)