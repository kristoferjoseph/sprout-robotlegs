module Robotlegs
  class MediatorGenerator < FlashSDK::ClassGenerator
    include RobotlegsHelper
    
    def manifest
      if(!input.match(/Test$/))
        directory mediator_directory do
          template "#{class_name}.as", 'RobotlegsMediator.as'
        end
      end

      if test_class
        generator :test_class, :input => "#{fully_qualified_class_name}Test"
      end
    end
    
    def mediator_directory
      src_array = [] << src
      src_array += package_directory.dup << "view" << "mediators"
    end
    
    def package_name
      default_package_name.dup << ".view" << ".mediators"
    end

  end
end
