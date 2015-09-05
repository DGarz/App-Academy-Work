class Player
  attr_reader :name
  attr_accessor :victory_count
  #get_lettr
  def initialize(name)
    @name = name
    @victory_count = 0
  end

  def get_letter
    puts "#{name}, please guess a letter"
    letter = gets.chomp
  end
end
