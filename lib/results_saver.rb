class ResultsSaver

  def save(path, content)
    # foo/bar/baz/save.txt
    match = path.match(/(^.+\/){0,}/)
    directory = match.to_s
    file = match.post_match
    p directory
    return "Unable to resolve path." unless Dir.exist?(directory)
    File.open(directory + file, 'a') do |new_file|
      new_file.write(content)
    end
    "Save successful."
  end

end
