20.times do |i|
  Information.find_or_create_by!(title: "お知らせ#{i+1}") do |information|
    information.body = "これはお知らせ#{i+1}です。"
  end
end