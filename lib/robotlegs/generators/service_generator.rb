module Robotlegs
  class ServiceGenerator < FlashSDK::ClassGenerator

    def manifest
      if(!input.match(/Test$/))
        directory service_directory do
          template "#{class_name}Service.as", 'RobotlegsService.as'
        end
      end

      unless no_test
        generator :test_class, :input => "#{fully_qualified_class_name}Test"
      end
    end
    
    def service_directory
      package_directory << 'service'
    end
    
    def service_package
      default_package_name << '.service'
    end
    
  end
end
