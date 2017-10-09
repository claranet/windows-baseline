title 'Security Options'

#
# 2.3.1 Accounts
#

control 'cis-admin-account-status-2.3.1.1' do
  impact 0.7
  title '2.3.1.1 Ensure Accounts: Administrator account status is set to Disabled'
  desc 'Ensure Accounts: Administrator account status is set to Disabled'
  
  tag cis: ['windows_2012r2:2.3.1.1']
  ref 'CIS Microsoft Windows Server 2012 R2 Benchmark'

  describe security_policy do
    its('Accounts: Administrator account status') { should eq 'Disabled' }
  end
end

control 'cis-accounts-block-microsoft-2.3.1.2' do
  impact 0.7
  title '2.3.1.2 Ensure Accounts: Block Microsoft Accounts is set to Users can\'t log on with Microsoft Accounts'
  desc 'Ensure Accounts: Block Microsoft Accounts is set to Users can\'t log on with Microsoft Accounts'
  
  describe registry_key('HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System') do
    its('NoConnectedUser') { should eq 3 }
  end
end

control 'cis-accounts-guest-account-status-2.3.1.3' do
  impact 0.7
  title '2.3.1.3 Ensure Accounts: Guest account status is set to Disabled'
  desc 'Ensure Accounts: Guest account status is set to Disabled'
  
  describe security_policy do
    its('Accounts: Guest account status') { should eq 'Disabled' }
  end
end

control 'cis-accounts-local-account-blank-passwords-2.3.1.4' do
  impact 0.7
  title '2.3.1.4 Ensure Accounts: Limit local account use of blank passwords to console logon only is set to Enabled'
  desc 'Ensure Accounts: Limit local account use of blank passwords to console logon only is set to Enabled'
  
  describe security_policy do
    its('Accounts: Limit local account use of blank passwords to console logon only') { should eq 'Enabled' }
  end
end

control 'cis-rename-administrator-account-2.3.1.5' do
  impact 0.7
  title '2.3.1.5 Configure Accounts: Rename administrator account'
  desc 'Configure Accounts: Rename administrator account'
  
  describe security_policy do
    its('Accounts: Rename administrator account') { should_not eq 'Administrator' }
  end
end

control 'cis-rename-guest-account-2.3.1.5' do
  impact 0.7
  title '2.3.1.5 Configure Accounts: Rename guest account'
  desc 'Configure Accounts: Rename guest account'

  describe security_policy do
    its('Accounts: Rename guest account') { should_not eq 'Guest' }
  end
end

#
# 2.3.2 Audit
#

control 'cis-audit-subcateogory-override-2.3.2.1' do
  impact 0.7
  title '2.3.2.1 Ensure Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings is set to Enabled'
  desc 'Ensure Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings is set to Enabled'

  describe security_policy do
    its('Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings') { should eq 'Enabled' }
  end
end

control 'cis-shutdown-when-unable-to-log-audits-2.3.2.2' do
  impact 0.7
  title '2.3.2.2 Ensure Audit: Shut down system immediately if unable to log security audits is set to Disable'
  desc 'Ensure Audit: Shut down system immediately if unable to log security audits is set to Disable'
  
  describe security_policy do
    its('Audit: Shut down system immediately if unable to log security audits') { should eq 'Disabled' }
  end
end

#
# 2.3.3 DCOM
#
# This section is intentionally blank and exists to ensure the structure of Windows benchmarks is consistent.
#

#
# 2.3.4 Devices
#

control 'cis-format-media-2.3.4.1' do
  impact 0.7
  title '2.3.4.1 Ensure Devices: Allowed to format and eject removable media is set to Administrators'
  desc 'Ensure Devices: Allowed to format and eject removable media is set to Administrators'
  
  describe security_policy do
    its('Devices: Allowed to format and eject removable media') { should eq 'Administrators' }
  end
end

