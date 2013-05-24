require File.expand_path(File.dirname(__FILE__)+"/spec_helper.rb")


describe Kder do
  before do
    @test_arr =10_000.times.map{ rand(100)}
  end
  it "gives a kde for a small array" do 
    resp = Kder.kde([1,2,3] )#@test_arr, Bandwidth.silverman(@test_arr, @test_arr.standard_deviation))
    resp.size.should eq(2)
    # TODO expand the tests
  end
  it "gives a kde for a large array" do 
    resp = Kder.kde @test_arr
    resp.size.should eq(2)
    # TODO expand the tests
  end
end

