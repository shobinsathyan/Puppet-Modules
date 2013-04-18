# /etc/puppet/modules/proxy/manifests/init.pp

class proxy {

	file { "/etc/profile":
		owner	=> root,
		group	=> root,
		mode	=> 644,
		source	=> "puppet:///modules/proxy/profile", }
}
