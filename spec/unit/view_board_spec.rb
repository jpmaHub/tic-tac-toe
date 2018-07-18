describe ViewBoard do
  it 'can view an empty board' do
    view_board = ViewBoard.new(mark_gateway: double(mark_properties: nil))
    expect(view_board.execute).to eq(board: [[nil]*3]*3)
  end
end