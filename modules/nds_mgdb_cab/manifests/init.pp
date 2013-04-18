class nds_mgdb_cab {

#$version = "5.0.0-1"
$version = "4.0.1-5"

	group { oracle:
		ensure => present,
		gid => 666 }

	user { oracle:
		ensure      => present,
		uid         => 666,
		gid         => oracle,
		home        => "/home/oracle",
		shell       => "/bin/bash",
		require => Group["oracle"],
		password => '$1$QqLEU3Gk$Il6sYtl0FVk1VhXuyLXW..',
		allowdupe   => false }	

	exec {"makecache":
                	command => "yum makecache",}

 	package { 'nds_blin_env':
                ensure => latest }

	package { 'nds_mgdb_cab':
        	ensure => '4.0.1-5_el5_11g',
		require => Package[nds_blin_env]}

      file { "/opt/nds/":
                ensure  => directory,
                owner   => ndsuser,
                group   => nds ,
                mode    => 755,
        }

	exec {"link":
		unless => "ls -l /opt/nds/ | grep mgdb_cab-$version | grep -v grep 2>/dev/null",	
                require => [File["/opt/nds/"]],
                command => "ln -s /opt/nds/installed/mgdb_cab-$version /opt/nds/mgdb_cab_cabhe ",
		logoutput => true, }
}
