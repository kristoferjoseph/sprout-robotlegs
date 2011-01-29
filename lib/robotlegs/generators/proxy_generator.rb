module Robotlegs
  class ProxyGenerator < FlashSDK::ClassGenerator
    include RobotlegsHelper
    
    def manifest
      if(!input.match(/Test$/))
        directory proxy_directory do
          template "#{class_name}.as", 'RobotlegsProxy.as'
        end
      end

      if test_class
        generator :test_class, :input => "#{fully_qualified_class_name}Test", :force => true
      end
    end
    
    def proxy_directory
      src_array = [] << src
      src_array += package_directory.dup << "model" << "proxy"
    end
    
    def package_name
      default_package_name.dup << ".model" << ".proxy"
    end

  end
end
