# specs - Get system specs easily

# EXAMPLE

	$ specs ruby os hardware
	Specs:

	ruby --version
	ruby 1.8.7 (2012-02-08 patchlevel 358) [universal-darwin12.0]

	system_profiler SPSoftwareDataType | grep System
	    System Software Overview:
	      System Version: OS X 10.8.2 (12C54)

	system_profiler | grep 'Model Identifier'
	      Model Identifier: MacBookPro5,5

# REQUIREMENTS

* [Ruby](http://www.ruby-lang.org/)
* [extlib](http://rubygems.org/gems/extlib)

# BUILTINS

By default, specs can obtain information for:

* Ruby version
* Operating System name and version
* Hardware manufacturer and model name

If other tools are installed, specs can obtain version information for them as well.

* as
* gcc
* g++
* ld
* Lua
* Haskell Platform and consituents (GHC, Cabal)
* Inkscape
* Perl
* Xcode
...

# ADDONS

Additional specs are inserted as Ruby modules in the `commands` subdirectory.

View this directory for example spec modules.