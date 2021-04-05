require 'pry'

# binding.pry at any point un the program to make a breakpoint


class Game 
  def initialize
    #Get player names and signs
    puts "Player1"
    @player1 = Player.new()
    puts "Player2"
    @player2 = Player.new()
    
    #Initializing empty board
    @table = Table.new()
    @table.show_table()
  
  end
end


# Multi-dimensional array for table
# 3
# 2
# 1
#   A B C
class Table 
  def initialize
    @@table = [['-','-','-'],['-','-','-'],['-','-','-']]
  end
  def show_table
    puts "3 #{@@table[0][0]} #{@@table[0][1]} #{@@table[0][2]}"
    puts "2 #{@@table[1][0]} #{@@table[1][1]} #{@@table[1][2]}"
    puts "1 #{@@table[2][0]} #{@@table[2][1]} #{@@table[2][2]}"
    puts "  A B C"
  end
  def input(column, row, sign)
    @@table[column][row] = sign
  end
end

# Player class with instance methods and variables
# Sign choosing at beginnings
class Player
  def initialize
    puts "What's your name?"
    @name = gets.chomp
    puts "Would you be O or X?"
    @sign = gets.chomp.upcase
    until @sign == 'O' || @sign == 'X'
      puts "Please choose between O and X!"
      @sign = gets.chomp.upcase
    end
      puts "Welcome, #{@name}! Your sign is: #{@sign}"
      puts "-----------------------------------------"
  end
  def sign 
    return @sign
  end
  def name
    return @name
  end
end

Game.new()


# Input move

#checking already taken spots

#win-checker






