class testing {

file { "zen.txt":
ensure => file,
owner => 'root',
group => 'root',
mode => '0755',

source => "/etc/puppetlabs/puppet/modules/testing/zen.txt",

path => "/var/tmp/zen.txt",
require => Exec["check_dir"],
audit =>'all' ,
}

exec { "check_dir":
command => '/bin/true',
onlyif => '/usr/bin/test -d  /var/tmp/',
}

}
