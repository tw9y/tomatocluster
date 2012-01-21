require_relative '../spec_helper'

describe User do

	before do
		@user = User.new
	end

  it "should require a valid email address" do
  	@user.valid?.must_equal false
	end

  it "should require a password" do
  end

end
