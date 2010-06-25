require 'rubygems'
require 'bundler'
Bundler.setup

require 'as3'
require 'flashplayer'

#library :asunit4
library 'robotlegs', :swc

mxmlc 'bin/<%= class_name %>.swf' => ['robotlegs'] do |t|
  t.input = 'src/<%= class_name %>.mxml'
  #t.library_path << 'lib/AsUnit-4.0.0.swc'
  t.library_path << 'lib/robotlegs/robotlegs-framework-v1.1.1.swc'
end

flashplayer 'bin/<%= class_name %>.swf'

desc "Compile and run the SWF"
task :debug => 'bin/<%= class_name %>.swf'
