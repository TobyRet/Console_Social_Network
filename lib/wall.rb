class Wall

  def initialize(user)
    @user = user
  end

  def view
    retrieve.map do |message|
      "#{ message[:user] } - #{ message[:post] } (#{ time_ago(message[:time]) } minutes ago)"
    end
  end

  def retrieve
    User.all_messages.flatten(1).select { |message| message if match_user(message) || match_following(message) }.sort_by { |k| k[:time] }
  end

  def match_user(message)
    message[:user] == @user.name
  end

  def match_following(message)
    @user.following.include?(message[:user])
  end

  def time_ago(time_created)
    ((Time.now - time_created) / 60).ceil
  end

end
