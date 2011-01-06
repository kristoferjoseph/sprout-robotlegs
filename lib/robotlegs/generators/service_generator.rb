module Robotlegs
  class ServiceGenerator < FlashSDK::ClassGenerator
    include RobotlegsHelper
    
    def manifest
      if(!input.match(/Test$/))
        directory service_directory do
          template "#{class_name}.as", 'RobotlegsService.as'
        end
      end

      if test_class
        generator :test_class, :input => "#{fully_qualified_class_name}Test"
      end
    end
    
    def service_directory
      src_array = [] << src
      src_array += package_directory << 'service'
    end
    
    def package_name
      default_package_name.dup << '.service'
    end
    
  end
end

