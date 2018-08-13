describe AI do
  
  def expect_AI_mark_respond_with(expected_move, actual_marks)
    tmp_gateway = double(mark_properties: [])
    mark_gateway = double(mark_properties: actual_marks)
    ai_mark = AI.new(mark_gateway: mark_gateway, tmp_gateway: tmp_gateway) 
    expect(ai_mark.execute).to eq(expected_move)
  end

  xit 'can place a mark' do
    expect_AI_mark_respond_with({6=>:win_O, 8=>{0.1=>:draw}}, [ Mark.new('X',1) ,
                                      Mark.new('O',3),
                                      Mark.new('X',2),
                                      Mark.new('O',4),
                                      Mark.new('X',5),
                                      Mark.new('O',9),   
                                      Mark.new('X',7)          
                                      ])
  end

  xit 'can place a mark different game' do
    expect_AI_mark_respond_with({1=>:win_O, 7=>:win_O} , [ Mark.new('X',2),
                                      Mark.new('O',3),
                                      Mark.new('X',4),
                                      Mark.new('O',5),
                                      Mark.new('X',6),
                                      Mark.new('O',9),
                                      Mark.new('X',8)
                                      ])
  end

  xit 'can place a different mark in game 3 ' do
    expect_AI_mark_respond_with({4=>
    {0.1=>:win_X,
     1.1=>{1.1=>:win_O, 2.1=>:win_O},
     4.1=>{4.1=>:win_O, 5.1=>{5.1=>:win_X}}},
   6=>
    {0.1=>{0.1=>{0.1=>:draw}, 2.1=>:win_O},
     4.1=>{4.1=>:win_O, 5.1=>:win_O},
     7.1=>{7.1=>:win_O, 8.1=>{8.1=>:draw}}},
   7=>
    {0.1=>{0.1=>{0.1=>:draw}, 2.1=>:win_O},
     4.1=>:win_X,
     5.1=>{5.1=>{5.1=>:win_X}, 7.1=>{7.1=>:draw}}},
   8=>:win_O}, [ Mark.new('X',1),
                                      Mark.new('O',2),
                                      Mark.new('X',3),
                                      Mark.new('O',5),
                                      Mark.new('X',9)
                                           ])
  end

   xit 'can place a different mark in game 5 ' do
    expect_AI_mark_respond_with(3 , [ Mark.new('X',2),
                                      Mark.new('O',7),
                                      Mark.new('X',6),
                                      Mark.new('O',8),
                                      Mark.new('X',9)
                                           ])
  end

  xit 'can place a different mark when X going to win' do
    expect_AI_mark_respond_with(3 , [ Mark.new('X',1) ,
                                      Mark.new('X',2),
                                      Mark.new('O',5),
                                           ])
  end
  
  xit 'can place a different mark when draw condition' do
    expect_AI_mark_respond_with({8=>{0.1=>:draw}, 9=>{0.1=>:draw}} , [Mark.new('X',1),
                                            Mark.new('X',2),
                                            Mark.new('O',3),
                                            Mark.new('O',4),
                                            Mark.new('O',5),
                                            Mark.new('X',6),
                                            Mark.new('X',7),
                                           ])
  end

  xit 'can return draw and win_O respectively for two possible moves' do
    expect_AI_mark_respond_with({5=>{0.1=>:draw}, 6=>:win_O},
                                    [
                                      Mark.new('X',1),
                                      Mark.new('O',3),
                                      Mark.new('X',2),
                                      Mark.new('O',4),
                                      Mark.new('X',7),
                                      Mark.new('O',9),
                                      Mark.new('X',8),
                                    ])
  end
end 
