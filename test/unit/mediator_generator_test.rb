require 'test_helper'

class MediatorGeneratorTest < Test::Unit::TestCase
  include SproutTestCase

  context "A new Mediator generator" do

    setup do
      @temp             = File.join(fixtures, 'generators', 'tmp')
      FileUtils.mkdir_p @temp
      @generator        = Robotlegs::MediatorGenerator.new
      @generator.path   = @temp
      @generator.logger = StringIO.new
    end

    teardown do
      remove_file @temp
    end

    should "generate a new Mediator" do
      @generator.input = "SasafrassMediator"
      @generator.package = "com.foo.bar"
      @generator.execute
      
      input_dir = File.join(@temp, "src", "com", "foo", "bar", "view", "mediators")
      assert_directory input_dir
      
      input_file = File.join(input_dir, "SasafrassMediator.as")
      assert_file input_file do |content|
        assert_match /com.foo.bar.view.mediators/, content
        assert_match /SasafrassMediator/, content
      end

    end

  end
end
