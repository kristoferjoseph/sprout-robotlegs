require 'test_helper'

class ContextGeneratorTest < Test::Unit::TestCase
  include SproutTestCase

  context "A new Context generator" do

    setup do
      @temp             = File.join(fixtures, 'generators', 'tmp')
      FileUtils.mkdir_p @temp
      @generator        = Robotlegs::ContextGenerator.new
      @generator.path   = @temp
      @generator.logger = StringIO.new
    end

    teardown do
      remove_file @temp
    end

    should "generate a new Context" do
      @generator.input = "BrainwashContext"
      @generator.package = "com.foo.bar"
      @generator.execute
      
      input_dir = File.join(@temp, "src", "com", "foo", "bar")
      assert_directory input_dir
      
      input_file = File.join(input_dir, "BrainwashContext.as")
      assert_file input_file do |content|
        assert_match /com.foo.bar/, content
        assert_match /BrainwashContext/, content
      end

    end

  end
end
