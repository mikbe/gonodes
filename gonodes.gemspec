# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gonodes/version"

Gem::Specification.new do |s|
  s.name        = "gonodes"
  s.version     = Gonodes::VERSION
  s.authors     = ["Mike Bethany"]
  s.email       = ["mikbe.tk@gmail.com"]
  s.homepage    = "http://mikbe.tk/projects#gonodes"
  s.summary     = %q{An easy way to create simple, weighted graphs. Even randomly populated ones!}
  s.description = %q{If you need to create simple (in the mathematical sense), weighted graphs with  
  random values for the connections and weights then this is the gem for you.}

  s.rubyforge_project = "gonodes"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ["lib"]
end
