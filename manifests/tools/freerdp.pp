# Class: openstack_hyper_v::freerdp
#
# This module downloads then installs Cloudbase Solutions FreeRDP tools
#
# Parameters: none
#
# Actions:
#

class openstack_hyper_v::tools::freerdp{

  $rdp_url  = 'http://www.cloudbase.it/downloads/FreeRDP_win32_x86_20121010.zip'
  $rdp_file = 'FreeRDP_win32_x86_20121010.zip'

  commands::download{'FreeRDP-cloudbase':
    url  => $rdp_url,
    file => $rdp_file,
  }

  commands::extract_archive{'FreeRDP-Powershell-Module':
    archivefile => $rdp_file,
  }

  exec { 'install-freerdp-powershell-cmdlet':
    command  => 'Import-Module -Global .\\PSFreeRDP.ps1',
    require  => Commands::Extract_archive['FreeRDP-Powershell-Module'],
    provider => powershell,
    cwd      => "${::temp}\\FreeRDP",
  }

}
