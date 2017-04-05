my_file = File.open("test.txt", "r")
puts my_file.read
puts File.file?(my_file)

my_file.close
