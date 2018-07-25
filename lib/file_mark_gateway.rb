class FileMarkGateway
  def mark_properties
    return [] unless File.exists?('/tmp/test')
    contents = File.read('/tmp/test')
    contents = contents.split(" ")
    [
      Mark.new(contents[0], contents[1].to_i)
    ]
  end

  def mark_properties=(mark)
    File.open('/tmp/test', 'w') do |file|
      file.write(mark.type_of_mark + " " + (mark.cell_number).to_s + "\n")
    end
  end

  def delete_all
    File.unlink('/tmp/test')
  rescue
  end
end