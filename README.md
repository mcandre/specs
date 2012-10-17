# specs - Software version information at your fingertips

# EXAMPLE

Bug tracking is much easier when everyone is on the same page for which versions of software are being used. `specs` brings this information right to your fingertips.

	$ specs chrome ruby os hardware
	Specs:

	/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --version 2>&1 | grep -v Unsure
	 22.0.1229.94 

	gem --version
	1.3.6

	ruby --version
	ruby 1.8.7 (2012-02-08 patchlevel 358) [universal-darwin12.0]

	system_profiler SPSoftwareDataType | grep 'System Version'
	      System Version: OS X 10.8.2 (12C54)

	system_profiler | grep 'Model Identifier'
	      Model Identifier: MacBookPro5,5

You can copy & paste the output into bug trackers, forums, mailing lists, and live chat sessions. `spec` prints the command line instructions that obtain the version information, so that anyone, even non-`spec` users, can obtain the same information quickly and easily.

# REQUIREMENTS

* [Ruby](http://www.ruby-lang.org/)
* [extlib](http://rubygems.org/gems/extlib)

# ADDONS

Custom aspects are written as Ruby recipes in the `commands` subdirectory. Any recipes you create there are automatically part of your local aspect database.

When you're happy with your recipes, issue a [git pull request](https://github.com/mcandre/specs/pull/new/master) to share them with other `spec` users.