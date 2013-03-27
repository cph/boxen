# Boxen

Boxen automates the configuration of MacBook Pros. Its purpose is:

 * To make it fast and easy to get a new computer's development environment up and running.
 * To ensure that all we're working with the same tools so that what works on Jesse's computer works on yours.


### How it works

Boxen uses [Puppet](https://puppetlabs.com/) (see [Getting Started with Puppet](https://github.com/concordia-publishing-house/boxen/blob/master/docs/puppet.md)) which is Ruby software for configuration management. Aspects of machine configuration are broken into modules. You can find quite a few at [github.com/boxen](https://github.com/boxen) and [github.com/puppetlabs](https://github.com/puppetlabs/puppet-postgresql). [puppetlabs/puppet-postgresql](https://github.com/puppetlabs/puppet-postgresql), for example, is a module for installing and configuring Postgres.

This is a fork of GitHub's [Boxen](https://github.com/boxen/our-boxen). Currently, it comes with GitHub's default configuration:

 * Homebrew
 * Git
 * Hub
 * DNSMasq w/ .dev resolver for localhost
 * NVM
 * RBenv
 * Full Disk Encryption requirement
 * NodeJS 0.4
 * NodeJS 0.6
 * NodeJS 0.8
 * Ruby 1.8.7
 * Ruby 1.9.2
 * Ruby 1.9.3
 * Ack
 * Findutils
 * GNU-Tar




## TODO: Make Boxen work for us

Our requirements aren't identical with GitHub's. To begin using Boxen at CPH, we need to modify this project to represent our required configuration.

Here are the steps that Boxen should perform to setup an EP development environment:

##### Foundations

 * Install [Homebrew](http://mxcl.github.com/homebrew/) :shipit: [boxen/puppet-homebrew](https://github.com/boxen/puppet-homebrew)
 * Install [Git](http://git-scm.org/) :shipit: [boxen/puppet-git](https://github.com/boxen/puppet-git)

##### Ruby

 * Install [Ruby Version Manager (RVM)](https://rvm.io/) _Note: [RBenv](https://github.com/sstephenson/rbenv) is a popular alternative. We have no reason to switch, and it is a new interface to learn, but it seems to be comparably good._ :x: _There are several on Github, none developed specifically for Boxen. The most active, [blt04/puppet-rvm](https://github.com/blt04/puppet-rvm), is specifically for installing system RVM (as root), which we do not want to do. Is there a lightweight way to run shell scripts with puppet? Installing RVM (and even the Rubies and Gems below) are simple one-liners when the requirements are met! [jfryman/puppet-rvm](https://github.com/jfryman/puppet-rvm) is promising: he works for GitHub. The others are: [fup/puppet-rvm](https://github.com/fup/puppet-rvm) and [rtyler/puppet-rvm](https://github.com/rtyler/puppet-rvm)._
   * Install [Rubies](http://www.ruby-lang.org/en/)
      * 1.9.3-p392
      * 2.0.0-p0
   * Install Gems _Most gems will be installed by bundler on behalf of the individual projects that require them. There are, however, a few global gems, not specified by Gemfiles, but required nonetheless_
     * [Bundler](http://gembundler.com/) _For managing projects' dependencies_
     * [Capistrano](http://capistranorb.com/) _For deploying_
     * [rvm-capistrano](https://github.com/wayneeseguin/rvm-capistrano) _Because we deploy to servers that run RVM_
     * [Powder](https://github.com/Rodreegez/powder) _Shortcuts for managing Pow_
 * Install [Pow](http://pow.cx/) _Pow is used to run applications locally APPNAME.dev. This is useful when you need multiple applications running on your local computer in order to develop. For example, Unite relies on both Members (@ 360.dev) and Epic Auth (@ epic-auth.dev)._ :x:
 
##### Databases

 * Install [MySQL](http://dev.mysql.com/downloads/mysql/5.1.html#downloads) _I believe the version we run is 5.1_ :shipit: [boxen/puppet-mysql](https://github.com/boxen/puppet-mysql) _uses Homebrew_
 * Install [Postgres](http://www.postgresql.org/download/macosx/) _I believe [Postgres.app](http://postgresapp.com/) is the best way of installing this_  :shipit: [boxen/puppet-postgresql](https://github.com/boxen/puppet-postgresql) _uses Homebrew to compile postgres, not Postgres.app..._
 * Install [Redis](http://redis.io/) _for Resque_ :shipit: [boxen/puppet-redis](https://github.com/boxen/puppet-redis)

##### Packages

 * Install [ImageMagick](http://www.imagemagick.org/) _used by most apps that do any image resizing or processing_ :shipit: [boxen/puppet-imagemagick](https://github.com/boxen/puppet-imagemagick)
 * Install [pdftk](http://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/) _used by Doctrinal Review to modify PDF metadata_ :x:
 * Install [mdb-tools 0.7](https://github.com/brianb/mdbtools) _used by Members to import Shepherd's Staff data_ :x:
 * Install [phantomjs](http://phantomjs.org/) _used to run integration tests headlessly_ :shipit: [boxen/puppet-phantomjs](https://github.com/boxen/puppet-phantomjs)

##### Applications

 * Install [Git Tower](http://www.git-tower.com/)
 * Install [TextMate](http://macromates.com/) and several bundles: :shipit: [boxen/puppet-textmate](https://github.com/boxen/puppet-textmate)
   * The [RailsCasts TextMate Theme](http://railscasts.com/about)
   * The [CoffeeScript Bundle](https://github.com/jashkenas/coffee-script-tmbundle)
   * The [Cucumber Bundle](https://github.com/cucumber/cucumber-tmbundle)
   * The [Handlebars Bundle](https://github.com/drnic/Handlebars.tmbundle)
   * The [SCSS Bundle](https://github.com/kuroir/SCSS.tmbundle)
   * [PeepOpen](https://peepcode.com/products/peepopen)
 * Install [Jumpcut](http://jumpcut.sourceforge.net/) _for clipboard buffering_ :shipit: [boxen/puppet-jumpcut](https://github.com/boxen/puppet-jumpcut)
 * Install [ImageOptim](http://imageoptim.com/) _for optimizing images for the web_ :shipit: [webflo/imageoptim](https://github.com/webflo/puppet-imageoptim)
 * Install [GitX](https://github.com/boxen/puppet-gitx) _useful for viewing history_ :shipit: [boxen/puppet-gitx](https://github.com/boxen/puppet-gitx)
 * Install [Caffeine](http://lightheadsw.com/caffeine/) _useful when demoing_ :shipit: [boxen/puppet-caffeine](https://github.com/boxen/puppet-caffeine)

##### Browsers

 * Install [Google Chrome](https://www.google.com/intl/en/chrome/browser/) :shipit: [boxen/puppet-chrome](https://github.com/boxen/puppet-chrome)
 * Install [Firefox](http://www.mozilla.org/en-US/firefox/new/) :shipit: [boxen/puppet-firefox](https://github.com/boxen/puppet-firefox)

##### Configuration

 * Clone the [EP toolchain](https://github.com/concordia-publishing-house/ep) to `~/.ep` and run `ep config all` _to write the locations of our various servers to_ `~/.ssh/config` _and various test domains to_ `/etc/hosts`.
 * [Generate an SSH Key and add it your GitHub account](https://help.github.com/articles/generating-ssh-keys#platform-mac)




## Getting Started


### Conflicts 

There are a few potential conflicts to keep in mind.
Boxen does its best not to get in the way of a dirty system,
but you should check into the following before attempting to install your
boxen on any machine (we do some checks before every Boxen run to try
and detect most of these and tell you anyway):

* Boxen __requires__ at least the Xcode Command Line Tools installed.
* Boxen __will not__ work with an existing rvm install.
* Boxen __may not__ play nice with an existing rbenv install.
* Boxen __may not__ play nice with an existing chruby install.
* Boxen __may not__ play nice with an existing homebrew install.
* Boxen __may not__ play nice with an existing nvm install.
* Boxen __recommends__ installing the full Xcode.


### Dependencies

**Install the Xcode Command Lines Tools and/or full Xcode.**
This will grant you the most predictable behavior in building apps like
MacVim.

How do you do it?

1. Install Xcode from the Mac App Store.
1. Open Xcode.
1. Open the Preferences window (`Cmd-,`).
1. Go to the Downloads tab.
1. Install the Command Line Tools.


### Getting Boxen

``` sh
sudo mkdir -p /opt/boxen
sudo chown ${USER}:admin /opt/boxen
git clone git@github.com:concordia-publishing-house/boxen.git /opt/boxen/repo
```


### Using Boxen

Here's how to run Boxen on your laptop:

``` sh
cd /opt/boxen/repo
script/boxen
```

It should run successfully, and should tell you to source a shell script
in your environment.

For users without a bash or zsh config or a `~/.profile` file,
Boxen will add a line that looks like this to the file:

``` sh
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
```

Once your shell is ready, open a new tab/window in your Terminal
and you should be able to successfully run `boxen --env`.
If that runs cleanly, you're in good shape.




## Hacking on Boxen


### The Puppetfile

You can add modules of configuration by editing the `Puppetfile` much
as you would a `Gemfile`. The `Puppetfile` tells Boxen where to find the
modules.

It seems that you can use an Puppet modules, but the modules at
[github.com/boxen](https://github.com/boxen) have all been tested to be
compatible with Boxen.

Here's a sample `Puppetfile`:

``` ruby
# Core modules for a basic development environment.

github "dnsmasq",  "1.0.0"
github "gcc",      "1.0.0"
github "git",      "1.0.0"
github "homebrew", "1.0.0"
github "hub",      "1.0.0"
github "inifile",  "0.9.0", :repo => "cprice-puppet/puppetlabs-inifile"
github "nginx",    "1.0.0"
github "nodejs",   "1.0.0"
github "nvm",      "1.0.0"
github "ruby",     "1.0.0"
github "stdlib",   "3.0.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",     "1.0.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "java",     "1.0.5"
```

In the above snippet of a customized Puppetfile, the bottom line
includes the Java module from Github using the tag "1.0.5" from the github repository
"boxen/puppet-java".  The function "github" is defined at the top of the Puppetfile
and takes the name of the module, the version, and optional repo location:

``` ruby
def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end
```

Finally, you can now include the optional module in your site.pp or mypersonal.pp file like this:

``` puppet
# include the java module referenced in my Puppetfile with the line
# github "java",     "1.0.5"
include java
```


### Node definitions

Puppet has the concept of a
['node'](http://docs.puppetlabs.com/references/glossary.html#agent),
which is essentially the machine on which Puppet is running. Puppet looks for
[node definitions](http://docs.puppetlabs.com/learning/agent_master_basic.html#node-definitions)
in the `manifests/site.pp` file in the Boxen repo. You'll see a default node
declaration that looks like the following:

``` puppet
node default {
  # core modules, needed for most things
  include dnsmasq

  # more...
}
```


### How Boxen interacts with Puppet

Boxen runs everything declared in `manifests/site.pp` by default.
But just like any other source code, throwing all your work into one massive
file is going to be difficult to work with. Instead, we recommend you
use modules in the `Puppetfile` when you can and make new modules
in the `modules/` directory when you can't. Then add `include $modulename`
for each new module in `manifests/site.pp` to include them.
One pattern that's very common is to create a module for your organization
(e.g., `modules/github`) and put an environment class in that module
to include all of the modules your organization wants to install for
everyone by default. An example of this might look like so:

``` puppet
# modules/github/manifests/environment.pp

 class github::environment {
   include github::apps::mac

   include ruby::1-8-7

   include projects::super-top-secret-project
 }
```

If you'd like to read more about how Puppet works, we recommend
checking out [the official documentation](http://docs.puppetlabs.com/)
for:

 * [Modules](http://docs.puppetlabs.com/learning/modules1.html#modules)
 * [Classes](http://docs.puppetlabs.com/learning/modules1.html#classes)
 * [Defined Types](http://docs.puppetlabs.com/learning/definedtypes.html)
 * [Facts](http://docs.puppetlabs.com/guides/custom_facts.html)


### Creating a personal module

See [the documentation in the
`modules/people`](modules/people/README.md)
directory for creating per-user modules that don't need to be applied
globally to everyone.


### Creating a project module

See [the documentation in the
`modules/projects`](modules/projects/README.md)
directory for creating organization projects (i.e., repositories that people
will be working in).




## The Plan

The plan is to customize Boxen to automatically configure our development environment,
find the modules we need to install the components we need or creating modules for
tools we can't find.

When we've finished setting Boxen up (using Kendall's laptop as a guinea pig),
we'll run it on all of our laptops and standardize our environment.

If we've created any modules, we'll share them with the Boxen organization by
filing an issue on [this repo](https://github.com/boxen/our-boxen) and linking to the module.

Finally, we'll set up [Boxen Web](https://github.com/boxen/boxen-web) on a VM
and use it to synchronize our configuration.



### Help

Use Issues or #boxen on irc.freenode.net.
