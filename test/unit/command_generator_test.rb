require 'test_helper'

class CommandGeneratorTest < Test::Unit::TestCase
  include Sprout::TestHelper

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
      
      # Testing that these methods can be called more than once and not maniuplate the underlying variables
      assert_equal("com.foo.bar.controller.commands", @generator.package_name);
      assert_equal("com.foo.bar.controller.commands", @generator.package_name);
      
      # Testing that these methods can be called more than once and not maniuplate the underlying variables
      assert_equal(["src", "com", "foo", "bar", "controller", "commands"], @generator.command_directory);
      assert_equal(["src", "com", "foo", "bar", "controller", "commands"], @generator.command_directory);
            
      input_dir = File.join(@temp, "src", "com", "foo", "bar", "controller", "commands")
      assert_directory input_dir
      
      input_file = File.join(input_dir, "PoodleCommand.as")
      assert_file input_file do |content|
        assert_match /com.foo.bar.controller.commands/, content
        assert_match /PoodleCommand/, content
      end
      
      # Testing that these methods can be called more than once and not maniuplate the underlying variables      
      assert_equal("com.foo.bar.controller.commands.PoodleCommand", @generator.fully_qualified_class_name)
      assert_equal("com.foo.bar.controller.commands.PoodleCommand", @generator.fully_qualified_class_name)
    end

  end
end
