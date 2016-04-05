# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'libx11/version'

Gem::Specification.new do |spec|
  spec.name          = 'libx11'
  spec.version       = LibX11::VERSION
  spec.authors       = ['Takashi Kokubun']
  spec.email         = ['takashikkbn@gmail.com']

  spec.summary       = 'Ruby binding for libx11 including xlib'
  spec.description   = 'Ruby binding for libx11 including xlib'
  spec.homepage      = 'https://github.com/k0kubun/libx11-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.extensions    = ['ext/libx11_ruby/extconf.rb']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rake-compiler'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