control 'cis-prevent-printer-drivers-2.3.4.2' do
  impact 0.7
  title '2.3.4.2 Ensure Devices: Prevent users from installing printer drivers is set to Enabled'
  desc 'Ensure Devices: Prevent users from installing printer drivers is set to Enabled'
  
  describe security_policy do
    its('Devices: Prevent users from installing printer drivers') { should eq 'Enabled' }
  end
end

#
# 2.3.5 Domain Controller
#
# TODO:
#

#
# 2.3.6 Domain Member
#

control 'cis-encrypt-sign-channel-data-always-2.3.6.1' do
  impact 0.7
  title '2.3.6.1 Ensure Domain member: Digitally encrypt or sign secure channel data (always) is set to Enabled'
  desc 'Ensure Domain member: Digitally encrypt or sign secure channel data (always) is set to Enabled'
  
  describe security_policy do
    its('Domain member: Digitally encrypt or sign secure channel data (always)') { should eq 'Enabled' }
  end
end

control 'cis-encrypt-channel-data-when-possible-2.3.6.2' do
  impact 0.7
  title '2.3.6.1 Ensure Domain member: Digitally encrypt secure channel data (when possible) is set to Enabled'
  desc 'Ensure Domain member: Digitally encrypt secure channel data (when possible) is set to Enabled'
  
  describe security_policy do
    its('Domain member: Digitally encrypt secure channel data (when possible)') { should eq 'Enabled' }
  end
end

control 'cis-sign-channel-data-when-possible-2.3.6.3' do
  impact 0.7
  title '2.3.6.1 Ensure Domain member: Digitally sign secure channel data (when possible) is set to Enabled'
  desc 'Ensure Domain member: Digitally sign secure channel data (when possible) is set to Enabled'
  
  describe security_policy do
    its('Domain member: Digitally sign secure channel data (when possible)') { should eq 'Enabled' }
  end
end

control 'cis-disable-machine-password-changes-2.3.6.4' do
  impact 0.7
  title '2.3.6.4 Ensure Domain member: Disable machine account password changes is set to Disabled'
  desc 'Ensure Domain member: Disable machine account password changes is set to Disabled'
  
  describe security_policy do
    its('Domain member: Disable machine account password changes') { should eq 'Disabled' }
  end
end

control 'cis-machine-account-password-age-2.3.6.5' do
  impact 0.7
  title '2.3.6.5 Ensure Domain member: Maximum machine account password age is set to 30 or fewer days, but not 0'
  desc 'Ensure Domain member: Maximum machine account password age is set to 30 or fewer days, but not 0'
  
  describe security_policy do
    its('Domain member: Maximum machine account password age') { should be > 0 }
    its('Domain member: Maximum machine account password age') { should be <= 30 }
  end
end

control 'cis-strong-session-key-2.3.6.6' do
  impact 0.7
  title '2.3.6.6 Ensure Domain member: Require strong (Windows 2000 or later) session key is set to Enabled'
  desc 'Ensure Domain member: Require strong (Windows 2000 or later) session key is set to Enabled'
  
  describe security_policy do
    its('Domain member: Require strong (Windows 2000 or later) session key') { should eq 'Enabled' }
  end
end

#
# 2.3.7 Interactive logon
#

control 'cis-logon-dont-display-last-user-2.3.7.1' do
  impact 0.7
  title '2.3.7.1 Ensure Interactive logon: Do not display last user name is set to Enabled'
  desc 'Ensure Interactive logon: Do not display last user name is set to Enabled'
  
  describe security_policy do
    its('Interactive logon: Do not display last user name') { should eq 'Enabled' }
  end
end

control 'cis-logon-ctrl-alt-del-2.3.7.2' do
  impact 0.7
  title '2.3.7.2 Ensure Interactive logon: Do not require CTRL+ALT+DEL is set to Disabled'
  desc 'Ensure Interactive logon: Do not require CTRL+ALT+DEL is set to Disabled'
  
  describe security_policy do
    its('Interactive logon: Do not require CTRL+ALT+DEL') { should eq 'Disabled' }
  end
end

