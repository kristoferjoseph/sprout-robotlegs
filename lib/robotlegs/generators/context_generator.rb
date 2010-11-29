module Robotlegs
  class ContextGenerator < FlashSDK::ClassGenerator

    def manifest
      if(!input.match(/Test$/))
        directory context_directory do
          template "#{class_name}.as", 'RobotlegsContext.as'
        end
      end

      unless no_test
        generator :test_class, :input => "#{fully_qualified_class_name}Test"
      end
    end
    
    def context_directory
      [] << src << package_directory
    end
    
  end
end
