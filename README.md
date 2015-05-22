# Boxen

[Boxen](https://boxen.github.com/) automates the configuration of Mac OS X.

Our Boxen is a fork of [GitHub's](https://github.com/boxen/our-boxen) that installs the languages, tools, and applications a developer or designer needs to run EP applications.

#### How it works

Boxen uses [Puppet](https://puppetlabs.com/) (see [Getting Started with Puppet](https://github.com/boxen/our-boxen/blob/master/docs/puppet.md)) which is Ruby software for configuration management. Aspects of machine configuration are broken into modules. You can find quite a few public modules at [github.com/boxen](https://github.com/boxen) and [github.com/puppetlabs](https://github.com/puppetlabs). For more information about Boxen, see [the original repo](https://github.com/boxen/our-boxen).



## Using Boxen

Install [the EP toolchain](https://github.com/concordia-publishing-house/ep#installing-ep) and run:

```
ep update --bootstrap
```

If you encounter any problems with this step, see [Troubleshooting EP Bootstrap](https://github.com/concordia-publishing-house/ep/wiki/Troubleshooting-EP-Bootstrap).



#### What this will do to your computer

Boxen will install:

###### Development Environment

  * [ImageMagick](http://www.imagemagick.org/) _image manipulation utilities used by Members and Unite_
  * [mdbtools](https://github.com/brianb/mdbtools) _used by Members and Ledger to import Shepherd's Staff data_
  * [MySQL](http://www.mysql.com/) _the database_
  * [PDFtk](http://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/) _used by Doctrinal Review to remove author metadata from PDFs_
  * [PhantomJS](http://phantomjs.org/) _a headless browser, super useful for running client-side test suites_
  * [Postgres.app](http://postgresapp.com/) _the database_
  * [RBenv](https://github.com/sstephenson/rbenv) _for managing and switching between multiple versions of ruby_
  * [Redis](http://redis.io/) _a key-value store used by [Resque](https://github.com/resque/resque) and [Sidekiq](http://sidekiq.org/)_

###### Applications

  * [Caffeine](http://lightheadsw.com/caffeine/) _a lightweight app that keeps your laptop from going to sleep_
  * [Git Tower](http://www.git-tower.com/) _a great GUI for Git_
  * [Homebrew](http://mxcl.github.com/homebrew/) _the best package manager available for OSX_
  * [iTerm2](http://www.iterm2.com/) _a better Terminal_
  * [Jumpcut](http://jumpcut.sourceforge.net/) _a buffered clipboard_
  * [SublimeText 3](http://www.sublimetext.com/) _a text editor_
  * [TextMate 1.5](http://macromates.com/) _a text editor_

See [Puppetfile](https://github.com/concordia-publishing-house/boxen/blob/master/Puppetfile) and [modules/ep/manifests/default.pp](https://github.com/concordia-publishing-house/boxen/blob/master/modules/ep/manifests/default.pp) for the complete listing.



## Hacking on Boxen

###### Branches and Rebasing

Branches are named for versions of the Boxen stack (e.g. `ep/v1` is version 1 of the Boxen stack). Should we need to rebase our work off of [boxen/our-boxen](https://github.com/boxen/our-boxen), we would create a new branch with a bumped version (e.g. `ep/v2`) and squash all of our modifications to-date into one commit.


