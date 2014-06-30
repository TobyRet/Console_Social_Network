class Timeline

  def initialize(messages = [])
    @messages = messages
    #@user = user
  end

  def view
    if @messages.empty?
      puts "This person has not posted any messages yet"
    else
      @messages.map { |message| "#{ message[:post] } (#{ time_ago(message[:time]) } minutes ago)" }
    end
  end

  def time_ago(time_created)
    ((Time.now - time_created) / 60).ceil
  end

end
