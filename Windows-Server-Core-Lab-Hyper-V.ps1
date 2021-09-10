#https://4sysops.com/archives/copy-files-between-hyper-v-and-a-guest-vm/ (Hyper-V as host part 1)
#https://docs.microsoft.com/en-us/windows-server/security/guarded-fabric-shielded-vm/guarded-fabric-and-shielded-vms (Hyper-V as host part 2)
#https://www.redpill-linpro.com/sysadvent/2016/12/11/read-logs-in-powershell-console.html (Read logs using PowerShell)
#https://docs.microsoft.com/en-us/troubleshoot/windows-server/user-profiles-and-logon/turn-on-automatic-logon (Configure auto-logon)
#Install SSH
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Set-Service sshd -StartupType Automatic
Set-Service ssh-agent -StartupType Automatic
Start-Service sshd
Start-Service ssh-agent
#Install Chocolatey and nano editor
echo Installing chocolatey and nano...
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y nano
#https://www.server-world.info/en/note?os=Windows_Server_2019&p=smb&f=3 (Create SMB share)
#https://4sysops.com/archives/managing-windows-file-shares-with-powershell/ (SMB share permissions)
Set-MpPreference -ExclusionPath C:\Users\Administrator\Downloads
New-SmbShare -Name "web-shared" -Path "C:\Users\Administrator\Downloads"
Grant-SmbShareAccess -Name web-shared -AccountName Administrator -AccessRight Full
#Scan after activation
Start-MpScan -ScanType FullScan
#https://www.c-sharpcorner.com/article/step-by-step-installation-of-active-directory-on-windows-server-2019-core/ (Install AD using PowerShell)
Get-WindowsFeature AD-Domain-Service | Install-WindowsFeature
#https://social.technet.microsoft.com/Forums/ie/en-US/07b6f830-ba49-4c13-8e79-9bc2369671b6/cant-run-importmodule-addsdeployment-on-server-2012-rc?forum=winserver8setup
Get-WindowsFeature AD-Domain-Service | Install-WindowsFeature
#Reboot
shutdown -r -f -t 00
Install-WindowsFeature -Name AD-Domain-Services –IncludeManagementTools
Import-Module ADDSDeployment
Install-ADDSForest
A
#Add AD account
New-ADUser –Name “User01” –SamAccountName User01 –UserPrincipalName user01@xymvl4t3d.lab
Set-ADAccountPassword ‘CN=User01,CN=users,DC=xymvl4t3d,DC=lab’ -Reset -NewPassword (ConvertTo-SecureString -AsPlainText “password-here” -Force)
Enable-ADAccount -Identity User01
Add-ADGroupMember ‘Domain Admins’ User01