module Robotlegs
  class ServiceGenerator < RobotlegsClassGeneratorBase

    ##
    # This is how you add a parameter to your generator
    # add_param :fwee, String, { :default => "fwee" }
    add_param :package, String, { :default => "com.foo" }

    def manifest
      directory input.snake_case do
        template "#{input.camel_case}Service.as", "RobotlegsService.as"
      end

    end

    def package_name
      package
    end

    def class_name
      ""
    end
    
  end
end
