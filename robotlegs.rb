require 'sprout'

module Robotlegs  NAME    = 'robotlegs'
  VERSION = '0.0.1'
end

Sprout::Specification.new do |s|
  s.name    = Robotlegs::NAME
  s.version = Robotlegs::VERSION
  s.add_file_target do |f|
    f.add_library :swc, 'bin/Robotlegs-0.0.1.swc'
    f.add_library :src, 'src'
  end
end
