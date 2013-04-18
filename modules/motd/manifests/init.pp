# /etc/puppet/modules/motd/manifests/init.pp

class motd {

	file { "/etc/motd":
		owner	=> root,
		group	=> wheel,
		mode	=> 644,
		source	=> "puppet:///modules/motd/motd" }
}
