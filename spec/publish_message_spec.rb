require 'spec_helper'
require './lib/user'
require './lib/action'

describe 'publishing a message' do

  it 'can publish a message' do

    user = User.new('Alice')
    alice = Action.new(user)

    alice.post("I love the weather today")
    expect(alice.messages).to eq(["I love the weather today"])

    user = User.new('Bob')
    bob = Action.new(user)

    bob.post("Damn! We lost!")
    bob.post("Good game though.")
    expect(bob.messages).to eq(["Damn! We lost!", "Good game though."])

  end

end
