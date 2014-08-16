# encoding: utf-8

require 'multi_json'

require 'ffprobe/version'
require 'ffprobe/container'

module FFProbe
  # Return the path to the `ffprobe` executable. The method will try to deduct
  # the path from the environment variable `PATH` if not explicitly specified
  # with `path=`.
  #
  # @return [String] the absolute path to `ffprobe`.
  def self.path
    unless class_variable_defined? :@@path
      @@path = ENV['PATH'].split(File::PATH_SEPARATOR).find do |path|
        File.executable? File.join path, 'ffprobe'
      end
    else
      @@path
    end
  end

  # Set the absolute path to the `ffprobe` executable. This is the executable
  # that will be run by FFProbe.
  #
  # @param path [String] the absolute path.
  def self.path= path
    @@path = path
  end

  # Probe the given +file+ and return a container.
  #
  # @returns [Container] the container instance.
  def self.probe file
    unless File.readable? file
      raise "The file `#{file}' could not be read."
    end

    Container.new(file).tap do |container|
      container.parse!
    end
  end
end
