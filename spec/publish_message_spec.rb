require 'spec_helper'
require './lib/user'
require './lib/action'

describe 'publishing a message' do

  it 'can publish a message to a personal timeline' do

    user = User.new('Alice')
    alice = Action.new(user)

    alice.post("I love the weather today")
    expect(alice.messages).to eq(["I love the weather today"])

  end

end
