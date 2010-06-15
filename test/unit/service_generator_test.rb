require File.join(File.dirname(__FILE__), "test_helper")

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
      @generator.input = "Service"
      @generator.execute
      # 
      # input_dir = File.join(@temp, "service")
      # assert_directory input_dir
      # 
      # input_file = File.join(input_dir, "RobotlegsService.as")
      # assert_file input_file do |content|
      #   assert_matches /Your content to assert here/, content
      # end

    end

  end
end
