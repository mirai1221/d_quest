module MessageDialog
  # 攻撃時のメッセージ
  def attack_message(**params)
    puts "#{@name}の攻撃！"
    puts "クリティカルヒット" if params[:attack_type] == "クリティカルヒット"
  end

  # ダメージを受けた時のメッセージ
  def damage_message(**params)
    target = params[:target]
    damage = params[:damage]

    puts <<~EOS

    #{target.name}は#{damage.round}のダメージを受けた
    #{target.name}の残りのHPは#{target.hp.round}だ

    EOS
  end

  # バトルが終了した時のメッセージ
  def end_message(result)
    if result[:player_win_flag]
      puts <<~EOS

      勇者は戦いに勝った
      #{result[:exp].round}の経験値と#{result[:gold].round}ゴールドを獲得した

      EOS
    else
      puts <<~EOS

      勇者は戦いに負けた
      目の前が真っ暗になった

      EOS
    end
  end

  def transform_message(**params)
    name = params[:name]
    transform_name = params[:transform_name]
    puts <<~TEXT
    #{name}は怒っている
    #{name}は#{transform_name}に変身した
    TEXT
  end
end
