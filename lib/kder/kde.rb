class Kder
  require 'distribution'
  require_relative 'bandwidth'
  require_relative '../util/statistics'

  Sigmas = 2.5 
  MeshCount = 2e3
  MinimumThresholdValue = 1e-2
  MinimumStepSize = 1e-3
  DifferenceThreshold = 1e-2
  class << self
    ## 
    # :singleton-method: kde
    # Accepts a single member array plus optional additional information
    # Returns a two member array, [x_vals,y_vals] representing the kde
    def kde(arr, bw = nil, opts = {sigmas: Sigmas, sampling_density: MeshCount, threshold: MinimumThresholdValue, minimum_delta: DifferenceThreshold})
      unless bw # is nil
        bw = Bandwidth.silverman(arr)
      end
      # Initialization steps
      range = bw*opts[:sigmas]
      min = arr.min - range
      max = arr.max + range
      step_size = (max-min)/(opts[:sampling_density].to_f)
      step_size = step_size < MinimumStepSize ? MinimumStepSize : step_size
      arr.sort!
      # initialize the range variables
      ranges = (min..max).step(step_size).to_a
      output = [[min,0]]
      old_intensity = 0
      # Step through the range
      ranges[1..-1].map.with_index do |mid, i|
        high_end = mid + range
        lower_end = mid - range
        selection_range = (lower_end..high_end)
        included = arr.select {|a| selection_range.include?(a)}
        intensity = included.map {|a| Kder::Statistics.custom_pdf(a-mid, bw) }.inject(:+) || 0
        unless intensity < opts[:threshold] or (intensity - old_intensity).abs < opts[:minimum_delta]
          output << [mid, intensity ] 
          old_intensity = intensity
        end
      end
      output << [max,0]
      output.compact.transpose
    end
  end
end
