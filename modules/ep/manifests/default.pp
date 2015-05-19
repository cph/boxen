class ep::default {
  notify { 'installing ep stuff': }
  require boxen::config
  require homebrew
  require ruby

  $version = "2.0.0"

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
  include gitx
  include tower
  include firefox
  include chrome
  include caffeine
  include postgresapp
  include pow
  include pdftk
  include textmate
  #include sublime_text_2
  include iterm2::stable
  include autoconf
  include automake
  include mdbtools
  include heroku
  include s3cmd

  # class { 'ruby::global':
  #   version => $version,
  # }

  # ruby::gem {

  #   "json for ${version}":
  #   gem     => 'json',
  #   ruby    => $version,
  #   version => '1.7.7';

  #   "capistrano for ${version}":
  #   gem     => 'capistrano',
  #   ruby    => $version,
  #   version => '2.14.2';

  #   "rvm-capistrano for ${version}":
  #   gem     => 'rvm-capistrano',
  #   ruby    => $version,
  #   version => '1.2.7';

  #   "powder for ${version}":
  #   gem     => 'powder',
  #   ruby    => $version,
  #   version => '0.2.0';

  #   "faraday for ${version}":
  #   gem     => 'faraday',
  #   ruby    => $version,
  #   version => '0.8.2';

  #   "engineyard for ${version}":
  #   gem     => 'engineyard',
  #   ruby    => $version,
  #   version => '2.1.3';
  # }

}

