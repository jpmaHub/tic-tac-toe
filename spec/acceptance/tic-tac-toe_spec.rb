describe 'a game of Tic Tac Toe' do
  
  before { mark_gateway.delete_all }
  after { mark_gateway.delete_all }
  def mark_gateway
    FileMarkGateway.new
  end

  def tmp_gateway
    TempMarkGateway.new
  end

  let(:view_board) do
    ViewBoard.new(mark_gateway: mark_gateway)
  end

  let(:set_a_mark) do
    SetMark.new(mark_gateway: mark_gateway)
  end

  let(:outcomes) do
    Outcomes.new(mark_gateway: mark_gateway)
  end

  let(:ai_mark) do
    AI.new(mark_gateway: mark_gateway ,tmp_gateway: tmp_gateway)
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

  it 'can determine a horizontal win' do
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 1)
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 2)
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 3)
    expect(outcomes.execute).to eq({status: :HumanWon})
  end

  it 'can determine a vertical win' do
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 1)
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 4)
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 7)
    expect(outcomes.execute).to eq({status: :HumanWon})
  end

  it 'can determine a random vertical win' do
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 7)
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 1)
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 4)
    expect(outcomes.execute).to eq({status: :HumanWon})
  end

  it 'can determine a diagonal win' do
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 3)
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 5)
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 7)
    expect(outcomes.execute).to eq({status: :HumanWon})
  end

  it 'can determine a diagonal win' do
    set_a_mark.execute(type_of_mark: 'O', position_on_board: 3)
    set_a_mark.execute(type_of_mark: 'O', position_on_board: 5)
    set_a_mark.execute(type_of_mark: 'O', position_on_board: 7)
    expect(outcomes.execute).to eq({status: :AIWon})
  end

  it 'can determine a random horizontal win' do
    set_a_mark.execute(type_of_mark: 'O', position_on_board: 5)
    set_a_mark.execute(type_of_mark: 'O', position_on_board: 6)
    set_a_mark.execute(type_of_mark: 'O', position_on_board: 4)
    expect(outcomes.execute).to eq({status: :AIWon})
  end

  it 'Determines a Draw' do
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 1)
    set_a_mark.execute(type_of_mark: 'O', position_on_board: 2)
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 3)
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 4)
    set_a_mark.execute(type_of_mark: 'O', position_on_board: 5)
    set_a_mark.execute(type_of_mark: 'O', position_on_board: 6)
    set_a_mark.execute(type_of_mark: 'O', position_on_board: 7)
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 8)
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 9)
    expect(outcomes.execute).to eq({status: :Draw})
  end

  it 'when the board not full and no winner' do
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 1)
    set_a_mark.execute(type_of_mark: 'O', position_on_board: 2)
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 3)
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 4)
    set_a_mark.execute(type_of_mark: 'O', position_on_board: 5)
    set_a_mark.execute(type_of_mark: 'O', position_on_board: 6)
    set_a_mark.execute(type_of_mark: 'O', position_on_board: 7)
    expect(outcomes.execute).to eq({status: :IncompleteGame})
  end

  xit 'AI can create tree' do
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 1)
    set_a_mark.execute(type_of_mark: 'O', position_on_board: 3)
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 2)
    set_a_mark.execute(type_of_mark: 'O', position_on_board: 4)
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 7)
    set_a_mark.execute(type_of_mark: 'O', position_on_board: 9)
    set_a_mark.execute(type_of_mark: 'X', position_on_board: 8)
    expect(ai_mark.execute).to eq({5=>{0.1=>:draw}, 6=>:win_O})
  end 
end
