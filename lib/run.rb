require 'action'
require 'user'
require 'timeline'
require 'wall'

#user1 = User.new('Alice')
#user2 = User.new('Bob')
#user3 = User.new('Charlie')
#
#alice = Action.new(user1)
#bob = Action.new(user2)
#charlie = Action.new(user3)
#
#@users = [alice, bob, charlie]

@all_users = []

#puts "User profiles loaded: Alice, Bob & Charlie"

puts 'Welcome to Chatter!'
puts '-------------------'

def process
  input = gets.chomp.split
  input[2] = input[2..-1].join(" ") if input.length > 3

  if input[1] == "->"
    user_name = "#{ input[0] }"
    check_user(user_name)
    post_message(@user_do, input[2])
  elsif input.length == 1
    check_user(user_name)
    read(@user_do)
  elsif input[1] == "follows"
    follow(user_action, input[2])
  elsif input[1] == "wall"
    wall(user_action)
  else
    puts "Sorry I don't understand that command. Please check instructions in this application's README file"
  end

end

def post_message(user, message)
  user.post(message)
  puts "* #{ user.user.name } has posted the following message: #{ message } *"
end

def read(user)
  user_messages = user.messages
  puts user.messages.inspect
  user_timeline = Timeline.new(user, user_messages)
  puts user_timeline.inspect
  user_timeline.view
end

def follow(user, target)
  user.follow(target)
  puts "* #{ name } is now following #{ target } *"
end

def wall(user)
  user_wall = Wall.new(user)
  user_wall.view
end

def check_user(username)
  if !@all_users.include?(username)
    @all_users << username
    @user = User.new(username)
    @user_do = Action.new(@user)
  end
end

loop do
  puts 'Please enter a command.'
  process
end
