require 'outcomes'
class AI
  def initialize(mark_gateway:)
    @mark_gateway = mark_gateway
    @depth = 0
    @outcome = Outcomes.new(mark_gateway: @mark_gateway)
  end 

  def execute(*)
      mark = @mark_gateway.mark_properties[0].cell_number
      if mark == 1
        5
      else
        9
     end 
     possible_game(2)
  end

  def game_over?
    @outcome.win_O? || @outcome.win_X? || @outcome.full_board?
  end 

  def minimax(game , depth)
    return score if game_over?
    @depth += 1
    possible_moves = []
    scores = []

    available_cells.each do |cell|
      scores.push(minimax(possible_game(cell), @depth))
      possible_moves.push(cell)
    end 

  end

  def possible_game(cell)
    available_cells.delete(cell) 
  end 

  def score
    if @outcome.win_O?
      return 10 - @depth
    elsif @outcome.win_X?
      return @depth - 10
    else
      return 0
    end 
  end 
  
  def available_cells
    populated_cells = []
    available_cells = []
    (0...@mark_gateway.mark_properties.length).each do |index|
      populated_cells.push(@mark_gateway.mark_properties[index].cell_number)
      empty_grid =[1,2,3,4,5,6,7,8,9]
      available_cells = empty_grid - populated_cells 
    end
    available_cells 
  end
  
end 

