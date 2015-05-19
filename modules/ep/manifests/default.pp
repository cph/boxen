class ep::default {
  notify { 'installing ep stuff': }
  require boxen::config
  require homebrew
  require ruby

  # CPH defaults
  include mysql
  include sysctl
  include redis
  include xquartz
  include pkgconfig
  include imagemagick
  include phantomjs
  include jumpcut
  include imageoptim
  include tower
  include caffeine
  include postgresapp
  include pow
  include pdftk
  include textmate
  include sublime_text
  include iterm2::stable
  include autoconf
  include automake
  include mdbtools
  include heroku
  include s3cmd

  # Additional Ruby versions
  ruby::version { "2.2.2": }

  # Default Ruby
  class { 'ruby::global':
    version => "2.1.2",
  }

  # Make sure bundler is always there
  ruby_gem { 'bundler for all rubies':
    gem          => 'bundler',
    version      => '~> 1.0',
    ruby_version => '*',
  }

}
