module Robotlegs
  class ProjectGenerator < FlashSDK::ProjectGenerator
    
    ## These params below are inherited from the AS3 ProjectGenerator and are available
    # add_param :src, String, { :default => "src"}
    # add_param :lib, String, { :default => "lib"}
    # add_param :bin, String, { :default => "bin"}
    # add_param :skins, String, { :default => "skins"}
    # add_param :test, String, { :default => "test"}    
    
    ##
    # Send flag shallow to prevent subdirectories vo, dto from being created
    add_param :shallow, Boolean
    add_param :proxy, String, { :default => "proxy" }
    add_param :vo, String, { :default => "vo" }
    add_param :view, String, { :default => "view" }
    add_param :mediators, String, { :default => "mediators" }
    add_param :components, String, { :default => "components" }
    add_param :model, String, { :default => "model" }
    add_param :controller, String, { :default => "controller" }
    add_param :commands, String, { :default => "commands" }
    add_param :service, String, { :default => "service" }
    add_param :dto, String, { :default => "dto" }
    add_param :notifications, String, { :default => "events" }

    def manifest
      directory project_name do

        template "rakefile.rb", "RobotlegsRakefile.rb"
        template "Gemfile", "RobotlegsGemfile.rb"
        
        directory lib
        directory bin

        directory src do
          template "#{project_name}.mxml", "RobotlegsMain.mxml"
          template "#{test_runner_name}.mxml", "Flex4TestRunner.mxml"

          directory package_directory do
          template "#{project_name}Context.as", "RobotlegsContext.as"            
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
        end
      end

    end

    protected

      def context_package
        if default_package_name != ""
          return default_package_name + ".*"
        end
        "*"
      end
      
  end
end
