# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'authify/core/version'

Gem::Specification.new do |spec|
  spec.name          = 'authify-core'
  spec.version       = Authify::Core::VERSION
  spec.authors       = ['Jonathan Gnagy']
  spec.email         = ['jgnagy@knuedge.com']

  spec.summary       = 'Authify Core library'
  spec.homepage      = 'https://github.com/knuedge/authify-core'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '~> 2.0'

  spec.add_runtime_dependency 'jwt', '~> 1.5'
  spec.add_runtime_dependency 'pony', '~> 1.11'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'rubocop', '~> 0.49'
  spec.add_development_dependency 'yard',    '~> 0.9.11'
  spec.add_development_dependency 'travis', '~> 1.8'
  spec.add_development_dependency 'simplecov', '~> 0.13'
end
