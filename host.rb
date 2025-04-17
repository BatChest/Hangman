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

      # Turn the solution word in an array of characters
      @solution_array = random_word.chars
      @display_array = "_" * @solution_array.length

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

  # Goes through the solution array
  # If the guessed letter is in the solution then we replace
  # the empty space with the guessed letter
  def check_guess_letter(letter)
    found = false
    @solution_array.each_with_index do |char, index|
      if char == letter
        @display_array[index] = letter
        found = true
      end
    end
    found
  end

  def display
    @display_array
  end

  # Checks if the current display array have any "_" chars
  def word_guessed?
    !@display_array.include?("_")
  end

  # shows the answer
  # ONLY AT THE END OF GAME
  def reveal_answer
    @solution_array.join
  end

  private
  def solution
    @solution_array
  end
end