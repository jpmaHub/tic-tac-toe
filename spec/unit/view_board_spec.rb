describe ViewBoard do
  def expect_view_board_respond_with(actual_marks , expected_board) #  
    mark_gateway = double(mark_properties: actual_marks)
    view_board = ViewBoard.new(mark_gateway: mark_gateway)
    expect(view_board.execute).to eq(board: expected_board)
  end

  it 'can view an empty board' do
    expect_view_board_respond_with([], [[nil]*3]*3)
  end

  it 'can view a board with a starting mark' do
    expect_view_board_respond_with([
      Mark.new('X', 5)
    ], [
        [nil, nil, nil],
        [nil, "X", nil],
        [nil, nil, nil]
      ])
    end

    it 'can view a board with a two marks' do
      expect_view_board_respond_with([
        Mark.new('X', 1),
        Mark.new('O', 2)
      ],
        [
          ['X', 'O', nil],
          [nil, nil, nil],
          [nil, nil, nil]
        ])
    end

    it 'can view a board with a winning solution' do
      expect_view_board_respond_with([
        Mark.new('X', 1),
        Mark.new('X', 2),
        Mark.new('X', 3)
      ],[
          ['X', 'X', 'X'],
          [nil, nil, nil],
          [nil, nil, nil]
        ])
    end
end
