class Ramen < Item
  def initialize
    super(Image[:ramen])
    # 当たり判定を円で設定（X座標の中心, Y座標の中心, 半径）
    self.collision = [image.width / 2, image.height / 2, 56]
  end

  def hit
    # 効果音を鳴らす
    Sound[:success].play
    self.vanish
    GAME_INFO[:score] += 1
  end
end
