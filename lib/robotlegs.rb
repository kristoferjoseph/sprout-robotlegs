require 'as3'

lib = File.expand_path File.dirname(__FILE__)
$:.unshift lib unless $:.include?(lib)

require 'robotlegs/generators/project_generator'
require 'robotlegs/generators/context_generator'
require 'robotlegs/generators/proxy_generator'
require 'robotlegs/generators/mediator_generator'
require 'robotlegs/generators/command_generator'


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
