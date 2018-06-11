class Game
  attr_accessor :board, :player_1, :player_2, :current_player, :winning_token, :winner, :turn

  def initialize(player_1="X", player_2="O", board=[])
    if player_1 == "X"
      @player_1 = Players::Human.new("X")
    else
      @player_1 = player_1
    end
    if player_2 == "O"
      @player_2 = Players::Human.new("O")
    else
      @player_2 = player_2
    end
    if board == []
      @board = Board.new
    else
      @board = board
    end
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def current_player
    if self.board.turn_count == 0
      @player_1
    elsif self.board.turn_count.odd?
      @player_2
    elsif self.board.turn_count.even?
      @player_1
    end
  end

  def won?
    exes = []
    ohs = []
    i = 0
    self.board.cells.collect do |cell|
      if cell == "X"
        exes << i
        i += 1
      elsif cell == "O"
        ohs << i
        i += 1
      else
        i += 1
      end
    end

    WIN_COMBINATIONS.detect do |win_combination|
      if win_combination.all? {|space| ohs.include?(space)}
        @winning_token = "O"
        return win_combination
      elsif win_combination.all? {|space| exes.include?(space)}
        @winning_token = "X"
        return win_combination
      end
    end
  end

  def draw?
    if @board.full?
      if self.won?
        false
      else
        true
      end
    end
  end

  def over?
    if @board.full? || self.won? || self.draw?
      true
    elsif @board.full? == false
      false
    else
      false
    end
  end

  def winner
    if self.won?
      @winning_token
    end
  end

  def turn
    input = self.current_player.move(@board)
    if self.board.valid_move?(input)
      i = input.to_i - 1
      self.board.cells[i] = self.current_player.token
      self.board.display
      return self.board.turn_count
    else
      puts "invalid"
      self.turn
    end
    self.over?
  end

  def play
    until self.over?
      self.turn
      sleep(1.0)
    end
    if self.won?
      puts "Congratulations #{@winning_token}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end

  def rules
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
  end

end
