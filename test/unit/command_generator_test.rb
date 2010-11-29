require 'test_helper'

class CommandGeneratorTest < Test::Unit::TestCase
  include SproutTestCase

  context "A new Command generator" do

    setup do
      @temp             = File.join(fixtures, 'generators', 'tmp')
      FileUtils.mkdir_p @temp
      @generator        = Robotlegs::CommandGenerator.new
      @generator.path   = @temp
      @generator.logger = StringIO.new
    end

    teardown do
      remove_file @temp
    end

    should "generate a new Command" do
      @generator.input = "PoodleCommand"
      @generator.package = "com.foo.bar"
      @generator.execute
      
      input_dir = File.join(@temp, "com", "foo", "bar", "controller", "commands")
      assert_directory input_dir
      
      input_file = File.join(input_dir, "PoodleCommand.as")
      assert_file input_file do |content|
        assert_match /com.foo.bar.controller.command/, content
        assert_match /PoodleCommand/, content
      end

    end

  end
end
