# Shobin Sathyan ssathyan@nds.com

class resolver {
}
define resolv_conf($domainname = "$domain", $searchpath, $nameservers) {

    file { "/etc/resolv.conf":
        owner   => root,
        group   => root,
        mode    => 644,
        content => template("resolver/resolv.conf.erb");
    }
}
