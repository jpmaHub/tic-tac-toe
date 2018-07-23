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
end