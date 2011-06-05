module Robotlegs
  class ViewWithMediatorTestcaseGenerator < FlashSDK::ClassGenerator
    include RobotlegsHelper
    
    def manifest
       directory mediator_directory do
          template "#{class_name}Test.as", 'RobotlegsViewMediatorTestcase.as'
        end
        generator :suite_class, {:input => 'AllTests.as'}
    end
    
    def mediator_directory
      src_array = [] << test
      src_array += package_directory.dup << "view" << "mediators"
    end
    
    def package_name
      default_package_name.dup << ".view" << ".mediators"
    end
    
    def component_package_name
      default_package_name.dup << ".view" << ".components"
    end
    
    def component_class_name
      class_name.chomp("Mediator");
    end

  end
end
