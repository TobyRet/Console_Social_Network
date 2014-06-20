class Action

  attr_reader :messages

  def initialize(user)
    @messages = []
    @user = user
  end

  def post(message)
    @messages << { post: message, date: post_date }
    puts @messages
  end

  def post_date
    DateTime.now.strftime("%Y%m%dT%H%M%S")
  end

end
