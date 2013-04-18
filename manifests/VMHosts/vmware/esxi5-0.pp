node 'mysql-test.nds-abs.com' inherits dev_basenode {
include motd
include putty-keys
include proxy
include yumrepos
   repo { base:
          repo_name => 'base',
          repo_url => 'http://172.17.22.214/repos/CentOS/',
       }

include vmtools-5-0
include mysql::nnodb
}

node 'test5.nds-abs.com' inherits dev_basenode {
include motd
include putty-keys
include yumrepos
   repo { base:
          repo_name => 'base',
          repo_url => 'http://172.17.22.214/repos/CentOS/',
       }
include vmtools-5-0
}
