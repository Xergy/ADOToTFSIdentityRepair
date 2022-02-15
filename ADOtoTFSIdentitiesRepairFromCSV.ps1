# Simple script to loop through a CSV input and run a TFSConfig commandline
# 
# From: https://docs.microsoft.com/en-us/azure/devops/server/admin/move-across-domains?view=tfs-2013
# Sample command:
# TFSConfig identities /change /fromdomain:OldComputerorDomainName /todomain:NewDomainName /account:OldTFSServiceAccount /toaccount:NewTFSServiceAccount


# Get Account Data

$Accounts = Import-Csv -Path ".\AccountData.csv" 

# Loop Through user data

Foreach ($Account in $Accounts) {
    $CommandString = "TFSConfig identities /change /fromdomain:$($Account.FromDomain) /todomain:$($Account.ToDomain) /account:$($Account.Account) /toaccount:$($Account.ToAccount)" 
    Write-Host "Executing: ""$($CommandString)"" " -ForegroundColor Cyan
    & $CommandString
}

Write-Host "Done!" -ForegroundColor Green