# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  { email: "admin@admin", password: "testtest" }
)

categories = Category.create!(
 [
  { name: "抽象" },
  { name: "動物・野生生物" },
  { name: "芸術" },
  { name: "背景・テクスチャ" },
  { name: "美容・ファッション" },
  { name: "建物・都市" },
  { name: "ビジネス・金融" },
  { name: "有名人" },
  { name: "教育" },
  { name: "食べ物・飲み物" },
  { name: "ヘルスケア・医療" },
  { name: "祝祭日・年中行事" },
  { name: "イラスト・挿絵" },
  { name: "産業・工業" },
  { name: "インテリア" },
  { name: "風景・アウトドア" },
  { name: "自然" },
  { name: "物" },
  { name: "人物" },
  { name: "宗教" },
  { name: "スポーツ・娯楽" },
  { name: "交通" },
  { name: "科学" },
  { name: "テクノロジー" },
  { name: "アイコン・記号・標識" },
  { name: "レトロ・ビンテージ" },
  { name: "その他" },
 ]
)

genres = Genre.create!(
 [
  { name: "写真", contents_status: 0 },
  { name: "イラスト", contents_status: 0 },
  { name: "人物画像", contents_status: 0 },
  { name: "その他", contents_status: 0 },
  { name: "ドット絵", contents_status: 0 },
  { name: "イメージ画像", contents_status: 0 },
  { name: "動画", contents_status: 1 },
 ]
)

users = EndUser.create!(
 [
  { email: "olivia@test", name: "Olivia", password: "Olivia123" },
  { email: "james@test", name: "James", password: "James123" },
  { email: "lucas@test", name: "Lucas", password: "Lucas123" },
  { email: "Marianne@test", name: "Marianne", password: "Marianne123" },
  { email: "Nina@test", name: "Nina", password: "Nina123" },
  { email: "Hamilton@test", name: "Hamilton", password: "Hamilton123" },
  { email: "Pamela@test", name: "Pamela", password: "Pamela123" },
  { email: "Gilbert@test", name: "Gilbert", password: "Gilbert123" },
  { email: "Fred@test", name: "Fred", password: "Fred123" },
  { email: "Rose@test", name: "Rose", password: "Rose123" },
  { email: "Shirley@test", name: "Shirley", password: "Shirley123" },
  { email: "Elvis@test", name: "Elvis", password: "Elvis123" },
  { email: "Daniel@test", name: "Daniel", password: "Daniel123" },
  { email: "Cedric@test", name: "Cedric", password: "Cedric123" },
  { email: "Tammy@test", name: "Tammy", password: "Tammy123" },
  { email: "Brandon@test", name: "Brandon", password: "Brandon123" },
  { email: "Vivian@test", name: "Vivian", password: "Vivian123" },
  { email: "Zoe@test", name: "Zoe", password: "Zoe123" },
 ]
)

ActiveStorage::AnalyzeJob.queue_adapter = :inline
ActiveStorage::PurgeJob.queue_adapter = :inline

