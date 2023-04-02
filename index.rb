# 商品管理とユーザーが入力したらなんかする処理を書くファイル

# 外部ファイル呼ぶ
require "./book"
require "./peripheral"

# 商品の一覧と内容
book1 = Book.new(name: "Ruby入門", price: 2000, page_count: 300)
book2 = Book.new(name: "web入門", price: 1800, page_count: 250)
book3 = Book.new(name: "JavaScript入門", price: 2500, page_count: 350)

peripheral1 = Peripheral.new(name: "ワイヤレスマウス", price: 1200)
peripheral2 = Peripheral.new(name: "打感のいいキーボード", price: 15000)
peripheral3 = Peripheral.new(name: "4kモニター", price: 28000)

# items変数に配列代入
items = [book1, book2, book3, peripheral1, peripheral2, peripheral3]

puts "火曜日と金曜日は200円引き!!"
puts "-----------------------"
puts "商品一覧↓"

# itemsを一つ一つ取り出しitemという引数に代入

# indexにてidを振り分ける
index = 0
# each文で繰り返し処理
items.each do |item|
  puts "#{index}: #{item.info}"

  # index = index + 1の略↓ 1ずつ増やす
  index += 1
end

# 実際にお客さんに商品idを記入させる
puts "商品ナンバーを0~5までで記入してください"
puts "整数で５以上打つとバリデーションエラーバリバリ出ます"
puts "書籍のみ300ページ以上で2冊以上購入された場合、1000円引き!!!!!"
puts "cart_itemsがないから一個ずつしか買えません!(同じ本2冊w)"
puts "-----------------------"

# order変数に整数を記入させる　to_iは文字列から整数
order = gets.chomp.to_i
# 選択した商品を配列から商品オブジェクトを取り出しindex番号を取得。
selected_item = items[order]
# 先ほど取り出した商品オブジェクトに対してnameのみ出力
puts "お客様が選んだのは#{selected_item.name}です。"

# 割引等の合計金額と個数を求める
puts "いくつ買いますか？"

# count変数に整数を記入させる
count = gets.chomp.to_i
# 記入したcountに対して選択した商品の割引した合計金額を出力！
puts "合計金額は#{selected_item.grand_total(count)}円です！"
