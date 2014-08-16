#!/usr/bin/gem build
# encoding: utf-8

$:.unshift File.dirname(__FILE__) + '/library'
require 'ffprobe/version'

Gem::Specification.new do |spec|
  # The project description.
  spec.name    = 'ffprobe'
  spec.version = FFProbe::Version
  spec.summary = %{No summary}
  spec.description = <<-eos
    No description
  eos

  # The project license.
  spec.license   'MIT'

  # The author(s) full name.
  spec.author  = 'Mikkel Kroman'

  # The author(s) e-mail address.
  spec.email   = 'mk@uplink.io'

  # The exported files.
  spec.files = Dir['library/**/*.rb', 'README.md', 'LICENSE', '.yardopts']

  # The library directory.
  spec.require_path = 'library'

  # The dependencies.
  spec.add_development_dependency 'guard', '~> 2.6'
  spec.add_development_dependency 'guard-rspec', '~> 4.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
end

# vim: set syntax=ruby
