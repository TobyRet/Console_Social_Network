class Action

  attr_reader :messages

  def initialize(user)
    @messages = []
    @user = user
  end

  def post(message)
    @messages << { post: message, date: DateTime.now.strftime("%Y%m%dT%H%M%S") }
    puts @messages
  end

end
