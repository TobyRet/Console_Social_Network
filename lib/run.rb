require 'user'
require 'timeline'
require 'wall'

@all_users = []
@active_users = []

puts 'Welcome to Chatter!'
puts '-------------------'

def process
  input = gets.chomp.split
  input[2] = input[2..-1].join(" ") if input.length > 3

  if input[1] == "->"
    user_name = "#{ input[0] }"
    check_user(user_name)
    post_message(@current_user, input[2])
  elsif input.length == 1
    user_name = "#{ input[0] }"
    check_user(user_name)
    read(@current_user)
  elsif input[1] == "follows"
    user_name = "#{ input[0] }"
    check_user(user_name)
    follow(@current_user, input[2])
  elsif input[1] == "wall"
    user_name = "#{ input[0] }"
    check_user(user_name)
    wall(@current_user)
  else
    puts "Sorry I don't understand that command. Please check instructions in this application's README file"
  end

end

def post_message(user, message)
  user.post(message)
  puts "* #{ user.name } has posted the following message: #{ message } *"
end

def read(user)
  user_messages = user.messages
  user_timeline = Timeline.new(user_messages)
  puts user_timeline.view
end

def follow(user, target)
  user.follow(target)
  puts "* #{ user.name } is now following #{ target } *"
end

def wall(user)
  user_wall = Wall.new(user)
  puts user_wall.view
end

def check_user(username)
  if !@all_users.include?(username)
    @all_users << username
    @user = User.new(username)
    @active_users << @user
    @current_user = select_current_user(username)
  else
    @current_user = select_current_user(username)
  end
end

def select_current_user(username)
  @active_users.select { |active_user| active_user if active_user.name == username }[0]
end

loop do
  puts 'Please enter a command.'
  process
end
