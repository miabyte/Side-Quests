# Prompt the user to enter the folder directory
$FolderPath = Read-Host "Enter the folder directory"

# Check if the input is empty
if ([string]::IsNullOrWhiteSpace($FolderPath)) {
    Write-Host "No folder directory provided. Exiting script."
    exit
}

# Check if the folder directory provided exists
if (-not (Test-Path -Path $FolderPath -PathType Container)) {
    Write-Host "Folder directory does not exist: $FolderPath"
    exit
}

# Change the current location to the specified folder directory
Set-Location -Path $FolderPath

# Perform the same functionality within the specified folder directory
(Get-ChildItem -File -Recurse) | ForEach-Object {
    $Dest = New-Item -ItemType Directory -Force -Path (Join-Path $_.DirectoryName $_.BaseName)
    $_ | Move-Item -Destination $Dest.FullName -Force
}

Write-Host "Script completed successfully!"
