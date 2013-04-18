class openxennode { }

define openxen_vm($vm_name, $vm_memory, $vm_cpu, $vm_bridge, $vm_vg, $vm_fqdn, $vm_size, $vm_mac, $ks_ip) {
#	logical_volume { "$vm_name":
#		ensure => present,
#		volume_group => "$vm_vg",
#		size => "$vm_size" }

#        exec { "/dev/$vm_vg/$vm_name":
#	command => "lvcreate -L +$vm_size -n $vm_name $vm_vg"}
 
	file { "/usr/xenvms/$vm_name":
		ensure => directory,
		recurse => true }
	file { "install-config-$vm_name":
		path => "/usr/xenvms/$vm_name/install-config",
		owner => root,
		group => root,
		mode =>	 777,
		content => template("openxennode/vm-install.erb"),}
	file { "running-config-$vm_name":
		path => "/usr/xenvms/$vm_name/running-config",
		owner => root,
		group => root,
		mode =>  777,
		content => template("openxennode/vm-config.erb"),}
}
