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

require "getoptlong"
require "pathname"

SPECS_VERSION = "0.2"
SPECS_VERSION_STRING = "specs #{SPECS_VERSION}"
SPECS_HOME_PAGE = "https://github.com/mcandre/specs#readme"

SPECS_DIR = Pathname.new(File.dirname(__FILE__))

# Get the basic operating system name reliably, even in JRuby
# Useful for OS-contextual command line instructions.
#
# E.g., "C:\Program Files (x86)\Mozilla Firefox\firefox --version" in Windows vs
#       "/Applications/Firefox.app/Contents/MacOS/firefox --version" in Mac vs
#       "firefox --version" in Unix
#
module Os
  def self.raw
    # Config deprecated in Ruby 1.9
    RbConfig::CONFIG["host_os"]
  end

  # A series of OS descriptions.
  # Not all of these are mutually exclusive.

  def self.windows?
    self.raw =~ /cygwin|mswin|mingw|bccwin|wince|emx/
  end

  def self.mingw?
    self.raw =~ /cygwin|mingw/
  end

  def self.mac?
    self.raw =~ /darwin/
  end

  def self.unix?
    not self.windows?
  end

  def self.haiku?
    self.raw =~ /haiku/
  end

  def self.linux?
    self.unix? and not self.mac? and not self.haiku?
  end

  def self.x86_64?
    RbConfig::CONFIG["arch"] =~ /64/
  end

  def self.x86?
    !self.x86_64?
  end
end

module Recipe
  def self.command_not_found
    # Windows but not MinGW
    if Os.windows? and !Os.mingw?
      "not recognized as an internal or external command"
      # MinGW or other Unix variant.
    else
      "command not found"
    end
  end

  def self.os
    if Os.windows?
      "systeminfo | findstr /B /C:\"OS Name\" /C:\"OS Version\""
    elsif Os.mac?
      "system_profiler SPSoftwareDataType | grep 'System Version'"
    elsif Os.linux?
      "lsb_release -a"
      # Unix
    else
      "uname -a"
    end
  end

  def self.arch
    "ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"arch\"]'"
  end

  def self.specs
    SPECS_VERSION_STRING
  end

  def self.ruby_v
    RUBY_VERSION
  end

  def self.ruby1_8?
    RUBY_VERSION =~ /^1\.8/
  end

  def self.ruby1_9?       
    RUBY_VERSION =~ /^1\.9/
  end

  def self.rubygems
    "gem --version"
  end

  def self.rb
    "ruby --version"
  end

  def self.ruby
    [rubygems, rb]
  end
end

BUILTINS = ["specs", "os", "arch", "ruby"]

SEP = File::SEPARATOR

# .../specs/aspects
RECIPE_DIR = [SPECS_DIR, "aspects"].join(SEP)

# For a given spec, return the command line instruction(s)
# that will get the spec's version information.
def command(aspect)
  # Custom aspect?
  if !BUILTINS.include?(aspect)
    require_path = "#{RECIPE_DIR}#{SEP}#{aspect}.rb"

    # Attempt to load custom aspect recipe.
    if File.exist?(require_path)
      require require_path
    end
  end

  # Ruby methods can't use hypens (-),
  # So translate to underscores (_)
  # When looking up known aspects.
  method = aspect.gsub("-", "_").to_sym

  # Known aspect.
  if Recipe.methods.include?(method)
    Recipe.send(method)
    # Unknown aspect.
    # Default to --version flag.
  else
    "#{aspect} --version"
  end
end

# Print a command line instruction and its output,
# Emulating a user manually entering the instruction.
def run(cmd, aspect)
  # Newline to visually separate multiple aspect commands.
  puts ""

  if cmd.nil?
    puts "#{aspect} aspect not implemented for this system"

  elsif cmd == SPECS_VERSION_STRING
    puts "specs --version"
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

def usage
  system "more specs.rb"
  exit
end

def print_specs_own_version
  puts SPECS_VERSION_STRING
  puts SPECS_HOME_PAGE
end

def check_ruby_version
  if RUBY_VERSION =~ /^1\.8/
    puts "Requires Ruby 1.9+"
    puts "http://www.ruby-lang.org/"
    exit
  end
end

def main
  check_ruby_version

  opts = GetoptLong.new(
                        ["--help", "-h", GetoptLong::NO_ARGUMENT],
                        ["--version", "-v", GetoptLong::NO_ARGUMENT]
                        )

  begin
    opts.each { |option, value|
      case option
      when "--help"
        usage
      when "--version"
        print_specs_own_version
      end
    }
  rescue GetoptLong::InvalidOption
    usage
  end

  # Default aspects
  aspects = ["specs", "os", "hardware"]
  if !ARGV.empty?
    aspects = ARGV
  end

  aspects = aspects - ["specs"]
  puts "Specs:\n\n"
  print_specs_own_version

  aspects.each { |aspect|
    # What does the aspect module say to run
    # in order to retrieve the aspect information?
    cmds = command(aspect)

    if cmds.nil? or cmds.instance_of?(String)
      run(cmds, aspect)
      # Module returns an array of command strings.
    elsif cmds.instance_of?(Array)
      cmds.each { |cmd| run(cmd, aspect) }
    end
  }
end