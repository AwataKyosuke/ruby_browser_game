class Player < Sprite

  # 初期
  def initialize
    x = Window.width / 2
    y = Window.height - 100
    image = Image[:player]
    super(x, y, image)
    # 当たり判定を円で設定（X座標の中心, Y座標の中心, 半径）
    self.collision = [image.width / 2, image.height / 2, 16]
  end

  # 移動
  def update
    if Input.key_down?(K_LEFT) && self.x > 0
      self.x -= 12
    end
    if Input.key_down?(K_RIGHT) && self.x < (Window.width - Image[:player].width)
      self.x += 12
    end
    if Input.key_down?(K_UP) && self.y > 0
      self.y -= 8
    end
    if Input.key_down?(K_DOWN)  && self.y < (Window.height - Image[:player].height)
      self.y += 8
    end
  end

end
