require File.join(File.dirname(__FILE__), "test_helper")

require 'generators/project_generator'

class ProjectGeneratorTest < Test::Unit::TestCase
  include SproutTestCase

  context "A new Project generator" do

    setup do
      @temp             = File.join(fixtures, 'generators', 'tmp')
      FileUtils.mkdir_p @temp
      @generator        = Sprout::ProjectGenerator.new
      @generator.path   = @temp
      @generator.logger = StringIO.new
    end

    teardown do
      remove_file @temp
    end

    should "generate a new Project" do
      @generator.input = "Fwee"
      @generator.execute

      input_dir = File.join(@temp, "fwee")
      assert_directory input_dir
      
      src_dir = File.join(input_dir, "src")
      assert_directory src_dir
      
      context_file = File.join(src_dir, "FweeContext.as")
      assert_file context_file
      
      main_file = File.join(src_dir, "Fwee.mxml")
      assert_file main_file do |content|
        assert_match /FweeCompleteHandler/, content
      end
      
      lib_dir = File.join(input_dir, "lib")
      assert_directory lib_dir
      
      bin_dir = File.join(input_dir, "bin")
      assert_directory bin_dir
      
      model_dir = File.join(src_dir, "model")
      assert_directory model_dir
      
      view_dir = File.join(src_dir, "view")
      assert_directory view_dir
      
      controller_dir = File.join(src_dir, "controller")
      assert_directory controller_dir
      
      service_dir = File.join(src_dir, "service")
      assert_directory service_dir
      
      notifications_dir = File.join(src_dir, "events")
      assert_directory notifications_dir
      
      #Second level directories
      
      proxy_dir = File.join(model_dir, "proxy")
      assert_directory proxy_dir
      
      vo_dir = File.join(model_dir, "vo")
      assert_directory vo_dir
      
      mediators_dir = File.join(view_dir, "mediators")
      assert_directory mediators_dir
      
      components_dir = File.join(view_dir, "components")
      assert_directory components_dir
      
      skins_dir = File.join(view_dir, "skins")
      assert_directory skins_dir
      
      commands_dir = File.join(controller_dir, "commands")
      assert_directory commands_dir
      
      dto_dir = File.join(service_dir, "dto")
      assert_directory dto_dir
      
    end
    
    should "respect shallow" do
      @generator.input = "Fwee"
      @generator.shallow = true
      @generator.execute
      
      input_dir = File.join(@temp, "fwee")
      assert_directory input_dir
      
      vo_dir = File.join(input_dir, "src", "model", "vo")
      assert !File.exists?(vo_dir)
      
      dto_dir = File.join(input_dir, "src", "service", "dto")
      assert !File.exists?(dto_dir)
      
    end

  end
end
