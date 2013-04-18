class nds_mgdb_cab_rpm { }


define version_num($versionnumber) {
	$version =  $versionnumber

#$version = "4.0.1-5"
#$version = "5.0.0-1"

	group { oracle:
		ensure => present,
		gid => 666 }

	user { oracle:
		ensure      => present,
		uid         => 666,
		gid         => 666,
		home        => "/home/oracle",
		shell       => "/bin/bash",
		require => Group["oracle"],
		password => '$1$QqLEU3Gk$Il6sYtl0FVk1VhXuyLXW..',
		allowdupe   => false }	

     	group { nds:
                ensure => present,
                gid => 667 }

        user { ndsuser:
                ensure      => present,
                uid         => 667,
                gid         => 667,
                home        => "/home/ndsuser",
                shell       => "/bin/bash",
                require => [Group["nds"],File["/home/ndsuser"]],
                password => '$1$QqLEU3Gk$Il6sYtl0FVk1VhXuyLXW..',
                allowdupe   => false } 

	exec {"installrpm":
		unless => "rpm -qa | grep nds_mgdb_cab-${version}_el5_11g | grep -v grep 2>/dev/null",
                require => [File["/home/ndsuser/.ssh/nds-puppet"],File["/opt/nds/rpms"],User["ndsuser"],User["oracle"],Package[nds_blin_env]],
                command => "scp -o 'StrictHostKeyChecking no' -i /home/ndsuser/.ssh/nds-puppet linuxrepo.uk.nds.com:/var/www/html/repos/ndsinfra/nds_mgdb_cab-${version}_el5_11g.x86_64.rpm /opt/nds/rpms/; rpm -ivh /opt/nds/rpms/nds_mgdb_cab-${version}_el5_11g.x86_64.rpm --force;",
		logoutput => true,
	      }


 	package { 'nds_blin_env':
                ensure => latest }

      	file { "/opt/nds/":
                ensure  => directory,
                owner   => ndsuser,
                group   => nds ,
                mode    => 755,
        }

         file { "/opt/nds/rpms":
                ensure  => directory,
                owner   => ndsuser,
                group   => nds ,
                mode    => 755,
        }


  	file { "/home/ndsuser/.ssh/nds-puppet":
        	ensure  => present,
        	owner   => 666,
        	group   => 666,
        	mode    => 600,
        	require => File["/home/ndsuser/.ssh"],
        	source  => "puppet:///modules/nds_mgdb_cab_rpm/nds-puppet",
	}

	file { "/home/ndsuser":
		ensure  => directory,
                owner   => 667,
                group   => 667,
                mode    => 754,
 	}

  	file { "/home/ndsuser/.ssh":
		ensure  => directory,
		owner   => 666,
		group   => 666,
		mode    => 700,
		require => User["ndsuser"],
    	}

	exec {"link":
		unless => "ls -l /opt/nds/ | grep mgdb_cab-$version | grep -v grep 2>/dev/null",	
                require => [File["/opt/nds/"]],
                command => "rm -rf /opt/nds/mgdb_cab_cabhe; ln -s /opt/nds/installed/mgdb_cab-$version /opt/nds/mgdb_cab_cabhe ",
		logoutput => true, 
		}
}
