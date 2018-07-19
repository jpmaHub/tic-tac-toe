describe 'a game of Tic Tac Toe' do
  class InMemoryMarkGateway
    def initialize
      @mark_properties = []
    end

    def mark_properties
      @mark_properties
    end
  
    def mark_properties=(mark_properties)
      @mark_properties.push(mark_properties)
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

  it 'can start a game with a different single mark on the board' do
    set_a_mark.execute(type_of_mark: 'O', position_on_board: 9)
    response = view_board.execute({})
    board = response[:board]
    
    expect(board).to eq(    
    [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, "O"]
    ])
  end

  it 'can hold many marks on the board at once' do
    set_a_mark.execute(type_of_mark: 'O', position_on_board: 1)
    set_a_mark.execute(type_of_mark: 'O', position_on_board: 2)
    set_a_mark.execute(type_of_mark: 'O', position_on_board: 3)
    response = view_board.execute({})
    board = response[:board]

    expect(board).to eq(    
      [
        ['O', 'O', 'O'],
        [nil, nil, nil],
        [nil, nil, nil]
      ])
  end
end