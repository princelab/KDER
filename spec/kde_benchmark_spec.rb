require File.expand_path(File.dirname(__FILE__)+"/spec_helper.rb")


describe Kder do
  context "BENCHMARKING" do 
    require 'ruby-prof'
    before do
      @test_arr =10_000.times.map{ rand(100)}
    end
    it "gives a kde for a large array" do 
      resp = Kder.kde @test_arr
      resp.size.should eq(2)
      # TODO expand the tests
    end
    it "PROFILES a KDE for a VERY large array" do 
      @test_arr = 10_000_000.times.map{ rand(100)}
      result = RubyProf.profile do 
        resp = Kder.kde @test_arr
      end
      file = "ruby_profile_kde.html"
      File.open(file, 'w') do |io|
        printer = RubyProf::GraphHtmlPrinter.new(result)
        printer.print(io, {})
      end
    end
  end # BENCHMARKING
end

