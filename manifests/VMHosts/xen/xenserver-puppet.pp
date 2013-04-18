#######################################################################
# This Section Define the Virtual Machine Defination                  #
#######################################################################
node 'xenserver-puppet.uk.nds.com' { include xenhost
include xennode
include motd

# Start defining the VM's here.
xen_vm { xentest1:
        vm_name => 'xentest1',
        vm_memory => '512',
	vm_cpu => '1',
        vm_bridge => 'xenbr0',
        vm_vg => 'VG_XenStorage-7c45029b-c632-7bc2-1d58-177d0152382b',
        vm_fqdn => 'xentest1.uk.nds.com',
        vm_size => '5G', 
        vm_mac => '00:23:5e:2e:d2:c3',
        ks_ip => '172.17.22.214' }
}

node 'xentest1.uk.nds.com' inherits dev_basenode { include ifconfig
interface {eth0:
	device => 'eth0',
        address => '172.17.22.220',
        netmask => '255.255.254.0',
        gateway => '172.17.23.254'} 
}
