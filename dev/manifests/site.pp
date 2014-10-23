Exec {
  path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ]
}
node 'dev.demo.softshake' {

    class { '::ntp': }
    class { 'java': 
    } -> class { "maven::maven":
        version => "3.1.1", 
        repo => {
            url => "http://repo.maven.apache.org/maven2",
        }
    }
    class { "servicemix::servicemix":
      owner => "vagrant",
      group => "vagrant"
    }
}

node /^(qa|staging|prod)\.demo\.softshake$/ {
    class { '::ntp': }
    class { 'java': }
    class { "servicemix::servicemix":
      owner => "vagrant",
      group => "vagrant"
    }
}
