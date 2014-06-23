require 'action'
require 'user'
require 'timeline'

user1 = User.new('Alice')
user2 = User.new('Bob')
user3 = User.new('Charlie')

alice = Action.new(user1)
bob = Action.new(user2)
charlie = Action.new(user3)

@users = [alice, bob, charlie]

puts "User profiles loaded: Alice, Bob & Charlie"

def process
  input = gets.chomp.split
  input[2] = input[2..-1].join(" ") if input.length > 3

  if input.length == 1
    read(input[0])
  elsif input[1] == "->"
    post_message(input[0], input[2])
  else
    puts "nothing"
  end

end

def read(name)
  user = select_user(name)[0]
  user_messages = user.messages
  user_timeline = Timeline.new(user, user_messages)
  user_timeline.view
end

def post_message(name, message)
  user = select_user(name)[0]
  user.post(message)
end

def select_user(name)
  @users.select { |user| user if user.user.name == name }
end

loop do
  process
end
