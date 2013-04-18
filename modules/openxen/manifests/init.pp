#OPENXEN module to setup a freshly kickstarted XEN host
class openxen inherits xenhost {
       
#        package { 'xen.x86_64':
#                    ensure => latest }
#        package { 'kernel-xen.x86_64':
#                ensure => latest }
 
        service { "network": 
  	       	ensure => running,
        	enable => true, }

}

#define vlan($vlanid, $interface, $bridge) {
#	file { "/etc/sysconfig/network-scripts/ifcfg-$interface.$vlanid":
#        owner   => root,
#        group   => root,
#        mode    => 644,
#        ensure => present,
#        content => template("openxen/vlan.erb")}
#}

#define bridge($name, $address, $netmask, $gateway) {
#	file { "/etc/sysconfig/network-scripts/ifcfg-$name":
#        owner   => root,
#        group   => root,
#        mode    => 644,
#        ensure => present,
#        content => template("openxen/bridge.erb")}
