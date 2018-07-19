describe ViewBoard do
  it 'can view an empty board' do
    view_board = ViewBoard.new(mark_gateway: double(mark_properties: []))
    expect(view_board.execute).to eq(board: [[nil]*3]*3)
  end


  it 'can view a board with a starting mark' do
    mark_gateway = double(mark_properties: [
      Mark.new('X', 5)
    ])
    view_board = ViewBoard.new(mark_gateway: mark_gateway)
    expect(view_board.execute).to eq(board: 
      [
        [nil, nil, nil],
        [nil, "X", nil],
        [nil, nil, nil]
      ])
    end

    it 'can view a board with a two marks' do
      mark_gateway = double(mark_properties: [
        Mark.new('X', 1),
        Mark.new('O', 2)
      ]) 
      
      view_board = ViewBoard.new(mark_gateway: mark_gateway)
      expect(view_board.execute).to eq(board: 
        [
          ['X', 'O', nil],
          [nil, nil, nil],
          [nil, nil, nil]
        ])
    end

    it 'can view a board with a winning solution' do
      mark_gateway = double(mark_properties: [
        Mark.new('X', 1),
        Mark.new('X', 2),
        Mark.new('X', 3)
      ]) 
      
      view_board = ViewBoard.new(mark_gateway: mark_gateway)
      expect(view_board.execute).to eq(board: 
        [
          ['X', 'X', 'X'],
          [nil, nil, nil],
          [nil, nil, nil]
        ])
    end
end