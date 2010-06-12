require 'sprout'

lib = File.expand_path File.dirname(__FILE__)
$:.unshift lib unless $:.include?(lib)

require 'generators/project_generator'
require 'generators/context_generator'
require 'generators/proxy_generator'
require 'generators/mediator_generator'
require 'generators/command_generator'


module Robotlegs  
  NAME    = 'robotlegs'
  VERSION = '1.0.pre'
end

Sprout::Specification.new do |s|
  s.name    = Robotlegs::NAME
  s.version = Robotlegs::VERSION
  s.add_file_target do |f|
    f.add_library :swc, 'bin/Robotlegs-0.0.1.swc'
    f.add_library :src, 'src'
  end
end
