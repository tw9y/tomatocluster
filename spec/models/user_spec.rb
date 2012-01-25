require_relative '../spec_helper'

describe User do

	before do
    # FIXME: use some kind of database cleaner instead
    User.delete_all
		@user = User.new
	end

  it "should require a valid email address" do
  	@user.valid?.must_equal false
	end

	it "should not save when invalid" do
		@user.save.must_equal false
	end

  it "should require a password" do
  end

end
