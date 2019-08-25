class Items

  def initialize
    @items = []
    @item_count = 10
  end

  def update(player)

    # 各スプライトのupdateメソッドを呼ぶ
    @items.each { |item| item.update }

    # playerとitemが衝突しているかチェックし衝突していればhitメソッドが呼ばれる
    Sprite.check(player, @items)

    # vanishしたスプライトを配列から取り除く
    Sprite.clean(@items)

    # 消えた分を補充する(常にアイテムがN個あるようにする)
    (item_count - @items.size).times do
      i = rand(1..100)
      if i < 34
        @items.push(Ramen.new)
      elsif i > 34 && i < 67
        @items.push(Udon.new)
      else
        @items.push(Soba.new)
      end
    end
  end

  def draw
    # 各スプライトのdrawメソッドを呼ぶ
    Sprite.draw(@items)
  end

  def item_count
    @item_count += 0.005
  end
end
