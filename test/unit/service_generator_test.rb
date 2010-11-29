require 'test_helper'

require 'robotlegs/generators/service_generator'

class ServiceGeneratorTest < Test::Unit::TestCase
  include SproutTestCase

  context "A new Service generator" do

    setup do
      @temp             = File.join(fixtures, 'generators', 'tmp')
      FileUtils.mkdir_p @temp
      @generator        = Robotlegs::ServiceGenerator.new
      @generator.path   = @temp
      @generator.logger = StringIO.new
    end

    teardown do
      remove_file @temp
    end

    should "generate a new Service" do
      @generator.input = "Noodle"
      @generator.package = "com.foo.bar"
      @generator.execute
      
      input_dir = File.join(@temp, "com", "foo", "bar", "service")
      assert_directory input_dir
      
      input_file = File.join(input_dir, "NoodleService.as")
      assert_file input_file do |content|
        assert_match /com.foo.bar.service/, content
        assert_match /Noodle/, content
      end

    end

  end
end
