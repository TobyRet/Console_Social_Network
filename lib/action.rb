require './lib/user'

class Action

  attr_reader :messages
  attr_reader :subscriptions
  attr_reader :user

  @all_messages = []

  def initialize(user)
    @messages = []
    @subscriptions = []
    @user = user
  end

  def post(message)
    @messages << { user: "#{ @user.name }", post: "#{ message }", time: Time.new }
  end

  def follow(person)
    User.users.each { |user| @subscriptions << person if person == user }
  end

  def self.all_messages
    @all_messages << @messages
  end

end
