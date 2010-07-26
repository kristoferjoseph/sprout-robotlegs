module Robotlegs

  class RobotlegsClassGeneratorBase < Sprout::Generator::Base
    ##
    # The path where source files should be created.
    add_param :src, String, { :default => 'src' }
    add_param :test, String, { :default => 'test' }    
    ##
    # Do not create a test case for this class.
    add_param :no_test, Boolean
    
    def fully_qualified_class_name
      input
    end
    
    def create_test_case
      unless no_test
        generator :test_class, :input => "#{fully_qualified_class_name}Test"
      end
    end
    
  end  

end