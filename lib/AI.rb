require 'outcomes'

class AI

  def initialize(mark_gateway:, tmp_gateway:)
    @mark_gateway = mark_gateway
    @tmp_gateway = tmp_gateway
  end 
  
  def outcome
    Outcomes.new(mark_gateway: @tmp_gateway)
  end

  def set_mark
    SetMark.new(mark_gateway: @tmp_gateway)
  end

  def properties(type)
    type.mark_properties
  end

  def execute(*)
     tree
  end 

  def tree
    create_hash = Hash.new 
    populate_tmp
    available_cells.each do |cell|
      #require 'pry-nav'; binding.pry
      populate_tmp
      player = switch_player
      place_next_move(player, cell)
      if outcome.execute == { status: :IncompleteGame}
        create_hash[cell] = node
        #binding.pry
      elsif outcome.execute == { status: :HumanWon }
        create_hash[cell] = :win_X
      elsif outcome.execute == { status: :AIWon }
        create_hash[cell] = :win_O
      elsif outcome.execute ==  { status: :Draw }
        create_hash[cell] = :draw
      end
    end
    create_hash 
  end
  
  def node
    node_hash = Hash.new 
    available_cells.each_with_index do |cell, index|
      player = switch_player
      place_next_move(player, cell)
      if outcome.execute ==  { status: :IncompleteGame }
        node_hash[index + 1] = node
      elsif outcome.execute == { status: :AIWon }
        node_hash[index + 1] = :win_O
      elsif outcome.execute == { status: :HumanWon }
        node_hash[index + 1] = :win_X
      elsif outcome.execute ==  { status: :Draw }
        node_hash[index + 1] = :draw
      end
      @tmp_gateway.mark_properties.pop 
    end 
    node_hash
  end

  def switch_player
    if properties(@tmp_gateway)[@tmp_gateway.mark_properties.length - 1].type_of_mark == 'O'
      'X'
    else
      'O'
    end
  end

  def place_next_move(player, cell)
    set_mark.execute(type_of_mark: player, position_on_board: cell)
    properties(@tmp_gateway)
  end 
  
  def populate_tmp
    properties(@tmp_gateway).clear
    (0...@mark_gateway.mark_properties.length).each do |index|
      #@tmp_gateway.store_the_mark(@mark_gateway.mark_properties[index])
      set_mark.execute(type_of_mark: properties(@mark_gateway)[index].type_of_mark, position_on_board: properties(@mark_gateway)[index].cell_number)
    end
    properties(@tmp_gateway)
  end 
  
  def available_cells
  populated_cells = []
  available_cells = []
  (0...@tmp_gateway.mark_properties.length).each do |index|
    populated_cells.push(@tmp_gateway.mark_properties[index].cell_number)
    empty_grid = [1,2,3,4,5,6,7,8,9]
    available_cells = empty_grid - populated_cells 
  end
  available_cells 
  end
end 
