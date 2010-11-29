module Robotlegs
  class MediatorGenerator < FlashSDK::ClassGenerator

    def manifest
      if(!input.match(/Test$/))
        directory mediator_directory do
          template "#{class_name}.as", 'RobotlegsMediator.as'
        end
      end

      unless no_test
        generator :test_class, :input => "#{fully_qualified_class_name}Test"
      end
    end
    
    def mediator_directory
      [] << src << package_directory << "view" << "mediators"
    end
    
    def mediator_package
      default_package_name << ".view" << ".mediators"
    end

  end
end
