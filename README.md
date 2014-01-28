# specs - Software version information at your fingertips

# EXAMPLE

Bug tracking is much easier when everyone is on the same page for which versions of software are being used. `specs` brings this information right to your fingertips.

You type this:

    $ specs chrome ruby os hardware

Specs prints this:

    Specs:

    specs 0.8
    https://github.com/mcandre/specs#readme

    /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --version 2>&1 | grep -v Unsure
     22.0.1229.94

    gem --version
    1.3.6

    ruby --version
    ruby 1.9.3

    system_profiler SPSoftwareDataType | grep 'System Version'
          System Version: OS X 10.8.2 (12C54)

    system_profiler | grep 'Model Identifier'
          Model Identifier: MacBookPro5,5

You can copy & paste the output into bug trackers, forums, mailing lists, and live chat sessions. `specs` prints the command line instructions that obtain the version information, so that anyone, even non-`specs` users, can obtain the same information quickly and easily.

# Package Versions

specs now supports retrieving version numbers from packages in addition to programs. Any package manager specs is aware of can be queried. For example:

    $ specs gem:multi_json
    Specs:

    specs 0.8
    https://github.com/mcandre/specs#readme

    gem list | grep multi_json
    multi_json (1.7.2)

# REQUIREMENTS

* [Ruby](http://www.ruby-lang.org/) 1.9 or higher

# INSTALL

    $ gem install specs

# ADDONS

Custom aspects are written as Ruby recipes in the `aspects` subdirectory. Any recipes you create there are automatically part of your local aspect database.

When you're happy with your recipes, issue a [pull request](https://github.com/mcandre/specs/pull/new/master) to share them with other `specs` users.

# DEVELOPMENT

Checkout a copy of the code, and get the developer dependencies:

    $ git clone https://github.com/mcandre/specs.git
    $ cd specs
    $ bundle

## Testing

Ensure the example script works as expected:

    $ bundle
    $ cucumber
    Feature: Get versions

      Scenario: Running specs                                  # features/get_versions.feature:3
        Given "specs ruby"                                     # features/step_definitions/steps.rb:1
        Then the output has "ruby --version"                   # features/step_definitions/steps.rb:5
        Given "specs ruby"                                     # features/step_definitions/steps.rb:1
        Then the output has "gem --version"                    # features/step_definitions/steps.rb:5
        Given "specs ruby"                                     # features/step_definitions/steps.rb:1
        Then the output has "bundle --version"                 # features/step_definitions/steps.rb:5
        Given "specs rake"                                     # features/step_definitions/steps.rb:1
        Then the output has "rake --version"                   # features/step_definitions/steps.rb:5
        Given "specs --version"                                # features/step_definitions/steps.rb:1
        Then the output has "https://github.com/mcandre/specs" # features/step_definitions/steps.rb:5
        Given "specs gem:specs"                                # features/step_definitions/steps.rb:1
        Then the output has "specs"                            # features/step_definitions/steps.rb:5

    1 scenario (1 passed)
    12 steps (12 passed)
    0m4.136s

## Linting

Keep the code looking good with the linter tools:

    $ rake lint
