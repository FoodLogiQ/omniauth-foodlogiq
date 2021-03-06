# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-foodlogiq/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Shaun Pack"]
  gem.email         = ["spack@foodlogiq.com"]
  gem.description   = %q{Official OmniAuth strategy for FoodLogiQ.}
  gem.summary       = %q{Official OmniAuth strategy for FoodLogiQ.}
  gem.homepage      = "https://github.com/FoodLogiQ/omniauth-foodlogiq"

#  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-foodlogiq"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::FoodLogiQ::VERSION

  gem.add_dependency 'omniauth'
  gem.add_dependency 'omniauth-oauth2'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
