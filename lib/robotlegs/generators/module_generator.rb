module Robotlegs
  class ModuleGenerator < FlashSDK::ClassGenerator
    include RobotlegsHelper
    
    add_param :mxml, Boolean, { :default => true }
    
    def manifest
      if(!input.match(/Test$/))
        directory api_directory do
          if mxml
            template "#{class_name}.mxml", 'RobotlegsModule.mxml'
          else 
            template "#{class_name}.as", 'RobotlegsModule.as'
          end
        end
         directory restricted_directory do
          template "#{class_name}Mediator.as", 'RobotlegsModuleMediator.as'
            if mxml
              template "#{class_name}Context.as", 'RobotlegsModuleContext.as'
            else 
              template "#{class_name}Context.as", 'RobotlegsAS3ModuleContext.as'
            end
          end
      end

      if test_class
        generator :test_class, :input => "#{fully_qualified_class_name}Test", :force => true
        generator :module_mediator_testcase, :input => "#{fully_qualified_class_name}Test", :force => true
      end
    end
    
    def api_directory
      src_array = [] << src
      src_array += package_directory.dup << "api"
    end
    
    def restricted_directory
      src_array = [] << src
      src_array += package_directory.dup << "restricted"
    end
    
    def package_name
      default_package_name.dup << ".api"
    end
    
    def restricted_package_name
        default_package_name.dup << ".restricted"
    end

  end
end
