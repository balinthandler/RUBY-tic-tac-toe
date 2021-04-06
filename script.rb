require 'pry'

# binding.pry at any point un the program to make a breakpoint


class Game 
  
  #Get player names and signs
  def initialize
    @players = []
    @table = Board.new()
    2.times { |i|
    puts "Player #{i+1}"
    puts "What's your name?"
    name = gets.chomp

    if i > 0 
      if @players[0].sign == 'O'
        sign = 'X'
      else
        sign = 'O'
      end
    else  
      puts "Choose sign: O or X?"
      sign = gets.chomp.upcase
      until (sign == 'O' || sign == 'X')
        puts "Please choose between O and X!"
        sign = gets.chomp.upcase
      end

    end

    @players[i] = Player.new(name,sign)
    @players[i].greeting()
    }
  end

  def game_mechanism
    #one turn
    turn_switch = true


    puts ""
     @table.input(0,2, 'X')
     @table.input(1,1, 'O')
     @table.input(2,0, 'X')

    @table.show_board
    @table.check_game(@players)
    #game over conditions

  end
  

end


# Multi-dimensional array for board
# 3
# 2
# 1
#   A B C
class Board 
  def initialize
		@board = [['-','-','-'],['-','-','-'],['-','-','-']]
    @game_ended = false
  end
  def check_game(players)
    for i in 0...2
      if @board[i].all? { |item| item == @board[i][0] && item != '-'} 
        if @board[i][0] == players[0].sign()
          show_result(players[0].name)
          @game_ended = true
          break
        else  
          @game_ended = true
          show_result(players[1].name)
          break
        end
      elsif @board[0][i] == @board[1][i] && @board[1][i] == @board[2][i] then
        if @board[0][i] == players[0].sign()
          @game_ended = true
          show_result(players[0].name)
          break
        else  
          @game_ended = true
          show_result(players[1].name)
          break
        end
      end
    end
    if @game_ended == false
      if @board[0][0] == @board[1][1] && @board[2][2] == @board[1][1] || @board[0][2] == @board[1][1] && @board[2][0] == @board[1][1] 
        if @board[1][1] == players[0].sign()
          @game_ended = true
          show_result(players[0].name)
        else
          @game_ended = true
          show_result(players[1].name)
        end
      end
    end
    if @game_ended == false
      joined = @board[0] << @board[1] << @board[1]
      if joined.all? {|item| item != '-'}
        @game_ended = true
        puts "Game over! Tie."
      end
    end



  end

  private
  def show_result(winner)
    puts "#{winner} have won the match"
  end
	def reset
		@board = [['-','-','-'],['-','-','-'],['-','-','-']]
    @game_ended = true
	end

  public
  def show_board
    puts "3 #{@board[0][0]} #{@board[0][1]} #{@board[0][2]}"
    puts "2 #{@board[1][0]} #{@board[1][1]} #{@board[1][2]}"
    puts "1 #{@board[2][0]} #{@board[2][1]} #{@board[2][2]}"
    puts "  A B C"
  end

  def input(column, row, sign)
    @board[column][row] = sign
  end
end

# Player class with instance methods and variables
# Sign choosing at beginnings
class Player
  def initialize(name, sign)
    @name = name
    @sign = sign
  end

  def greeting
    puts "Welcome, #{@name}! Your sign is: #{@sign}"
  end

  def name
    return @name
  end
  def sign
    return @sign
  end
end

new_game = Game.new()
new_game.game_mechanism

# Input move

#checking already taken spots

#win-checker






