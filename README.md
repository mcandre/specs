# specs - Get system specs easily

# EXAMPLE

Bug tracking is much easier when everyone is on the same page for which versions of software are being used. `specs` brings this information right to your fingertips. List the names of the specs to report, and `specs` will do its best to retrieve them. `specs` will also print the commands it uses to obtain the data, making it easy for other people to retrieve their version information and compare with yours.

	$ specs ruby os hardware
	Specs:

	ruby --version
	ruby 1.8.7 (2012-02-08 patchlevel 358) [universal-darwin12.0]

	system_profiler SPSoftwareDataType | grep System
	    System Software Overview:
	      System Version: OS X 10.8.2 (12C54)

	system_profiler | grep 'Model Identifier'
	      Model Identifier: MacBookPro5,5

The `spec` user can copy & paste this output bug trackers, forums, mailing lists, and live chat sessions. On the other end of the line, people can quickly see which versions of the relevant software toolchain are installed. Finally, `spec` output prints the commands for obtaining this information, so that anyone, even non-`spec` users can obtain the same information quickly and easily via the command line.

# REQUIREMENTS

* [Ruby](http://www.ruby-lang.org/)
* [extlib](http://rubygems.org/gems/extlib)

# OVERVIEW

Many programs can generate reports on their system specifications. As you can see, many programs do not standardize their command line interface, so they often require different options to provide the same data. `ruby` requires a `--version` flag, but `ld` requires a `-v` flag, and `as` requires a `-version` flag.

	$ ruby --version
	ruby 1.8.7 (2012-02-08 patchlevel 358) [universal-darwin12.0]

	$ ld -v
	@(#)PROGRAM:ld  PROJECT:ld64-134.9
	configured to support archs: armv6 armv7 armv7s i386 x86_64
	LTO support using: LLVM version 3.1svn, from Apple Clang 4.1 (build 421.11.65)

	# as -o /dev/null -version < /dev/null
	Apple Inc version cctools-836, GNU assembler version 1.38

Sometimes getting basic information requires some command line tricks. Apple's older version of `as` plays dumb when asked for its version number; it will report the information, but then it will hang forever, expecting assembly code as input. This is canceled by sending the End of File signal through `< /dev/null`.

	$ system_profiler SPSoftwareDataType | grep 'System Version'
	      System Version: OS X 10.8.2 (12C54)

In this case, the `grep` command is filtering the lengthy output of `system_profiler SPSoftwareDataType`, displaying only the relevant data. is available in most Unix environments by default, including Mac OS X. grep is available for Windows as a [third party app](http://www.yellosoft.us/helpers#grep).

# BUILTINS

By default, specs can obtain information for several aspects:

* Ruby and RubyGems versions
* Operating System name and version
* Hardware manufacturer and model name

If other tools are installed, specs can obtain version information for them as well.

* Any program with a `--version` flag
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

Additional specs are inserted as Ruby modules in the `commands` subdirectory. The addons therein serve as a template for further addons.