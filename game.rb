class Game
  def initialize(host, guesser)
    @host = host
    @guesser = guesser
  end

  def play(random_word)
    puts "Round 1:"
    # line_numbers = random_word.length
    @guesser.get_move


    # until line_numbers == 0 do
    #   print "_ "
    #   $stdout.flush
    #   line_numbers -= 1
    # end
    # puts
  end
end