class Guesser
  def initialize(name, host)
    @name = name
    @previous_guesses = []
    @host = host
  end

  # Refactored for reusability that just gets the user input
  # allows for us to call a different function inside that asks for either a letter guess or
  # yes or no when asked for saving a game
  def get_input(prompt:, error_msg:, &validation)
    loop do
      puts prompt
      input = gets.chomp
      if validation.call(input)
        if @host && !@host.check_guess_letter(input)
          @previous_guesses << input
        end
        return input
      else
        puts error_msg
      end
    end
  end

  # Here we are just asking for the user to guess a letter during each round
  # using the check_valid_move for checking for a valid input (1 char length)
  def get_move
    get_input(
      prompt: "Please enter a single letter:",
      error_msg: "Invalid input. Please enter a SINGLE letter.",
      &method(:check_valid_move)
    )
  end

  # Returns true for 'y', false for 'n'
  # Simply ask user if you want to save the game
  # Uses a custom lambda funciton that only accepts 'y' or 'n'
  def get_yes_no
    get_input(
      prompt: "Would you like to save your game? (y/n):",
      error_msg: "Invalid input. Please enter 'y' or 'n'.",
      &lambda { |input| input.downcase =~ /^[yn]$/ }
    ).downcase == 'y'
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