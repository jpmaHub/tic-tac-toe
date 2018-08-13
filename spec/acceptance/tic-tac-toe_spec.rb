describe 'a game of Tic Tac Toe' do
  
  before { mark_gateway.delete_all }
  after { mark_gateway.delete_all }
  def mark_gateway
    FileMarkGateway.new
  end

  class TempMarkGateway
    def initialize
        @mark_properties = []
    end

    def mark_properties
      @mark_properties 
    end

    def store_the_mark(mark)
      @mark_properties.push(mark)
    end
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

  def setting_marks(*marks)
    marks.each do |mark|
    set_a_mark.execute(type_of_mark: mark[0], position_on_board: mark[1])
    end 
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
    setting_marks(['O',1],
                  ['O',2],
                  ['O',3])
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
    setting_marks(['X',1],
                  ['X',2],
                  ['X',3])
    expect(outcomes.execute).to eq({status: :HumanWon})
  end

  it 'can determine a vertical win' do
    setting_marks(['X',1],
                  ['X',4],
                  ['X',7])
    expect(outcomes.execute).to eq({status: :HumanWon})
  end

  it 'can determine a random vertical win' do
    setting_marks(['X',7],
                  ['X',1],
                  ['X',4])
    expect(outcomes.execute).to eq({status: :HumanWon})
  end

  it 'can determine a diagonal win' do
    setting_marks(['X',3],
                  ['X',5],
                  ['X',7])
    expect(outcomes.execute).to eq({status: :HumanWon})
  end

  it 'can determine a diagonal win' do
    setting_marks(['O',3],
                  ['O',5],
                  ['O',7])
    expect(outcomes.execute).to eq({status: :AIWon})
  end

  it 'can determine a random horizontal win' do
    setting_marks(['O',5],
                  ['O',6],
                  ['O',4])
    expect(outcomes.execute).to eq({status: :AIWon})
  end

  it 'Determines a Draw' do
    setting_marks(['X', 1],
                  ['O', 2],
                  ['X', 3],
                  ['X', 4],
                  ['O', 5],
                  ['O', 6],
                  ['O', 7],
                  ['X', 8],
                  ['X', 9])
    expect(outcomes.execute).to eq({status: :Draw})
  end

  it 'when the board not full and no winner' do
    setting_marks(['X', 1],
                  ['O', 2],
                  ['X', 3],
                  ['X', 4],
                  ['O', 5],
                  ['O', 6],
                  ['O', 7])
    expect(outcomes.execute).to eq({status: :IncompleteGame})
  end

  it 'AI can create tree' do
    setting_marks(['X', 1],
                  ['O', 3],
                  ['X', 2],
                  ['O', 4],
                  ['X', 7],
                  ['O', 9],
                  ['X', 8])
    expect(ai_mark.execute).to eq({5=>{1=>:draw}, 6=>:win_O})
  end 
end
