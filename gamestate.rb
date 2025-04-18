class Game_State
  attr_accessor :game, :guesser, :host, :remaining_rounds
  def initialize(host, guesser, remaining_rounds = nil)
    @host = host
    @guesser = guesser
    @remaining_rounds = remaining_rounds
  end

  def save(filename = "savegame.dat")
    File.open(filename, "wb") do |file|
      file.write(Marshal.dump(self))
    end
    puts "Game saved to #{filename}"
  end

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