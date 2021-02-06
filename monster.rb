require "./character"
class Monster < Character

  POWER_UP_RATE = 1.5
  CALC_HALF_HP = 0.5

  def initialize(**params)
    super(
      name: params[:name],
      hp: params[:hp],
      offense: params[:offense],
      defense: params[:defense]
    )
    @status = false
    @half_hp = params[:hp] * CALC_HALF_HP
  end

  def attack(player)

    if @hp <= @half_hp && @status == false
      @status == true
      transform
    end
    damage = calculate_damage(player)
    cause_damage(target: player,damage: damage)

    # 攻撃時のメッセージ
    attack_message
    # ダメージ計算時のメッセージ
    damage_message(target: player,damage: damage)
  end

  private

  def calculate_damage(player)
    @offense - player.defense
  end

  def cause_damage(**params)
    target = params[:target]
    damage = params[:damage]
    target.hp -= damage
    target.hp = 0 if target.hp < 0
  end

  def transform
    transform_name = "ドラゴン"

    transform_message(name: @name,transform_name: transform_name)
    @offense *= POWER_UP_RATE
    @name = transform_name
  end
end
