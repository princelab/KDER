class Kder
  require 'distribution'
  require_relative 'bandwidth'
  require_relative '../util/statistics'

  Sigmas = 3 
  MeshCount = 1e4
  class << self
    ## 
    # :singleton-method: kde
    # Accepts a single member array plus optional additional information
    # Returns a two member array, [x_vals,y_vals] representing the kde
    def kde(arr, bw = nil, sigmas = Sigmas, sampling_density = MeshCount)
      unless bw # is nil
        bw = Bandwidth.silverman(arr)
      end
      # Initialization steps
      min = arr.min - bw*sigmas
      max = arr.max + bw*sigmas
      step_size = (max-min)/sampling_density.to_f
      arr.sort!
      # Step through the range
      output = (min..max).step(step_size).map do |mid|
        high_end = mid+ bw*sigmas
        lower_end = mid - bw*sigmas
        included = arr.select {|a| (lower_end..high_end).include?(a)}
        intensity = included.map {|a| Kder::Statistics.custom_pdf(a-mid, bw) }.inject(:+)
        intensity ||= 0
        [mid, intensity ]
      end
      output.transpose
    end
  end
end
