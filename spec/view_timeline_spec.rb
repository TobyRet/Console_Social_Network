require 'spec_helper'
require './lib/user'
require './lib/timeline'
require_relative './helpers/users.rb'

describe "User's timeline" do

  build_users

  it "it displays a user's published messages" do

    alice.post("I love the weather today")
    alice.post("Where is the cheese?")
    alice_messages = alice.messages
    alice_timeline = Timeline.new(alice_messages)

    expect(alice_timeline.view).to eq(["I love the weather today (1 minutes ago)",
                                       "Where is the cheese? (1 minutes ago)"])

  end

end
