# 周辺機器のクラス

require "./item"


class Peripheral < Item

  def initialize(name:, price:)
    super(name: name, price: price)
  end

  # オーバーライド
  def info
    return "周辺機器: #{@name}は#{@price}円です"
  end

  # 他はitemクラスから継承
end
