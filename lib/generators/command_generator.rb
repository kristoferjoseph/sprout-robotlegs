
class CommandGenerator < Sprout::Generator::Base

  ##
  # The path where source files should be created.
  add_param :src, String, { :default => 'src' }

  def manifest
    directory input.snake_case do
      template "#{input.camel_case}.as", 'RobotlegsCommand.as'
    end

  end

  def class_directory
    parts = input_in_parts
    if parts.size > 1
      parts.pop
      return File.join src, *parts
    end
    return src
  end

  def package_name
    parts = input_in_parts
    if parts.size > 1
      parts.pop
      return "#{parts.join('.')} "
    end
    return ""
  end

  def class_name
    parts = input_in_parts
    parts.pop.camel_case
  end

  def input_in_parts
    provided_input = input
    if provided_input.include?('/')
      provided_input.gsub! /^#{src}\//, ''
      provided_input = provided_input.split('/').join('.')
    end

    provided_input.gsub!(/\.as$/, '')
    provided_input.gsub!(/\.mxml$/, '')
    provided_input.gsub!(/\.xml$/, '')

    provided_input.split('.')
  end

end
