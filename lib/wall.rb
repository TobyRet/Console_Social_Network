class Wall

  def initialize( user, messages, subscriptions )
    @user = user
    @messages = messages
    @subscriptions = subscriptions
  end

  def view
    own_messages
    subscription_messages
  end

  def own_messages
    @messages.map { |message| "#{ message[:post] } (#{ time_ago(message[:time]) } minutes ago)" }
  end

  def subscription_messages
    @suscriptions.map do |subscription|

    end

  end

end
