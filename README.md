# specs - Software version information at your fingertips

# EXAMPLES

You type this:

```console
$ specs chrome ruby os hardware
```

Specs prints this:

```console
$ specs chrome ruby os hardware
specs --version
0.21

/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --version 2>&1 | grep -v Unsure
 36.0.1985.143

bundle --version
Bundler version 1.7.1

gem --version
2.2.2

ruby --version
ruby 2.0.0p481 (2014-05-08 revision 45883) [x86_64-darwin13.3.0]

system_profiler SPSoftwareDataType | grep 'System Version'
      System Version: OS X 10.9.4 (13E28)

system_profiler 2>&1 | grep 'Model Identifier'
      Model Identifier: MacBookAir6,2
```

You can copy & paste the output into bug trackers, forums, mailing lists, and live chat sessions. `specs` prints the command line instructions that obtain the version information, so that anyone, even non-`specs` users, can obtain the same information quickly and easily.

## Aliases

specs supports aliases:

```console
$ specs rspec ruby chruby
specs --version
0.21

rspec --version
3.1.7

bundle --version
Bundler version 1.8.3

gem --version
2.4.6

ruby --version
ruby 2.0.0p598 (2014-11-13 revision 48408) [x86_64-darwin14.1.0]

chruby --version
chruby: 0.3.9

$ specs coffee node nvm
specs --version
0.21

coffee --version
CoffeeScript version 1.9.2

npm --version
2.7.5

node --version
v0.10.36

nvm --version
0.23.3
```

# USAGE

```console
$ specs -h
Usage:
  specs [-v | -h] [<aspect>]...

Arguments:
  <aspect>               Software stack to query [default: os hardware]

Options:
  -v --version           Print version info
  -h --help              Print usage info
```

# HOMEPAGE

https://github.com/mcandre/specs

# RUBYGEMS

https://rubygems.org/gems/specs

# ABOUT

Bug tracking is much easier when everyone is on the same page for software and hardware stacks. `specs` brings this information right to your fingertips, so bug reporters can quickly identify, copy, and paste your stack info into reports.

`specs` is command line based, printing not only the stack info, but the commands used to obtain the info, so even users without specs installed can see how to get the same info on their computers.

`specs` can find versions with `-v/--version` flags for programs that support them, custom `aspects/` recipes for programs that don't, and `<pkg> list` for programs installed by package managers like [RubyGems](http://rubygems.org/), [NPM](https://www.npmjs.org/), [Homebrew](http://brew.sh/), and [Chocolatey](http://chocolatey.org/). It's as close as you can get to fully computerized versioning without forcing Vagrant on your users.

# Package Versions

specs now supports retrieving version numbers from packages in addition to programs. Any package manager specs is aware of can be queried. For example:

```
$ specs gem:multi_json
Specs:

specs 0.11
https://github.com/mcandre/specs#readme

gem list | grep multi_json
multi_json (1.10.1, 1.8.4)
```

# REQUIREMENTS

* [Ruby](http://www.ruby-lang.org/) 2.0+

## Optional

* [make](https://www.gnu.org/software/make/)
* [GNU findutils](https://www.gnu.org/software/findutils/)
* [stank](https://github.com/mcandre/stank) (e.g. `go get github.com/mcandre/stank/...`)
* [Python](https://www.python.org) 3+ (for yamllint)
* [Node.js](https://nodejs.org/en/) (for eclint)

# INSTALL

```console
$ gem install specs
```

# ADDONS

Custom aspects are written as Ruby recipes in the `aspects` subdirectory. Any recipes you create there are automatically part of your local aspect database.

When you're happy with your recipes, issue a [pull request](https://github.com/mcandre/specs/pull/new/master) to share them with other `specs` users.

# DEVELOPMENT

Checkout a copy of the code, and get the developer dependencies:

```console
$ git clone https://github.com/mcandre/specs.git
$ cd specs
$ bundle
```

## Test

Ensure the example script works as expected:

```console
$ bundle
$ cucumber
```

## Lint

Keep the code looking good with the linter tools:

```console
$ rake lint
```

## Spell Check

```console
$ aspelllint
```

## Git Hooks

See `hooks/`.
