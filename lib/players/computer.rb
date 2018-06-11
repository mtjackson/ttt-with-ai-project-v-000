
module Players
  class Computer < Player
    def move(board)
      i = ""
      until board.valid_move?(i)
        i = rand(1..9).to_i
      end
      i.to_s

      #each time it plays, computer checks game.WIN_COMBINATIONS
      #first, check if computer has two values of a WIN_COMBINATIONS
      #if yes, computer should select the third value
      #second, check if other player has two values of a WIN_COMBINATIONS
      #if other player has two values, computer should select the third value
      #if other player has fewer than two values, computer should select value of
      #WIN_COMBINATIONS it has the most values of already
      #
  #    board.WIN_COMBINATIONS.each do |combo|
  #        if combo.count(self.token) == 2
  #          i =
  #  end

  #    if board.turn_count > 0
  #      my_pieces = []
  #      other_players_pieces = []
  #      i = 0
  #      board.cells.collect do |cell|
  #        if cell == self.token
  #          my_pieces << i
  #          i += 1
  #        elsif cell != " "
  #          other_players_pieces << i
  #          i += 1
  #        else
  #          i += 1
  #        end
  #      end
  #      my_status = []
  #      other_status = []
  #      board.win_combinations.select do |win_combination|
  #        i = (win_combination & my_pieces)
  #        if i.length == 2
  #          final = win_combination - my_pieces
  #          final = final[0]
  #          return final.to_s
  #        else
  #          my_status << i
  #        end
  #        x = (win_combination & other_players_pieces)
  #        if x.length == 2
  #          halt = win_combination - other_players_pieces
  #          halt = halt[0]
  #          return halt.to_s
  #        else
  #          other_status << x
  #        end
  #      end

  #      my_status.detect do |maybe_winning|
  #        board.win_combinations.detect do |win_combination|
  #          i = (win_combination - maybe_winning)
  #          if i.length != 0
  #            if board.valid_move?(i[0].to_s)
  #              return i[0].to_s
  #            end
  #          end
  #        end
  #      end
  #    else
  #      i = ""
  #      until board.valid_move?(i)
  #        i = rand(1..9).to_i
  #      end
  #      i.to_s
  #    end
    end
  end
end
