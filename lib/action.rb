class Action

  attr_reader :messages

  def initialize(user)
    @messages = []
    @user = user
  end

  def post(message)
    @messages << message
  end

end
