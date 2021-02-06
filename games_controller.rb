require "./message_dialog"

class GamesController
  include MessageDialog

  EXP_CONSTANT = 2
  GOLD_CONSTANT = 3

  # バトルの処理
  def battle(**params)

    build_characters(params)

    loop do
      @player.attack(@monster)
      break if battle_end?

      @monster.attack(@player)
      break if battle_end?
    end
    battle_judgment
  end

  private
    def build_characters(**params)
      @player = params[:player]
      @monster = params[:monster]
    end

    # バトル終了の判定
    def battle_end?
      @player.hp <= 0 || @monster.hp <= 0
    end

    # プレイヤー勝利判定
    def player_win?
      @player.hp > 0
    end

    # プレイヤーの勝敗によってメッセージを変える
    def battle_judgment
      result = calculate_of_exp_and_gold
      end_message(result)
    end

    # 経験値とゴールドの計算
    def calculate_of_exp_and_gold
      if player_win?
        player_win_flag = true
        exp = (@monster.offense + @monster.defense) * EXP_CONSTANT
        gold = (@monster.offense + @monster.defense) * GOLD_CONSTANT
      else
        player_win_flag = false
        exp = 0
        gold = 0
      end

      { player_win_flag: player_win_flag,exp: exp, gold: gold }
    end
end
