# -*- encoding: utf-8 -*-

require File.dirname(__FILE__) + '/robotlegs'
require 'rake'

Gem::Specification.new do |s|
  s.name                      = Robotlegs::NAME
  s.version                   = Robotlegs::VERSION
  s.author                    = "Kristofer Joseph"
  s.email                     = ["projectsprouts@googlegroups.com"]
  s.homepage                  = "http://projectsprouts.org"
  s.summary                   = "A library for developing Robotlegs projects with Project Sprouts"
  s.description               = "GO AND CODE"
  s.rubyforge_project         = "sprout"
  s.required_rubygems_version = ">= 1.3.6"
  s.require_path              = "."
  s.files                     = FileList["**/*"].exclude /docs|.DS_Store|generated|.svn|.git/
end

