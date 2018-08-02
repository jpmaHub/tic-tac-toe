describe AI do

  it 'can place a mark' do
    mark_gateway = double(mark_properties: [Mark.new('X',1)])
    AI_mark = AI.new(mark_gateway: mark_gateway)
    expect(AI_mark.execute).to eq(5)
  end
  
  it 'can place a different mark' do
    mark_gateway = double(mark_properties: [Mark.new('X',1)])
    AI_mark = AI.new(mark_gateway: mark_gateway)
    expect(AI_mark.execute).to eq(9)
  end
end 
