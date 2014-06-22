require 'spec_helper'
require './lib/user'
require './lib/action'
require 'timecop'

describe 'User' do

  it 'can publish a message' do

    user = User.new('Alice')
    alice = Action.new(user)
    time = Time.new

    Timecop.freeze(time)

    alice.post("I love the weather today")
    expect(alice.messages).to eq([{ user: "Alice", post: "Alice -> I love the weather today", time: time }])

  end

  it 'can post mulitple messages' do

    user = User.new('Bob')
    bob = Action.new(user)

    time1 = Time.new
    Timecop.freeze(time1)
    bob.post("Damn! We lost!")
    Timecop.return

    sleep(3)

    time2 = Time.new
    Timecop.freeze(time2)
    bob.post("Good game though.")

    expect(bob.messages).to eq([{ user: "Bob", post: "Bob -> Damn! We lost!", time: time1 }, { user: "Bob", post: "Bob -> Good game though.", time: time2 }])

  end

end
