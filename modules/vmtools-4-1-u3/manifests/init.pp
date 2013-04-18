class vmtools-4-1-u3 {
    $mountpoint = "/usr/local/src/puppet"
    $share = "/nfs1/vmtools-4-1-u3"
    $server = "172.17.22.214"
    if $is_virtual == 'true' {
    # we need to mount the nfs share to get at the install script
    exec { "create mountpoint":
        command => "mkdir -p ${mountpoint}",
        unless  => "test -d ${mountpoint}",
    }  
     
    exec { "mount puppetshare":
        command  => "mount -t nfs ${server}:${share} $mountpoint",
        timeout  => 300,
        logoutput => true,
        require  => Exec["create mountpoint"],
    }  
     
    exec { "unmount puppetshare":
        command  => "umount $mountpoint",
        timeout  => 300,
        logoutput => true,
        require  => Exec["install vmwaretools"],
    }  
     
    exec { "install vmwaretools":
        creates  => "/etc/vmware-tools",
        environment => ["PAGER=/bin/cat","DISPLAY=:9"],
        cwd      => "/usr/local/src/puppet/vmware-tools-distrib",
        command  => "./vmware-install.pl -d",
        logoutput => true,
        timeout  => 300,
        require  => Exec["mount puppetshare"],
    }  
     
    service { "vmware-tools":
        ensure => running,
        enable => true,
        hasstatus => false,
        pattern => "vmware-guestd --background",
        require => Exec["install vmwaretools"],
    }   
  }
}
