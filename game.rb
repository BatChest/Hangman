class Game
  def initialize(host, guesser)
    @host = host
    @guesser = guesser
  end

  # We have 12 guesses and each guess we get the input our guess
  # Then our guess is then checked if its part of the word
  # Then we recieve feedback on it, if correct then display our correct guesse in
  # the correct spaces
  # We continue this until we correctly guess the word before we run out of turns
  # If we run out of turns and we haven't guess it, we loose and the answer is shown
  def play(random_word)
    rounds = 12
    puts @host.display
    loop do
      rounds -= 1
      puts "Guess #{rounds}:"
      guess = @guesser.get_move
      result = @host.check_guess_letter(guess)
      @guesser.receive_feedback(result, @host.display)
      game_over = check_for_winner
      if game_over == true
        break
      end
      if rounds <= 0
        puts "Game over! The word was: #{@host.reveal_answer}"
        break
      end
    end
  end

  # Here we check if the the current display array have any blank chars
  # If it doesn't then that means we guessed all the correct letters and win
  # If not then we keep going until we're out of turns
  def check_for_winner
    if @host.word_guessed?
      puts "Congratulations! You've guessed the word!"
      return true
    end
    return false
  end
end