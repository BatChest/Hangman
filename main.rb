# when the game starts, script should load into the text file and selects a random word
require_relative 'game'
require_relative 'guesser'
require_relative 'host'

def set_up_game
  file_path = '/mnt/d/VSstuff/repos/Hangman/google-10000-english-no-swears.txt'
  host = Host.new("Computer")
  guesser = Guesser.new("Player", host)

  random_word = host.randomly_select_word(file_path)

  game = Game.new(host, guesser)

  game.play(random_word)
end

set_up_game