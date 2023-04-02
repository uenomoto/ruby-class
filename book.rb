# 書籍のクラス

require "./item"

class Book < Item

  attr_accessor :page_count

  # Itemクラスから継承しつつ本クラスだけページ数を追加
  def initialize(name:, price:, page_count:)
    super(name: name, price: price)
    @page_count = page_count
  end

  # オーバーライドにて上書き
  def info
    return "書籍: #{@name}は#{@price}円です。ページ数は#{@page_count}ページです"
  end


  # itemクラスからオーバーライドで書籍に関する条件を上書き
  def grand_total(count)
    # 合計の金額
    total_price = @price * count

    # 書籍が300ページ以上で2冊以上購入された場合、1000円引き。
    if @page_count >= 300 && count >= 2
      return total_price -= 1000
    end

    # 火曜日か金曜日の場合値引き
    if self.class.discount_day?
      return total_price -= 200
    end

    # 割引した金額と合計金額をかえす
    return total_price
  end

end
