class Timeline

  def initialize(user, messages)
    @messages = messages
    @user = user
  end

  def view
    "#{ @messages[0] } (5 minutes ago)"
  end


end
