#######################################################################
node 'openxen-puppet.uk.nds.com' inherits xen_host { include xenhost
include openxen
include motd
include xennode

# This section starts the VM definations
# Start defining the VM's here.
xen_vm { xentest2:
        vm_name => 'xentest2',
        vm_memory => '512',
        vm_cpu => '1',
        vm_bridge => 'xenbr0',
        vm_vg => 'VolGroup00',
        vm_fqdn => 'xentest2.uk.nds.com',
        vm_size => '5G',
        vm_mac => '00:16:3e:00:00:01',
        ks_ip => '172.17.22.214' }
}

node 'xentest2.uk.nds.com' inherits dev_basenode { 
#include ifconfig
#interface {eth0:
#        device => 'eth0',
#        address => '172.17.22.220',
#        netmask => '255.255.254.0',
#        gateway => '172.17.23.254'}

include motd
include telnet
}
