require './lib/user'

class Action

  attr_reader :messages
  attr_reader :subscriptions

  def initialize(user)
    @messages = []
    @subscriptions = []
    @user = user
  end

  def post(message)
    @messages << { post: "#{@user.name} -> #{ message }", time: Time.new }
    puts @messages
  end

  def follow(person)
    User.users.each { |user| @subscriptions << person if person == user }
  end

end
