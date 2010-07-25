# -*- encoding: utf-8 -*-
lib = File.expand_path File.dirname(__FILE__), "lib"
$:.unshift lib unless $:.include?( lib )

require 'bundler'
Bundler.require
require 'robotlegs'

Gem::Specification.new do |s|
  s.name                      = Robotlegs::NAME
  s.version                   = Robotlegs::VERSION
  s.author                    = "Kristofer Joseph"
  s.email                     = ["projectsprouts@googlegroups.com"]
  s.homepage                  = "http://projectsprouts.org"
  s.summary                   = "A library for developing Robotlegs projects with Project Sprouts"
  s.description               = "GO AND CODE"
  s.executables               = ["rl-project","rl-context","rl-proxy","rl-mediator","rl-command","rl-service"]
  s.rubyforge_project         = "sprout"
  s.required_rubygems_version = ">= 1.3.6"
  s.files                     = FileList["**/*"].exclude /docs|.DS_Store|generated|.svn|.git/
  s.add_bundler_dependencies
  s.require_paths             << 'lib'
end
