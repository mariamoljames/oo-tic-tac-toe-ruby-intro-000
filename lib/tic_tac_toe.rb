class TicTacToe
  def initialize(board = Array.new(9, " "))
    @board = board
  end

  WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index=input.to_i - 1
  end

  def move(index, current_player='X')
    @board[index] = current_player
  end

  def position_taken?(index)
    return @board[index]=="X"||@board[index]=="O"
  end

  def valid_move?(index)
    return index.between?(0,8) && !(position_taken?(index))
  end

  def turn
    puts "Please enter 1-9:"
    input=gets.chomp
    index=input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end

def turn_count
  count=0
  @board.each do |index|
    if index=="X"||index=="O"
      count+=1
    end
  end
  return count
end

def current_player
  if turn_count%2==0
    return "X"
  else
    return "O"
  end
end

def won?
  if !@board.none? { |item| item=="X"||item=="O" }
    WIN_COMBINATIONS.each do |win_combination|
      if [@board[win_combination[0]],@board[win_combination[1]],@board[win_combination[2]]].all?{ |item| item=="X"||item=="O" } && @board[win_combination[0]]==@board[win_combination[1]] && @board[win_combination[1]]==@board[win_combination[2]]
        return win_combination
      end
    end
    return false
  end
end

def full?
  return @board.all? { |item| item=="X"||item=="O" }
end

def draw?
  return full? && !won?
end

def over?
  return draw? || won?
end

def winner
  if won?
    return @board[won?[0]]
  else
    return nil
  end
end

def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
