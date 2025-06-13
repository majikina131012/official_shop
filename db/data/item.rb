20.times do |i|
  Item.find_or_create_by!(name: "グッズ#{i+1}", genre_id: 1) do |item|
    item.description = "これはグッズ#{i+1}です。"
    item.price_without_tax = 2000
  end
end

20.times do |i|
  Item.find_or_create_by!(name: "CD#{i+1}", genre_id: 2) do |item|
    item.description = "これはCD#{i+1}です。"
    item.price_without_tax = 1500
  end
end