module Robotlegs
  class ProxyGenerator < FlashSDK::ClassGenerator
    include RobotlegsHelper
    
    def manifest
      if(!input.match(/Test$/))
        directory proxy_directory do
          template "#{class_name}.as", 'RobotlegsProxy.as'
        end
      end

      unless no_test
        generator :test_class, :input => "#{fully_qualified_class_name}Test"
      end
    end
    
    def proxy_directory
      [] << src << package_directory << "model" << "proxy"
    end
    
    def package_name
      default_package_name << ".model" << ".proxy"
    end

  end
end
