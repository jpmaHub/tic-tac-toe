describe SetMark do
  it 'responds with an empty hash' do
    mark_gateway = spy
    expect(SetMark.new(mark_gateway: mark_gateway).execute(type_of_mark: 'X', position_on_board: 1)).to eq({})
  end
  
  it 'sets the mark' do
    mark_gateway = spy
    SetMark.new(mark_gateway: mark_gateway).execute(type_of_mark: 'O', position_on_board: 2)

    expect(mark_gateway).to have_received(:store_the_mark) do |mark|
      expect(mark.type_of_mark).to eq('O')
      expect(mark.position_on_board).to eq([0,1])
    end
  end
end