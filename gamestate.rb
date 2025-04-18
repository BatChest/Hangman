class Game_State
  attr_accessor :game, :guesser, :host, :remaining_rounds
  def initialize(host, guesser, remaining_rounds = nil)
    @host = host
    @guesser = guesser
    @remaining_rounds = remaining_rounds
  end

  # Serialization stuff that I'm still pretty unsure about
  # save method will create a data file that will write down all our
  # class data into it
  def save(filename = "savegame.dat")
    File.open(filename, "wb") do |file|
      file.write(Marshal.dump(self))
    end
    puts "Game saved to #{filename}"
  end

  # Here we are then opening our file where we stored the save data
  # And then we read it
  def self.load(filename = "savegame.dat")
    if File.exist?(filename)
      File.open(filename, "rb") do |file|
        Marshal.load(file.read)
      end
    else
      puts "No save file found."
      nil
    end
  end
end