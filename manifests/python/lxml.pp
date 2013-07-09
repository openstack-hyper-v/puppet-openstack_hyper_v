# Class: openstack_hyper_v::lxml
#
# This bruteforce installs lxm from precompiled binary for windows
#
# Parameters: none
#
# Actions:
#

class openstack_hyper_v::python::lxml{

  $lxml_url   = 'https://pypi.python.org/packages/2.7/l/lxml/lxml-2.3.win32-py2.7.exe#md5=9c02aae672870701377750121f5a6f84'
  $lxml_file = 'lxml-2.3.win32-py2.7.exe'

  Commands::Download['lxml'] -> Commands::Extract_archive['lxml']

  commands::download{'lxml':
    url  => $lxml_url,
    file => $lxml_file,
  }
  commands::extract_archive{'lxml':
    archivefile => $lxml_file,
  }



#  file { 'lxml-2.3-py2.7.egg':
#    ensure  => 'directory',
#    path    => 'C:/Python27/lib/site-packages/lxml-2.3-py2.7.egg',
#    source  => 'puppet:///modules/windows/lxml-2.3-py2.7.egg-info',
#    recurse => true,
#   require => Class['openstack_hyper_v::python', 'openstack_hyper_v::pywin32'],
#  }

#  file { 'lxml':
#    ensure  => 'directory',
#    path    => 'C:/Python27/lib/site-packages/lxml',
#    source  => 'puppet:///modules/windows/lxml',
#    recurse => true,
#   require => Class['openstack_hyper_v::python', 'openstack_hyper_v::pywin32'],
#  }

}
