require 'set'

class Outcomes
  def initialize(mark_gateway:)
    @mark_gateway = mark_gateway
    @array_of_mark_positions = []
  end

  def win_horizontally?
    # counter = 0
    # (1...3).each do |i|
    #   counter += 1 if array_of_mark_positions.include?(i)
    # end
    # return true if counter == 3
    a = Set(array_of_mark_positions) 
    b = Set[1, 2, 3]
    b.subset? a
  end

  def array_of_mark_positions
    (0...@mark_gateway.mark_properties.length).each do |index|
      coordinates = @mark_gateway.mark_properties[index].position_on_board
      number_on_board = convert_coordinates_to_position_on_board(coordinates)
      @array_of_mark_positions.push(number_on_board)
    end
  end

  def convert_coordinates_to_position_on_board(position)
    return 1 if position == [0,0] 
    return 2 if position == [0,1]
    return 3 if position == [0,2] 
    return 4 if position == [1,0] 
    return 5 if position == [1,1]
    return 6 if position == [1,2]
    return 7 if position == [2,0]
    return 8 if position == [2,1]
    return 9 if position == [2,2]
  end

  def execute
    if win_horizontally?
      p @array_of_mark_positions
      'Human has won horizontally'
    else
      'no win'
    end
  end
end