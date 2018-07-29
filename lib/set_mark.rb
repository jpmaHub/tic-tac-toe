class SetMark
  def initialize(mark_gateway:)
    @mark_gateway = mark_gateway
  end

  def execute(type_of_mark:, position_on_board:)
    @mark_gateway.store_the_mark(Mark.new(type_of_mark, position_on_board))
    {}
  end
end