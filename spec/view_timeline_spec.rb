require 'spec_helper'
require './lib/user'
require './lib/timeline'
require 'timecop'
require_relative './helpers/users.rb'

describe "User's timeline" do

  build_users

  it "it displays a user's published messages" do

    Timecop.freeze Time.local(2014, 6, 30, 18, 0, 0)
    alice.post("I love the weather today")
    Timecop.return

    Timecop.freeze Time.local(2014, 6, 30, 18, 5, 0)
    alice.post("Where is the cheese?")
    Timecop.return

    Timecop.freeze Time.local(2014, 6, 30, 19, 0, 0)
    alice_messages = alice.messages
    alice_timeline = Timeline.new(alice_messages)


    expect(alice_timeline.view).to eq(["I love the weather today (60 minutes ago)","Where is the cheese? (55 minutes ago)"])
    Timecop.return
  end

end
