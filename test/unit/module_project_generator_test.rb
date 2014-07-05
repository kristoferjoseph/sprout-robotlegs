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

    should "generate a new rake file" do
      @generator.input = "Fwee"
      @generator.execute
      
      input_dir = File.join(@temp, "Fwee")
      assert_directory input_dir
      
      rakefile = File.join(input_dir, "rakefile.rb")
      assert_file rakefile
      assert_file rakefile do |content|
        assert_match /src\/Fwee.mxml/, content
      end
    end
      
    should "generate a new gem file" do
      @generator.input = "Fwee"
      @generator.execute

      input_dir = File.join(@temp, "Fwee")
      
      gemfile = File.join(input_dir, "Gemfile")
      assert_file gemfile
    end
        
    should "generate a src directory" do
      @generator.input = "Fwee"
      @generator.execute

      input_dir = File.join(@temp, "Fwee")

      src_dir = File.join(input_dir, "src")
      assert_directory src_dir
    end
    
    should "generate a lib directory" do
      @generator.input = "Fwee"
      @generator.execute

      input_dir = File.join(@temp, "Fwee")
      

      lib_dir = File.join(input_dir, "lib")
      assert_directory lib_dir
    end
    
    should "generate a bin directory" do
      @generator.input = "Fwee"
      @generator.execute

      input_dir = File.join(@temp, "Fwee")
      
      bin_dir = File.join(input_dir, "bin")
      assert_directory bin_dir
    end
    
    should "generate a project api directory" do
      @generator.input = "Fwee"
      @generator.execute

      input_dir = File.join(@temp, "Fwee", "src")
      
      api_dir = File.join(input_dir, "api")
      assert_directory api_dir
    end
    
    should "generate a project restricted directory" do
      @generator.input = "Fwee"
      @generator.execute

      input_dir = File.join(@temp, "Fwee", "src")
      
      restricted_dir = File.join(input_dir, "restricted")
      assert_directory restricted_dir
    end
    
    should "generate a shell directory" do
      @generator.input = "Fwee"
      @generator.package = "com.foo"
      @generator.execute

      input_dir = File.join(@temp, "Fwee", "src", "com", "foo", "restricted")
      
      shell_dir = File.join(input_dir, "shell")
      assert_directory shell_dir
    end
    
    should "generate a modules directory" do
      @generator.input = "Fwee"
      @generator.execute

      input_dir = File.join(@temp, "Fwee", "src", "restricted")
      
      modules_dir = File.join(input_dir, "modules")
      assert_directory modules_dir
    end
    
    should "generate a shell api directory" do
      @generator.input = "Fwee"
      @generator.package = "com.foo"
      @generator.execute

      input_dir = File.join(@temp, "Fwee", "src", "com", "foo", "restricted", "shell")
      
      api_dir = File.join(input_dir, "api")
      assert_directory api_dir
    end
    
    should "generate a new shell Context" do
      @generator.input = "Fwee"
      @generator.execute
      
      input_dir = File.join(@temp, "Fwee", "src", "restricted", "shell", "api")
      
      input_file = File.join(input_dir, "FweeContext.as")
      assert_file input_file do |content|
        assert_match /FweeContext/, content
      end
    end
    
    should "generate a shell restricted directory" do
      @generator.input = "Fwee"
      @generator.execute

      input_dir = File.join(@temp, "Fwee", "src", "restricted", "shell")
      
      restricted_dir = File.join(input_dir, "restricted")
      assert_directory restricted_dir
    end
    
    should "generate a shell views directory" do
      @generator.input = "Fwee"
      @generator.execute

      input_dir = File.join(@temp, "Fwee", "src", "restricted", "shell", "restricted")

      views_dir = File.join(input_dir, "views")
      assert_directory views_dir
   end
   
   should "generate a shell mediators directory" do
     @generator.input = "Fwee"
     @generator.execute

     input_dir = File.join(@temp, "Fwee", "src", "restricted", "shell", "restricted", "views")

     mediators_dir = File.join(input_dir, "mediators")
     assert_directory mediators_dir
   end
   
   should "generate a shell view file" do
      @generator.input = "Fwee"
      @generator.execute

      input_dir = File.join(@temp, "Fwee", "src", "restricted", "shell", "api", "views", "components")

      view_file = File.join(input_dir, "FweeView.mxml")
      assert_file view_file
    end
    
   should "generate a shell view mediator file" do
     @generator.input = "Fwee"
     @generator.execute

     input_dir = File.join(@temp, "Fwee", "src", "restricted", "shell", "restricted", "views", "mediators")
    
     mediator_file = File.join(input_dir, "FweeViewMediator.as")
     assert_file mediator_file 
   end
   
   should "generate a main application file" do
      @generator.input = "Fwee"
      @generator.execute

      input_dir = File.join(@temp, "Fwee", "src")

      application_file = File.join(input_dir, "Fwee.mxml")
      assert_file application_file do |content|
           assert_match /FweeView/, content
           assert_match /fweeView/, content
      end
    end
    
     should "respect mxml as false for main application" do
         @generator.input = "Fwee"
         @generator.mxml = false
         @generator.execute

         input_dir = File.join(@temp, "Fwee", "src")
         view_file = File.join(input_dir, "Fwee.as")
         assert_file view_file
      end
      
      should "respect mxml as false for main view" do
           @generator.input = "Fwee"
           @generator.mxml = false
           @generator.execute

           input_dir = File.join(@temp, "Fwee", "src", "restricted", "shell", "api", "views", "components")
           view_file = File.join(input_dir, "FweeView.as")
           assert_file view_file
      end
      
      should "respect mxml as false for shell Context" do
        @generator.input = "Fwee"
        @generator.mxml = false
        @generator.execute

        input_dir = File.join(@temp, "Fwee", "src", "restricted", "shell", "api")

        input_file = File.join(input_dir, "FweeContext.as")
        assert_file input_file do |content|
          assert_match /contextView:ModuleContextView/, content
        end
      end
      
  end
end
