class Soba < Item
  def initialize
    super(Image[:soba])
    # 当たり判定を円で設定（X座標の中心, Y座標の中心, 半径）
    self.collision = [image.width / 2, image.height / 2, 42]
  end

  def hit
    # 効果音を鳴らす
    Sound[:failure].play
    Sound[:playing].stop
    self.vanish
    GAME_INFO[:scene] = :game_over
  end
end
