# Boxen

Boxen automates the configuration of MacBooks.

This is a fork of GitHub's [Boxen](https://github.com/boxen/our-boxen).

#### Purpose

 * To make it fast and easy to enable a new designer or developer to run EP applications
 * To ensure that we're all working with the same tools so that what works on one computer works on another

#### How it works

Boxen uses [Puppet](https://puppetlabs.com/) (see [Getting Started with Puppet](https://github.com/concordia-publishing-house/boxen/blob/master/docs/puppet.md)) which is Ruby software for configuration management. Aspects of machine configuration are broken into modules. You can find quite a few at [github.com/boxen](https://github.com/boxen) and [github.com/puppetlabs](https://github.com/puppetlabs/puppet-postgresql). [puppetlabs/puppet-postgresql](https://github.com/puppetlabs/puppet-postgresql), for example, is a module for installing and configuring Postgres.




## Using Boxen

#### What this will do to your computer

Boxen will install:

  * [Caffeine](http://lightheadsw.com/caffeine/)
  * [Chrome](https://www.google.com/intl/en/chrome/browser/)
  * [GitX](https://github.com/boxen/puppet-gitx)
  * [Homebrew](http://mxcl.github.com/homebrew/)
  * [ImageMagick](http://www.imagemagick.org/)
  * [ImageOptim](http://imageoptim.com/)
  * [iTerm2](http://www.iterm2.com/)
  * [Firefox](http://www.mozilla.org/en-US/firefox/new/)
  * [Jumpcut](http://jumpcut.sourceforge.net/)
  * [MDB Tools 0.7](https://github.com/brianb/mdbtools) _used by Members and Ledger to import Shepherd's Staff data_
  * [MySQL 5.5.20](http://www.mysql.com/)
  * [PDFtk 1.44](http://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/) _used by Doctrinal Review to remove author metadata from PDFs_
  * [PhantomJS 1.9.0](http://phantomjs.org/)
  * [Postgres.app](http://postgresapp.com/)
  * [RBenv](https://github.com/sstephenson/rbenv)
    * Ruby 1.9.3-p392
    * Ruby 2.0.0-p0
  * [Redis](http://redis.io/) (used by [Resque](https://github.com/resque/resque) and [Sidekiq](http://sidekiq.org/))
  * [TextMate 1.5.11](http://macromates.com/)


#### Prerequisites

You must have these things in place to use Boxen:

  * OSX Mountain Lion
  * [Git](http://git-scm.org/) (There's an easy installer on their web site)
  * [Xcode](https://itunes.apple.com/us/app/xcode/id497799835?mt=12) (Install this from the App Store)
  * [XCode Commandline Tools](https://developer.apple.com/downloads)
  * A GitHub account with pull access to concordia-publishing-house/boxen ([how to generate an SSH Key and add it your GitHub account](https://help.github.com/articles/generating-ssh-keys#platform-mac))
  
Boxen does its best not to get in the way of a dirty system,
but you should check into the following before attempting to install your
boxen on any machine (we do some checks before every Boxen run to try
and detect most of these and tell you anyway):

* Boxen __requires__ at least the Xcode Command Line Tools installed.
* Boxen __will not__ work with an existing rvm install.
* Boxen __may not__ play nice with a GitHub username that includes dash(-)
* Boxen __may not__ play nice with an existing rbenv install.
* Boxen __may not__ play nice with an existing chruby install.
* Boxen __may not__ play nice with an existing homebrew install.
* Boxen __may not__ play nice with an existing nvm install.
* Boxen __recommends__ installing the full Xcode.



#### Getting Boxen

Open your Terminal and enter the following command to clone Boxen to `opt/boxen/repo`:

``` sh
sudo mkdir -p /opt/boxen

sudo chown ${USER}:admin /opt/boxen
git clone git@github.com:concordia-publishing-house/boxen.git /opt/boxen/repo
```


#### Using Boxen

The following command will run Boxen (without requiring Full-Disk Encryption):

``` sh
cd /opt/boxen/repo
script/boxen --no-fde
```

Keep in mind this requires you to encrypt your hard drive by default.
If you do not want to do encrypt your hard drive, you can use the `--no-fde`.

```
./script/boxen --no-fde
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


#### Troubleshooting

Due to issues with switching the default version of Ruby you'll have to `bundle install` then run `boxen` again.

``` sh
bundle install
boxen
```

This should get all the default rubygems installed.




## Hacking on Boxen


#### To Do

##### These are in the Puppetfile, but I don't think Boxen successfully installed them:

  * [Git Tower](http://www.git-tower.com/)
  * [Pow](http://pow.cx/): `curl get.pow.cx | sh`

##### Tweaks to existing packages to make the experience smoother:

  * Symlink mysql.sock: `ln -s /opt/boxen/data/mysql/socket /tmp/mysql.sock`
  * Put Postgres.app in PATH ahead of usr/bin: `export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH`
  * Start Postgres.app and configure to "Automatically Start on Login"
  * Add Jumpcut to Login Items
  * Ruby 2.0.0-p247

##### These aren't in the Puppetfile:

  * TextMate Bundles:
    * The [CoffeeScript Bundle](https://github.com/jashkenas/coffee-script-tmbundle)
    * The [Cucumber Bundle](https://github.com/cucumber/cucumber-tmbundle)
    * The [Handlebars Bundle](https://github.com/drnic/Handlebars.tmbundle)
    * The [SCSS Bundle](https://github.com/kuroir/SCSS.tmbundle)
  * The [Heroku Toolbelt](https://github.com/boxen/puppet-heroku)
  * [s3cmd](http://s3tools.org/s3cmd), Amazon's command line S3 client _Can be installed with Homebrew_
  * Ruby gems: `powder`, `capistrano`, `engineyard`
  * [Dash](https://itunes.apple.com/us/app/dash-docs-snippets/id458034879?mt=12)
  * [KeyCastr](http://download.cnet.com/KeyCastr/3000-2075_4-125977.html) _for pairing_
  * [GitHub for Mac](http://mac.github.com/)
  * [MongoDB](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-os-x/) _Errbit's database_

##### Candidates:

  * LastPass extension for Chrome, Firefox, and Safari
  * [RailsCasts theme for TextMate](http://railscasts.com/about)
  * Activate locate: `sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist`

##### Other

  * Share new modules with Boxen by filing an issue on [this repo](https://github.com/boxen/our-boxen) and linking to the module.
  * Install [Boxen Web](https://github.com/boxen/boxen-web) on a VM and use it to synchronize our configuration.


#### The Puppetfile

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
includes the Java module from Github using the tag "1.1.0" from the github repository
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

#### Node definitions

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


#### How Boxen interacts with Puppet

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


#### Creating a personal module

See [the documentation in the
`modules/people`](modules/people/README.md)
directory for creating per-user modules that don't need to be applied
globally to everyone.


#### Creating a project module

See [the documentation in the
`modules/projects`](modules/projects/README.md)
directory for creating organization projects (i.e., repositories that people
will be working in).


#### Help

Use Issues or #boxen on irc.freenode.net.
