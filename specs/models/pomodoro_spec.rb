require_relative '../test_helper'

describe Pomodoro do
  it "should require a name" do
    pomodoro = Pomodoro.new
    pomodoro.valid?.must_equal false
    pomodoro.errors.size.must_be :>=, 1
  end
  it "should belong to a user" do

  end
  it "should have a start datetime" do

  end
  it "should have interruptions" do

  end

end