Item.create!(
 [
  { name: "アルプスの雪山", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/image2.jpg"), filename: "image2.jpg"), introduction: "アルプスの雪山を映しました。test", end_user_id: users[17].id, category_id: categories[16].id, genre_id: genres[0].id, is_active: "true" },
  { name: "偉大な自然", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/mv.jpg"), filename: "mv.jpg"), introduction: "オセアニア地域の海で神秘的な風景を見ました。test", end_user_id: users[7].id, category_id: categories[15].id, genre_id: genres[0].id, is_active: "true" },
  { name: "ヨーロッパの街道", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/image3.jpg"), filename: "image3.jpg"), introduction: "ヨーロッパの街道です。test", end_user_id: users[3].id, category_id: categories[15].id, genre_id: genres[0].id, is_active: "true" },
  { name: "灰色の森", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/image4.jpg"), filename: "image4.jpg"), introduction: "綺麗な森林を加工してモノクロにしあげました。test", end_user_id: users[3].id, category_id: categories[16].id, genre_id: genres[0].id, is_active: "true" },
  { name: "イタリアの谷底", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/italy.jpg"), filename: "italy.jpg"), introduction: "イタリアの田舎の風景です。test", end_user_id: users[3].id, category_id: categories[15].id, genre_id: genres[0].id, is_active: "true" },
  { name: "赤い鳥居", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/japan2.jpg"), filename: "japan2.jpg"), introduction: "日本の伝統的な鳥居です。test", end_user_id: users[6].id, category_id: categories[19].id, genre_id: genres[0].id, is_active: "true" },
  { name: "華麗な雪景色", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/snow.jpg"), filename: "snow.jpg"), introduction: "とても綺麗な雪景色です。test", end_user_id: users[7].id, category_id: categories[16].id, genre_id: genres[0].id, is_active: "true" },
  { name: "星空の下の砂漠", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/desert.jpg"), filename: "desert.jpg"), introduction: "砂漠の上で輝く星空が魅力的です。test", end_user_id: users[15].id, category_id: categories[15].id, genre_id: genres[0].id, is_active: "true" },
  { name: "光指す森林", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/forest.jpg"), filename: "forest.jpg"), introduction: "森林の中に一筋の光が差し込む様子が神秘的です。test", end_user_id: users[15].id, category_id: categories[16].id, genre_id: genres[0].id, is_active: "true" },
  { name: "初咲きの桜", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/japan.jpg"), filename: "japan.jpg"), introduction: "日本の初咲きの桜を収めました。test", end_user_id: users[6].id, category_id: categories[16].id, genre_id: genres[0].id, is_active: "true" },
  { name: "アジアの棚田", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/asia.jpg"), filename: "asia.jpg"), introduction: "アジアの棚田で作業する親子の写真です。test", end_user_id: users[0].id, category_id: categories[17].id, genre_id: genres[0].id, is_active: "true" },
  { name: "大きな湖", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/lake.jpg"), filename: "lake.jpg"), introduction: "湖です。test", end_user_id: users[7].id, category_id: categories[16].id, genre_id: genres[0].id, is_active: "true" },
  { name: "ヨーロッパの街並み", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/image1.jpg"), filename: "image1.jpg"), introduction: "ヨーロッパの街並みが綺麗です。test", end_user_id: users[15].id, category_id: categories[15].id, genre_id: genres[0].id, is_active: "true" },
  { name: "草原に佇む牛", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/cattle.mp4"), filename: "cattle.mp4"), introduction: "草原の牛を捉えています。test", end_user_id: users[11].id, category_id: categories[1].id, genre_id: genres[6].id, is_active: "true" },
  { name: "広大な農場", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/image5.jpg"), filename: "image5.jpg"), introduction: "巨大な農場を映しました。test", end_user_id: users[3].id, category_id: categories[15].id, genre_id: genres[0].id, is_active: "true" },
  { name: "空港", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/airport.jpg"), filename: "airport.jpg"), introduction: "一般的な空港です。test", end_user_id: users[0].id, category_id: categories[21].id, genre_id: genres[0].id, is_active: "true" },
  { name: "血清作成", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/health1.jpg"), filename: "health1.jpg"), introduction: "血清を作成している様子のイメージ画像です。test", end_user_id: users[1].id, category_id: categories[10].id, genre_id: genres[5].id, is_active: "true" },
  { name: "壁", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/abstract1.jpg"), filename: "abstract1.jpg"), introduction: "壁の抽象画像です。test", end_user_id: users[1].id, category_id: categories[0].id, genre_id: genres[0].id, is_active: "true" },
  { name: "青き渦", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/abstract2.jpg"), filename: "abstract2.jpg"), introduction: "青い渦の抽象画像です。test", end_user_id: users[11].id, category_id: categories[21].id, genre_id: genres[0].id, is_active: "true" },
  { name: "絵の具と筆", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/art1.jpg"), filename: "art1.jpg"), introduction: "絵画の世界にようこそ。test", end_user_id: users[1].id, category_id: categories[2].id, genre_id: genres[0].id, is_active: "true" },
  { name: "取引に関わる男女", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/illustration7.jpg"), filename: "illustration7.jpg"), introduction: "ビットコイン取引に関わる男女の絵となっています。test", end_user_id: users[7].id, category_id: categories[6].id, genre_id: genres[1].id, is_active: "true" },
  { name: "造花を持つ女性", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/illustration6.jpg"), filename: "illustration6.jpg"), introduction: "造花を持つ女性です。test", end_user_id: users[11].id, category_id: categories[18].id, genre_id: genres[1].id, is_active: "true" },
  { name: "サーファーを持つ男性", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/illustration3.jpg"), filename: "illustration3.jpg"), introduction: "サーファーを持つ男性の絵です。test", end_user_id: users[1].id, category_id: categories[18].id, genre_id: genres[1].id, is_active: "true" },
  { name: "電卓", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/illustration13.jpg"), filename: "illustration13.jpg"), introduction: "電卓の絵です。test", end_user_id: users[1].id, category_id: categories[8].id, genre_id: genres[1].id, is_active: "true" },
  { name: "2羽のフラミンゴ", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/illustration16.jpg"), filename: "illustration16.jpg"), introduction: "2羽のフラミンゴが綺麗に並んでいます。test", end_user_id: users[1].id, category_id: categories[1].id, genre_id: genres[1].id, is_active: "true" },
  { name: "肉食獣", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/illustration17.jpg"), filename: "illustration17.jpg"), introduction: "肉食動物をカッコよく描きました。test", end_user_id: users[16].id, category_id: categories[1].id, genre_id: genres[1].id, is_active: "true" },
  { name: "サンダル", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/illustration12.jpg"), filename: "illustration12.jpg"), introduction: "サンダルの絵です。test", end_user_id: users[1].id, category_id: categories[17].id, genre_id: genres[1].id, is_active: "true" },
  { name: "道路", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/road.jpg"), filename: "road.jpg"), introduction: "道路です。test", end_user_id: users[7].id, category_id: categories[0].id, genre_id: genres[0].id, is_active: "true" },
  { name: "黒い犬", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/illustration2.jpg"), filename: "illustration2.jpg"), introduction: "黒い犬の絵です。test", end_user_id: users[1].id, category_id: categories[1].id, genre_id: genres[1].id, is_active: "true" },
  { name: "絵を描く女性", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/illustration18.jpg"), filename: "illustration18.jpg"), introduction: "絵を描く女性の絵です。test", end_user_id: users[16].id, category_id: categories[18].id, genre_id: genres[1].id, is_active: "true" },
  { name: "ワクチン容器", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/illustration9.jpg"), filename: "illustration9.jpg"), introduction: "ワクチン容器の絵です。test", end_user_id: users[5].id, category_id: categories[10].id, genre_id: genres[1].id, is_active: "true" },
  { name: "明かりを持つ女性", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/illustration14.jpg"), filename: "illustration14.jpg"), introduction: "明かりを持つ女性を綺麗にかきました。test", end_user_id: users[1].id, category_id: categories[18].id, genre_id: genres[1].id, is_active: "true" },
  { name: "プレゼントと女性", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/illustration4.jpg"), filename: "illustration4.jpg"), introduction: "プレゼントと女性の絵です。test", end_user_id: users[1].id, category_id: categories[0].id, genre_id: genres[1].id, is_active: "true" },
  { name: "座る男性", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/illustration5.jpg"), filename: "illustration5.jpg"), introduction: "座る男性の絵です。test", end_user_id: users[1].id, category_id: categories[18].id, genre_id: genres[1].id, is_active: "true" },
  { name: "欧米の街並み", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/building.mp4"), filename: "building.mp4"), introduction: "欧米の街並みを捉えた動画です。test", end_user_id: users[1].id, category_id: categories[5].id, genre_id: genres[6].id, is_active: "true" },
  { name: "hand", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/illustration15.jpg"), filename: "illustration15.jpg"), introduction: "hand。test", end_user_id: users[1].id, category_id: categories[12].id, genre_id: genres[1].id, is_active: "true" },
  { name: "ばんそうこ", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/illustration10.jpg"), filename: "illustration10.jpg"), introduction: "ばんそうこの絵です。test", end_user_id: users[1].id, category_id: categories[10].id, genre_id: genres[1].id, is_active: "true" },
  { name: "ねずみちゃん", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/illustration11.jpg"), filename: "illustration11.jpg"), introduction: "ねずみを可愛く書きました。test", end_user_id: users[1].id, category_id: categories[1].id, genre_id: genres[1].id, is_active: "true" },
  { name: "壁に描かれた絵", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/art2.jpg"), filename: "art2.jpg"), introduction: "壁に描かれた絵の抽象画です。test", end_user_id: users[1].id, category_id: categories[2].id, genre_id: genres[0].id, is_active: "true" },
  { name: "日の出", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sunset.jpg"), filename: "sunset.jpg"), introduction: "日の出の落ち着く雰囲気を表現しました。test", end_user_id: users[7].id, category_id: categories[16].id, genre_id: genres[0].id, is_active: "true" },
  { name: "ヘモグロビン", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/health2.jpg"), filename: "health2.jpg"), introduction: "ヘモグロビンのイメージ画像です。test", end_user_id: users[1].id, category_id: categories[10].id, genre_id: genres[5].id, is_active: "true" },
  { name: "リサイクルを掲げる女性", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/illustration1.jpg"), filename: "illustration1.jpg"), introduction: "リサイクルを掲げる女性です。test", end_user_id: users[1].id, category_id: categories[0].id, genre_id: genres[1].id, is_active: "true" },
  { name: "ハンモックで休憩する男女", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/illustration8.jpg"), filename: "illustration8.jpg"), introduction: "ハンモックで休憩する男女の絵です。test", end_user_id: users[11].id, category_id: categories[20].id, genre_id: genres[1].id, is_active: "true" },
  { name: "アジアのお祭り", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/holiday1.jpg"), filename: "holiday1.jpg"), introduction: "アジアの伝統的なお祭りの風景です。test", end_user_id: users[3].id, category_id: categories[11].id, genre_id: genres[0].id, is_active: "true" },
  { name: "クローク建築の建物", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/photo1.jpg"), filename: "photo1.jpg"), introduction: "クローク建築の建物です。test", end_user_id: users[10].id, category_id: categories[5].id, genre_id: genres[0].id, is_active: "true" },
  { name: "覗く猫", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/photo2.jpg"), filename: "photo2.jpg"), introduction: "布団の中からこちらをのぞいています。test", end_user_id: users[10].id, category_id: categories[1].id, genre_id: genres[0].id, is_active: "true" },
  { name: "夕方の電車", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/photo3.jpg"), filename: "photo3.jpg"), introduction: "夕方の時間帯を走る電車を写真におさめました。test", end_user_id: users[11].id, category_id: categories[21].id, genre_id: genres[0].id, is_active: "true" },
  { name: "悲しきロバ", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/photo4.jpg"), filename: "photo4.jpg"), introduction: "悲しそうなロバの写真です。test", end_user_id: users[10].id, category_id: categories[18].id, genre_id: genres[0].id, is_active: "true" },
  { name: "おしゃれな男性", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/photo5.jpg"), filename: "photo5.jpg"), introduction: "男の人を収めた素材です。test", end_user_id: users[13].id, category_id: categories[1].id, genre_id: genres[0].id, is_active: "true" },
  { name: "心落ち着く焚き火", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/photo6.jpg"), filename: "photo6.jpg"), introduction: "焚き火のほのうに惹かれました。test", end_user_id: users[13].id, category_id: categories[15].id, genre_id: genres[0].id, is_active: "true" },
  { name: "紫の世界", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/photo7.jpg"), filename: "photo7.jpg"), introduction: "綺麗な紫色の抽象風景です。test", end_user_id: users[13].id, category_id: categories[3].id, genre_id: genres[5].id, is_active: "true" },
  { name: "混沌", content: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/photo8.jpg"), filename: "photo8.jpg"), introduction: "黄色と紫を主体とした作品です。test", end_user_id: users[13].id, category_id: categories[3].id, genre_id: genres[5].id, is_active: "true" },
 ] 
)

ActiveStorage::AnalyzeJob.queue_adapter = :inline
ActiveStorage::PurgeJob.queue_adapter = :inline

Item.find_each do |item|
  if item.content.content_type.include?("image/")
    tags = Vision.get_image_data(item.content)
    tags.each do |tag|
      item.tags.create(name: tag)
    end
  end
end
