class testing {

  file { "zen.txt":     #set the full path or the file name here
      ensure => file,
      owner => 'root',
      group => 'root',
      mode => '0755',
      source => "/etc/puppetlabs/puppet/modules/testing/zen.txt",
      path => "/var/tmp/zen.txt",
      require => Exec["check_dir"],
      audit =>'all' ,    #set audit here so that you can see changes if any during a puppet run. Feel free to skip this.
 }

  exec { "check_dir":
      command => '/bin/true',
      onlyif => '/usr/bin/test -d  /var/tmp/',
 }

}
