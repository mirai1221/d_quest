require "./player"
require "./monster"
require './games_controller'

games_controller = GamesController.new

player = Player.new(name: "勇者",hp: 500,offense: 150,defense: 100)
monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)

games_controller.battle(player: player, monster: monster)