control 'cis-logon-machine-inactivity-2.3.7.3' do
  impact 0.7
  title '2.3.7.3 Ensure Interactive logon: Machine inactivity limit is set to 900 or fewer seconds but not 0'
  desc 'Ensure Interactive logon: Machine inactivity limit is set to 900 or fewer seconds but not 0'
  
  describe security_policy do
    its('Interactive logon: Machine inactivity limit') { should be > 0 }
    its('Interactive logon: Machine inactivity limit') { should be <= 900 }
  end
end

control 'cis-logon-message-text-2.3.7.4' do
  impact 0.7
  title '2.3.7.4 Interactive logon: Message text for users attempting to log on'
  desc 'Interactive logon: Message text for users attempting to log on'
  
  describe security_policy do
    its('Interactive logon: Message text for users attempting to log on') { should_not be '' }
  end
end

control 'cis-logon-message-title-2.3.7.5' do
  impact 0.7
  title '2.3.7.4 Interactive logon: Message title for users attempting to log on'
  desc 'Interactive logon: Message title for users attempting to log on'
  
  describe security_policy do
    its('Interactive logon: Message title for users attempting to log on') { should_not be '' }
  end
end

control 'cis-logon-cache-2.3.7.6' do
  impact 0.7
  title '2.3.7.6 Ensure Interactive logon: Number of previous logons to cache (in case domain controller is not available) is set to 4 or fewer'
  desc 'Ensure Interactive logon: Number of previous logons to cache (in case domain controller is not available) is set to 4 or fewer'
  
  describe security_policy do
    its('Interactive logon: Number of previous logons to cache (in case domain controller is not available)') { should be <= 4 }
  end
end

control 'cis-logon-change-password-prompt-2.3.7.7' do
  impact 0.7
  title '2.3.7.7 Ensure Interactive logon: Prompt user to change password before expiration is set to between 5 and 14 days'
  desc 'Ensure Interactive logon: Prompt user to change password before expiration is set to between 5 and 14 days'

  describe security_policy do
    its('Interactive logon: Prompt user to change password before expiration') { should be >= 5 }
    its('Interactive logon: Prompt user to change password before expiration') { should be <= 14 }
  end
end

control 'cis-logon-require-domain-to-unlock-2.3.7.8' do
  impact 0.7
  title '2.3.7.8 Ensure Interactive logon: Require Domain Controller Authentication to unlock workstation is set to Enabled'
  desc 'Ensure Interactive logon: Require Domain Controller Authentication to unlock workstation is set to Enabled'
  
  describe security_policy do
    its('Interactive logon: Require Domain Controller Authentication to unlock workstation') { should eq 'Enabled' }
  end
end

control 'cis-logon-smartcard-removal-2.3.7.9' do
  impact 0.7
  title '2.3.7.9 Interactive logon: Smart card removal behavior is set to Lock Workstation'
  desc 'Interactive logon: Smart card removal behavior is set to Lock Workstation'
  
  describe security_policy do
    its('Interactive logon: Smart card removal behavior') { should eq 'Lock Workstation' }
  end
end

#
# 2.3.8 Microsoft network client
#

control 'cis-network-digital-sign-always-2.3.8.1' do
  impact 0.7
  title '2.3.8.1 Ensure Microsoft network client: Digitally sign communications (always) is set to Enabled'
  desc 'Ensure Microsoft network client: Digitally sign communications (always) is set to Enabled'
  
  describe security_policy do
    its('Microsoft network client: Digitally sign communications (always)') { should eq 'Enabled' }
  end
end

control 'cis-network-digital-sign-agrees-2.3.8.2' do
  impact 0.7
  title '2.3.8.2 Ensure Microsoft network client: Digitally sign communications (if server agrees) is set to Enabled'
  desc 'Ensure Microsoft network client: Digitally sign communications (if server agrees) is set to Enabled'
  
  describe security_policy do
    its('Microsoft network client: Digitally sign communications (if server agrees)') { should eq 'Enabled' }
  end
end

