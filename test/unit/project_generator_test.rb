require 'test_helper'

class ProjectGeneratorTest < Test::Unit::TestCase
  include Sprout::TestHelper

  context "A new Project generator" do

    setup do
      @temp             = File.join(fixtures, 'generators', 'tmp')
      FileUtils.mkdir_p @temp
      @generator        = Robotlegs::ProjectGenerator.new
      @generator.path   = @temp
      @generator.logger = StringIO.new
    end

    teardown do
      remove_file @temp
    end

    should "generate a new Project" do
      @generator.input = "Fwee"
      @generator.execute

      input_dir = File.join(@temp, "Fwee")
      assert_directory input_dir
      
      rakefile = File.join(input_dir, "rakefile.rb")
      assert_file rakefile
      assert_file rakefile do |content|
        assert_match /src\/Fwee.mxml/, content
      end
      
      gemfile = File.join(input_dir, "Gemfile")
      assert_file gemfile

      src_dir = File.join(input_dir, "src")
      assert_directory src_dir

      context_file = File.join(src_dir, "FweeContext.as")
      assert_file context_file
      
      main_file = File.join(src_dir, "Fwee.mxml")
      assert_file main_file do |content|
        assert_match /FweeCompleteHandler/, content
        assert_match /xmlns:context="*"/, content
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
      @generator.input = "Fwi"
      @generator.shallow = true
      @generator.execute

      input_dir = File.join(@temp, "Fwi")
      assert_directory input_dir

      vo_dir = File.join(input_dir, "src", "model", "vo")
      assert !File.exists?(vo_dir)

      dto_dir = File.join(input_dir, "src", "service", "dto")
      assert !File.exists?(dto_dir)

    end

    should "add package directories" do
      @generator.input = "Fwo"
      @generator.package = "com/developsigner"
      @generator.execute

      input_dir = File.join(@temp, "Fwo")
      assert_directory input_dir

      src_dir = File.join(input_dir, "src")
      assert_directory src_dir

      package_dir = File.join(src_dir, "com", "developsigner")
      assert_directory package_dir
      
      context_file = File.join(package_dir, "FwoContext.as")
      assert_file context_file

      main_file = File.join(src_dir, "Fwo.mxml")
      assert_file main_file do |content|
        assert_match /FwoCompleteHandler/, content
        assert_match /com.developsigner.*/, content
      end
    end

    should  "respect notifications override" do
      @generator.input = "Fwum"
      @generator.notifications = "signals"
      @generator.execute
      
      src_dir = File.join(@temp, "Fwum", "src")
      assert_directory src_dir
      
      notifications_dir = File.join(src_dir, "signals")
      assert_directory notifications_dir
      
    end

  end
end
