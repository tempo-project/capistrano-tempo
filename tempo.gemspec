# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tempo/version'

Gem::Specification.new do |spec|
  spec.name = "Tempo"
  spec.version = Tempo::VERSION

  spec.licenses = ["MIT"]
  spec.authors = ["Ikimea"]
  spec.description = %q{Send notifications to Tempo about Capistrano deployments.}
  spec.summary = %q{Send notifications to Tempo about Capistrano deployments.}
  spec.homepage = "https://github.com/tempo-project/capistrano-tempo"

  spec.required_ruby_version = '>= 2.0.0'

  spec.require_paths = ["lib"]
  spec.files = `git ls-files`.split($/)
  spec.executables = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }

  spec.add_dependency 'json'
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
end
