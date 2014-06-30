require 'spec_helper'
require_relative './helpers/users.rb'
require './lib/user'
require './lib/wall'

describe 'following a user' do

  build_users

  before do

    charlie.post("I'm in New York today! Anyone wants to have a coffee?")
    alice.post("I love the weather today")

  end

  it 'a user can follow another user' do

    charlie.follow('Alice')
    charlie.follow('Bob')

    expect(charlie.following).to eq(['Alice', 'Bob'])

  end

end
