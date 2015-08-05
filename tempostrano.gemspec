# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tempostrano/version'

Gem::Specification.new do |gem|
  gem.name = "tempostrano"
  gem.version = Tempostrano::VERSION

  gem.licenses = ["MIT"]
  gem.authors = ["Ikimea"]
  gem.email   = ["support@ikimea.com"]
  gem.description = %q{Send notifications to Tempo about Capistrano deployments.}
  gem.summary = %q{Send notifications to Tempo about Capistrano deployments.}
  gem.homepage = "https://github.com/tempo-project/tempostrano"

  gem.required_ruby_version = '>= 2.0.0'
  gem.add_dependency 'capistrano', '>= 3.0.1'

  gem.require_paths = ["lib"]
  gem.files = `git ls-files`.split($/)

  gem.add_dependency 'json'
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rake"
end
