module Enumerable
  # Thanks StackOverflow users!
  # http://stackoverflow.com/questions/7749568/how-can-i-do-standard-deviation-in-ruby
  def sum
    self.inject(:+)
  end
  def mean
    self.sum/self.length.to_f
  end
  alias average mean
  def sample_variance
    m = self.mean
    sum = self.inject(0){|accum, i| accum + (i-m)**2}
    sum/(self.length - 1).to_f
  end
  def standard_deviation
    Math.sqrt(self.sample_variance)
  end
end
