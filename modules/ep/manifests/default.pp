class ep::default {
  notify { 'installing ep stuff': }
  require boxen::config

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
  #include pdftk
  #include textmate
  #include sublime_text_2
  #include iterm2::stable
  include autoconf
  include automake
  include libtool
  #include libffi

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
  package { 'glib':
    ensure => installed,
    provider => homebrew,
  }

  $mdbtools_path = "/opt/boxen/mdbtools"

  repository { 'mdbtools repo':
    source   => 'brianb/mdbtools',
    provider => 'git',
    path     => $mdbtools_path,
  }

  exec { 'install mdbtools':
    command => 'sh autogen.sh && make && make install',
    cwd     => $mdbtools_path
  }

  exec { 'ldconfig':
    command => 'ldconfig'
  }

  Package['glib'] -> Repository['mdbtools repo'] -> Exec['install mdbtools'] -> Exec['ldconfig']
  */
}

