require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase

	def setup
		@relationship = Relationship.new(follower_id: 1, followed_id: 2)
	end

	test "Should be valid" do 
		assert @relationship.valid?
	end

	test "Should require a follower_id" do 
		@relationship.follower_id = nil
		assert_not @relationship.valid?
	end

	test "Should require a followed_id" do 
		@relationship.followed_id = nil 
		assert_not @relationship.valid?
	end

	test "Should follow and unfollow a user" do 
		michael = users(:michael)
		archer = users(:archer)
		assert_not michael.following?(archer)
		michael.follow(archer)
		assert michael.following?(archer)
		assert archer.followers.include?(michael)
		michael.unfollow(archer)
		assert_not michael.following?(archer)
	end

end