control 'cis-network-disable-unencrypted-smb-2.3.8.3' do
  impact 0.7
  title '2.3.8.3 Ensure Microsoft network client: Send unencrypted password to third-party SMB servers is set to Disabled'
  desc 'Ensure Microsoft network client: Send unencrypted password to third-party SMB servers is set to Disabled'
  
  describe security_policy do
    its('Microsoft network client: Send unencrypted password to third-party SMB servers') { should eq 'Disabled' }
  end
end

#
# 2.3.9 Microsoft network server
#

control 'cis-network-server-idle-before-suspend-2.3.9.1' do
  impact 0.7
  title '2.3.9.1 Ensure Microsoft network server: Amount of idle time required before suspending session is set to 15 or fewer minute(s), but not 0'
  desc 'Ensure Microsoft network server: Amount of idle time required before suspending session is set to 15 or fewer minute(s), but not 0'
  
  describe security_policy do
    its('Microsoft network server: Amount of idle time required before suspending session') { should be > 0 }
    its('Microsoft network server: Amount of idle time required before suspending session') { should be <= 15 }
  end
end

control 'cis-network-server-digital-sign-always-2.3.9.2' do
  impact 0.7
  title '2.3.9.2 Ensure Microsoft network server: Digitally sign communications (always) is set to Enabled'
  desc 'Ensure Microsoft network server: Digitally sign communications (always) is set to Enabled'
  
  describe security_policy do
    its('Microsoft network server: Digitally sign communications (always)') { should eq 'Enabled' }
  end
end

control 'cis-network-server-digtial-asign-agrees-2.3.9.3' do
  impact 0.7
  title '2.3.9.2 Microsoft network server: Digitally sign communications (if client agrees) is set to Enabled'
  desc 'Microsoft network server: Digitally sign communications (if client agrees) is set to Enabled'
  
  describe security_policy do
    its('Microsoft network server: Digitally sign communications (if client agrees)') { should eq 'Enabled' }
  end
end

control 'cis-network-server-disconnect-clients-2.3.9.3' do
  impact 0.7
  title '2.3.9.3 Ensure Microsoft network server: Disconnect clients when logon hours expire is set to Enabled'
  desc 'Ensure Microsoft network server: Disconnect clients when logon hours expire is set to Enabled'
  
  describe security_policy do
    its('Microsoft network server: Disconnect clients when logon hours expire') { should eq 'Enabled' }
  end
end

control 'cis-network-server-spn-validation-level-2.3.9.4' do
  impact 0.7
  title '2.3.9.4 Ensure Microsoft network server: Server SPN target name validation level is set to Accept if provided by client'
  desc 'Ensure Microsoft network server: Server SPN target name validation level is set to Accept if provided by client'
  
  describe security_policy do
    its('Microsoft network server: Server SPN target name validation level') { should eq 'Accept if provided by client' }
  end
end

#
# 2.3.10 Network access
#

control 'cis-network-access-allow-anonymous-2.3.10.1' do
  impact 0.7
  title '2.3.10.1 Ensure Network access: Allow anonymous SID/Name translation is set to Disabled'
  desc 'Ensure Network access: Allow anonymous SID/Name translation is set to Disabled'
  
  describe security_policy do
    its('Network access: Allow anonymous SID/Name translation') { should eq 'Disabled' }
  end
end

control 'cis-network-access-deny-anonymous-sam-2.3.10.2' do
  impact 0.7
  title '2.3.10.2 Ensure Network access: Do not allow anonymous enumeration of SAM accounts is set to Enabled'
  desc 'Ensure Network access: Do not allow anonymous enumeration of SAM accounts is set to Enabled'
  
  describe security_policy do
    its('Network access: Do not allow anonymous enumeration of SAM accounts') { should eq 'Enabled' }
  end
end

control 'cis-network-access-deny-enumeration-of-sam-2.3.10.3' do
  impact 0.7
  title '2.3.10.3 Ensure Network access: Do not allow anonymous enumeration of SAM accounts and shares is set to Enabled'
  desc 'Ensure Network access: Do not allow anonymous enumeration of SAM accounts and shares is set to Enabled'
  
  describe security_policy do
    its('Network access: Do not allow anonymous enumeration of SAM accounts') { should eq 'Enabled' }
  end
