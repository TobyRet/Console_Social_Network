require 'spec_helper'
require './lib/user'
require './lib/action'
require 'timecop'

describe 'User' do

  it 'can publish a message' do

    user = User.new('Alice')
    alice = Action.new(user)
    time1 = DateTime.now.strftime("%Y%m%dT%H%M%S")

    Timecop.freeze(time1)

    alice.post("I love the weather today")
    expect(alice.messages).to eq([{ post: "I love the weather today", date: time1 }])

  end

  #xit 'can post mulitple messages' do
  #
  #  user = User.new('Bob')
  #  bob = Action.new(user)
  #
  #  time1 = Time.parse("2014-6-19 10:00:00")
  #  time2 = Time.parse("2014-7-19 11:00:00")
  #
  #  DateTime.stub(:now).and_return (time1)
  #  DateTime.stub(:now).and_return (time2)
  #
  #  bob.post("Damn! We lost!")
  #  bob.post("Good game though.")
  #
  #  expect(bob.messages).to eq([{ post: "Damn! We lost!", time: time1 }, { post: "Good game though.", time: time2 }])
  #
  #end

end
