class ep::tmbundles {
  require boxen::config
  # require repository
  notify { 'installing textmate bundles': }
  class textmate_theme {
    
    $textmate_theme_path = "/Users/${::luser}/Library/Application\\ Support/TextMate/Themes"
    
    exec { 'download ${name}':
      command => "curl ${site}/${name}",
      cwd => "${boxen::config::home}/cache",
      creates => '${cwd}/${name}',
    }
    
    exec { 'unzip and install ${name}':
      command => '/usr/bin/unzip -o ${cwd}/${name} -d ${textmate_theme_path}',
    }
    
    Exec['download ${name}'] -> Exec['unzip and install ${name}']
  }

  textmate_theme { 'textmate_theme.zip':
    site => "http://media.railscasts.com/resources",
  }

  class textmate_bundle {
    
    repository { '/Applications/TextMate.app/Contents/SharedSupport/Bundles/${name}.tmbundle':
      source   => $repo,
      provider => 'git',
    }
  }

  textmate_bundle { 'CoffeeScriptBundle':
    repo => 'jashkenas/coffee-script-tmbundle',
  }

  textmate_bundle { 'Cucumber':
    repo => 'cucumber/cucumber-tmbundle',
  }

  textmate_bundle { 'Handlebars':
    repo => 'drnic/Handlebars.tmbundle',
  }

  textmate_bundle { 'SCSS':
    repo => 'kuroir/SCSS.tmbundle',
  }

}