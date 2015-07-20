require 'minitest/autorun'

require_relative '../lib/count_down'

describe CountDown do
  it "finds the closest answers" do
    CountDown.new(10,5,2).found?.must_equal(true)
    CountDown.new(10,5,2).answer.must_equal("5 * 2 = 10")
    CountDown.new(5,4,1).found?.must_equal(true)
    CountDown.new(5,4,1).answer.must_equal("4 + 1 = 5")
    CountDown.new(3,6,2).found?.must_equal(true)
    CountDown.new(3,6,2).answer.must_equal("6 / 2 = 3")
    CountDown.new(1,2,1).found?.must_equal(true)
    CountDown.new(1,2,1).answer.must_equal("2 - 1 = 1")
    CountDown.new(10,4,1,2).found?.must_equal(true)
    CountDown.new(10,4,1,2).answer.must_equal("4 + 1 = 5,5 * 2 = 10")
    CountDown.new(13,4,1,2,3).answer.must_equal("4 + 1 = 5,5 * 2 = 10")
  end
end
