module Robotlegs
  class MediatorGenerator < RobotlegsClassGeneratorBase

    def manifest
      directory input.snake_case do
        template input.camel_case
      end

    end

  end
end
