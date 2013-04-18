node basenode {
include proxy
#include ntp
#	 ntp_conf { basenode:
#        ntpservers => ['172.17.22.214', '172.17.22.214']}
#        ntpservers => ['172.17.22.214']}

include resolver
	resolv_conf { basenode: 
        domainname  => 'uk.nds.com',
        searchpath  => ['uk.nds.com'],
        nameservers => ['172.17.22.1']}

include yumrepos
	repo { base:
        repo_name => 'base',
        repo_url => 'http://anorien.csc.warwick.ac.uk/mirrors/CentOS/5.6/os/x86_64/' }
	repo { epel:
	repo_name => 'epel',
	repo_url => 'http://download.fedora.redhat.com/pub/epel/5/x86_64/' }
	repo { extras:
	repo_name => 'extras',
	repo_url => 'http://anorien.csc.warwick.ac.uk/mirrors/CentOS/5.6/extras/x86_64/' }
	repo { contrib:
	repo_name => 'contrib',
	repo_url => 'http://anorien.csc.warwick.ac.uk/mirrors/CentOS/5.6/contrib/x86_64/' }
}

node dev_basenode {
include proxy
include motd
include putty-keys
include resolver
        resolv_conf { dev_basenode:
        domainname  => 'nds-abs.com',
        searchpath  => ['uk.nds.com','nds-abs.com'],
        nameservers => ['172.17.22.1','172.18.253.100']}

include yumrepos
	repo { ndsinfra:
        repo_name => 'ndsinfra',
        repo_url => 'http://172.17.22.214/repos/ndsinfra/' }
}

node xen_host {

include proxy
include resolver
        resolv_conf { xen_host:
        domainname  => 'uk.nds.com',
        searchpath  => ['uk.nds.com','us.nds.com'],
        nameservers => ['172.17.22.1','172.17.22.2'],}

include yumrepos
        repo { base:
        repo_name => 'base',
        repo_url => 'http://172.17.22.214/repos/CentOS/' }
        repo { ndsinfra:
        repo_name => 'ndsinfra',
        repo_url => 'http://172.17.22.214/repos/ndsinfra/' }
}
