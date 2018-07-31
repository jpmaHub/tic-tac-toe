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
    (0...@mark_gateway.mark_properties.length).each do |index|  
      x,y = @mark_gateway.mark_properties[index].position_on_board
      @board[x][y] = @mark_gateway.mark_properties[index].type_of_mark
    end
      { board: @board }
  else
      { board: @board }
    end
  end
  #
end
