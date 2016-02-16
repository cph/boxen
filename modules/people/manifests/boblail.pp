class people::boblail {
  include brewcask

  $home     = "/Users/${::boxen_user}"
  
  repository { "${home}/Me": source  => 'boblail/dotfiles' }

  package { 'dropbox': provider => 'brewcask' }
  package { 'nvalt': provider => 'brewcask' }
  package { 'flux': provider => 'brewcask' }
  package { 'numi': provider => 'brewcask' }
  package { 'sonos': provider => 'brewcask' }
  package { 'cyberduck': provider => 'brewcask' } # for Builder's web services

}
