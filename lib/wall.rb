require 'time_formatter'

class Wall

  include TimeFormatter

  def initialize(user)
    @user = user
  end

  def view
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

end
