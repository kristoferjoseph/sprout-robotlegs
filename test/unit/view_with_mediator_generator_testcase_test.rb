require 'test_helper'

class ViewWithMediatorTestcaseGeneratorTest < Test::Unit::TestCase
  include Sprout::TestHelper

  context "A new View With Mediator Testcase generator" do

    setup do
      @temp             = File.join(fixtures, 'generators', 'tmp')
      FileUtils.mkdir_p @temp
      @generator        = Robotlegs::ViewWithMediatorTestcaseGenerator.new
      @generator.path   = @temp
      @generator.logger = StringIO.new
    end

    teardown do
      remove_file @temp
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
    
     should "generate a View Test" do
        @generator.input = "Sasafrass"
        @generator.package = "com.foo.bar"
        @generator.execute

        input_dir = File.join(@temp, "test", "com", "foo", "bar", "view", "components")
        assert_directory input_dir
        test_file = File.join(input_dir, "SasafrassTest.as")
        assert_file test_file
      end
    
  end
end
