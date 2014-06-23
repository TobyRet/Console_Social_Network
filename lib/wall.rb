class Wall

  def initialize(user)
    @user = user
  end

  def view
    retrieve.map do |message|
      puts "#{ message[:user] } - #{ message[:post] } (#{ time_ago(message[:time]) } minutes ago)"
    end
  end

  def retrieve
    result = Action.all_messages.flatten(1).select do |message|
      message if message[:user] == @user.user.name || @user.subscriptions.include?(message[:user])
    end

    result.sort_by { |k| k[:time] }
  end

  def time_ago(time_created)
    ((Time.now - time_created) / 60).ceil
  end

end
