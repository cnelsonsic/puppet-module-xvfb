class xvfb {
  package { 'xvfb':
    ensure => installed,
  }

  file { '/etc/init.d/xvfb':
    content => template('xvfb/xvfb.init'),
    mode    => '0755',
  }

  service { 'xvfb':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

  Package['xvfb'] -> File['/etc/init.d/xvfb'] -> Service['xvfb']
}
