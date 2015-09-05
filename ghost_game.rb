require_relative 'ghost_player'

class Game

  attr_reader :current_player

  def initialize(player1, player2, dictionary = [])
    @dictionary = dictionary

    @player1 = player1

    @player2 = player2

    @current_player = player1
  end

  def new_board
    @game_dict = @dictionary
    @fragment = ""
  end

  def play
    puts "Welcome to ghost!\n"
    puts
    until @current_player.victory_count == 5
      new_board
      play_round
    end

    puts "#{@current_player.name} wins the game!"
    puts
    puts "Current score:"
    puts "#{score}\n"
    puts
  end

  def play_round
    until loss?
      letter = @current_player.get_letter
      @fragment += letter
      puts "Fragment is now #{@fragment}"
      update_dictionary!
      switch_players!
    end

    @current_player.victory_count += 1
    puts "#{@current_player.name} wins the round!\n"
    puts "Current score:"
    puts "#{score}"
  end

  def score
    "#{@player1.name}: #{@player1.victory_count}, #{@player2.name}: #{@player2.victory_count}"
  end

  def update_dictionary!
    @game_dict = @game_dict.select do |word|
      word[0..@fragment.length-1] == @fragment
    end
  end

  def loss?
    @game_dict.length < 1
  end

  def switch_players!
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end


end

if $PROGRAM_NAME == __FILE__
  dictionary = File.readlines(ARGV[0])
  game = Game.new(Player.new("David"), Player.new("Gregory"), dictionary)
  game.play
end
