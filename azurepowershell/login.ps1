$ErrorActionPreference = "Stop"

Write-Host "Setting up"
$json = $env:credentials | ConvertFrom-Json

Install-Module -Name Az -Force
$clientPassword = ConvertTo-SecureString $json.clientSecret -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PSCredential($json.clientId, $clientPassword)

Write-Host "Logging in"
Login-AzAccount -Credential $credentials -ServicePrincipal -TenantId $json.tenantId

Write-Host "Selecting subscription"
Select-AzSubscription -SubscriptionId $json.subscriptionId

Write-Host "Succesfully logged in!"
