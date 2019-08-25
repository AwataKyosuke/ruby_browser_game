class Item < Sprite

  def initialize(image)
    x = rand(Window.width - image.width)
    y = 0
    super(x, y, image)
    @speed_y = rand(5) + 10
  end

  def update
    self.y += @speed_y
    if self.y > Window.height
      self.vanish
    end
  end
end
