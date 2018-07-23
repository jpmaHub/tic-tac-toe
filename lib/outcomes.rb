require 'set'

class Outcomes
  def initialize(mark_gateway:)
    @mark_gateway = mark_gateway
    @array_of_mark_positions = []
  end

  def win_horizontally?
    counter1 = counter2 = counter3 = 0
    (1..@mark_gateway.mark_properties.length).each do |i|
      counter1 += 1 if array_of_mark_positions.include?(i)
      counter2 += 1 if array_of_mark_positions.include?(i + 3)
      counter3 += 1 if array_of_mark_positions.include?(i + 6)
    end
    return true if (counter1 == 3 || counter2 == 3 || counter3 == 3)
    # a = Set(array_of_mark_positions) 
    # b = Set[1, 2, 3]
    # b.subset? a
  end

  def array_of_mark_positions
    (0...@mark_gateway.mark_properties.length).each do |index|
      @array_of_mark_positions.push(@mark_gateway.mark_properties[index].cell_number)
    end
    @array_of_mark_positions
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