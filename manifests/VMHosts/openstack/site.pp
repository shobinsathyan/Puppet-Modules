import "/etc/puppet/manifests/templates.pp"
import "openstack.pp"
Exec { path => "/usr/bin:/usr/sbin/:/bin:/sbin" }
