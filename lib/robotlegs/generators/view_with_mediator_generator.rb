module Robotlegs
  class ViewWithMediatorGenerator < FlashSDK::ClassGenerator
    include RobotlegsHelper
    
    add_param :mxml, Boolean, { :default => true }
    
    def manifest
      if(!input.match(/Test$/))
        directory mediator_directory do
          template "#{class_name}Mediator.as", 'RobotlegsViewMediator.as'
        end
        directory component_directory do
          if mxml
            template "#{class_name}.mxml", 'RobotlegsViewComponent.mxml'
          else 
            template "#{class_name}.as", 'RobotlegsView.as'
          end
        end
      end

      if test_class
        generator :view_with_mediator_testcase, :input => "#{fully_qualified_class_name}Test", :force => true
      end
    end
    
    def mediator_directory
      src_array = [] << src
      src_array += package_directory.dup << "view" << "mediators"
    end
    
    def component_directory
      src_array = [] << src
      src_array += package_directory.dup << "view" << "components"
    end
    
    def package_name
      default_package_name.dup << ".view" << ".mediators"
    end

  end
end
