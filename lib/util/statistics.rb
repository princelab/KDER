class Kder
  module Statistics
    SQ2PI = Math.sqrt(2 * Math::PI)
    # Normal pdf with a custom sigma value, still centered around 0.
    def self.custom_pdf(x, sigma = 1.0)
      mean = 0 
      (1.0/( sigma*SQ2PI))*Math::exp(-0.5*((x-mean)/sigma)**2)
    end
  end
end
