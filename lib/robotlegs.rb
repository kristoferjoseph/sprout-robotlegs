require 'flashsdk'

require 'robotlegs/module'
require 'robotlegs/generators/robotlegs_helper'
require 'robotlegs/generators/project_generator'
require 'robotlegs/generators/context_generator'
require 'robotlegs/generators/proxy_generator'
require 'robotlegs/generators/mediator_generator'
require 'robotlegs/generators/command_generator'
require 'robotlegs/generators/service_generator'

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
