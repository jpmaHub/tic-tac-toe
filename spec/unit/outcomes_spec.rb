describe Outcomes do
  def expect_outcome_respond_with(actual_marks , expected_outcome)
    mark_gateway = double(mark_properties: actual_marks)
    outcomes = Outcomes.new(mark_gateway: mark_gateway)
    expect(outcomes.execute).to eq(expected_outcome)
  end 

  it 'determines a horizontal win' do
    expect_outcome_respond_with([
      Mark.new('X', 1),
      Mark.new('X', 2),
      Mark.new('X', 3)
    ], {status: :HumanWon})
  end

  it 'determines a second type of horizontal win' do
    expect_outcome_respond_with([
      Mark.new('X', 4),
      Mark.new('X', 5),
      Mark.new('X', 6)
    ], {status: :HumanWon})
  end

  it 'determines a third type of horizontal win' do
    expect_outcome_respond_with([
      Mark.new('X', 7),
      Mark.new('X', 8),
      Mark.new('X', 9)
    ], {status: :HumanWon})
  end

  it 'determines a fourth type of horizontal win' do
    expect_outcome_respond_with([
      Mark.new('X', 2),
      Mark.new('X', 3),
      Mark.new('X', 1)
    ], {status: :HumanWon})
  end

  it 'determines a vertical win' do
    expect_outcome_respond_with([
      Mark.new('X', 1),
      Mark.new('X', 4),
      Mark.new('X', 7)
    ], {status: :HumanWon})
  end

  it 'determines a second vertical win' do
    expect_outcome_respond_with([
      Mark.new('X', 4),
      Mark.new('X', 1),
      Mark.new('X', 7)
    ], {status: :HumanWon})
  end

  it 'determines a third vertical win' do
    expect_outcome_respond_with([
      Mark.new('X', 2),
      Mark.new('X', 5),
      Mark.new('X', 8),
      Mark.new('X', 1)
      ], {status: :HumanWon})
  end

  it 'determines a diagonal win' do
    expect_outcome_respond_with([
      Mark.new('X', 1),
      Mark.new('X', 5),
      Mark.new('X', 9)
      ], {status: :HumanWon})
  end

  it 'determines a second diagonal win' do
    expect_outcome_respond_with([
      Mark.new('X', 3),
      Mark.new('X', 5),
      Mark.new('X', 7)
      ], {status: :HumanWon})
  end


  it 'determines a random diagonal win' do
    expect_outcome_respond_with([
      Mark.new('X', 7),
      Mark.new('X', 3),
      Mark.new('X', 5)
      ], {status: :HumanWon})
  end

  it 'determines a vertical win for the AI' do
    expect_outcome_respond_with([
      Mark.new('O', 2),
      Mark.new('O', 5),
      Mark.new('O', 8)
      ], {status: :AIWon})
  end

  it 'determines a random diagonal win for the AI' do
    expect_outcome_respond_with([
      Mark.new('O', 7),
      Mark.new('O', 3),
      Mark.new('O', 5)
      ], {status: :AIWon})
  end

  it 'determines draw' do
    expect_outcome_respond_with([
      Mark.new('X', 1),
      Mark.new('O', 2),
      Mark.new('X', 3),
      Mark.new('X', 4),
      Mark.new('O', 5),
      Mark.new('O', 6),
      Mark.new('O', 7),
      Mark.new('X', 8),
      Mark.new('X', 9)
      ], {status: :Draw})
  end

  it 'when the board not full and no winner' do
    expect_outcome_respond_with([
      Mark.new('X', 1),
      Mark.new('O', 2),
      Mark.new('X', 3),
      Mark.new('X', 4),
      Mark.new('O', 5),
      Mark.new('O', 6),
      Mark.new('O', 7),
      ], {status: :IncompleteGame})
  end
end
