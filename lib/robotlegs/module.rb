module Robotlegs
  NAME    = 'robotlegs'
  ZIP_VERSION = '1.4.0'
  ZIP_MD5 = '2c0962ea2f5e9665d1ac8951c7448b95'
  # Version applies directly to Robotlegs official version. To release patches to 
  # the sprout or gem, increment the micro value, or the 4th number in the version sequence.
  version_file = File.join(File.dirname(__FILE__), '..', '..', 'VERSION')
  VERSION = File.read(version_file).strip 
end
