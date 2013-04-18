# /etc/puppet/modules/ldap/manifests/init.pp

class ldap {

	file { "/etc/ldap.conf":
		owner	=> root,
		group	=> root,
		mode	=> 644,
		source	=> "puppet:///ldap/ldap.conf", }

        file { "/etc/nsswitch.conf":
                owner   => root,
                group   => root,
                mode    => 644,
		require => File["/etc/ldap.conf"],
                source  => "puppet:///ldap/nsswitch.conf", }

        file { "/etc/pam.d/system-auth-ac":
                owner   => root,
                group   => root,
                mode    => 644,
		require => [File["/etc/ldap.conf"],File["/etc/nsswitch.conf"]],
                source  => "puppet:///ldap/system-auth-ac", }
}
