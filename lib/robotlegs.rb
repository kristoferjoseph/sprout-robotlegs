require 'robotlegs/version'
require 'flashsdk'
require 'robotlegs/generators/robotlegs_class_generator_base'
require 'robotlegs/generators/project_generator'
require 'robotlegs/generators/context_generator'
require 'robotlegs/generators/proxy_generator'
require 'robotlegs/generators/mediator_generator'
require 'robotlegs/generators/command_generator'
require 'robotlegs/generators/service_generator'

module Robotlegs  
  NAME    = 'robotlegs'
  VERSION = '1.1.3.pre'
  ZIP_VERSION = '1.4.0'
  ZIP_MD5 = '2c0962ea2f5e9665d1ac8951c7448b95'
end

Sprout::Specification.new do |s|
  s.name    = Robotlegs::NAME
  s.version = Robotlegs::VERSION
  s.add_remote_file_target do |f|
    f.url = "http://downloads.robotlegs.org/robotlegs-framework-v#{Robotlegs::ZIP_VERSION}.zip"
    f.md5 = Robotlegs::ZIP_MD5
    f.archive_type = :zip
    f.add_library :swc, ['bin/']
  end
end
