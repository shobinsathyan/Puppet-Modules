#XENHOST module to setup a freshly kickstarted XEN host
class xenhost {
	file { "/usr/xenguests":
                ensure => directory,
                recurse => true }
	file { "/usr/xenguests/vmlinuz":
                owner   => root,
                group   => root,
                mode    => 644,
                source  => "puppet:///xenhost/vmlinuz", }
        file { "/usr/xenguests/initrd.img":
                owner   => root,
                group   => root,
                mode    => 644,
                source  => "puppet:///xenhost/initrd.img", }
        file { "/etc/sysconfig/network-scripts/ifcfg-xenbr0":
                owner   => root,
                group   => root,
                mode    => 644,
                source  => "puppet:///xenhost/ifcfg-xenbr0", }
}

#define vlan($vlanid, $interface, $bridge) {
#	file { "/etc/sysconfig/network-scripts/ifcfg-$interface.$vlanid":
#        owner   => root,
#        group   => root,
#        mode    => 644,
#        ensure => present,
#        content => template("xenhost/vlan.erb")}
#}

#define bridge($name, $address, $netmask, $gateway) {
#	file { "/etc/sysconfig/network-scripts/ifcfg-$name":
#        owner   => root,
#        group   => root,
#        mode    => 644,
#        ensure => present,
#        content => template("xenhost/bridge.erb")}
