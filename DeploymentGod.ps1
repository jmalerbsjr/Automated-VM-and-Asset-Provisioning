clear
[DateTime]::Now

# --------------- SET ENVIRONMENT ------------------
Set-Location "C:\Staged-Deployment"
$global:RootWorkingDir = (Get-Location).Path
gci $RootWorkingDir -recurse | unblock-file
. ./functions.ps1
PrepHost

#
## Install Hyper-V
#If(!((Get-WindowsFeature Hyper-V).Installed))
#{
#	Write-Host "Installing Hyper-V on Local Computer"
#	Install-WindowsFeature Hyper-V
#}

# Create Meta Data Table from XML File
XMLtoDataTable -Path "$RootWorkingDir\MetaData.xml" -CustomTableName MetaDataTable -Validate

# Create Dynamic Variables from Meta Data Table
Foreach($TableRow in $MetaDataTable)
{
 	# Set New Variable Based On Index Number
	ForEach($ColumnName in $ColumnNames)
	{
		# Convert Values Containing 'GB'
		If($TableRow.$ColumnName -imatch "GB")
		{
			Set-Variable -Name $ColumnName -Value ([Int64]($TableRow.$ColumnName.Split("GB")[0]) * 1GB)
		}
		Else
		{
			Set-Variable -Name $ColumnName -Value $TableRow.$ColumnName
		}
	}
		CreateNewVM -ServerMetaData $TableRow -ComputerName $ComputerName -ServerRole $ServerRole -RDSHA $RDSHA -DomainName $DomainName -CollectionName $CollectionName -DNSServer $DNSServer -VMMemory $VMMemory -VMMemoryType $VMMemoryType -StaticIP $StaticIP -NextHopAddress $NextHopAddress -OSISOPath $OSISOPath -OSEdition $OSEdition -VMVHDSize $VMVHDSize -HVRootDir $HVRootDir -VMProcessorCount $VMProcessorCount -VMSwitch $VMSwitch -ProductKey $ProductKey
}

# GET GLOBAL VAR NOT LEFT OVER VALUES FROM LAST ROW (OUTSIDE OF LOOP)
ConfigureRDSDeployment -RDSHA $RDSHA -RDSDNSRRName $RDSDNSRRName -CollectionName $CollectionName -DomainName $DomainName

# Cleanup
Remove-Item "$RootWorkingDir\_Staged-Unattend-Files" -force -Recurse -ErrorAction SilentlyContinue | Out-Null

Write-Host `n "----------COMPLETED----------" -ForegroundColor DarkGreen
[DateTime]::Now



## Check for IP conflict
