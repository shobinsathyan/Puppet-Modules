# Shobin Sathyan ssathyan@nds.com
class telnet {
#   	exec {"cleanall":
#                command => "yum clean all", }
#	exec {"makecache":
#              	command => "yum makecache", }
    	package { telnet:
        	ensure => "latest" }
        #	ensure => "absent" }
}
