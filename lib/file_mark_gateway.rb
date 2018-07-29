class FileMarkGateway
  def mark_properties
    return [] unless File.exists?('test')
    read_file
  end

  def read_file
    mark_properties = []
    File.read('test').each_line do |line|
      contents = line.split(" ")
      mark_properties.push(Mark.new(contents[0], contents[1].to_i))
    end
    mark_properties
  end

  def store_the_mark(mark)
    File.open('test', "a") do |file|
      file.write(mark.type_of_mark + " " + (mark.cell_number).to_s + "\n")
    end
  end

  def delete_all
    File.unlink('test')
  rescue
  end
end

