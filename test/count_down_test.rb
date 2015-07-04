require 'minitest/autorun'

require_relative '../lib/countdown'

it "finds the closest answers" do
  Countdown.new(10,5,2).answer.must_equal("5 * 2 = 10")
end
