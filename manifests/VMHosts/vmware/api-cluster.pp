node 'test.nds-abs.com' inherits dev_basenode {
include motd
include putty-keys
include yumrepos
   repo { base:
          repo_name => 'base',
          repo_url => 'http://172.17.22.214/repos/RHEL/Server/',
       }
#include vmtools-4-1-u3
#include nds_mgdb_cab_rpm
}

node 'default' inherits dev_basenode {
include yumrepos
   repo { base:
          repo_name => 'base',
          repo_url => 'http://172.17.22.214/repos/RHEL/Server/',
       }
include vmtools-5-0
include nds_mgdb_cab_rpm
     version_num { IT38:
		#versionnumber => '4.0.1-5',
		versionnumber => '5.0.0-1',
	      }
}
