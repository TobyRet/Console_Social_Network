require 'spec_helper'
require './lib/user'
require './lib/action'
require './lib/timeline'

describe "Viewing a user's timeline" do

  let(:user) { User.new('Alice') }
  let(:alice) { Action.new(user) }

  it "allows a user to view another user's published messages" do

    alice.post("I love the weather today")
    alice_messages = alice.messages
    alice_timeline = Timeline.new(user, alice_messages)

    expect(alice_timeline.view).to eq(["Alice -> I love the weather today (0 minutes ago)"])

  end

end
