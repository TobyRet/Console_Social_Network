class Timeline

  def initialize(user, messages)
    @messages = messages
    @user = user
  end

  def view
    @messages.map { |message| "#{ message[:post] } (#{ time_ago(message[:time]) } minutes ago)" }
  end

  def time_ago(time_created)
    ((Time.now - time_created) / 60).ceil
  end

end
