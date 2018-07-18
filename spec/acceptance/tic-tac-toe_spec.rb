describe 'a game of Tic Tac Toe' do
  class InMemoryMarkGateway
    def mark_properties
      @mark_properties
    end
  
    def mark_properties=(mark_properties)
      @mark_properties = mark_properties
    end
  end

  let(:mark_gateway) { InMemoryMarkGateway.new }

  let(:view_board) do
    ViewBoard.new(mark_gateway: mark_gateway)
  end

  let(:set_a_mark) do
    SetMark.new(mark_gateway: mark_gateway)
  end

  it 'can start a game with a single mark on the board' do
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 1)
    response = view_board.execute({})
    board = response[:board]
    
    expect(board).to eq(    
    [
      ["X", nil, nil],
      [nil, nil, nil],
      [nil, nil, nil]
    ])
  end
end