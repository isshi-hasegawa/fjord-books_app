# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @alice = users(:alice)
    @bob = users(:bob)
    Relationship.create!(following_id: @bob.id, follower_id: @alice.id)
  end

  test '#following?' do
    assert @alice.following?(@bob)
  end

  test '#followed_by?' do
    assert @bob.followed_by?(@alice)
  end

  test '#follow' do
    assert @alice.following?(@bob)
    Relationship.find_by(following_id: @bob.id, follower_id: @alice.id)&.destroy!
    assert_not @alice.following?(@bob)
    @alice.follow(@bob)
    assert @alice.following?(@bob)
  end

  test '#unfollow' do
    assert @alice.following?(@bob)
    @alice.unfollow(@bob)
    assert_not @alice.following?(@bob)
  end

  test '#name_or_email' do
    assert_equal 'alice@example.com', @alice.name_or_email

    @alice.name = 'Alice'
    assert_equal 'Alice', @alice.name_or_email
  end
end
