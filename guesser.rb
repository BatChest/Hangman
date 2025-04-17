class Guesser
  def initialize(name, host)
    @name = name
    @previous_guesses = []
    @host = host
  end

  # Gets user input and checks if its a single character
  # If not single char then gets prompted until meets criteria
  # if the input is incorrect then pushes it into an array
  # returns the user input
  def get_move()

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

  # Checks if the user input length is 1
  def check_valid_move(guess)
    guess.length == 1
  end

  # If the guess was correct then display the new current dispplay with the correct guess
  # If not, then we display our incorrect guesses with the old display
  def receive_feedback(correct, current_display)
    if correct == true
      puts current_display
    elsif correct == false
      puts "Incorrect guesses: #{@previous_guesses.join(', ')}"
      puts current_display
    end
  end

end