end

control 'cis-network-access-deny-storage-of-passwords-2.3.10.4' do
  impact 0.7
  title '2.3.10.4 Ensure Network access: Do not allow storage of passwords and credentials for network authentication is set to Enabled'
  desc 'Ensure Network access: Do not allow storage of passwords and credentials for network authentication is set to Enabled'
  
  describe security_policy do
    its('Network access: Do not allow storage of passwords and credentials for network authentication') { should eq 'Enabled' }
  end
end

control 'cis-network-access-deny-everyone-for-annon-2.3.10.5' do
  impact 0.7
  title '2.3.10.5 Ensure Network access: Let Everyone permissions apply to anonymous users is set to Disabled'
  desc 'Ensure Network access: Let Everyone permissions apply to anonymous users is set to Disabled'
  
  describe security_policy do
    its('Network access: Let Everyone permissions apply to anonymous users') { should eq 'Disabled' }
  end
end

control 'cis-network-access-named-pipes-annon-2.3.10.6' do
  impact 0.7
  title '2.3.10.6 Configure Network access: Named Pipes that can be accessed anonymously'
  desc 'Configure Network access: Named Pipes that can be accessed anonymously'
  
  describe security_policy do
    its('Network access: Named Pipes that can be accessed anonymously') { should eq '' }
  end
end

control 'cis-network-access-remote-registry-2.3.10.7' do
  impact 0.7
  title '2.3.10.7 Ensure Network access: Remotely accessible registry paths'
  desc 'Network access: Remotely accessible registry paths'
  
  $paths = [
    'System\CurrentControlSet\Control\ProductOptions',
    'System\CurrentControlSet\Control\Server Applications',
    'Software\Microsoft\Windows NT\CurrentVersion'
  ]

  describe security_policy do
    its('Network access: Remotely accessible registry paths') { should eq $paths }
  end
end

control 'cis-network-access-remote-registry-subpaths-2.3.10.8' do
  impact 0.7
  title '2.3.10.8 Network access: Remotely accessible registry paths and sub-paths'
  desc 'Network access: Remotely accessible registry paths and sub-paths'
  
  $paths = [
    'System\CurrentControlSet\Control\Print\Printers'
    'System\CurrentControlSet\Services\Eventlog'
    'Software\Microsoft\OLAP Server'
    'Software\Microsoft\Windows NT\CurrentVersion\Print'
    'Software\Microsoft\Windows NT\CurrentVersion\Windows'
    'System\CurrentControlSet\Control\ContentIndex'
    'System\CurrentControlSet\Control\Terminal Server'
    'System\CurrentControlSet\Control\Terminal Server\UserConfig'
    'System\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration'
    'Software\Microsoft\Windows NT\CurrentVersion\Perflib'
    'System\CurrentControlSet\Services\SysmonLog'
  ]

  describe security_policy do
    its('Network access: Remotely accessible registry paths and sub-paths') { should eq $paths }
  end
end

control 'cis-network-access-restrict-name-pipes-2.3.10.9' do
  impact 0.7
  title '2.3.10.9 Network access: Restrict anonymous access to Named Pipes and Shares is set to Enabled'
  desc 'Network access: Restrict anonymous access to Named Pipes and Shares is set to Enabled'
  
  describe security_policy do
    its('Network access: Restrict anonymous access to Named Pipes and Shares') { should eq 'Enabled' }
  end
end

control 'cis-network-access-deny-annon-shares-2.3.10.10' do
  impact 0.7
  title '2.3.10.10 Network access: Shares that can be accessed anonymously is set to None'
  desc 'Network access: Shares that can be accessed anonymously is set to None'
  
  describe security_policy do
    its('Network access: Shares that can be accessed anonymously') { should eq '' }
  end
end

