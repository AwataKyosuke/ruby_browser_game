class Game

  # おすすめラーメン店リスト
  SHOP_LIST = [
    ["中野", "二代目えん寺"],["歌舞伎町", "ラーメン二郎"],["小滝橋通", "龍の家"],["秋葉原", "MAZERU"],["荻窪", "暁月"],
    ["荻窪", "味噌っ子ふっく"],["新宿", "野郎商店"],["新宿", "三田製麺所"],["吉祥寺", "鷹神"],["渋谷", "ちばから"],["目黒", "ラーメン二郎"],
    ["新宿", "蒙古タンメン中本"],["神田", "つじ田"],["御徒町", "なんつっ亭"],["中野", "バラそば屋"]
  ]

  # 初期化
  def initialize

    # 画面サイズの設定
    Window.width = 1060
    Window.height = 800

    #準備
    preparation
  end

  # ゲーム開始前の準備
  def preparation
    @player = Player.new
    @items = Items.new
    @ramen_shop = SHOP_LIST.sample
    @start_time = Time.now
    GAME_INFO[:score] = 0
  end

  # ゲーム実行
  def run
    Window.loop do

      # 背景画像の描写
      Window.draw(0,0, Image[:bg])

      # シーンごとに処理を分ける
      case GAME_INFO[:scene]

      # タイトル画面
      when :title

        # タイトル用ののれん画像の描写
        Window.draw(65, 70, Image[:title])

        # タイトル用文字列の描写
        Window.draw_font((Window.height / 2) + 60, Window.width / 2, "PRESS SPACE", Font.default)

        # スペースキーが押されたらシーンを変える
        if Input.key_push?(K_SPACE)
          preparation
          Sound[:playing].play
          GAME_INFO[:scene] = :playing
        end

      # プレイ画面
      when :playing

        Window.draw_font(100, 100, "#{Time.now - @start_time}", Font.default)

        @player.update
        @items.update(@player)

        @player.draw
        @items.draw

      # ゲームオーバー画面
      when :game_over

        Window.draw(0, 0, Image[:result])
        Window.draw_font(120, 610, "今回、お前が食べたラーメンは・・・ #{GAME_INFO[:score]} 杯だ。", Font.default, color: [0, 0, 0])
        Window.draw_font(120, 650, "まだ食べ足りないだと？よし、俺のおすすめのラーメン屋を教えてやる。", Font.default, color: [0, 0, 0])
        Window.draw_font(120, 690, "お前におすすめのラーメン屋は、#{@ramen_shop[0]}にある「#{@ramen_shop[1]}」だ。", Font.default, color: [0, 0, 0])
        Window.draw_font(120, 730, "スペースキーを押せばもう1度ゲームにチャレンジできるぜ。", Font.default, color: [0, 0, 0])

        # スペースキーが押されたらゲームの状態をリセットし、シーンを変える
        if Input.key_push?(K_SPACE)
          preparation
          Sound[:playing].play
          GAME_INFO[:scene] = :playing
        end

      end
    end
  end
end
