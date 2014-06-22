require 'action'
require 'user'
require 'wall'

user1 = User.new('Alice')
user2 = User.new('Bob')
user3 = User.new('Charlie')

puts "User profiles loaded: #{user1.name}, #{user2.name}, #{user3.name}"

def process
  input = gets.chomp
  command = input.split

  case command
  when command.length == 1
    puts "reading timeline"
  when command[1] == "->"
    puts "posting message"
  else
    puts "nothing"
  end

end

loop do
  process
end
