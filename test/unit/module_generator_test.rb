require 'test_helper'

class ModuleGeneratorTest < Test::Unit::TestCase
  include Sprout::TestHelper

  context "A new Module generator" do

    setup do
      @temp             = File.join(fixtures, 'generators', 'tmp')
      FileUtils.mkdir_p @temp
      @generator        = Robotlegs::ModuleGenerator.new
      @generator.path   = @temp
      @generator.logger = StringIO.new
    end

    teardown do
      remove_file @temp
    end

    should "generate a Module" do
      @generator.input = "SasafrassModule"
      @generator.package = "com.foo.bar.restricted.modules.sasafrass"
      @generator.execute
      
      # Testing that these methods can be called more than once and not maniuplate the underlying variables
      assert_equal("com.foo.bar.restricted.modules.sasafrass.api", @generator.package_name);
      assert_equal("com.foo.bar.restricted.modules.sasafrass.api", @generator.package_name);
      
      input_dir = File.join(@temp, "src", "com", "foo", "bar", "restricted", "modules", "sasafrass", "api")
      assert_directory input_dir
       
      input_file = File.join(input_dir, "SasafrassModule.mxml")
      assert_file input_file
      
      # Testing that these methods can be called more than once and not maniuplate the underlying variables      
      assert_equal("com.foo.bar.restricted.modules.sasafrass.api.SasafrassModule", @generator.fully_qualified_class_name)
      assert_equal("com.foo.bar.restricted.modules.sasafrass.api.SasafrassModule", @generator.fully_qualified_class_name)
    end
    
    should "respect mxml as false and generate AS Module" do
       @generator.input = "SasafrassModule"
       @generator.package = "com.foo.bar.restricted.modules.sasafrass"
       @generator.mxml = false
       @generator.execute

       input_dir = File.join(@temp, "src", "com", "foo", "bar", "restricted", "modules", "sasafrass", "api")
       assert_directory input_dir

       input_file = File.join(input_dir, "SasafrassModule.as")
       assert_file input_file
    end
    
    should "generate a ModuleContext" do
      @generator.input = "SasafrassModule"
      @generator.package = "com.foo.bar.restricted.modules.sasafrass"
      @generator.execute
      
      input_dir = File.join(@temp, "src", "com", "foo", "bar", "restricted", "modules", "sasafrass", "restricted")
      assert_directory input_dir
       
      input_file = File.join(input_dir, "SasafrassModuleContext.as")
      assert_file input_file do |content|
        assert_match /contextView:DisplayObjectContainer/, content
      end
      
      # Testing that these methods can be called more than once and not maniuplate the underlying variables
      assert_equal("com.foo.bar.restricted.modules.sasafrass.restricted", @generator.restricted_package_name);
      assert_equal("com.foo.bar.restricted.modules.sasafrass.restricted", @generator.restricted_package_name);
    end
    
    should "respect mxml as false and generate AS ModuleContext" do
       @generator.input = "SasafrassModule"
       @generator.package = "com.foo.bar.restricted.modules.sasafrass"
       @generator.mxml = false
       @generator.execute

       input_dir = File.join(@temp, "src", "com", "foo", "bar", "restricted", "modules", "sasafrass", "restricted")
       assert_directory input_dir

       input_file = File.join(input_dir, "SasafrassModuleContext.as")
       assert_file input_file do |content|
         assert_match /contextView:ModuleContextView/, content
       end
    end
    
    should "generate a ModuleMediator" do
      @generator.input = "SasafrassModule"
      @generator.package = "com.foo.bar.restricted.modules.sasafrass"
      @generator.execute
      
      input_dir = File.join(@temp, "src", "com", "foo", "bar", "restricted", "modules", "sasafrass", "restricted")
      input_file = File.join(input_dir, "SasafrassModuleMediator.as")
      assert_file input_file
    end
    
  end
end
