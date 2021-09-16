# Check (https://esxi-patches.v-front.de/ESXi-7.0.0.html) for latest build
$baseProfile = "<latest-esxi-build>"
Add-EsxSoftwareDepot https://hostupdate.vmware.com/software/VUM/PRODUCTION/main/vmw-depot-index.xml
Export-ESXImageProfile -ImageProfile $baseProfile -ExportToBundle -filepath "$($baseProfile).zip"
Remove-EsxSoftwareDepot https://hostupdate.vmware.com/software/VUM/PRODUCTION/main/vmw-depot-index.xml
Add-EsxSoftwareDepot "$($baseProfile).zip"
Export-ESXImageProfile -ImageProfile $baseProfile -ExportToIso -filepath "$($baseProfile).iso"
