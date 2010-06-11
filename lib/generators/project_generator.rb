
module Sprout
  class ProjectGenerator < Generator::Base

    add_param :src, String, { :default => "src" }
    add_param :lib, String, { :default => "lib" }
    add_param :bin, String, { :default => "bin" }
    add_param :model, String, { :default => "model" }
    add_param :view, String, { :default => "view" }
    add_param :controller, String, { :default => "controller" }
    add_param :service, String, { :default => "service" }

    def manifest
      directory input.snake_case do

        directory src do

        end

        directory lib do

        end

        directory bin do

        end

      end

    end

  end
end
