describe AI do
  
  def expect_AI_mark_respond_with(expected_move, actual_marks)
    mark_gateway = double(mark_properties: actual_marks)
    ai_mark = AI.new(mark_gateway: mark_gateway)
    expect(ai_mark.execute).to eq(expected_move)
  end

  xit 'can place a mark' do
    expect_AI_mark_respond_with(6 , [ Mark.new('X',1) ,
                                      Mark.new('X',2),
                                      Mark.new('O',3),
                                      Mark.new('O',4),
                                      Mark.new('X',5),
                                      Mark.new('X',7),
                                      Mark.new('O',9)              
                                      ])
  end

  xit 'can place a mark different game' do
    expect_AI_mark_respond_with(1 , [ Mark.new('X',2) ,
                                      Mark.new('X',4),
                                      Mark.new('O',3),
                                      Mark.new('O',5),
                                      Mark.new('X',6),
                                      Mark.new('X',8),
                                      Mark.new('O',9)              
                                      ])
  end

  it 'can place a different mark in game 3 ' do
    expect_AI_mark_respond_with(6 , [ Mark.new('X',1) ,
                                      Mark.new('X',3),
                                      Mark.new('O',2),
                                      Mark.new('O',5),
                                      Mark.new('X',9)
                                           ])
  end

  xit 'can place a different mark in game 5 ' do
    expect_AI_mark_respond_with(3 , [ Mark.new('X',2) ,
                                      Mark.new('X',6),
                                      Mark.new('O',7),
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
    expect_AI_mark_respond_with(8 , [Mark.new('X',1),
                                            Mark.new('X',2),
                                            Mark.new('O',3),
                                            Mark.new('O',4),
                                            Mark.new('O',5),
                                            Mark.new('X',6),
                                            Mark.new('X',7),
                                           ])
  end
end 
