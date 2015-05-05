require_relative 'specs'

require 'docopt'

USAGE = <<DOCOPT
Usage:
  specs [-v | -h] [<aspect>]...

Arguments:
  <aspect>  Software stack to query [default: os hardware].

Options:
  -v --version  Print version info.
  -h --help     Print usage info.
DOCOPT

module Specs
  def self.main
    check_ruby_version

    begin
      options = Docopt::docopt(USAGE, version: Specs::VERSION)

      aspects = options['<aspect>']

      # Work around https://github.com/docopt/docopt/issues/274
      if aspects == []
        aspects = ['os', 'hardware']
      end

      # Print specs' own version, and filter out redundant requests
      aspects = ['specs'] + (aspects - ['specs'])

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
    rescue Docopt::Exit => e
      puts e.message
    end
  rescue Interrupt
    nil
  end
end
