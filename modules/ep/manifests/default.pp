class ep::default {
  notify { 'installing ep stuff': }
  
  # CPH defaults
  include mysql # TODO: custom root db setup, prolly need to fork puppet-mysql
  include sysctl
  include redis
  include xquartz
  include imagemagick
  include phantomjs
  include jumpcut
  include imageoptim
  include gitx
  include git_tower
  include firefox
  include chrome
  include caffeine
  include postgresapp
  include pow
  include textmate
  include sublime_text_2
}
