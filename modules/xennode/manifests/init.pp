class xennode { }

define xen_vm($vm_name, $vm_memory, $vm_cpu, $vm_bridge, $vm_vg, $vm_fqdn, $vm_size, $vm_mac, $ks_ip) {

       	#physical_volume { "/dev/cciss/c0d0p2":
    	#ensure => present
	#	}

       # lvm::volume_group { "VolGroup00":
       # ensure => present,
       # physical_volumes => "/dev/cciss/c0d0p2"
       # }

#       logical_volume { "$vm_name":
#		ensure => present,
#		volume_group => "$vm_vg",
#		size => "$vm_size" }

        exec { "lvcreate -L +$vm_size -n $vm_name $vm_vg":
        unless => "lvdisplay | grep -i /dev/$vm_vg/$vm_name",}
 
	file { "/usr/xenguests/$vm_name":
		ensure => directory,
		recurse => true }
	file { "install-config-$vm_name":
		path => "/usr/xenguests/$vm_name/install-config",
		owner => root,
		group => root,
		mode =>	 777,
		content => template("xennode/vm-install.erb"),}
	file { "running-config-$vm_name":
		path => "/usr/xenguests/$vm_name/running-config",
		owner => root,
		group => root,
		mode =>  777,
		content => template("xennode/vm-config.erb"),}
}
