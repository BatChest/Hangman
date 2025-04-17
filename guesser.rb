class Guesser
  def initialize(name, host)
    @name = name
    @previous_guesses = []
    @host = host
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
    if @host.check_guess_letter(player_input) == false
      @previous_guesses << player_input
    end

    return player_input
  end

  def check_valid_move(guess)
    guess.length == 1
  end

  def receive_feedback(correct, current_display)
    if correct == true
      puts current_display
    elsif correct == false
      puts "Incorrect guesses: #{@previous_guesses.join(', ')}"
      puts current_display
    end
  end

end