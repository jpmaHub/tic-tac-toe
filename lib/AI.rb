require 'outcomes'
class AI
  def initialize(mark_gateway:)
    @mark_gateway = mark_gateway
    @depth = 0
    @outcome = Outcomes.new(mark_gateway: @mark_gateway)
    @scores = {}
  end 

  def execute(*)
    
    minimax
  end

  def game_over?
    @outcome.win_O? || @outcome.win_X? || @outcome.full_board?
  end 

  def minimax
    
    @depth += 1
     
    available_cells.each do |cell|
      possible_AI_move(cell)
      if @outcome.win_O? 
       @scores[cell] = score

      elsif @outcome.win_X?
        next
        
      else
        available_cells.each do |cell|
          possible_X_moves(cell)
          minimax
      end 
      end
      @mark_gateway.mark_properties.pop
      @depth = 0
    end
    @scores.key(@scores.values.min)

  end

  def possible_AI_move(cell)
    @mark_gateway.mark_properties.push(Mark.new('O', cell)) #
  end 

  def possible_X_moves(cell)
    @mark_gateway.mark_properties.push(Mark.new('X', cell)) #
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

