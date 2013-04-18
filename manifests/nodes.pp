node 'spacewalk.uk.nds.com' inherits basenode { include ifconfig
interface {eth0:
        device => 'eth0',
        address => '172.17.22.213',
        netmask => '255.255.254.0',
        gateway => '172.17.23.254'}
}

node 'scsi-store.nds-abs.com' inherits dev_basenode {
include motd
include putty-keys
include yumrepos
   repo { base:
          repo_name => 'base',
    	  repo_url => 'http://172.17.22.214/repos/CentOS/',
       }

   repo { extras:
          repo_name => 'extras',
    	  repo_url => 'http://mirror.centos.org/centos/5/extras/x86_64/',
       }

}
