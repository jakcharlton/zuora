# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "zuora"

Gem::Specification.new do |s|
  s.name        = "zuora"
  s.version     = Zuora::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["John D'Agostino", "Shane Niu"]
  s.email       = ["john.dagostino@omg.com.au", "shane.niu@omg.com.au"]
  s.homepage    = "http://www.omg.com.au"
  s.summary     = %q{}
  s.description = <<-EOF
EOF
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('savon')
  s.add_dependency('gyoku')
  s.add_dependency('activesupport')

  # Test libraries
  s.add_development_dependency('rspec', '1.3.0')
end

