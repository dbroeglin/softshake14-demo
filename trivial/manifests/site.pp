class ssh {
    package { openssh: ensure => installed }
    file { "/etc/ssh/sshd_config":
        name    => "/etc/ssh/sshd_config",
        owner   => root, group => root,
        source  => "file:///vagrant/sshd/sshd_config",
        require => Package[openssh]
    }
    service { sshd:
        ensure => running,
        subscribe => [
          Package[openssh],
          File["/etc/ssh/sshd_config"]]
    }
}

node 'trivial.demo.softshake' {
  include ssh
}
