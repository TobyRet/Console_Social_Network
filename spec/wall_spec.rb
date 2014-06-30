require 'spec_helper'
require './lib/user'
require './lib/wall'
require_relative './helpers/users.rb'

describe 'wall' do

  build_users

  before do

    charlie.post("I'm in New York today! Anyone wants to have a coffee?")
    alice.post("I love the weather today")
    bob.post("Damn! We lost!")

    charlie.follow('Alice')
    charlie.follow('Bob')

  end

  it 'user can view an aggregated list of all subscribed posts' do

    charlie_wall = Wall.new(charlie)

    expect(charlie_wall.view).to eq(["Charlie - I'm in New York today! Anyone wants to have a coffee? (1 minutes ago)",
                                     "Alice - I love the weather today (1 minutes ago)",
                                     "Bob - Damn! We lost! (1 minutes ago)"])
  end

end
