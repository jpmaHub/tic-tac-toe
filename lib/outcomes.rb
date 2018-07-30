class Outcomes
  def initialize(mark_gateway:)
    @mark_gateway = mark_gateway
    @array_of_X_positions = []
    @array_of_O_positions = []
  end

  def win_horizontally_X?
    array_of_positions_x = array_of_X_positions
    return true if ([1, 2, 3] - array_of_positions_x).length == 0
    return true if ([4, 5, 6] - array_of_positions_x).length == 0
    return true if ([7, 8, 9] - array_of_positions_x).length == 0
  end

  def win_horizontally_O?
    @array_of_O_positions = []
    array_of_positions_O = array_of_O_positions
    return true if ([1, 2, 3] - array_of_positions_O).length == 0
    return true if ([4, 5, 6] - array_of_positions_O).length == 0
    return true if ([7, 8, 9] - array_of_positions_O).length == 0
  end

  def win_vertically_X?
    @array_of_X_positions = []
    array_of_positions_x = array_of_X_positions
    return true if ([1, 4, 7] - array_of_positions_x).length == 0
    return true if ([2, 5, 8] - array_of_positions_x).length == 0
    return true if ([3, 6, 9] - array_of_positions_x).length == 0  
  end

  def win_vertically_O?
    @array_of_O_positions = []
    array_of_positions_O = array_of_O_positions
    return true if ([1, 4, 7] - array_of_positions_O).length == 0
    return true if ([2, 5, 8] - array_of_positions_O).length == 0
    return true if ([3, 6, 9] - array_of_positions_O).length == 0  
  end

  def win_diagonal_X?
    @array_of_X_positions = []
    array_of_positions_x = array_of_X_positions
    return true if ([1, 5, 9] - array_of_positions_x).length == 0
    return true if ([3, 5, 7] - array_of_positions_x).length == 0
  end

  def win_diagonal_O?
    @array_of_O_positions = []
    array_of_positions_O = array_of_O_positions
    return true if ([1, 5, 9] - array_of_positions_O).length == 0
    return true if ([3, 5, 7] - array_of_positions_O).length == 0
  end

  def array_of_X_positions
    (0...@mark_gateway.mark_properties.length).each do |index|
      if @mark_gateway.mark_properties[index].type_of_mark == 'X'
        @array_of_X_positions.push(@mark_gateway.mark_properties[index].cell_number)
      end
    end
    @array_of_X_positions
  end

  def array_of_O_positions
    (0...@mark_gateway.mark_properties.length).each do |index|
      if @mark_gateway.mark_properties[index].type_of_mark == 'O'
        @array_of_O_positions.push(@mark_gateway.mark_properties[index].cell_number)
      end
    end
    @array_of_O_positions
  end

  def execute
    return { status: :HumanWon } if win_X? 
    return { status: :AIWon } if win_O?
    return { status: :Draw } if full_board?
    { status: :IncompleteGame }
  end

  def win_X?
    win_horizontally_X? || win_vertically_X? || win_diagonal_X?
  end 

  def win_O?
    win_horizontally_O? || win_vertically_O? || win_diagonal_O?
  end

  def full_board?
    @mark_gateway.mark_properties.length == 9
  end 
end
