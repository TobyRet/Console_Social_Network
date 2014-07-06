require 'spec_helper'
require 'timecop'
require './lib/user'
require './lib/wall'
require_relative './helpers/users.rb'

describe 'wall' do

  build_users

  before do

    @time = Time.local(2014, 6, 30, 18, 0, 0)

    Timecop.freeze @time

    charlie.post("I'm in New York today! Anyone wants to have a coffee?")
    alice.post("I love the weather today")

    Timecop.return

    Timecop.travel(@time + 15)
    bob.post("Damn! We lost!")

    charlie.follow('Alice')
    charlie.follow('Bob')

    Timecop.return

  end

  it 'user can view an aggregated list of all subscribed posts' do

    Timecop.travel(@time + 30 )

    charlie_wall = Wall.new(charlie)

    expect(charlie_wall.view).to eq(["Bob - Damn! We lost! (15 seconds ago)", "Alice - I love the weather today (30 seconds ago)", "Charlie - I'm in New York today! Anyone wants to have a coffee? (30 seconds ago)"])

    Timecop.return
  end

end
