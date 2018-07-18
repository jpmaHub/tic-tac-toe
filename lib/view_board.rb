class ViewBoard
  def initialize(mark_gateway:)
    @mark_gateway = mark_gateway
    @board = [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil]
    ]
  end

  def execute(*)
    if !@mark_gateway.mark_properties.nil?
      x,y = @mark_gateway.mark_properties.position_on_board
      @board[x][y] = @mark_gateway.mark_properties.type_of_mark
      
      pp @board
      { board: @board}
    else
      pp @board
      { board: @board }
    end
  end
end