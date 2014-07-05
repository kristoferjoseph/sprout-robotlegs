module Robotlegs
  class ModuleMediatorTestcaseGenerator < FlashSDK::ClassGenerator
    include RobotlegsHelper
    
    def manifest
       directory mediator_directory do
          template "#{class_name}MediatorTest.as", 'RobotlegsViewMediatorTestcase.as'
        end
    end
    
    def mediator_directory
      src_array = [] << test
      src_array += package_directory.dup << "restricted"
    end
    
    def package_name
      default_package_name.dup << ".restricted"
    end
    
    def component_package_name
      default_package_name.dup << ".view" << ".components"
    end
    
    def component_class_name
      class_name.chomp("Mediator");
    end

  end
end
