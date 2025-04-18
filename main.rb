# when the game starts, script should load into the text file and selects a random word
require_relative 'game'
require_relative 'guesser'
require_relative 'host'
require_relative 'gamestate'

def set_up_game
  file_path = '/mnt/d/VSstuff/repos/Hangman/google-10000-english-no-swears.txt'
  host = Host.new("Computer")
  guesser = Guesser.new("Player", host)
  game_state = Game_State.new(host, guesser)

  random_word = host.randomly_select_word(file_path)

  game = Game.new(host, guesser, game_state)

  game.play(random_word)
end

def load_game
  puts "Would you like to load a game? y/n"
  input = gets.chomp
  if input == "y"
    game_state = Game_State.load("my_savegame.dat")
    if game_state
      @host = game_state.host
      @guesser = game_state.guesser
      @game = Game.new(@host, @guesser, game_state)
      @game.play(nil, game_state.remaining_rounds)
    else
      puts "Could not load game. Starting new game..."
      set_up_game
    end
  elsif input == "n"
    set_up_game
  end
end

load_game