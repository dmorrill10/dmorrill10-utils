# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dmorrill10-utils/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dustin Morrill"]
  gem.email         = ["morrill@ualberta.ca"]
  gem.description   = %q{Group of random Ruby mixin utility functions.}
  gem.summary       = %q{Group of random Ruby mixin utility functions.}
  gem.homepage      = 'https://github.com/dmorrill10/dmorrill10-utils'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dmorrill10-utils"
  gem.require_paths = ["lib"]
  gem.version       = Dmorrill10::Utils::VERSION
end
