class Wall

  def initialize(user)
    @user = user
  end

  def view
    retrieve.map do |message|
      "#{message[:user]} - #{message[:post]} (#{ time_ago(message[:time]) } minutes ago)"
    end
  end

  def retrieve
    Action.all_messages.flatten(1).select do |message|
      message if message[:user] == @user.user.name || @user.subscriptions.include?(message[:user])
    end
  end

  def time_ago(time_created)
    ((Time.now - time_created) / 60).ceil
  end

end
