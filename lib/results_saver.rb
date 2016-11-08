class ResultsSaver

  def save(path, content)
    # foo/bar/baz/save.txt
    directory = path.match(/(^.+\/){0,}/).to_s
    return "Unable to resolve path." unless Dir.exist?(directory)
    #File.open()
  end

end
