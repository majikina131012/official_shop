# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: "ryuma@1012",
    password: "111111"
    )

Genre.create!(
    name: "key_ring"
)

Information.create!(
    title: "新商品入荷のお知らせ",
    body: "10月から新しいTシャツが入荷しました！"
)

Item.create!(
    genre_id: 1,
    name: "キーホルダー",
    description: "10月発売",
    price_without_tax: "600",
    status: 0
)