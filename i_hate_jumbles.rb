
# a class for descrambling single-word word anagrams
class IHateJumbles
  require 'json'

  #The hash table key is a set of characters, the value is an array of valid words that can made with those characters
  def initialize
    @hash_dict = {}
  end
  #input is a string
  # puts error message if string has spaces in middle or contains non alphabetic characters
  # returns a string, capitlized and sorted alphabetically
  private
  def alpha_num(scram_word)
    word = scram_word.upcase.strip
    valid_word = true
    word.each_char do |c|
      valid_word = valid_word && c.ord >= 65 && c.ord <= 90
    end
    return word.chars.sort.join if valid_word
    puts 'string error for', scram_word

  end

  #input is the string, the file path of a txt file to read
  # text file should be a newline-delimited list of words
  # populates the @hash_dict instance variable
  public
  def make_dict(filename)
    h = Hash.new('hash error')
    File.open(filename).each do |line|
      l= line.strip.chomp
      k = alpha_num(l)
      a = []
      if h.key?(k)
        a = h[k]
      end
      a.push(l)
      h[k] = a
    end
    @hash_dict = h
  end

  #Input is a string, a filename or filepath to save to
  #writes hash table to a JSON file
  def save_dict(filename)
    File.open(filename,'w') do |f|
      f.write(JSON.generate(@hash_dict))
    end
  end

  #input is a string, filepath for a JSON file
  #loads a hash table from a JSON file, avoids calling the "alpha_num" method
  def load_dict(filename)
    if File.exist?(filename)
      f = File.read(filename)
      @hash_dict = JSON.parse(f)
    else
      puts('read error')
    end
  end

  def find(scrambled_word)
    return @hash_dict[alpha_num(scrambled_word)] if !@hash_dict.empty?
    puts 'error: no dictionary loaded'
  end
end
