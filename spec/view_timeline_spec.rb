require 'spec_helper'
require './lib/user'
require './lib/action'
require './lib/timeline'

describe "User's timeline" do

  let(:user) { User.new('Alice') }
  let(:alice) { Action.new(user) }

  it "it displays a user's published messages" do

    alice.post("I love the weather today")
    alice_messages = alice.messages
    alice_timeline = Timeline.new(user, alice_messages)
    receiver = double()
    alice_timeline.view.receiver = receiver

    expect(receiver).to receive(:puts).with(alice_timeline)
    expect(alice_timeline.view).to eq("I love the weather today (0 minutes ago)")

  end

end
