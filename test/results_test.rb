require 'minitest/autorun'

require_relative '../lib/results'

describe Results do 
  it "returns results from all calculations" do
    results = { 7  => "5 + 2 = 7",
                3  => "5 - 2 = 3",
                10 => "5 * 2 = 10",
              }
    r =  Results.new(2,5)
    r.first.must_equal(5)
    r.answers.must_equal(results)
  end

  it "gives back a hash with the results of a math expression" do
    r =  Results.new(2,5)
    result = { 7 => "2 + 5 = 7"}
    r.try(2,:+,5).must_equal(result)
  end
end
