# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "constructor/version"

Gem::Specification.new do |s|
  s.name        = "constructor"
  s.version     = Constructor::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Red Davis"]
  s.email       = ["red@railslove.com"]
  s.homepage    = "http://rubygems.org/gems/constructor"
  s.summary     = %q{Gem skeleton builder using bundler and rspec}
  s.description = %q{Gem skeleton builder using bundler and rspec}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "bundler", "~> 1.0.3"
  s.add_dependency "erubis", "~> 2.6.6"

  s.add_development_dependency "rspec", "~> 2.0.1"
end
