class Board
  attr_accessor :cells, :win_combinations

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    @win_combinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    input = input.to_i
    i = input - 1
    if input > 0 && input <= 9
      @cells[i]
    end
  end

  def full?
    if @cells.include?(" ") == false
      true
    else
      false
    end
  end

  def turn_count
    spaces = []
    @cells.each do |space|
      if space != " "
        spaces << space
      end
    end
    spaces.length
  end

  def taken?(input)
    input = input.to_i
    i = input - 1
    if input > 0 && input <= 9
      if @cells[i] != " "
        true
      else
        false
      end
    end
  end

  def valid_move?(input)
    input = input.to_i
    i = input - 1
    i.between?(0,8) && !taken?(input)
  end

  def update(input, player)
    if valid_move?(input)
      input = input.to_i
      i = input - 1
      @cells[i] = player.token
    end
  end

end
