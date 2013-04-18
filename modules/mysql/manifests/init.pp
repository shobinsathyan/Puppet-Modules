class mysql {
	class nnodb {
                exec {"cleanall":
                        command => "yum clean all" }
        	exec {"makecache":
                	command => "yum makecache",
                       	}
        	package { 'mysql-server':
                	ensure => "5.0.77-4.el5_5.4",
                	}
	 }

}
