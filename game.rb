class Game
  def initialize(host, guesser)
    @host = host
    @guesser = guesser
  end

  def play(random_word)
    rounds = 11
    loop do
      rounds -= 1
      puts "Guess #{rounds}:"
      # line_numbers = random_word.length
      guess = @guesser.get_move
      result = @host.check_guess_letter(guess)
      @guesser.receive_feedback(result, @host.display)

      if rounds == 0
        puts "You Loose"
        break
      end
    end


    # until line_numbers == 0 do
    #   print "_ "
    #   $stdout.flush
    #   line_numbers -= 1
    # end
    # puts
  end
end