
module Players
  class Computer < Player
#    def move(board)
#      i = ""
#      until board.valid_move?(i)
#        i = rand(1..9).to_i
#      end
#      i.to_s
#    end
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
def move(board)
  my_pieces = [] # will result in an array of numbers equal to the index of a given X token
  opps_pieces = []
  my_status = [] #will result in a nested array of numbers equivilant to the index values computer is missing to win
  other_status = []
  if board.turn_count < 2
    i = ""
    until board.valid_move?(i)
      i = rand(1..9).to_i
    end
    i.to_s
  elsif board.turn_count >= 2
    i = 0
    board.cells.collect do |cell|
      if cell == self.token
        my_pieces << i
        i += 1
      elsif cell == self.opps_token
        opps_pieces << i
        i += 1
      else
        i += 1
      end
    end
    WIN_COMBINATIONS.select do |win_combination|
      i = (win_combination & my_pieces)
      x = (win_combination & opps_pieces)
      if i.length == 2
        final = win_combination - my_pieces
        final = final[0]
        if board.valid_move?(final.to_s)
          return final.to_s
        end
      elsif x.length == 2
        halt = win_combination - opps_pieces
        halt = halt[0]
        if board.valid_move?(halt[0].to_s)
          return halt.to_s
        end
      else
        my_status << i
        other_status << x
      end
    end

    my_status.detect do |maybe_winning|
      WIN_COMBINATIONS.select do |win_combination|
        i = (win_combination - maybe_winning)
    #    if i.length != 0
          if board.valid_move?(i[0].to_s)
            return i[0].to_s
          end
    #    end
      end
    end
  end
end
  end
end