control 'cis-network-access-classic-security-for-local-accounts-2.3.10.11' do
  impact 0.7
  title '2.3.10.11 Ensure Network access: Sharing and security model for local accounts is set to Classic - local users authenticate as themselves'
  desc 'Ensure Network access: Sharing and security model for local accounts is set to Classic - local users authenticate as themselves'
  
  describe security_policy do
    its('Network access: Sharing and security model for local accounts') { should eq 'Classic - local users authenticate as themselves' }
  end
end

#
# 2.3.11 Network security
#

control 'cis-network-security-local-system-ntlm-2.3.11.1' do
  impact 0.7
  title '2.3.11.1 Network security: Allow Local System to use computer identity for NTLM is set to Enabled'
  desc 'Network security: Allow Local System to use computer identity for NTLM is set to Enabled'
  
  describe security_policy do
    its('Network security: Allow Local System to use computer identity for NTLM') { should eq 'Enabled' }
  end
end

control 'cis-network-security-local-system-null-session-2.3.11.2' do
  impact 0.7
  title '2.3.11.2 Network security: Allow LocalSystem NULL session fallback is set to Disabled'
  desc 'Network security: Allow LocalSystem NULL session fallback is set to Disabled'
  
  describe security_policy do
    its('Network security: Allow LocalSystem NULL session fallback') { should eq 'Disabled' }
  end
end

control 'cis-network-security-pku2u-auth-online-identities-2.3.11.3' do
  impact 0.7
  title '2.3.11.3 Ensure Network Security: Allow PKU2U authentication requests to this computer to use online identities is set to Disabled'
  desc 'Ensure Network Security: Allow PKU2U authentication requests to this computer to use online identities is set to Disabled'
  
  describe security_policy do
    its('Network Security: Allow PKU2U authentication requests to this computer to use online identities') { should eq 'Disabled' }
  end
end

control 'cis-network-security-encryptions-types-for-kerberos-2.3.11.4' do
  impact 0.7
  title '2.3.11.4 Ensure Network Security: Configure encryption types allowed for Kerberos is set to RC4_HMAC_MD5, AES128_HMAC_SHA1, AES256_HMAC_SHA1, Future encryption types'
  desc 'Ensure Network Security: Configure encryption types allowed for Kerberos is set to RC4_HMAC_MD5, AES128_HMAC_SHA1, AES256_HMAC_SHA1, Future encryption types'
  
  describe security_policy do
    its('Network Security: Configure encryption types allowed for Kerberos') { should eq 'RC4_HMAC_MD5, AES128_HMAC_SHA1, AES256_HMAC_SHA1, Future encryption types' }
  end
end

control 'cis-network-security-donot-store-lanmanger-hash-2.3.11.5' do
  impact 0.7
  title '2.3.11.5 Ensure Network security: Do not store LAN Manager hash value on next password change is set to Enabled'
  desc 'Ensure Network security: Do not store LAN Manager hash value on next password change is set to Enabled'
  
  describe security_policy do
    its('Network security: Do not store LAN Manager hash value on next password change') { should eq 'Enabled' }
  end
end

control 'cis-network-security-force-logoff-on-expire-2.3.11.6' do
  impact 0.7
  title '2.3.11.6 Ensure Network security: Force logoff when logon hours expire is set to Enabled'
  desc 'Ensure Network security: Force logoff when logon hours expire is set to Enabled'
  
  describe security_policy do
    its('Network security: Force logoff when logon hours expire') { should eq 'Enabled' }
  end
end

control 'cis-network-security-lanmanager-auth-level-2.3.11.7' do
  impact 0.7
  title '2.3.11.7 Ensure Network security: LAN Manager authentication level is set to Send NTLMv2 response only. Refuse LM & NTLM'
  desc 'Ensure Network security: LAN Manager authentication level is set to Send NTLMv2 response only. Refuse LM & NTLM'
  
  describe security_policy do
    its('Network security: LAN Manager authentication level') { should eq 'Send NTLMv2 response only. Refuse LM & NTLM' }
  end
end

