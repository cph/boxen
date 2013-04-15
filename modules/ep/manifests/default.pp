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
  include xquartz
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
  #include libffi
  #include mdbtools
  #include textmate
  #include sublime_text_2
  #include iterm2::stable
  include autoconf
  include automake

  class { 'ruby::global':
    version => $version,
  }

  ruby::gem {

    "json for ${version}":
    gem     => 'json',
    ruby    => $version,
    version => '1.7.7';

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

  file { "${profile}":
    ensure => present,
    before => Exec['add bash-completion to .profile'],
  }

  exec { 'add bash-completion to .profile':
    path => "/bin:/usr/bin",
    command => "echo '\n${bash_completion}' >> ${profile}",
    unless => "grep -c 'bash completion' ${profile}",
  }

  $bash_profile = "/Users/${::luser}/.bash_profile"
  $bash_profile_source = 'if [ -f ~/.profile ]; then\n    source ~/.profile\nfi'

  file { "${bash_profile}":
    ensure => present,
    before => Exec['add source .profile to .bash_profile'],
  }

  exec { 'add source .profile to .bash_profile':
    path => "/bin:/usr/bin",
    command => "echo '\n${bash_profile_source}' >> ${bash_profile} && source ${bash_profile}",
    unless => "grep -c 'source ~/.profile' ${bash_profile}",
  }

  

  exec { "install glib":
    command => "brew boxen-install glib",
    before  => Package["mdbtools"],
    cwd     => "/Users/${::luser}",
  }

  package { 'mdbtools':
    ensure => installed,
    provider => homebrew,
  }
  

  #package { 'pdftk': 
  #  ensure => installed,
  #  source => 'http://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/pdftk-1.44-osx10.6.dmg',
  #  provider => pkgdmg,
  #}



}

