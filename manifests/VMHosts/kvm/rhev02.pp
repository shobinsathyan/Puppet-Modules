#######################################################################
node 'test1.uk.nds.com' inherits dev_basenode {
include motd
include telnet
}

node 'test2.uk.nds.com' inherits dev_basenode {
include motd
include telnet
include yumrepos
repo { base:
        repo_name => 'base',
        repo_url => 'http://172.17.22.214/repos/CentOS/',
    } 
}

node 'test3.uk.nds.com' inherits dev_basenode {
include motd
include telnet
include yumrepos
repo { base:
        repo_name => 'base',
        repo_url => 'http://172.17.22.214/repos/CentOS/',
      }

}

