class FileIO
  def read
    filename = ARGV[0]
    File.read(filename)
  end

  def write(content)
    filename = ARGV[1]
    f = File.open(filename, 'w')
    f.write(content)
    f.close
  end
end
