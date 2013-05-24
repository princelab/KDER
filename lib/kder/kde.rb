class Kder
  require 'distribution'
  require_relative 'bandwidth'
  require_relative '../util/statistics'

  Sigmas = 2.5 
  MeshCount = 2e3
  MinimumThresholdValue = 1e-2
  class << self
    ## 
    # :singleton-method: kde
    # Accepts a single member array plus optional additional information
    # Returns a two member array, [x_vals,y_vals] representing the kde
    def kde(arr, bw = nil, opts = {sigmas: Sigmas, sampling_density: MeshCount, threshold: MinimumThresholdValue})
      unless bw # is nil
        bw = Bandwidth.silverman(arr)
      end
      # Initialization steps
      min = arr.min - bw*opts[:sigmas]
      max = arr.max + bw*opts[:sigmas]
      step_size = (max-min)/opts[:sampling_density].to_f
      arr.sort!
      # Step through the range
      output = (min..max).step(step_size).map do |mid|
        high_end = mid+ bw*opts[:sigmas]
        lower_end = mid - bw*opts[:sigmas]
        included = arr.select {|a| (lower_end..high_end).include?(a)}
        intensity = included.map {|a| Kder::Statistics.custom_pdf(a-mid, bw) }.inject(:+)
        intensity ||= 0
        [mid, intensity ] unless intensity < opts[:threshold]
      end
      output.compact.transpose
    end
  end
end
