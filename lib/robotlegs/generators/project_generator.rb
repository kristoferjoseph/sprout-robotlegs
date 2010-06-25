module Robotlegs
  class ProjectGenerator < AS3::ProjectGenerator
    
    ## These params below are inherited from the AS3 ProjectGenerator and are available
    # add_param :src, String, { :default => "src"}
    # add_param :lib, String, { :default => "lib"}
    # add_param :bin, String, { :default => "bin"}
    # add_param :skins, String, { :default => "skins"}
    
    ##
    # Send flag shallow to prevent subdirectories vo, dto from being created
    add_param :shallow, Boolean
    add_param :package, String, { :default => ""}  
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
          template "#{project_name}Context.as", "RobotlegsContext.as"
          template "#{project_name}.mxml", "RobotlegsMain.mxml"

          directory package_directory do

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

      def project_name
        return input.camel_case
      end

      def package_directory
        split_parts package
      end

      def class_directory
        parts = input_in_parts
        if parts.size > 1
          parts.pop
          return File.join src, *parts
        end
        return src
      end

      def package_name
        parts = split_parts package
        return "#{parts.join('.')}"
      end

      def class_name
        parts = input_in_parts
        parts.pop.camel_case
      end
      
      def context_package
        if package_name != ""
          return package_name + ".*"
        end
        "*"
      end

      def input_in_parts
        split_parts input
      end

      def split_parts(value)
        provided_input = value
        if provided_input.include?('/')
          provided_input.gsub! /^#{src}\//, ''
          provided_input = provided_input.split('/').join('.')
        end

        provided_input.gsub!(/\.as$/, '')
        provided_input.gsub!(/\.mxml$/, '')
        provided_input.gsub!(/\.xml$/, '')

        provided_input.split('.')
      end

  end
end
