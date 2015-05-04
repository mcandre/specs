# == Usage
#
# specs [aspects]
#
# Example:
#
# specs ruby os hardware
#
# By default, aspects are os and hardware.

require_relative 'specs'

require 'getoptlong'

module Specs
  def self.usage
    puts "Specs:\n\n#{SPECS_VERSION_STRING}\n#{SPECS_HOME_PAGE}"

    exit if ARGV.include?('--version')
  end

  def self.main
    check_ruby_version

    usage

    # Default aspects
    aspects = %w(os) # hardware)

    aspects = ARGV unless ARGV.empty?

    aspects -= ['specs', '-v', 'version', '-version', '--version']

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
end
