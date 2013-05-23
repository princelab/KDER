require_relative '../util/enum_extensions'
module Bandwidth
  class << self
    def silverman(input_arr, std_deviation = input_arr.standard_deviation) 
      bandwidth = ((4 * std_deviation ** 5)/(3 * input_arr.size))**(1.0/5)
    end
    alias_method :estimate, :silverman 
    alias_method :nrd0, :silverman

    #def mean_integrated_squared_error(a,b,c,d)
    #end
  end
end
