require 'as3'

lib = File.expand_path File.dirname(__FILE__)
$:.unshift lib unless $:.include?(lib)

require 'robotlegs/generators/project_generator'
require 'robotlegs/generators/context_generator'
require 'robotlegs/generators/proxy_generator'
require 'robotlegs/generators/mediator_generator'
require 'robotlegs/generators/command_generator'
require 'robotlegs/generators/service_generator'


module Robotlegs  
  NAME    = 'robotlegs'
  VERSION = '1.1.1.pre'
end

Sprout::Specification.new do |s|
  s.name    = Robotlegs::NAME
  s.version = Robotlegs::VERSION
  s.add_remote_file_target do |f|
    f.url = 'http://downloads.robotlegs.org/robotlegs-framework-v1.1.1.zip'
    f.md5 = '822fae3a7684437ead94dd388f87d299'
    f.archive_type = :zip
    f.add_library :swc, 'bin/robotlegs-framework-v1.1.1.swc'
    f.add_library :swift_suspenders, 'libs/SwiftSuspenders-v1.5.1.swc'
    f.add_library :src, 'src'
  end
end
