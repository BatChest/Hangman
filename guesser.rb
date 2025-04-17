class Guesser
  def initialize(name)
    @name = name
  end

  def get_move()
    # letter_guess = nil

    puts "Please enter a single letter:"
    player_input = gets.chomp

    valid = check_valid_move(player_input)

    until valid == true
      puts "Please enter a SINGLE letter:"
      player_input = gets.chomp
      valid = check_valid_move(player_input)
    end
    return player_input
  end

  def check_valid_move(guess)
    guess.length == 1
  end
end