require 'action'
require 'user'
require 'wall'

alice = User.new('Alice')
bob = User.new('Bob')
charlie = User.new('Charlie')

puts "User profiles loaded: Alice, Bob & Charlie"

def process
  input = gets.chomp.split

  input[2] = input[2..-1].join(" ") if input.length > 3
  puts input[2]


  if input.length == 1
    read(input[0])
  elsif input[1] == "->"
    post_message(input[0], input[2])
  else
    puts "nothing"
  end

end

def read(query)
  user = User.new(query)
  user.name = Action.new(user)
  user_timeline.view
end

def post_message(person, message)
  puts message
  user = User.new(person)
  human = Action.new(user)
  x = human.post(message)
  puts x
end

loop do
  process
end
