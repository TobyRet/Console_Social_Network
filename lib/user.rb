class User

  attr_reader :name, :messages

  @@all_messages = []
  @@all_users = []

  def initialize(name)
    @name = name
    @messages = []
    @subscriptions = []
    @@all_users << @name
  end

  def post(message)
    formatted_message = { user: "#{ @name }", post: "#{ message }", time: Time.new }
    @messages << formatted_message
    @@all_messages << formatted_message
  end

  def follow(person)
    @@all_users.each { |user| @subscriptions << person if person == user }
  end

  def following
    @subscriptions
  end

  def self.all_messages
    @@all_messages
  end

  def self.all_users
    @@all_users
  end

end
