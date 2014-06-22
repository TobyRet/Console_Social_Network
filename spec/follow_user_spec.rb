require 'spec_helper'
require './lib/action'
require './lib/user'
require './lib/wall'

describe 'following a user' do

  let!(:user1) { User.new('Alice') }
  let!(:user2) { User.new('Bob') }
  let!(:user3) { User.new('Charlie') }

  let(:alice) { Action.new(user1) }
  let(:bob) { Action.new(user2) }
  let(:charlie) { Action.new(user3) }

  before do

    charlie.follow('Alice')
    charlie.follow('Bob')

    charlie.post("I'm in New York today! Anyone wants to have a coffee?")
    alice.post("I love the weather today")

  end

  it 'a user can follow another user' do
    expect(charlie.subscriptions).to eq(['Alice', 'Bob'])
  end

  it 'user can view an aggregated list of all subscribed posts' do

    charlie_messages = charlie.messages
    charlie_subscriptions = charlie.subscriptions
    charlie_wall = Wall.new(charlie, charlie_messages, charlie_subscriptions)

    expect(charlie_wall.view).to eq(["Charlie -> I'm in New York today! Anyone wants to have a coffee?(0 minutes ago)",
                                     "Alice -> I love the weather today (0 minutes ago)"])
  end


end
