require 'pry'
# binding.pry at any point un the program to make a breakpoint

# Multi-dimensional array for table
# 3
# 2
# 1
#   A B C
class Table 
  def initialize
    @table = [['-','-','-'],['-','-','-'],['-','-','-']]
  end

  def input(row,column,sign) 
    @table[row][column] = sign
  end

  def show_table
    puts "3 #{@table[0][0]} #{@table[0][1]} #{@table[0][2]}"
    puts "2 #{@table[1][0]} #{@table[1][1]} #{@table[1][2]}"
    puts "1 #{@table[2][0]} #{@table[2][1]} #{@table[2][2]}"
    puts "  A B C"

  end
end
# Sign choosing at beginnings

# Input move

#checking already taken spots

#win-checker



# Player class with instance methods and variables
class Player
  def initialize(name)
    @name = name
  end

  def greeting
    puts "Welcome, #{@name}"
  end
end

player = Player.new('Bálint')
table = Table.new()

player.greeting()
table.show_table()