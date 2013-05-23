$:.unshift(File.dirname(__FILE__)+"/../lib")
require 'rspec'
require 'kder'

RSpec.configure do |config|
  config.mock_with :rspec

end
