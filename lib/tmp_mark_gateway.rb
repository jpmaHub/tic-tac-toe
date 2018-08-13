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
