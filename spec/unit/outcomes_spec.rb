describe Outcomes do
  it 'determines a horizontal win' do
    mark_gateway = double(mark_properties: [
      Mark.new('X', 1),
      Mark.new('X', 2),
      Mark.new('X', 3)
    ])
    outcomes = Outcomes.new(mark_gateway: mark_gateway)
    expect(outcomes.execute).to eq('Human has won horizontally')
  end

  it 'determines a second type of horizontal win' do
    mark_gateway = double(mark_properties: [
      Mark.new('X', 4),
      Mark.new('X', 5),
      Mark.new('X', 6)
    ])
    outcomes = Outcomes.new(mark_gateway: mark_gateway)
    expect(outcomes.execute).to eq('Human has won horizontally')
  end

  it 'determines a third type of horizontal win' do
    mark_gateway = double(mark_properties: [
      Mark.new('X', 7),
      Mark.new('X', 8),
      Mark.new('X', 9)
    ])
    outcomes = Outcomes.new(mark_gateway: mark_gateway)
    expect(outcomes.execute).to eq('Human has won horizontally')
  end

  it 'determines a fourth type of horizontal win' do
    mark_gateway = double(mark_properties: [
      Mark.new('X', 2),
      Mark.new('X', 3),
      Mark.new('X', 1)
    ])
    outcomes = Outcomes.new(mark_gateway: mark_gateway)
    expect(outcomes.execute).to eq('Human has won horizontally')
  end

  it 'determines a vertical win' do
    mark_gateway = double(mark_properties: [
      Mark.new('X', 1),
      Mark.new('X', 4),
      Mark.new('X', 7)
    ])
    outcomes = Outcomes.new(mark_gateway: mark_gateway)
    expect(outcomes.execute).to eq('Human has won vertically')
  end

  it 'determines a second vertical win' do
    mark_gateway = double(mark_properties: [
      Mark.new('X', 4),
      Mark.new('X', 1),
      Mark.new('X', 7)
    ])
    outcomes = Outcomes.new(mark_gateway: mark_gateway)
    expect(outcomes.execute).to eq('Human has won vertically')
  end

  it 'determines a third vertical win' do
    mark_gateway = double(mark_properties: [
      Mark.new('X', 2),
      Mark.new('X', 5),
      Mark.new('X', 8),
      Mark.new('X', 1)
      ])
    outcomes = Outcomes.new(mark_gateway: mark_gateway)
    expect(outcomes.execute).to eq('Human has won vertically')
  end

  it 'determines a diagonal win' do
    mark_gateway = double(mark_properties: [
      Mark.new('X', 1),
      Mark.new('X', 5),
      Mark.new('X', 9)
      ])
    outcomes = Outcomes.new(mark_gateway: mark_gateway)
    expect(outcomes.execute).to eq('Human has won diagonally')
  end

  it 'determines a second diagonal win' do
    mark_gateway = double(mark_properties: [
      Mark.new('X', 3),
      Mark.new('X', 5),
      Mark.new('X', 7)
      ])
    outcomes = Outcomes.new(mark_gateway: mark_gateway)
    expect(outcomes.execute).to eq('Human has won diagonally')
  end


  it 'determines a random diagonal win' do
    mark_gateway = double(mark_properties: [
      Mark.new('X', 7),
      Mark.new('X', 3),
      Mark.new('X', 5)
      ])
    outcomes = Outcomes.new(mark_gateway: mark_gateway)
    expect(outcomes.execute).to eq('Human has won diagonally')
  end

  it 'determines a vertical win for the AI' do
    mark_gateway = double(mark_properties: [
      Mark.new('O', 2),
      Mark.new('O', 5),
      Mark.new('O', 8)
      ])
    outcomes = Outcomes.new(mark_gateway: mark_gateway)
    expect(outcomes.execute).to eq('AI has won vertically')
  end

  it 'determines a random diagonal win for the AI' do
    mark_gateway = double(mark_properties: [
      Mark.new('O', 7),
      Mark.new('O', 3),
      Mark.new('O', 5)
      ])
    outcomes = Outcomes.new(mark_gateway: mark_gateway)
    expect(outcomes.execute).to eq('AI has won diagonally')
  end

  it 'determines draw' do
    mark_gateway = double(mark_properties: [
      Mark.new('X', 1),
      Mark.new('O', 2),
      Mark.new('X', 3),
      Mark.new('X', 4),
      Mark.new('O', 5),
      Mark.new('O', 6),
      Mark.new('O', 7),
      Mark.new('X', 8),
      Mark.new('X', 9)
      ])
    outcomes = Outcomes.new(mark_gateway: mark_gateway)
    expect(outcomes.execute).to eq('Draw')
  end
end