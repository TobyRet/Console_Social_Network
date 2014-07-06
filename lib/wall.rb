class Wall

  def initialize(user)
    @user = user
  end

  def view
    puts retrieve_sorted
    retrieve_sorted.map { |message| "#{ message[:user] } - #{ message[:post] } (#{ time_ago(message[:time]) })" }
  end

  def retrieve_sorted
    retrieve_all.sort_by { |k| k[:time] }.reverse
  end

  def retrieve_all
    User.all_messages.flatten(1).select { |message| message if match_user(message) || match_following(message) }
  end

  def match_user(message)
    message[:user] == @user.name
  end

  def match_following(message)
    @user.following.include?(message[:user])
  end

  def time_ago(time_created)
    timestamp = Time.now - time_created
    if timestamp <= 60
      "#{ timestamp.round } seconds ago"
    else
      "#{ (timestamp / 60).ceil } minutes ago"
    end
  end

end
