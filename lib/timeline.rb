require 'time_formatter'

class Timeline

  include TimeFormatter

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

end
