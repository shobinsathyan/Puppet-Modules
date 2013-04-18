# Shobin Sathyan ssathyan@nds.com
class ntp {
    package { ntp:
        ensure => installed,
    }
}

define ntp_conf($ntpservers) {
    file { "/etc/ntp.conf":
        owner   => root,
        group   => root,
        mode    => 644,
	ensure => present,
        content => template("ntp/ntp.conf.erb")
    }
	file { "/etc/ntp/step-tickers":
 	owner => root,
 	group => root,
 	mode => 644,
	 content => template("ntp/ntp-step-tickers.erb"),
 	require => Package["ntp"];
   }
    service { "ntpd": 
        ensure => running,
        enable => true,
        subscribe => File["/etc/ntp.conf"]
    }
}
