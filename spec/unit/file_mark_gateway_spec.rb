describe FileMarkGateway do
  before { FileMarkGateway.new.delete_all }

  it 'returns an empty array' do
    expect(FileMarkGateway.new.mark_properties).to eq([])
  end

  it 'returns one mark from the array' do
    gateway = FileMarkGateway.new
    gateway.store_the_mark(Mark.new('O',1))
    expect(gateway.mark_properties.length).to eq(1)
  end

  it 'returns one mark O from the array' do
    gateway = FileMarkGateway.new
    gateway.store_the_mark(Mark.new('O',1))
    expect(gateway.mark_properties[0].type_of_mark).to eq('O')
    expect(gateway.mark_properties[0].cell_number).to eq(1)
  end

  it 'returns one mark X from the array' do
    gateway = FileMarkGateway.new
    gateway.store_the_mark(Mark.new('X', 2))
    expect(gateway.mark_properties[0].type_of_mark).to eq('X')
    expect(gateway.mark_properties[0].cell_number).to eq(2)
  end

  it 'returns two marks from the array' do
    gateway = FileMarkGateway.new
    gateway.store_the_mark(Mark.new('X', 2))
    gateway.store_the_mark(Mark.new('O', 3))
    expect(gateway.mark_properties[0].type_of_mark).to eq('X')
    expect(gateway.mark_properties[0].cell_number).to eq(2)
    expect(gateway.mark_properties[1].type_of_mark).to eq('O')
    expect(gateway.mark_properties[1].cell_number).to eq(3)
  end

  it 'returns one mark X from the array' do
    gateway = FileMarkGateway.new
    gateway.store_the_mark(Mark.new('X', 2))
    expect(gateway.mark_properties.length).to eq(1)
    gateway.mark_properties
    gateway.mark_properties
    gateway.mark_properties
    expect(gateway.mark_properties.length).to eq(1)
  end
end
