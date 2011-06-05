require 'test_helper'

class ProjectGeneratorTest < Test::Unit::TestCase
  include Sprout::TestHelper

  context "A new Project generator" do

    setup do
      @temp             = File.join(fixtures, 'generators', 'tmp')
      FileUtils.mkdir_p @temp
      @generator        = Robotlegs::ModuleProjectGenerator.new
      @generator.path   = @temp
      @generator.logger = StringIO.new
    end

    teardown do
      remove_file @temp
    end

    should "generate a new Module Project" do
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

    end

    should "respect mxml false" do
      @generator.input = "Fwi"
      @generator.mxml = false
      @generator.execute

    end

    should "add package directories" do
      @generator.input = "Fwo"
      @generator.package = "com.foo.bar"
      @generator.execute

      input_dir = File.join(@temp, "Fwo")
      assert_directory input_dir

      src_dir = File.join(input_dir, "src")
      assert_directory src_dir

      package_dir = File.join(src_dir, "com", "foo", "bar")
      assert_directory package_dir
      
      context_file = File.join(package_dir, "FwoContext.as")
      assert_file context_file

      main_file = File.join(src_dir, "Fwo.mxml")
      assert_file main_file do |content|
        assert_match /FwoCompleteHandler/, content
        assert_match /com.foo.bar.*/, content
      end
      
      api_dir = File.join(pckg_dir, "api")
      assert_directory api_dir
      
      restricted_dir = File.join(pckg_dir, "restricted")
      assert_directory restricted_dir
      
      modules_dir = File.join(pckg_dir, "restricted", "modules")
      assert_directory modules_dir
      
      shell_dir = File.join(pckg_dir, "restricted", "shell")
      assert_directory shell_dir
      
      shell_api_dir = File.join(pckg_dir, "restricted", "shell", "api")
      assert_directory shell_api_dir
      
      shell_restricted_dir = File.join(pckg_dir, "restricted", "shell", "restricted")
      assert_directory shell_restricted_dir

      views_dir = File.join(shell_restricted_dir, "views")
      assert_directory views_dir
      
      views_components_dir = File.join(shell_restricted_dir, "views", "components")
      assert_directory views_components_dir

      controller_dir = File.join(shell_restricted_dir, "controller")
      assert_directory controller_dir

      services_dir = File.join(shell_restricted_dir, "services")
      assert_directory services_dir
      
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
