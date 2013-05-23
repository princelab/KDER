require 'spec_helper'

describe "Enumerator extensions" do 
  before :each do 
    @test_arr = [1,2,3,4]
  end
  it 'does standard_deviation' do 
    resp = @test_arr.standard_deviation
    resp.should be_kind_of( Float)
    resp.should be_within(1e-5).of(1.29099444)
  end
end
