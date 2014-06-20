require 'spec_helper'
require './lib/user'
require './lib/action'
require 'timecop'

describe 'User' do

  it 'can publish a message' do

    user = User.new('Alice')
    alice = Action.new(user)
    time = Time.new #local(2014, 6, 6, 12, 0, 4)

    Timecop.freeze(time)

    alice.post("I love the weather today")
    expect(alice.messages).to eq([{ post: "I love the weather today", time: time }])

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

    expect(bob.messages).to eq([{ post: "Damn! We lost!", time: time1 }, { post: "Good game though.", time: time2 }])

  end

end
