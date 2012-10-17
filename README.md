# specs - Software version information at your fingertips

# EXAMPLE

Bug tracking is much easier when everyone is on the same page for which versions of software are being used. `specs` brings this information right to your fingertips. List the names of the specs to report, and `specs` will do its best to retrieve them.

	$ specs ruby os hardware
	Specs:

	ruby --version
	ruby 1.8.7 (2012-02-08 patchlevel 358) [universal-darwin12.0]

	system_profiler SPSoftwareDataType | grep System
	    System Software Overview:
	      System Version: OS X 10.8.2 (12C54)

	system_profiler | grep 'Model Identifier'
	      Model Identifier: MacBookPro5,5

The `spec` user can copy & paste this output into bug trackers, forums, mailing lists, and live chat sessions. On the other end of the line, people can quickly see which versions of the relevant software toolchain are installed. The output includes the commands that were used to obtain this information, so that anyone, even non-`spec` users, can obtain the same information quickly and easily.

# BUILTINS

By default, specs can obtain information for several aspects:

* Ruby and RubyGems versions
* Operating System name and version
* Hardware manufacturer and model name

If other systems are available, specs can obtain version information for them as well.

* Any program with a `--version` flag
* as
* Chrome
* Firefox
* gcc
* g++
* ld
* Lua
* Haskell Platform and consituents (GHC, Cabal)
* Inkscape
* OS name and version (Mac, Windows, Linux, Haiku, Unix, ...)
* Perl
* Ruby
* Xcode

...

# REQUIREMENTS

* [Ruby](http://www.ruby-lang.org/)
* [extlib](http://rubygems.org/gems/extlib)

# OVERVIEW

Many programs can generate reports on their system specifications with a command line flag such as `--version`. However, command line options are not standardize across different programs, making it difficult to know for an arbitrary program how to obtain its version info.

	ruby --version
	ruby 1.8.7 (2012-02-08 patchlevel 358) [universal-darwin12.0]

	ld -v
	@(#)PROGRAM:ld  PROJECT:ld64-134.9
	configured to support archs: armv6 armv7 armv7s i386 x86_64
	LTO support using: LLVM version 3.1svn, from Apple Clang 4.1 (build 421.11.65)

	as -o /dev/null -version < /dev/null
	Apple Inc version cctools-836, GNU assembler version 1.38

Sometimes getting basic information requires tricky shell syntax. Apple's older version of `as` plays dumb when asked for its version number; it will report the information, but then it will hang forever, expecting assembly code for input. Any user or program attempting to get `as` version info will stall, waiting for `as` to quit. This is canceled by sending the End of File signal through `< /dev/null`.

Sometimes, programs generate too much information. `system_profiler` can print the specific Mac OS X version, but it hides this among thousands of other lines.

Audio:

	$ system_profiler
	    Intel High Definition Audio:

	      Audio ID: 77

	        Headphone:

	          Connection: Combination Output

	        Speaker:

	          Connection: Internal

	        Line Input:

	          Connection: Combination Input

	        Internal Microphone:

	          Connection: Internal

	        S/PDIF Optical Digital Audio Output:
			...

`grep` can filter the lengthy output of `system_profiler SPSoftwareDataType`, displaying only the relevant data. `grep` is available in most Unix environments by default, including Mac OS X. For Windows, grep is available as a [third party app](http://www.yellosoft.us/helpers#grep).

	$ system_profiler SPSoftwareDataType | grep 'System Version'
	      System Version: OS X 10.8.2 (12C54)

All of these tricks are combined together preemtively in `specs` Ruby recipes, so that you don't have to bother looking through `man` pages for version info.

# ADDONS

Additional specs are inserted as Ruby modules in the `commands` subdirectory. The addons therein serve as a template for further addons.