require 'dxopal'
include DXOpal

require_remote 'player.rb'
require_remote 'item.rb'
require_remote 'ramen.rb'
require_remote 'udon.rb'
require_remote 'soba.rb'
require_remote 'items.rb'
require_remote 'game.rb'

# 画像の登録
Image.register(:player, 'images/player.png')
Image.register(:ramen, 'images/ra-men.png')
Image.register(:udon, 'images/udon.png')
Image.register(:soba, 'images/soba.png')
Image.register(:bg, 'images/background_image.png')
Image.register(:title, 'images/title.png')
Image.register(:result, 'images/result.png')

# 読み込みたい音声を登録する
Sound.register(:success, 'sounds/success.wav')
Sound.register(:failure, 'sounds/failure.wav')
Sound.register(:playing, 'sounds/playing.wav')

# スコア
GAME_INFO = {
  scene: :title,
  score: 0
}

Window.load_resources do
  game = Game.new
  game.run
end