control 'cis-network-security-ldap-signing-requirements-2.3.11.8' do
  impact 0.7
  title '2.3.11.8 Network security: LDAP client signing requirements is set to Negotiate signing or higher'
  desc 'Network security: LDAP client signing requirements is set to Negotiate signing or higher'
  
  describe security_policy do
    its('Network security: LDAP client signing requirements') { should be_in ['Negotiate signing','Require signing'] }
  end
end

control 'cis-network-security-session-ntlm-ssp-clients-2.3.11.9' do
  impact 0.7
  title '2.3.11.9 Ensure Network security: Minimum session security for NTLM SSP based (including secure RPC) clients is set to Require NTLMv2 session security, Require 128-bit encryption'
  desc 'Ensure Network security: Minimum session security for NTLM SSP based (including secure RPC) clients is set to Require NTLMv2 session security, Require 128-bit encryption'
  
  describe security_policy do
    its('Network security: Minimum session security for NTLM SSP based (including secure RPC) clients') { should eq 'Require NTLMv2 session security, Require 128-bit encryption' }
  end
end

control 'cis-network-security-session-ntlm-ssp-servers-2.3.11.10' do
  impact 0.7
  title '2.3.11.10 Ensure Network security: Minimum session security for NTLM SSP based (including secure RPC) servers is set to Require NTLMv2 session security, Require 128-bit encryption'
  desc 'Ensure Network security: Minimum session security for NTLM SSP based (including secure RPC) servers is set to Require NTLMv2 session security, Require 128-bit encryption'
  
  describe security_policy do
    its('Network security: Minimum session security for NTLM SSP based (including secure RPC) servers') { should eq 'Require NTLMv2 session security, Require 128-bit encryption' }
  end
end

#
# 2.3.12 Recovery console
#
# This section is intentionally blank and exists to ensure the structure of Windows benchmarks is consistent.
#

#
# 2.3.13 Shutdown
#

control 'cis-shutdown-without-logon-2.3.13.1' do
  impact 0.7
  title '2.3.13.1 Ensure Shutdown: Allow system to be shut down without having to log on is set to Disabled'
  desc 'Ensure Shutdown: Allow system to be shut down without having to log on is set to Disabled'
  
  describe security_policy do
    its('Shutdown: Allow system to be shut down without having to log on') { should eq 'Disabled' }
  end
end

#
# 2.3.14 System cryptography
#
# This section is intentionally blank and exists to ensure the structure of Windows benchmarks is consistent.
#

#
# 2.3.15 System objects
#

control 'cis-case-insensitive-for-non-subsystem-2.3.15.1' do
  impact 0.7
  title '2.3.15.1 Ensure System objects: Require case insensitivity for non-Windows subsystems is set to Enabled'
  desc 'Ensure System objects: Require case insensitivity for non-Windows subsystems is set to Enabled'
  
  describe security_policy do
    its('Ensure System objects: Require case insensitivity for non-Windows subsystems') { should eq 'Enabled' }
  end
end

control 'cis-strengthen-defaults-for-system-objects-2.3.15.2' do
  impact 0.7
  title '2.3.15.2 Ensure System objects: Strengthen default permissions of internal system objects (e.g. Symbolic Links) is set to Enabled'
  desc 'Ensure System objects: Strengthen default permissions of internal system objects (e.g. Symbolic Links) is set to Enabled'
  
  describe security_policy do
    its('System objects: Strengthen default permissions of internal system objects (e.g. Symbolic Links)') { should eq 'Enabled' }
  end
end

#
# 2.3.16 System settings
#
# This section is intentionally blank and exists to ensure the structure of Windows benchmarks is consistent.
#

#
# 2.3.17 User Account Control
#

control 'cis-uac-admin-approval-mode-2.3.17.1' do
  impact 0.7
  title '2.3.17.1 Ensure User Account Control: Admin Approval Mode for the Built-in Administrator account is set to Enabled'
  desc 'Ensure User Account Control: Admin Approval Mode for the Built-in Administrator account is set to Enabled'
  
  describe security_policy do
    its('User Account Control: Admin Approval Mode for the Built-in Administrator account') { should eq 'Enabled' }
  end
