class User

  attr_reader :name, :messages

  @@all_messages = []

  def initialize(name)
    @name = name
    @messages = []
  end

  def post(message)
    @@all_messages << { user: "#{ @name }", post: "#{ message }", time: Time.new }
    @messages << { user: "#{ @name }", post: "#{ message }", time: Time.new }
  end

  def follow(person)
    User.users.each { |user| @subscriptions << person if person == user }
  end

  def self.all_messages
    @@all_messages
  end

end
