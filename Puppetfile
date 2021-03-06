# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.13.0"

# Support for default hiera data in modules

github "module_data", "0.0.4", :repo => "ripienaar/puppet-module-data"


# ## Recommended by GitHub
# The following list of modules comes in the box from
# https://github.com/boxen/our-boxen/blob/master/Puppetfile
#
# However, we do not use:
#  * foreman
#  * go
#  * sudo

# Homebrew Cask
# http://caskroom.io/
# https://github.com/boxen/puppet-brewcask
#
#   extends Homebrew with a better user interface
#   requirements: homebrew
#
github "brewcask",    "0.0.10"

# Dnsmasq
# http://www.thekelleys.org.uk/dnsmasq/doc.html
# https://github.com/boxen/puppet-dnsmasq
#
#   Resolves anything at .dev to 127.0.0.1
#   requirements: boxen, homebrew
#
github "dnsmasq",     "2.0.4"

# Foreman
# http://theforeman.org/
# https://github.com/boxen/puppet-foreman
#
#   A complete lifecycle management tool for physical and virtual servers
#   requirements: boxen
#
# github "foreman",     "1.2.0"

# GCC
#
#   The GNU Compiler Collection.
#   OSX by default comes with Clang (based on LLVM),
#   but some things won't complete with that
#   requirements: boxen, homebrew, stdlib
#
# github "gcc",         "3.0.2"

# Git
# https://github.com/boxen/puppet-git
#
#   Git should already be installed but this
#   adds some commands for Puppet
#   requirements: boxen, homebrew, inifile
#
github "git",         "2.10.0"

# Go
#
#   Go is a programming language.
#   Supports changing go versions and installing go modules
#   requirements: boxen, repository, stdlib
#
# github "go",          "2.1.0"

# Homebrew
# https://github.com/boxen/puppet-homebrew
#
#   Mac's best package manager
#   Adds commands for puppet for installing homebrew formulae
#   requirements: boxen, repository, stdlib
#
github "homebrew",    "2.2.0"

# Hub
#
#   This is GitHub's neato git extension.
#   requirements: boxen, homebrew
#
github "hub",         "1.4.5"

# inifile
# https://github.com/puppetlabs/puppetlabs-inifile
#
#   Supports managing INI-style configuration files
#   requirements: none
#
github "inifile",     "1.4.1", :repo => "puppetlabs/puppetlabs-inifile"

# nginx
# http://nginx.org/
# https://github.com/boxen/puppet-nginx
#
#   Installs and sets up the nginx server
#   allows configuring nginx servers.
#   Used by pow.cx
#   requirements: boxen, homebrew, stdlib
#
github "nginx",       "1.9.0"

# node.js
# https://nodejs.org/
# https://github.com/boxen/puppet-nodejs
#
#   Set nodejs versions, install npm modules
#   requirements: boxen, repository, stdlib, module-data
#
github "nodejs",      "5.0.9"

# openssl
# https://github.com/boxen/puppet-openssl
#
#   Installs openssl and that's it, it seems
#   requirements: none
#
github "openssl",     "1.0.0"

# phantom.js
# http://phantomjs.org/
# https://github.com/boxen/puppet-phantomjs
#
#   Headless webkit scriptable with JS API.
#   Adds commands to set local and global versions of phantomjs
#   requirements: boxen, homebrew, repository, stdlib
#
github "phantomjs",   "3.0.0"

# pkgconfig
#
#   requirements: boxen, homebrew, stdlib
#
github "pkgconfig",   "1.0.0"

# Repository Type and Provider for Boxen
# https://github.com/boxen/puppet-repository
#
#   Adds the ability to specify a git repository
#   as the source for a dependency
#   requirements: none
#
github "repository",  "2.4.1"

# Ruby
# https://www.ruby-lang.org/en/
# https://github.com/boxen/puppet-ruby
#
#   Installs ruby versions, gems, rbenv plugins
#   Sets local and global ruby versions
#   requirements: boxen, repository, autoconf, openssl, gcc, and module-data
#
github "ruby",        "8.6.0"

# stdlib
#
#   Adds a heavily-used standard library of resources for Puppet modules:
#   stages, facts, functions, defined resource types, types, providers and more
#   requirements: none
#
github "stdlib",      "4.7.0", :repo => "puppetlabs/puppetlabs-stdlib"

# Sudo
# https://github.com/boxen/puppet-sudo
#
#   Type/provider for managing sudoers file.
#   Apparently used by something in this file.
#
github "sudo",        "1.0.0"

# XQuartz
# http://xquartz.macosforge.org/landing/
# https://github.com/boxen/puppet-xquartz
#
#   A version of the X.Org X Window System that runs on OS X
#   Used by ImageMagick
#   requirements: none
#
github "xquartz",     "1.2.1"




# ## Added by Emerging Products

# SysCTL
# https://github.com/boxen/puppet-sysctl
#
#   Supports editing `/etc/sysctl.conf`
#   requirements: stdlib
#
github "sysctl",         "1.0.1"

# Redis
# http://redis.io/
# https://github.com/boxen/puppet-redis
#
#   Redis is an open source, BSD licensed, advanced key-value cache and store.
#   It is used by Resque and Sidekiq which are used by Members, Unite, and
#   Ledger to process background jobs.
#   requirements: boxen, homebrew, stdlib
#
github "redis",          "4.0.2"

# Postgres.app
# http://postgresapp.com/
# https://github.com/boxen/puppet-postgresapp
#
#   The easiest way to install Postgres on a Mac
#   We had to fork this because the canonical repo is
#   glued to a specific version of Postgres (9.2)
#   requirements: boxen
#
github "postgresapp",    "9.6.0", :repo => "cph/puppet-postgresapp"

# PDFtk
# https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/
# https://github.com/cph/puppet-pdftk
#
#   Installs PDFtk: a commandline toolkit for working with PDFs
#   Used by the DR application
#   requirements: none
#
github "pdftk",          "2.0.2.1", :repo => "cph/puppet-pdftk"

# autoconf
# http://www.gnu.org/software/autoconf/autoconf.html
# https://github.com/boxen/puppet-automake
#
#   Installs autoconf, your favorite build and release framework
#   requirements: boxen
#
github "autoconf",       "1.0.0"

# automake
# http://www.gnu.org/software/automake/
# https://github.com/boxen/puppet-automake
#
#   Installs automake
#   Automake is a tool for automatically generating Makefile.in files
#   compliant with the GNU Coding Standards
#   Automake requires the use of Autoconf (but not necessarily via Boxen)
#   requirements: boxen
#
github "automake",       "1.0.0"

# libtool
# http://www.gnu.org/software/libtool/
# https://github.com/boxen/puppet-libtool
#
#   Installs libtool, a generic library support script
#   requirements: boxen, homebrew, stdlib
#
github "libtool",        "1.0.0"

# pow
# http://pow.cx
# https://github.com/boxen/puppet-pow
#
#   Installs Pow, which is a zero-conf rack server
#   requirements: boxen, nginx, dnsmasq, homebrew, stdlib
#
github "pow",            "2.3.2"

# heroku
# https://www.heroku.com
# https://github.com/boxen/puppet-heroku
#
#   Installs the Heroku CLI and allows
#   installing Heroku plugins
#   requirements: boxen
#
github "heroku",         "2.1.1"

# s3cmd
# http://s3tools.org/s3cmd
# https://github.com/KendallPark/puppet-s3cmd
#
#   Installs command line tools for interacting with AWS S3.
#   requirements: homebrew
#
github "s3cmd",          "1.0.1", :repo => "KendallPark/puppet-s3cmd"
