# Shobin Sathyan ssathyan@nds.com

class ifconfig { }

define interface($device, $address, $netmask, $gateway) {
    file { "/etc/sysconfig/network-scripts/ifcfg-$device":
        owner   => root,
        group   => root,
        mode    => 644,
	ensure => present,
	notify => Service['network'],
        content => template("ifconfig/ifconfig.erb") }
    service { "network": 
        hasstatus => false,
        ensure => running,
        enable => true,
        subscribe => File["/etc/sysconfig/network-scripts/ifcfg-$device"]}
}
