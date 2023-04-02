# ２つのクラスに共通する部分

# Dateクラス呼ぶ
require "date"


class Item
  attr_accessor :name #インスタンス変数は商品名と値段
  attr_accessor :price

  # 空のインスタンスを作った時にこれらがキーワード引数(oo: :←忘れずに)が代入される
  def initialize(name:, price:)
    @name = name
    @price = price
  end

  # 商品の値段を教える 子クラスの共通点のみ　(@はインスタンス変数をへアクセスするため,selfでも可)
  def info
    return "#{@name}は#{@price}円です"
  end

  # 合計の金額と値引き条件のインスタンスメソッド
  def grand_total(count)
    # 合計の金額
    total_price = @price * count

    # 火曜日か金曜日の場合値引き
    if self.class.discount_day?
      return total_price -= 200
    end

    return total_price
  end

  # 今日の日付を取得し曜日を確認するインスタンスクラス ?をつけることで真偽値を返すことができる
  def self.discount_day?
    today = Date.today
    return today.tuesday? || today.friday?
  end
end

