require 'outcomes'
class AI

  def initialize(mark_gateway: , tmp_gateway:)
    @mark_gateway = mark_gateway
    @tmp_gateway = tmp_gateway
    @outcome = Outcomes.new(mark_gateway: @tmp_gateway)
    @counter = 0
    #@move = @tmp_gateway.mark_properties[@tmp_gateway.mark_properties.length - 1].type_of_mark 
  end 

  def execute(*)
    tree
  end 

  def tree
    create_hash = Hash.new 
    populated_tmp
    #require 'pry-nav'; binding.pry
    available_cells.each do |cell|
      
      populated_tmp
      player = switch_player
      determine_next_move(player, cell)
      if @outcome.execute == { status: :IncompleteGame}
        create_hash[cell] = node
      elsif @outcome.execute == { status: :HumanWon }
        create_hash[cell] = :win_X
      elsif @outcome.execute == { status: :AIWon }
        create_hash[cell] = :win_O
      elsif @outcome.execute ==  { status: :Draw }
        create_hash[cell] = :draw
      end
    end
    create_hash 
  end

  def node
    node_hash = Hash.new 
    available_cells.each do |cell|
      player = switch_player
      determine_next_move(player, cell)
      if @outcome.execute ==  { status: :IncompleteGame }
      node_hash[@counter + 0.1]= node
      elsif @outcome.execute == { status: :AIWon }
        node_hash[@counter + 0.1] = :win_O
      elsif @outcome.execute == { status: :HumanWon }
        node_hash[@counter+ 0.1] = :win_X
      elsif @outcome.execute ==  { status: :Draw }
          node_hash[@counter+ 0.1] = :draw
      end
      @tmp_gateway.mark_properties.pop 
      @counter += 1 
    end 
    node_hash
  end

  def switch_player
    if @tmp_gateway.mark_properties[@tmp_gateway.mark_properties.length - 1].type_of_mark == 'O'
      'X'
    else
      'O'
    end
  end

  def determine_next_move(player, cell)
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
