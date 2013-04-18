import "/etc/puppet/manifests/templates.pp"
import "hpserver.pp"
Exec { path => "/usr/bin:/usr/sbin/:/bin:/sbin" }
