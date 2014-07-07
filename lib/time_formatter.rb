module TimeFormatter

  def time_ago(time_created)
    timestamp = Time.now - time_created
    if timestamp <= 60
      "#{ timestamp.round } seconds ago"
    else
      "#{ (timestamp / 60).round } minutes ago"
    end
  end

end
