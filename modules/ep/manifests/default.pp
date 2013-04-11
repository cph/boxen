class ep::default {
  notify { 'installing ep stuff': }
  require boxen::config
  require homebrew
  require ruby

  $profile = "/Users/${::luser}/.profile"
  $bash_completion = "# git bash completion via boxen\nif [ -f /opt/boxen/homebrew/etc/bash_completion ]; then\n. /opt/boxen/homebrew/etc/bash_completion\nfi"
  $version = "1.9.3-p392"

  # CPH defaults
  #include mysql # TODO: custom root db setup, prolly need to fork puppet-mysql
  #include sysctl
  #include redis
  #include xquartz
  #include imagemagick
  #include phantomjs
  #include jumpcut
  #include imageoptim
  #include gitx
  #include git_tower
  #include firefox
  #include chrome
  #include caffeine
  #include postgresapp
  include pow
  #include repository
  include pdftk
  include mdbtools
  #include textmate
  #include sublime_text_2
  #include iterm2::stable
  include autoconf
  include automake
  include libffi

  class { 'ruby::global':
    version => $version,
  }

  ruby::gem { 
    "capistrano for ${version}":
    gem     => 'capistrano',
    ruby    => $version,
    version => '2.14.2';

    "rvm-capistrano for ${version}":
    gem     => 'rvm-capistrano',
    ruby    => $version,
    version => '1.2.7';

    "powder for ${version}":
    gem     => 'powder',
    ruby    => $version,
    version => '0.2.0';

    "faraday for ${version}":
    gem     => 'faraday',
    ruby    => $version,
    version => '0.8.2';
  }

  package { 'bash-completion':
    ensure => installed,
    provider => homebrew,
  }

  #package { 'mdbtools':
  #  ensure => installed,
  #  provider => homebrew,
  #}

  file { "/Users/${::luser}/.profile":
    ensure => present,
  }

  exec { 'add bash-completion to .profile':
    path => "/bin:/usr/bin",
    command => "echo '\n\n${bash_completion}' >> ${profile}",
    unless => "grep -c 'bash completion' ${profile}",
  }

  /*

  exec { "install glib":
    command => "brew boxen-install glib",
    before => Package["mdbtools"],
  }

  package { 'mdbtools':
    ensure => installed,
    provider => homebrew,
  }
  */

  #package { 'pdftk': 
  #  ensure => installed,
  #  source => 'http://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/pdftk-1.44-osx10.6.dmg',
  #  provider => pkgdmg,
  #}



}

