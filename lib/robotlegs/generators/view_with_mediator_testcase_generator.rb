module Robotlegs
  class ViewWithMediatorTestcaseGenerator < FlashSDK::ClassGenerator
    include RobotlegsHelper
    
    add_param :template_class_name, String, { :default => "RobotlegsViewMediatorTestcase" }
    add_param :class_test, String, { :default  => ''}
    
    def manifest
       directory mediator_directory do
          template "#{input}MediatorTest.as", 'RobotlegsViewMediatorTestcase.as'
        end
        directory component_directory do
            template "#{input}Test.as", 'RobotlegsViewTestcase.as'
        end
        # Comment out for tests for now
        generator :suite_class, :input => 'AllTests.as'
    end
    
    def mediator_directory
      src_array = [] << test
      src_array += package_directory.dup << "view" << "mediators"
    end
    
    def component_directory
      src_array = [] << test
      src_array += package_directory.dup << "view" << "components"
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
