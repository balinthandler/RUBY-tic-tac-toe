class Game 
  
  #create empty board & get player names and signs
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

  #checking if entered move is valid
  def input_check(move)

    if move.length != 2 
      puts "Invalid cell, enter a valid cell code, e.g. B2 or A1!"
      return false
    else
      if move[0] >= 'A' && move[0] <= 'C' && move[1].to_i >= 1 && move[1].to_i <= 3
        if @table.board_reading[move[1].to_i-1][(move[0].ord-17).chr.to_i] != '-'
          puts "Cell already taken!"
          return false
        else
          return true
        end
      else
        puts "Invalid move, enter valid cell code, e.g. B2 or A1!"
        return false
      end
    end 
  end

  #playing turns until game over scenario
  def game_mechanism
    @table.show_board
    turn = 1
    move = ''
    
    until @table.game_ended
      if turn % 2 == 1 || turn == 1
        puts "#{@players[0].name}'s turn:"
        sign = @players[0].sign
      else 
        puts "#{@players[1].name}'s turn:"
        sign = @players[1].sign
      end
      loop do 
        move = gets.chomp.upcase
        if input_check(move)
          break
        end
      end
      move_array = [move[1].to_i - 1, (move[0].ord-17).chr.to_i]
      @table.input(move_array[0],move_array[1],sign)
      puts "- - - - - - - - - - - - - - - - -"
      @table.show_board
      @table.board_evaluation(@players)
      turn += 1
    end
    gameover_reset()
  end

  #reset table
  def gameover_reset
    if @table.game_ended == true
      puts "Want to play another round? Then type: play"
      answer = gets.chomp.downcase
      if answer == "play"
        @table.reset()
        game_mechanism()
      end
    end
  end
  

end

class Board 
  #empty board
  def initialize
		@board = [['-','-','-'],['-','-','-'],['-','-','-']]
    @game_ended = false
  end

  #returns game is ended or not
  def game_ended
    return @game_ended
  end

  #evaluates board 
  def board_evaluation(players)
    for i in 0..2
      if @board[i].all? { |item| item == @board[i][0] && item != '-'} 
        if @board[i][0] == players[0].sign()
          show_winner(players[0].name)
          @game_ended = true
          break
        else  
          show_winner(players[1].name)
          @game_ended = true
          break
        end
      elsif @board[0][i] == @board[1][i] && @board[1][i] == @board[2][i] && @board[0][i] != '-' then
        if @board[0][i] == players[0].sign()
          @game_ended = true
          show_winner(players[0].name)
          break
        else  
          @game_ended = true
          show_winner(players[1].name)
          break
        end
      end
    end
    if @game_ended == false
      if @board[0][0] == @board[1][1] && @board[2][2] == @board[1][1] && @board[2][2] != '-' || 
        @board[0][2] == @board[1][1] && @board[2][0] == @board[1][1] && @board[2][2] != '-' 
        if @board[1][1] == players[0].sign()
          @game_ended = true
          show_winner(players[0].name)
        else
          @game_ended = true
          show_winner(players[1].name)
        end
      end
    end
    if @game_ended == false
      filled_rows = 0
      for i in 0..2
        if @board[i].all? { |item| item != '-' }
          filled_rows += 1
        end
      end
      if filled_rows == 3
        @game_ended = true
        puts "Game over! Tie."
      end
    end
    
  end

  #puts board on screen
  def show_board
    puts "3 #{@board[2][0]} #{@board[2][1]} #{@board[2][2]}"
    puts "2 #{@board[1][0]} #{@board[1][1]} #{@board[1][2]}"
    puts "1 #{@board[0][0]} #{@board[0][1]} #{@board[0][2]}"
    puts "  A B C"
  end

  #write player sign on board
  def input(row, column, sign)
      @board[row][column] = sign  
  end
  
  #return @board
  def board_reading
    return @board
  end
  
  #show winner
  def show_winner(winner)
    puts "#{winner} have won the match"
  end

  #reset board and game_ended boolean
	def reset
		@board = [['-','-','-'],['-','-','-'],['-','-','-']]
    @game_ended = false
	end


end


class Player
  #assign names and signs
  def initialize(name, sign)
    @name = name
    @sign = sign
  end

  #welcome message for players
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