end

control 'cis-uac-application-prompt-for-elevation-2.3.17.2' do
  impact 0.7
  title '2.3.17.2 Ensure User Account Control: Allow UIAccess applications to prompt for elevation without using the secure desktop is set to Disabled'
  desc 'Ensure User Account Control: Allow UIAccess applications to prompt for elevation without using the secure desktop is set to Disabled'
  

  describe security_policy do
    its('User Account Control: Allow UIAccess applications to prompt for elevation without using the secure desktop') { should eq 'Disabled' }
  end
end

control 'cis-uac-elevation-prompt-behaviour-admins-2.3.17.3' do
  impact 0.7
  title '2.3.17.3 Ensure User Account Control: Behavior of the elevation prompt for administrators in Admin Approval Mode is set to Prompt for consent on the secure desktop'
  desc 'Ensure User Account Control: Behavior of the elevation prompt for administrators in Admin Approval Mode is set to Prompt for consent on the secure desktop'
  
  describe security_policy do
    its('User Account Control: Behavior of the elevation prompt for administrators in Admin Approval Mode') { should eq 'Prompt for consent on the secure desktop' }
  end
end

control 'cis-uac-elevation-prompt-behaviour-standard-2.3.17.4' do
  impact 0.7
  title '2.3.17.4 Ensure User Account Control: Behavior of the elevation prompt for standard users is set to Automatically deny elevation requests'
  desc 'Ensure User Account Control: Behavior of the elevation prompt for standard users is set to Automatically deny elevation requests'
  
  describe security_policy do
    its('User Account Control: Behavior of the elevation prompt for standard users') { should eq 'Automatically deny elevation requests' }
  end
end

control 'cis-uac-detect-app-installation-2.3.17.5' do
  impact 0.7
  title '2.3.17.5 Ensure User Account Control: Detect application installations and prompt for elevation is set to Enabled'
  desc 'Ensure User Account Control: Detect application installations and prompt for elevation is set to Enabled'
  
  describe security_policy do
    its('User Account Control: Detect application installations and prompt for elevation') { should eq 'Enabled' }
  end
end

control 'cis-uac-only-evevate-secure-apps-2.3.17.6' do
  impact 0.7
  title '2.3.17.6 Ensure User Account Control: Only elevate UIAccess applications that are installed in secure locations is set to Enabled'
  desc 'Ensure User Account Control: Only elevate UIAccess applications that are installed in secure locations is set to Enabled'
  
  describe security_policy do
    its('User Account Control: Only elevate UIAccess applications that are installed in secure locations') { should eq 'Enabled' }
  end
end

control 'cis-uac-administrators-in-admin-mode-2.3.17.7' do
  impact 0.7
  title '2.3.17.7 Ensure User Account Control: Run all administrators in Admin Approval Mode is set to Enabled'
  desc 'Ensure User Account Control: Run all administrators in Admin Approval Mode is set to Enabled'
  
  describe security_policy do
    its('User Account Control: Run all administrators in Admin Approval Mode') { should eq 'Enabled' }
  end
end

control 'cis-uac-switch-to-secure-desktop-2.3.17.8' do
  impact 0.7
  title '2.3.17.8 Ensure User Account Control: Switch to the secure desktop when prompting for elevation is set to Enabled'
  desc 'Ensure User Account Control: Switch to the secure desktop when prompting for elevation is set to Enabled'
  
  describe security_policy do
    its('User Account Control: Switch to the secure desktop when prompting for elevation') { should eq 'Enabled' }
  end
end

control 'cis-uac-virtualize-file-and-registry-failures-2.3.17.9' do
  impact 0.7
  title '2.3.17.9 Ensure User Account Control: Virtualize file and registry write failures to per-user locations is set to Enabled'
  desc 'Ensure User Account Control: Virtualize file and registry write failures to per-user locations is set to Enabled'

  describe security_policy do
    its('policUser Account Control: Virtualize file and registry write failures to per-user locationsy_name') { should eq 'Enabled' }
  end
end