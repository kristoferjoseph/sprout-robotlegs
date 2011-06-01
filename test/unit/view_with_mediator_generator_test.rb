require 'test_helper'

class ViewWithMediatorGeneratorTest < Test::Unit::TestCase
  include Sprout::TestHelper

  context "A new View With Mediator generator" do

    setup do
      @temp             = File.join(fixtures, 'generators', 'tmp')
      FileUtils.mkdir_p @temp
      @generator        = Robotlegs::ViewWithMediatorGenerator.new
      @generator.path   = @temp
      @generator.logger = StringIO.new
    end

    teardown do
      remove_file @temp
    end

    should "generate a Mediator" do
      @generator.input = "Sasafrass"
      @generator.package = "com.foo.bar"
      @generator.execute
      
      # Testing that these methods can be called more than once and not maniuplate the underlying variables
      assert_equal("com.foo.bar.view.mediators", @generator.package_name);
      assert_equal("com.foo.bar.view.mediators", @generator.package_name);
      
      input_dir = File.join(@temp, "src", "com", "foo", "bar", "view", "mediators")
      assert_directory input_dir
       
      input_file = File.join(input_dir, "SasafrassMediator.as")
      assert_file input_file do |content|
        assert_match /com.foo.bar.view.mediators/, content
        assert_match /SasafrassMediator/, content
      end
      
      # Testing that these methods can be called more than once and not maniuplate the underlying variables      
      assert_equal("com.foo.bar.view.mediators.SasafrassMediator", @generator.fully_qualified_class_name+'Mediator')
      assert_equal("com.foo.bar.view.mediators.SasafrassMediator", @generator.fully_qualified_class_name+'Mediator')
    end
    
    should "generate a View" do
      @generator.input = "Sasafrass"
      @generator.package = "com.foo.bar"
      @generator.execute

      input_dir = File.join(@temp, "src", "com", "foo", "bar", "view", "components")
      assert_directory input_dir
      view_file = File.join(input_dir, "Sasafrass.mxml")
      assert_file view_file
    end
    
    should "generate a Mediator Test" do
      @generator.input = "Sasafrass"
      @generator.package = "com.foo.bar"
      @generator.execute
      
      input_dir = File.join(@temp, "test", "com", "foo", "bar", "view", "mediators")
      assert_directory input_dir
      test_file = File.join(input_dir, "SasafrassMediatorTest.as")
      assert_file test_file
    end
    
    should "respect mxml as false" do
       @generator.input = "Sasafrass"
       @generator.package = "com.foo.bar"
       @generator.mxml = false
       @generator.execute

       input_dir = File.join(@temp, "src", "com", "foo", "bar", "view", "components")
       assert_directory input_dir
       view_file = File.join(input_dir, "Sasafrass.as")
       assert_file view_file
    end
    
  end
end
