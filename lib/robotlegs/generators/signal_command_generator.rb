module  Robotlegs
  class SignalCommandGenerator < FlashSDK::ClassGenerator
    include RobotlegsHelper
    
    def manifest
      if(!input.match(/Test$/))
        directory command_directory do
          template "#{class_name}.as", 'RobotlegsSignalCommand.as'
        end
      end

      if test_class
        generator :test_class, :input => "#{fully_qualified_class_name}Test", :force => true
      end
    end
    
    def command_directory
      src_array = [] << src
      src_array += package_directory.dup << "controller" << "commands"
    end
    
    def package_name
      default_package_name.dup << ".controller" << ".commands"
    end
        
  end
end


