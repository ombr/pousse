# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pousse/version'

Gem::Specification.new do |spec|
  spec.name          = "pousse"
  spec.version       = Pousse::VERSION
  spec.authors       = ["Julien Lerpscher", "Luc Boissaye"]
  spec.email         = ["julien@studyka.com", "luc@studyka.com"]
  spec.description   = %q{Add Realtime to your application}
  spec.summary       = %q{Pousse, simple realtime for rails applications}
  spec.homepage      = "https://github.com/Studyka/pousse"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency('redis', '>= 3.0.4')
  spec.add_dependency('actionmailer', '>= 3.2.13')

  spec.files = `git ls-files`.split("\n")
end
