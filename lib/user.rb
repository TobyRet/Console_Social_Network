class User

  attr_reader :name

  @@all_users = []

  def initialize(name)
    @name = name
    @@all_users << @name
  end

  def self.users
    @@all_users
  end

end
