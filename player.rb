require "./character"


class Player < Character
  CRITICAL_ATTACK_CONSTANT = 1.5

  def attack(monster)
    # 攻撃パターン
    attack_type = decision_attack_type
    # ダメージ計算
    damage = calculate_damage(target: monster, attack_type: attack_type)
    # HPダメージ反映
    cause_damage(target: monster,damage: damage)

    # 攻撃時のメッセージ
    attack_message(attack_type: attack_type)
    # ダメージ計算時のメッセージ
    damage_message(target: monster,damage: damage)
  end

  private

    def decision_attack_type
      attack_num = rand(4)

      if attack_num == 0
        "クリティカルヒット"
      else
        "通常攻撃"
      end
    end

    # ダメージ計算メソッド
    def calculate_damage(**params)
      target = params[:target]
      attack_type = params[:attack_type]

      if attack_type == "クリティカルヒット"
        # puts "クリティカルヒット!!"
        calculate_critical_attack - target.defense
      else
        # puts "通常攻撃"
        # 攻撃する側の攻撃力 - 攻撃される側の防御力
        @offense - target.defense
      end
    end

    # HPにダメージを反映させる
    def cause_damage(**params)
      target = params[:target]
      damage = params[:damage]
      target.hp -= damage
      # HPがマイナス値になったら0を代入
      target.hp = 0 if target.hp < 0

    end

    def calculate_critical_attack
      @offense * CRITICAL_ATTACK_CONSTANT
    end
end

