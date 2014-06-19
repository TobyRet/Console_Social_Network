require 'spec_helper'
require './lib/user'

describe 'publishing a message' do

  it 'can publish a message to a personal timeline' do

    alice = User.new(alice)

    alice.post("I love the weather today")
    expect(alice.messages).to eq(["I love the weather today"])

  end

end
