require 'test_helper'

class ProxyGeneratorTest < Test::Unit::TestCase
  include Sprout::TestHelper

  context "A new Proxy generator" do

    setup do
      @temp             = File.join(fixtures, 'generators', 'tmp')
      FileUtils.mkdir_p @temp
      @generator        = Robotlegs::ProxyGenerator.new
      @generator.path   = @temp
      @generator.logger = StringIO.new
    end

    teardown do
      remove_file @temp
    end

    should "generate a new Proxy" do
      @generator.input = "UserProxy"
      @generator.package = "com.foo.bar"
      @generator.execute
      
      # Testing that these methods can be called more than once and not maniuplate the underlying variables
      assert_equal("com.foo.bar.model.proxy", @generator.package_name);
      assert_equal("com.foo.bar.model.proxy", @generator.package_name);
            
      input_dir = File.join(@temp, "src", "com", "foo", "bar", "model", "proxy")
      assert_directory input_dir
      
      input_file = File.join(input_dir, "UserProxy.as")
      assert_file input_file do |content|
        assert_match /com.foo.bar.model.proxy/, content
        assert_match /UserProxy/, content
      end
      
      # Testing that these methods can be called more than once and not maniuplate the underlying variables
      assert_equal("com.foo.bar.model.proxy.UserProxy", @generator.fully_qualified_class_name)
      assert_equal("com.foo.bar.model.proxy.UserProxy", @generator.fully_qualified_class_name)      
      
    end

  end
end
