class Player
  attr_reader :token, :opps_token

  def initialize(token)
    @token = token
    if @token == "X"
      @opps_token = "O"
    else
  end
end
