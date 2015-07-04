require 'minitest/autorun'

it "finds the closest answers" do
  List.new(10,5,2).answer.must_equal("5 * 2 = 10")
end
