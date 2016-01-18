class ep::default {
  require boxen::config
  require homebrew
  require ruby
  require nodejs

  include brewcask
  include mysql
  include sysctl
  include redis
  include xquartz
  include pkgconfig
  include imagemagick
  include phantomjs
  include postgresapp
  include pow
  include pdftk
  include autoconf
  include automake
  include heroku
  include s3cmd

  # Members and Ledger use mdbtools to import Shepherd's Staff databases
  package { 'mdbtools': ensure   => installed, provider => 'homebrew' }

  # CMake is required to build the Ruby gem Rugged (which is used by Houston)
  package { 'cmake': ensure   => installed, provider => 'homebrew' }

  # Rugged requires libssh2 to clone Git repos using SSH
  package { 'libssh2': ensure   => installed, provider => 'homebrew' }

  # Allow the Keycastr installer to enable accessibility access
  sudoers { 'installer':
     users    => $::boxen_user,
     hosts    => 'ALL',
     commands => [
       '(ALL) SETENV:NOPASSWD: /usr/bin/sqlite3',
     ],
     type     => 'user_spec',
   }

  # Use Brewcask to install several apps
  # Note: it seems like this is the way to go for new apps:
  # https://github.com/boxen/our-boxen/issues/683#issuecomment-64502104
  # See https://github.com/caskroom/homebrew-cask
  # See http://caskroom.io/search

  package { 'atom': provider => 'brewcask' }
  package { 'caffeine': provider => 'brewcask' }
  package { 'imageoptim': provider => 'brewcask' }
  package { 'iterm2': provider => 'brewcask' }
  package { 'jumpcut': provider => 'brewcask' }
  package { 'keycastr': provider => 'brewcask', require => Sudoers['installer'] }
  package { 'lastpass': provider => 'brewcask' }
  package { 'licecap': provider => 'brewcask' }
  package { 'screenhero': provider => 'brewcask' }
  package { 'slack': provider => 'brewcask' }
  package { 'sublime-text': provider => 'brewcask' }
  package { 'textmate': provider => 'brewcask' }
  package { 'tower': provider => 'brewcask' }

  # # Use Brewcask to install boot2docker
  # # http://docs.docker.com/installation/mac/
  # package { 'boot2docker': provider => 'brewcask' }

  # Default Ruby
  class { 'ruby::global': version => "2.1.2" }

  # Default Node.js
  class { 'nodejs::global': version => '0.10' }

  # Make sure bundler is always there
  # For installing other dependencies
  ruby_gem { 'bundler for all rubies':
    gem          => 'bundler',
    version      => '~> 1.0',
    ruby_version => '*',
  }

  # Make sure powder is always there
  # For managing pow.cx
  ruby_gem { 'powder for all rubies':
    gem          => 'powder',
    version      => '~> 0.3.0',
    ruby_version => '*',
  }
}
