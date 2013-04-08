class ep::default {
  notify { 'installing ep stuff': }
  
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
  #include textmate
  #include sublime_text_2
  #include iterm2::stable

  class { 'ruby::global':
    version => '1.9.3-p392'
  }

  ruby::gem { 
    "bundler for ${version}":
    gem     => 'bundler',
    ruby    => $version,
    version => '1.3.0';

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
  }

  # Git bash completion
  class bash-completion {
    homebrew::formula {
      'bash-completion': ;
    }

    package { 'boxen/brews/bash-completion':
      ensure => '0.4.2';
    }
  }

}

