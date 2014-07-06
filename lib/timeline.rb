class Timeline

  def initialize(messages = [])
    @messages = messages
  end

  def view
    if @messages.empty?
      puts "This person has not posted any messages yet"
    else
      @messages.map { |message| "#{ message[:post] } (#{ time_ago(message[:time]) })" }
    end
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
