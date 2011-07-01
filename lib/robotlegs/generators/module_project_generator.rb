module Robotlegs
  class ModuleProjectGenerator < FlashSDK::ProjectGenerator
    
    ## These params below are inherited from the AS3 ProjectGenerator and are available
    # add_param :src, String, { :default => "src"}
    # add_param :lib, String, { :default => "lib"}
    # add_param :bin, String, { :default => "bin"}
    # add_param :skins, String, { :default => "skins"}
    # add_param :test, String, { :default => "test"}    
    
    add_param :mxml, Boolean, { :default => true }
    add_param :shell, String, { :default => "shell" }
    add_param :modules, String, { :default => "modules" }
    add_param :api, String, { :default => "api" }
    add_param :restricted, String, { :default => "restricted" }
    add_param :controller, String, { :default => "controller" }
    add_param :views, String, { :default => "views" }
    add_param :components, String, { :default => "components" }
    add_param :mediators, String, { :default => "mediators" }

    def manifest
      directory project_name do

        template "rakefile.rb", "RobotlegsRakefile.rb"
        template "Gemfile", "RobotlegsGemfile.rb"
        
        directory lib
        directory bin
        
        directory src do
          if mxml
            template "#{project_name}.mxml", "RobotlegsModuleMain.mxml"
            template "#{test_runner_name}.mxml", "Flex4TestRunner.mxml"
          else
            template "#{project_name}.as", 'RobotlegsModuleMainAS3.as'
            template "#{test_runner_name}.as", 'ActionScript3RunnerClass.as'
          end
          
          directory package_directory do
            directory api
            directory restricted do
              directory modules 
              directory shell do
                directory api do
                  if mxml
                    template "#{project_name}Context.as", "RobotlegsModuleShellContext.as"
                  else 
                    template "#{project_name}Context.as", 'RobotlegsAS3ModuleShellContext.as'
                  end
                  directory views do 
                    directory components do
                      if mxml
                        template "#{project_name}View.mxml", 'RobotlegsViewComponent.mxml'
                      else 
                        template "#{project_name}View.as", 'RobotlegsView.as'
                      end
                    end
                  end
                end
                directory restricted do
                  directory views do
                    directory components
                    directory mediators do
                       template "#{project_name}ViewMediator.as", 'RobotlegsModuleViewMediator.as'
                    end
                  end
                end
              end
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
        default_package_name.dup << ".restricted" << ".shell" << ".api" << ".views" << ".components"
      end
      
      def mediator_package
        default_package_name.dup << ".restricted" << ".shell" << ".restricted" << ".views" << ".mediators"
      end
      
      def context_package_name
        default_package_name.dup << ".restricted" << ".shell" << ".api"
      end
      
      def view_class_name
         project_name.dup << "View"
      end
      
  end
end
