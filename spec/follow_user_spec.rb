require 'spec_helper'
require './lib/user'
require './lib/wall'

describe 'following a user' do

  let!(:alice) { User.new('Alice') }
  let!(:bob) { User.new('Bob') }
  let!(:charlie) { User.new('Charlie') }

  before do

    charlie.post("I'm in New York today! Anyone wants to have a coffee?")
    alice.post("I love the weather today")

  end

  it 'a user can follow another user' do

    puts User.all_users

    charlie.follow('Alice')
    charlie.follow('Bob')

    expect(charlie.following).to eq(['Alice', 'Bob'])

  end

end
