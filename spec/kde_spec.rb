require File.expand_path(File.dirname(__FILE__)+"/spec_helper.rb")


describe Kder do
  before do
    @test_arr =1e5.to_i.times.map{ rand(100)}
  end
  it "gives a kde for a provided array" do 
    resp = Kder.kde([1,2,3] )#@test_arr, Bandwidth.silverman(@test_arr, @test_arr.standard_deviation))
    resp.size.should eq(2)
    resp.first.size.should eq(false)
    resp.first.first.should eq(false)
    resp.first.last.should eq(false)
    resp.last.size.should eq(false)
    resp.last.first.should eq(false)
    resp.last.last.should eq(false)
  end
end

