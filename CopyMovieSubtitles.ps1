# Find the subtitles
$filelist = Get-ChildItem "M:\TV & Movies\Movies" -include *.sub,*.srt -recurse
 
$num = $filelist | measure
$filecount = $num.count
 
$i = 0;
ForEach ($file in $filelist)
{
    $i++;
    $oldfile = $file.DirectoryName + "\" + $file.BaseName + $file.Extension;
	$newdirectory = "X:\TV & Movies\Movies\" + (get-item $file.DirectoryName).parent + "\" + (get-item $oldfile).Directory.Name +  "\"
	# Strip subtitles of current quality and erroneous text
    $oldfile.replace(".en","")
	$oldfile.replace(" - 1080p","")
	$oldfile.replace("- 1080p","")
	$oldfile.replace("-1080p","")
	$oldfile.replace("-DVD-Rip","")
	$oldfile.replace("-BR-Rip","")
    # Make the new subtitle names match the converted video
    $newfile =  $file.BaseName + " - 720p.en" + $file.Extension;
	$newcomplete = $newdirectory + $newfile
			If (-not(Test-Path $newdirectory)){
			New-Item $newdirectory -type directory}{}
			If (-not(Test-Path $newcomplete)){
    $progress = ($i / $filecount) * 100
    $progress = [Math]::Round($progress,2)
    # Pretty printing
    Clear-Host
    Write-Host -------------------------------------------------------------------------------
	Write-Host "New File: $newfile"
    Write-Host Handbrake Batch Encoding
    Write-Host "Processing - $oldfile"
    Write-Host "File $i of $filecount - $progress%"
    Write-Host -------------------------------------------------------------------------------

$host.ui.RawUI.WindowTitle = "$i of $filecount - $progress%"	
	
    Copy-Item $oldfile $newcomplete
}}
# Don't write it if it exists
Else{
	Write-Host "Exists"
	}
	