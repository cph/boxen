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

github "boxen", "3.10.4"

# Support for default hiera data in modules

github "module_data", "0.0.3", :repo => "ripienaar/puppet-module-data"


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
github "brewcask",    "0.0.6"

# Dnsmasq
# http://www.thekelleys.org.uk/dnsmasq/doc.html
# https://github.com/boxen/puppet-dnsmasq
#
#   Resolves anything at .dev to 127.0.0.1
#   requirements: boxen, homebrew
#
github "dnsmasq",     "2.0.1"

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
github "gcc",         "2.2.1"

# Git
# https://github.com/boxen/puppet-git
#
#   Git should already be installed but this
#   adds some commands for Puppet
#   requirements: boxen, homebrew, inifile
#
github "git",         "2.7.12"

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
github "homebrew",    "2.0.0"

# Hub
#
#   This is GitHub's neato git extension.
#   requirements: boxen, homebrew
#
github "hub",         "1.4.1"

# inifile
# https://github.com/puppetlabs/puppetlabs-inifile
#
#   Supports managing INI-style configuration files
#   requirements: none
#
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"

# nginx
# http://nginx.org/
# https://github.com/boxen/puppet-nginx
#
#   Installs and sets up the nginx server
#   allows configuring nginx servers.
#   Used by pow.cx
#   requirements: boxen, homebrew, stdlib
#
github "nginx",       "1.4.5"

# node.js
# https://nodejs.org/
# https://github.com/boxen/puppet-nodejs
#
#   Set nodejs versions, install npm modules
#   requirements: boxen, repository, stdlib, module-data
#
github "nodejs",      "5.0.5"

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
github "ruby",        "8.5.4"

# stdlib
#
#   Adds a heavily-used standard library of resources for Puppet modules:
#   stages, facts, functions, defined resource types, types, providers and more
#   requirements: none
#
github "stdlib",      "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"

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

# MySQL
# https://www.mysql.com/
# https://github.com/boxen/puppet-mysql
#
#   We keep this around for LivingWord and
#   One in Christ
#   requirements: boxen, homebrew, stdlib
#
#   Note: we are using our branch of this module
#   because we need the fix contained in these
#   two commits:
#   https://github.com/concordia-publishing-house/puppet-mysql/compare/2.0.1...2.0.2
#
github "mysql",          "2.0.2", repo: "concordia-publishing-house/puppet-mysql"

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
github "redis",          "3.1.0"

# ImageMagick
# http://www.imagemagick.org
# https://github.com/boxen/puppet-imagemagick
#
#   Open Source suite for manipulating images
#   Used by Paperclip and CarrierWave in Members and Unite
#   requirements: boxen, homebrew, stdlib, xquartz
#
github "imagemagick",    "1.3.0"

# TextMate
# https://macromates.com/
# https://github.com/boxen/puppet-textmate
#
#   This missing text editor for OSX
#   requirements: boxen
#
github "textmate",       "1.1.0"

# Sublime Text
# http://www.sublimetext.com/
# https://github.com/boxen/puppet-sublime_text
#
#   The text editor you'll fall in love with
#   Installs either SublimeText 2 or 3
#   requirements: boxen, stdlib, repository
#
github "sublime_text",   "1.1.0"

# Jumpcut
# http://jumpcut.sourceforge.net/
# https://github.com/boxen/puppet-jumpcut
# 
#   Provides clipboard buffering
#   requirements: none?
#
github "jumpcut",        "1.0.0"

# ImageOptim
# https://imageoptim.com/
# https://github.com/boxen/puppet-imageoptim
#
#   Installs a utility for compressing images
#   and making the web load faster
#   requirements: boxen
#
github "imageoptim",     "0.0.2"

# Git Tower
# http://www.git-tower.com/
# https://github.com/boxen/puppet-tower
#
#   Installs Tower
#   We had to fork this because there is a typo
#   in the canonical repo.
#   requirements: boxen
#
github "tower",          "1.1.1", :repo => "genebot/puppet-tower"

# Caffeine
# https://itunes.apple.com/us/app/caffeine/id411246225?mt=12
# https://github.com/boxen/puppet-caffeine
#
#   OSX App that prevents your laptop from going to sleep
#   requirements: boxen
#
github "caffeine",       "1.0.0"

# Postgres.app
# http://postgresapp.com/
# https://github.com/boxen/puppet-postgresapp
#
#   The easiest way to install Postgres on a Mac
#   We had to fork this because the canonical repo is
#   glued to a specific version of Postgres (9.2)
#   requirements: boxen
#
github "postgresapp",    "9.4.5.0", :repo => "concordia-publishing-house/puppet-postgresapp"

# PDFtk
# https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/
# https://github.com/concordia-publishing-house/puppet-pdftk
#
#   Installs PDFtk: a commandline toolkit for working with PDFs
#   Used by the DR application
#   requirements: none
#
github "pdftk",          "1.2.2", :repo => "concordia-publishing-house/puppet-pdftk"

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
#   Installs libtoon, a generic library support script
#   requirements: boxen, homebrew, stdlib
#
github "libtool",        "1.0.0"

# iterm2
# https://www.iterm2.com/
# https://github.com/boxen/puppet-iterm2
#
#   Installs iterm2, a terminal emulator
#   requirements: boxen, stdlib
#
github "iterm2",         "1.2.5"

# mdbtools
# http://mdbtools.sourceforge.net
# https://github.com/concordia-publishing-house/puppet-mdbtools
#
#   Installs mdbtools, which provides programmatic access to Access DBs
#   requirements: homebrew
#
github "mdbtools",       "1.0.0", :repo => "concordia-publishing-house/puppet-mdbtools"

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

# KeyCastr
# https://github.com/keycastr/keycastr
# https://github.com/concordia-publishing-house/puppet-keycastr
#
#   Installs KeyCastr which shows which keyboard shortcuts
#   you are typing — helpful for pairing!
#   requirements: boxen
#
github "keycastr",        "1.0.0", :repo => "concordia-publishing-house/puppet-keycastr"
