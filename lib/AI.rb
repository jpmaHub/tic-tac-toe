require 'outcomes'

class AI

  def initialize(mark_gateway:, tmp_gateway:)
    @mark_gateway = mark_gateway
    @tmp_gateway = tmp_gateway
  end 
  
  def outcome
    Outcomes.new(mark_gateway: @tmp_gateway)
  end

  def execute
     tree
  end 

  def tree
    create_tree = {}
    populated_tmp
    available_cells.each do |cell|
      populated_tmp
      @counter = 0
      player = switch_player
      place_next_move(player, cell)
      assign_outcome(create_tree, cell)
    end
    create_tree 
  end

  def assign_outcome(create, branch)
    create[branch] = determine_outcome
  end 

  def determine_outcome
    return node if outcome.execute == { status: :IncompleteGame}
    return :win_X if outcome.execute == { status: :HumanWon }
    return :win_O if outcome.execute == { status: :AIWon }
    return :draw if outcome.execute ==  { status: :Draw }
  end 

  def node
    create_node = {}
    available_cells.each_with_index do |cell, index|
      player = switch_player
      place_next_move(player, cell)
      assign_outcome(create_node, index + 1)
      undo_move
    end 
    create_node
  end

  def undo_move
    @tmp_gateway.mark_properties.pop 
  end 

  def switch_player
    return 'X' if check_last_mark == 'O'
    'O'
  end

  def check_last_mark
    @tmp_gateway.mark_properties[@tmp_gateway.mark_properties.length - 1].type_of_mark
  end 

  def place_next_move(player, cell)
    @tmp_gateway.mark_properties.push(Mark.new(player, cell))
    @tmp_gateway.mark_properties
  end 
  
  def populated_tmp
    @tmp_gateway.mark_properties.clear
    (0...@mark_gateway.mark_properties.length).each do |index|
      @tmp_gateway.mark_properties.push(@mark_gateway.mark_properties[index])
    end
    @tmp_gateway.mark_properties
  end 
  
  def available_cells
  populated_cells = []
  available_cells = []
  (0...@tmp_gateway.mark_properties.length).each do |index|
    populated_cells.push(@tmp_gateway.mark_properties[index].cell_number)
    empty_grid =[1,2,3,4,5,6,7,8,9]
    available_cells = empty_grid - populated_cells 
  end
  available_cells 
  end
end 
