import "/etc/puppet/manifests/templates.pp"
import "api-cluster.pp"
Exec { path => "/usr/bin:/usr/sbin/:/bin:/sbin" }
