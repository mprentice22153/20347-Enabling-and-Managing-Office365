# This script will make the following changes to users in AD DS:
#   Update the UserPrincipalName for 'Amr Zaki' to include an extra '@' character
#   Update the emailAddress for 'Brad Sutton' to 'brad@adatum.com'
#   Update the emailAddress for 'Don Funk' to 'brad@adatum.com'
#   Update the emailAddress for 'Holly Dickson' to “holly @adatum.com”
#   Update the emailAddress for 'Kelly Rollins' to “ “

# Update UPN for 'Amr'
$upn = Get-ADUser Amr | Select UserPrincipalName
If ($upn.UserPrincipalName -notlike "*@@*"){
	$arrupn = $upn.UserPrincipalName -split '@'
	$newUPN = $arrUPN[0] + "@@" + $arrUPN[1]
	Set-ADUser Amr -UserPrincipalName $newUPN
	Write-Host "Amr was updated successfully"
} Else {
	Write-Host "Amr was ALREADY updated"
}

# Update emailAddress for 'Brad'
$emailBrad = Get-ADUser Brad -Properties emailAddress | Select emailAddress
If ($emailBrad.emailAddress -notlike "brad@adatum.com"){
	Set-ADUser Brad -emailAddress brad@adatum.com
	Write-Host "Brad was updated successfully"
} Else {
	Write-Host "Brad was ALREADY updated"
}

# Update emailAddress for 'Don'
$emailDon = Get-ADUser Don -Properties emailAddress | Select emailAddress
If ($emailDon.emailAddress -notlike "brad@adatum.com"){
	Set-ADUser Don -emailAddress brad@adatum.com
	Write-Host "Don was updated successfully"
} Else {
	Write-Host "Don was ALREADY updated"
}

# Update emailAddress for 'Holly'
$emailHolly = Get-ADUser Holly -Properties emailAddress | Select emailAddress
If ($emailHolly.emailAddress -notlike "holly @adatum.com"){
	Set-ADUser Holly -emailAddress "holly @adatum.com"
	Write-Host "Holly was updated successfully"
} Else {
	Write-Host "Holly was ALREADY updated"
}

# Update emailAddress for 'Kelly'
$emailKelly = Get-ADUser Kelly -Properties emailAddress | Select emailAddress
If ($emailKelly.emailAddress -notlike " "){
	Set-ADUser Kelly -emailAddress " "
	Write-Host "Kelly was updated successfully"
} Else {
	Write-Host "Kelly was already updated"
}