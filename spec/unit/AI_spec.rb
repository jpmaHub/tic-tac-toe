describe AI do


  def setting_marks(*mark_arrays)
    mark_arrays.each { Mark.new(mark_arrays[0], mark_arrays[1]) }
  end
    
  def expect_AI_mark_respond_with(expected_move, actual_marks)
    tmp_gateway = double(mark_properties: [])
    mark_gateway = double(mark_properties: actual_marks)
    ai_mark = AI.new(mark_gateway: mark_gateway , tmp_gateway: tmp_gateway) 
    expect(ai_mark.execute).to eq(expected_move)
  end

  it 'can place a mark' do
    expect_AI_mark_respond_with({6=>:win_O, 8=>{1=>:draw}}, [ Mark.new('X',1) ,
                                                              Mark.new('O',3),
                                                              Mark.new('X',2),
                                                              Mark.new('O',4),
                                                              Mark.new('X',5),
                                                              Mark.new('O',9),   
                                                              Mark.new('X',7) ])
  end

  it 'can place a mark different game' do
    expect_AI_mark_respond_with({1=>:win_O, 7=>:win_O} , [ Mark.new('X',2),
                                                           Mark.new('O',3),
                                                           Mark.new('X',4),
                                                           Mark.new('O',5),
                                                           Mark.new('X',6),
                                                           Mark.new('O',9),
                                                           Mark.new('X',8) ])
  end

  it 'can place a different mark in game 3 ' do
    expect_AI_mark_respond_with({4=>
    {1=>:win_X,
     2=>{1=>:win_O, 2=>:win_O},
     3=>{1=>:win_O, 2=>{1=>:win_X}}},
   6=>
    {1=>{1=>{1=>:draw}, 2=>:win_O},
     2=>{1=>:win_O, 2=>:win_O},
     3=>{1=>:win_O, 2=>{1=>:draw}}},
   7=>
    {1=>{1=>{1=>:draw}, 2=>:win_O},
     2=>:win_X,
     3=>{1=>{1=>:win_X}, 2=>{1=>:draw}}},
   8=>:win_O}, [ Mark.new('X',1),
                 Mark.new('O',2),
                 Mark.new('X',3),
                 Mark.new('O',5),
                 Mark.new('X',9) ])
  end
  
  it 'can place a different mark when draw condition' do
    expect_AI_mark_respond_with({8=>{1=>:draw}, 9=>{1=>:draw}} , [ Mark.new('X',1),
                                                                   Mark.new('X',2),
                                                                   Mark.new('O',3),
                                                                   Mark.new('O',4),
                                                                   Mark.new('O',5),
                                                                   Mark.new('X',6),
                                                                   Mark.new('X',7) ])
  end

  it 'can return draw and win_O respectively for two possible moves' do
    expect_AI_mark_respond_with({5=>{1=>:draw}, 6=>:win_O}, [ Mark.new('X',1),
                                                              Mark.new('O',3),
                                                              Mark.new('X',2),
                                                              Mark.new('O',4),
                                                              Mark.new('X',7),
                                                              Mark.new('O',9),
                                                              Mark.new('X',8) ])
  end
end 
