class people::boblail {
  include brewcask

  $home     = "/Users/${::boxen_user}"
  
  repository { "${home}/dotfiles": source  => 'boblail/dotfiles' }

  package { 'dropbox': provider => 'brewcask' }
  package { 'nvalt': provider => 'brewcask' }

}
