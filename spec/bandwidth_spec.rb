require 'spec_helper'

describe Bandwidth do 
  before :each do 
    @test_arr = 1e5.to_i.times.map {rand(100)}
  end
  it "returns a value" do 
    bw = Bandwidth.silverman(@test_arr, @test_arr.standard_deviation)
    bw.should be_a(Float)
    p bw
    bw.should be_within(10).of(3)
  end
end

