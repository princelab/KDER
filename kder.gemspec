# -*- encoding: utf-8 -*-
require File.expand_path('../lib/kder', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ryan Taylor"]
  gem.email         = ["ryanmt@byu.net"]
  gem.description   = %q{A KDE implementation in Ruby.  Builds upon the gem 'distribution' to enable generation of a kernel density estimation.}
  gem.summary       = %q{Kernel Density Estimation, and an associated bandwidth estimator, rudimentary at best, but a decent first approximation for backend preparing of KDE plots for plotting in JS libraries, or for whatever you would like to use it.}
  gem.homepage      = "https://github.com/princelab/KDER"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "kder"
  gem.require_paths = ["lib"]
  gem.version       = Kder::VERSION
end
