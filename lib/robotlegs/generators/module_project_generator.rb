module Robotlegs
  class ModuleProjectGenerator < FlashSDK::ProjectGenerator
    
    ## These params below are inherited from the AS3 ProjectGenerator and are available
    # add_param :src, String, { :default => "src"}
    # add_param :lib, String, { :default => "lib"}
    # add_param :bin, String, { :default => "bin"}
    # add_param :skins, String, { :default => "skins"}
    # add_param :test, String, { :default => "test"}    
    
    ##
    # Send flag shallow to prevent subdirectories vo, dto from being created
    add_param :mxml, Boolean, { :default => true }
    add_param :shell, String, { :default => "shell" }
    add_param :modules, String, { :default => "modules" }
    add_param :api, String, { :default => "api" }
    add_param :restricted, String, { :default => "restricted" }
    add_param :model, String, { :default => "model" }
    add_param :controller, String, { :default => "controller" }
    add_param :services, String, { :default => "services" }
    add_param :views, String, { :default => "views" }
    add_param :components, String, { :default => "components" }

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
            directory api
            directory restricted do 
              directory modules
              directory shell
            end
          end
          
          directory shell do
            directory api
            directory restricted do
              template "#{project_name}Context.as", "RobotlegsModuleContext.as"
              template "#{class_name}Mediator.as", 'RobotlegsViewMediator.as'
              if mxml
                template "#{class_name}.mxml", 'RobotlegsViewComponent.mxml'
              else 
                template "#{class_name}.as", 'RobotlegsView.as'
              end 
              directory views do
                template "#{class_name}ViewMediator.as", 'RobotlegsViewMediator.as'
                directory components do
                  if mxml
                    template "#{class_name}View.mxml", 'RobotlegsViewComponent.mxml'
                  else 
                    template "#{class_name}View.as", 'RobotlegsView.as'
                  end  
                end
              end
              directory controller
              directory model
              directory services       
            end
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
      
    protected

      def view_package
        default_package_name.dup << ".restricted" << ".shell" << ".restricted" << ".views" << ".components"
      end
      
  end
end
