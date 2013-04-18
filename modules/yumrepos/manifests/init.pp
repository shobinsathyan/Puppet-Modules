class yumrepos { }

file { "/etc/yum.repos.d":
        owner => root,
        group => root,
        purge => true,
        recurse => true,
        force => true, }

define repo($repo_name, $repo_url) {
	file { "$repo_name":
	path => "/etc/yum.repos.d/$repo_name.repo",
	owner => root,
	group => root,
	mode =>	 644,
	content => template("yumrepos/repotemplate.erb"),}
}
