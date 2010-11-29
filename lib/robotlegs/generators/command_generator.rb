module  Robotlegs
  class CommandGenerator < FlashSDK::ClassGenerator

    def manifest
      if(!input.match(/Test$/))
        directory command_directory do
          template "#{class_name}.as", 'RobotlegsCommand.as'
        end
      end

      unless no_test
        generator :test_class, :input => "#{fully_qualified_class_name}Test"
      end
    end
    
    def command_directory
      package_directory << "controller" << "commands"
    end
    
    def command_package
      default_package_name << ".controller" << ".commands"
    end
    
  end
end

