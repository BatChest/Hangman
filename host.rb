class Host
  def initialize(name)
    @name = name
    @solution_array = []
    @display_array = []
  end

  def randomly_select_word(file_path)
    begin
      # First read from the file
      all_words = File.readlines(file_path, chomp: true)

      # Filter words that are between 5 and 12 characters
      valid_words = all_words.select { |word| word.length >= 5 && word.length <= 12 }

      if valid_words.empty?
        puts "No words are between 5 and 12 characters."
        return nil
      end

      # Select the random word from the file
      random_word = valid_words.sample

      return random_word

    # error handling, make sure the file exists
    rescue Errno::ENOENT
      puts "Error: File '#{file_path}' not found."
      return nil
    rescue => e
      puts "Error: #{e.message}"
      return nil
    end
  end

  private
  def solution
    @solution_array
  end
end