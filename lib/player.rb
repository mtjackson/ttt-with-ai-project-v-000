class Player
  attr_reader :token, :opps_token

  def initialize(token)
    @token = token
    if @token == "X"
      @opps_token = "O"
    else
      @opps_token = "X"
    end
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
end
