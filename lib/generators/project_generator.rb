
module Sprout
  class ProjectGenerator < Generator::Base
    
    ##
    # Send flag shallow to prevent subdirectories vo, dto from being created
    add_param :shallow, Boolean
    add_param :src, String, { :default => "src" }
    add_param :lib, String, { :default => "lib" }
    add_param :bin, String, { :default => "bin" }
    add_param :proxy, String, { :default => "proxy" }
    add_param :vo, String, { :default => "vo" }
    add_param :view, String, { :default => "view" }
    add_param :mediators, String, { :default => "mediators" }
    add_param :components, String, { :default => "components" }
    add_param :skins, String, { :default => "skins" }
    add_param :model, String, { :default => "model" }
    add_param :controller, String, { :default => "controller" }
    add_param :commands, String, { :default => "commands" }  
    add_param :service, String, { :default => "service" }
    add_param :dto, String, { :default => "dto" }
    add_param :notifications, String, { :default => "events" }

    def manifest
      directory input.snake_case do

        directory src do
          template "#{input.camel_case}Context.as", "RobotlegsContext.as"
          template "#{input.camel_case}.mxml", "RobotlegsMain.mxml"
          directory model do
            directory proxy 
            directory vo unless shallow
          end
          directory view do
            directory mediators
            directory components
            directory skins
          end
          directory controller do
            directory commands
          end
          directory service do
            directory dto unless shallow
          end
          directory notifications
        end

        directory lib
        directory bin
      end

    end

  end
end
