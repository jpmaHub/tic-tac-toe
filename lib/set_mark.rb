class SetMark
  def initialize(mark_gateway:)
    @mark_gateway = mark_gateway
  end

  def execute(type_of_mark: type_of_mark, position_on_board: position_on_board)
    @mark_gateway.mark_properties = Mark.new(type_of_mark, position_on_board)
    {}
  end

end