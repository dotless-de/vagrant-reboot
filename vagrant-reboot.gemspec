# coding: utf-8
require File.expand_path('../lib/vagrant-reboot/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "vagrant-reboot"
  spec.version       = VagrantReboot::VERSION
  spec.authors       = ["Robert Schulze"]
  spec.email         = ["robert@dotless.de"]
  spec.description   = %q{A sample vagrant plugin which reboots a box just after is came up first}
  spec.summary       = %q{A sample vagrant plugin with no real use.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
