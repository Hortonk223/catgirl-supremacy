$targetFolder = "C:\Users\Khalil\Downloads\n\bull shit"
$replacementImage = "C:\Users\Khalil\OneDrive\Pictures\download20240906012056.png"

# Replace each file with the image while keeping the same name
Get-ChildItem -Path $targetFolder -File -Recurse | ForEach-Object {
    Write-Output "Replacing $_ with a catgirl"
    $newFileName = "$($_.DirectoryName)\$($_.BaseName).png"
    Copy-Item -Path $replacementImage -Destination $newFileName -Force
}