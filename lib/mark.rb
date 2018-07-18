class Mark
  def initialize(type_of_mark, position_on_board)
    @type_of_mark = type_of_mark
    @position_on_board = position_on_board
  end
  
  def type_of_mark
    @type_of_mark
  end

  def position_on_board
    return @position_on_board = [0,0] if @position_on_board == 1
    return @position_on_board = [0,1] if @position_on_board == 2
    return @position_on_board = [0,2] if @position_on_board == 3
    return @position_on_board = [1,0] if @position_on_board == 4
    return @position_on_board = [1,1] if @position_on_board == 5
    return @position_on_board = [1,2] if @position_on_board == 6
    return @position_on_board = [2,0] if @position_on_board == 7
    return @position_on_board = [2,1] if @position_on_board == 8
    return @position_on_board = [2,2] if @position_on_board == 9
  end
end