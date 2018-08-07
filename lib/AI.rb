require 'outcomes'
class AI

 
  
  def initialize(mark_gateway:)
    @mark_gateway = mark_gateway
    @depth = 0
    @outcome = Outcomes.new(mark_gateway: @mark_gateway)
    @scores = {}
    @node_hash ={}
    @counter =0
    @starting_cell =0
  end 

  def execute(*)
    tree
  end 


  def tree
    create_hash = Hash.new 

    #require 'pry-nav'; binding.pry
    @depth += 1

    available_cells.each do |cell|
      determine_next_player(cell)
        if @outcome.execute == { status: :IncompleteGame}
        create_hash[cell] = node
        elsif @outcome.execute == { status: :HumanWon }
          create_hash[cell] = :win_X
        elsif @outcome.execute == { status: :AIWon }
          create_hash[cell] = :win_O
          pp @mark_gateway.mark_properties
        elsif @outcome.execute ==  { status: :Draw }
          create_hash[cell] = :draw
        end
      @mark_gateway.mark_properties.pop
    end
    
    create_hash
    
  end


  def node
    node_hash = Hash.new 

    available_cells.each do |cell|
     determine_next_player(cell)
     if @outcome.execute ==  { status: :IncompleteGame }

      node_hash[@counter + 0.1]= node

      elsif @outcome.execute == { status: :AIWon }
        node_hash[@counter + 0.1] = :win_O
      elsif @outcome.execute == { status: :HumanWon }
        node_hash[@counter+ 0.1] = :win_X
      elsif @outcome.execute ==  { status: :Draw }
          node_hash[@counter+ 0.1] = :draw
      end 
       @mark_gateway.mark_properties.pop
       @counter += 1
       
    end 
    @node_hash = node_hash
    @node_hash
    
  end

  def determine_next_player(move)
    if @mark_gateway.mark_properties[@mark_gateway.mark_properties.length - 1].type_of_mark == 'X'
      o_turn(move)
    else
      x_turn(move)
    end
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
  
   def x_turn(cell)
    @mark_gateway.mark_properties.push(Mark.new('X', cell)) #
   end 

   def o_turn(cell)
    @mark_gateway.mark_properties.push(Mark.new('O', cell)) #
   end 

  
  def game_over?
    @outcome.win_O? || @outcome.win_X? || @outcome.full_board?
  end 

  def minimax
    
    @depth += 1
     
    available_cells.each do |cell|
      # require 'pry-nav'; binding.pry
      if @depth == 1
        starting_cell = cell
      end
      possible_AI_move(cell)
      if @outcome.win_O? 
       @scores[starting_cell] = score 
      
      else
        available_cells.each do |cell|
          @depth += 1 #new - added by rebecca
          possible_X_moves(cell)
          if @outcome.win_X?
             @scores[starting_cell] =  score
             @mark_gateway.mark_properties.pop
          else
            minimax
          end
        end 
      end
      @mark_gateway.mark_properties.pop
      @depth = 0
    end
     @scores.key(@scores.values.max)

     
   
  end

  def possible_AI_move(cell)
    @mark_gateway.mark_properties.push(Mark.new('O', cell)) #
  end 

  def possible_X_moves(cell)
    @mark_gateway.mark_properties.push(Mark.new('X', cell)) #
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

