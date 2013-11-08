#!/usr/bin/env ruby
#
# Author:: Andrew Pennebaker
#
# Copyright:: Copyright 2012 Andrew Pennebaker
#
# == Synopsis
#
# specs - Get system specs easily
#
# == Usage
#
# specs [aspects]
#
# Example:
#
# specs ruby os hardware
#
# By default, aspects are os and hardware.
#
# If an aspect is not installed, its output may be omitted.
#
# --help, -h:
#    show usage info for specs
#
# --version, -v:
#    print specs' own version

require 'getoptlong'
require 'pathname'
require 'contracts'
include Contracts

require 'version'
SPECS_VERSION_STRING = "specs #{Specs::VERSION}"

SPECS_HOME_PAGE = 'https://github.com/mcandre/specs#readme'

SPECS_DIR = Pathname.new(File.dirname(__FILE__))

# Get the basic operating system name reliably, even in JRuby
# Useful for OS-contextual command line instructions.
#
# E.g., 'C:\Program Files (x86)\Mozilla Firefox\firefox --version' in Windows vs
#       '/Applications/Firefox.app/Contents/MacOS/firefox --version' in Mac vs
#       'firefox --version' in Unix
#
module Os
  Contract nil => String
  def self.raw
    # Config deprecated in Ruby 1.9
    RbConfig::CONFIG['host_os']
  end

  # A series of OS descriptions.
  # Not all of these are mutually exclusive.

  Contract nil => Bool
  def self.windows?
    raw =~ /cygwin|mswin|mingw|bccwin|wince|emx/
  end

  Contract nil => Bool
  def self.mingw?
    raw =~ /cygwin|mingw/
  end

  Contract nil => Bool
  def self.mac?
    raw =~ /darwin/
  end

  Contract nil => Bool
  def self.unix?
    !self.windows?
  end

  Contract nil => Bool
  def self.haiku?
    raw =~ /haiku/
  end

  Contract nil => Bool
  def self.linux?
    self.unix? && !(self.mac? || self.haiku?)
  end

  Contract nil => Bool
  def self.x86_64?
    RbConfig::CONFIG['arch'] =~ /64/
  end

  Contract nil => Bool
  def self.x86?
    !self.x86_64?
  end

  Contract nil => Symbol
  def self.os_name
    if self.windows?
      :windows
    elsif self.mac?
      :mac
    elsif self.linux?
      :linux
    elsif self.haiku?
      :haiku
    else
      :unix
    end
  end
end

#
# Recipe
#
module Recipe
  #
  # Package
  #
  module Package
  end

  Contract nil => String
  def self.command_not_found
    # Windows but not MinGW
    if Os.windows? && !Os.mingw?
      'not recognized as an internal or external command'
      # MinGW or other Unix variant.
    else
      'command not found'
    end
  end

  Contract nil => String
  def self.os
    case Os.os_name
    when :windows
      'systeminfo | findstr /B /C:\"OS Name\" /C:\"OS Version\"'
    when :mac
      'system_profiler SPSoftwareDataType | grep \'System Version\''
    when :linux
      'lsb_release -a'
    when :unix
      'uname -a'
    # Punt.
    else
      'echo $OS'
    end
  end

  Contract nil => String
  def self.arch
    'ruby -rrbconfig -e \'puts RbConfig::CONFIG[\'arch\']\''
  end

  Contract nil => String
  def self.specs
    SPECS_VERSION_STRING
  end

  Contract nil => String
  def self.ruby_v
    RUBY_VERSION
  end

  Contract nil => Bool
  def self.ruby1_8?
    RUBY_VERSION =~ /^1\.8/
  end

  Contract nil => Bool
  def self.ruby1_9?
    RUBY_VERSION =~ /^1\.9/
  end

  Contract nil => Bool
  def self.ruby2?
    RUBY_VERSION =~ /^2/
  end

  Contract nil => String
  def self.rubygems
    'gem --version'
  end

  Contract nil => String
  def self.rb
    'ruby --version'
  end

  Contract nil => ArrayOf[String]
  def self.ruby
    [rubygems, rb]
  end
end

BUILTINS = %w(specs, os, arch, ruby)

SEP = File::SEPARATOR

# .../specs/aspects
RECIPE_DIR = [SPECS_DIR, 'aspects'].join(SEP)

Dir[File.join(RECIPE_DIR, '**', '*.rb')].each do |file|
  require File.expand_path(file)
end

# For a given spec, return the command line instruction(s)
# that will get the spec's version information.
def self.command(aspect)
  # Ruby methods can't use hypens (-),
  # So translate to underscores (_)
  # When looking up known aspects.
  method = aspect.gsub('-', '_').to_sym

  # Package?
  if aspect.include?(':')
    package_manager, package = aspect.split(':')
    package_manager = package_manager.to_sym

    Recipe::Package.send(package_manager, package) if Recipe::Package.methods.include?(package_manager)
  # Known aspect?
  elsif Recipe.methods.include?(method)
    Recipe.send(method)
  # Unknown aspect.
  # Default to --version flag.
  else
    "#{aspect} --version"
  end
end

# Print a command line instruction and its output,
# Emulating a user manually entering the instruction.
def self.run(cmd, aspect)
  # Newline to visually separate multiple aspect commands.
  puts ''

  if !cmd
    puts "#{aspect} aspect not implemented for this system"
  elsif cmd == SPECS_VERSION_STRING
    puts 'specs --version'
    puts SPECS_VERSION_STRING
  else
    puts cmd

    output = `#{cmd} 2>&1`

    if output.include?(Recipe.command_not_found)
      puts "#{cmd.split.first} not found"
    else
      puts output
    end
  end
end

def self.check_ruby_version
  if Recipe.ruby1_8?
    puts 'Requires Ruby 1.9 or higher.'
    puts 'http://www.ruby-lang.org/'
    exit
  end
end

def self.usage
  puts "Specs:\n\n#{SPECS_VERSION_STRING}\n#{SPECS_HOME_PAGE}"

  exit if ARGV.include?('--version')
end

def main
  check_ruby_version

  usage

  # Default aspects
  aspects = %w(os, hardware)

  aspects = ARGV unless ARGV.empty?

  aspects = aspects - ['specs']

  aspects.each do |aspect|
    # What does the aspect module say to run
    # in order to retrieve the aspect information?
    cmds = command(aspect)

    if !cmds || cmds.instance_of?(String)
      run(cmds, aspect)
      # Module returns an array of command strings.
    elsif cmds.instance_of?(Array)
      cmds.each { |cmd| run(cmd, aspect) }
    end
  end
end
