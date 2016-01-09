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

  # Use Homebrew directly to install several things
  package { 'mdbtools':
    ensure   => installed,
    provider => 'homebrew' }

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

  package { 'caffeine': provider => 'brewcask' }
  package { 'imageoptim': provider => 'brewcask' }
  package { 'iterm2': provider => 'brewcask' }
  package { 'jumpcut': provider => 'brewcask' }
  package { 'keycastr': provider => 'brewcask', require => Sudoers['installer'] }
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
