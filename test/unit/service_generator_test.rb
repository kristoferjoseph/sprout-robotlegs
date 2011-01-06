require 'test_helper'

class ServiceGeneratorTest < Test::Unit::TestCase
  include Sprout::TestHelper

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
      @generator.input = "NoodleService"
      @generator.package = "com.foo.bar"
      @generator.execute
      
      # Testing that these methods can be called more than once and not maniuplate the underlying variables
      assert_equal("com.foo.bar.service", @generator.package_name);
      assert_equal("com.foo.bar.service", @generator.package_name);
      
      input_dir = File.join(@temp, "src", "com", "foo", "bar", "service")
      assert_directory input_dir
      
      input_file = File.join(input_dir, "NoodleService.as")
      assert_file input_file do |content|
        assert_match /com.foo.bar.service/, content
        assert_match /NoodleService/, content
      end
      
      # Testing that these methods can be called more than once and not maniuplate the underlying variables      
      assert_equal("com.foo.bar.service.NoodleService", @generator.fully_qualified_class_name)
      assert_equal("com.foo.bar.service.NoodleService", @generator.fully_qualified_class_name)

    end

  end
end
