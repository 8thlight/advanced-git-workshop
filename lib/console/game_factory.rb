require "console/player_factory"
require "core/game"

module GameOptions
  HUMAN_VS_HUMAN = "1"
  HUMAN_VS_MACHINE = "2"
  MACHINE_VS_HUMAN = "3"
  MACHINE_VS_MACHINE = "4"
end

class GameFactory
  def create_game(option)
    p_factory = PlayerFactory.new
    player1, player2 = nil, nil

    case option
    when GameOptions::HUMAN_VS_HUMAN
      player1 = p_factory.create_player(PlayerOptions::Human, "X")
      player2 = p_factory.create_player(PlayerOptions::Human, "O")
    when GameOptions::HUMAN_VS_MACHINE
      player1 = p_factory.create_player(PlayerOptions::Human, "X")
      player2 = p_factory.create_player(PlayerOptions::Machine, "O")
    when GameOptions::MACHINE_VS_HUMAN
      player1 = p_factory.create_player(PlayerOptions::Machine, "X")
      player2 = p_factory.create_player(PlayerOptions::Human, "O")
    when GameOptions::MACHINE_VS_MACHINE
      player1 = p_factory.create_player(PlayerOptions::Machine, "X")
      player2 = p_factory.create_player(PlayerOptions::Machine, "O")
    else
      raise NotImplementedError.
        new("#{option}# is not a valid game option.")
    end

    Game.new(player1, player2)
  end
end