# /etc/puppet/modules/putty-keys/manifests/init.pp

class putty-keys {

file { "/root/.ssh":
        ensure  => directory,
        owner   => root,
        group   => root,
        mode    => 700,
    }

    file { "/root/.ssh/authorized_keys2":
	ensure  => present,
	owner	=> root,
	group	=> root,
	mode	=> 600,
	source	=> "puppet:///modules/putty-keys/authorized_keys2", }
}
