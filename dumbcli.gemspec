# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dumbcli/version'

Gem::Specification.new do |spec|
  spec.name          = "dumbcli"
  spec.version       = Dumbcli::VERSION
  spec.authors       = ["Shintaro Kojima"]
  spec.email         = ["goodies@codeout.net"]

  spec.summary       = 'A scaffold of ruby wrapper of rancid xlogin'
  spec.description   = "DumbCLI is a ruby wrapper of rancid xlogin that is a CLI handler of network devices. You can easily extends DumbCLI's scaffold classes to manage your devices."
  spec.homepage      = 'https://github.com/codeout/dumbcli'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
