# Find the TV shows
$filelist = Get-ChildItem "M:\TV & Movies\TV" -include *.wmv,*.avi,*.mp4,*.mkv,*.mpg,*.m4v,*.mpeg,*.mov -recurse
 
$num = $filelist | measure
$filecount = $num.count
 
$i = 0;
ForEach ($file in $filelist)
{
    $i++;
    $oldfile = $file.DirectoryName + "\" + $file.BaseName + $file.Extension;
	$newdirectory = "X:\TV & Movies\TV\" + (get-item $file.DirectoryName).parent +"\" + (get-item $oldfile).Directory.Name +  "\"
    # Add quality at end of filename
    $newfile =  $file.BaseName + " - 720p" + ".mp4";
	# Create the new directory if necessary
    $newcomplete = $newdirectory + $newfile
			If (-not(Test-Path $newdirectory)){
			New-Item $newdirectory -type directory}{}
			If (-not(Test-Path $newcomplete)){
    $progress = ($i / $filecount) * 100
    $progress = [Math]::Round($progress,2)
    # Pretty printing of progress
    Clear-Host
    Write-Host -------------------------------------------------------------------------------
	Write-Host "New File: $newfile"
    Write-Host Handbrake Batch Encoding
    Write-Host "Processing - $oldfile"
    Write-Host "File $i of $filecount - $progress%"
    Write-Host -------------------------------------------------------------------------------

$host.ui.RawUI.WindowTitle = "$i of $filecount - $progress%"	
	# To change quality, adjust everything after "$oldfile" to use handbrake CLI coversion language
    Start-Process "H:\Program Files\HandBrake\HandBrakeCLI.exe" -ArgumentList "-i `"$oldfile`" -t 1 --angle 1 -c 1 -o `"$newcomplete`" --optimize --format mp4 --ab 64 --mixdown mono --quality 23 -e x264 -x b-adapt=2:rc-lookahead=50:me=umh:bframes=5:ref=6:direct=auto:trellis=2:subq=10:psy-rd=1.0,0.10:analyse=all --width 1280 --height 720" -Wait -NoNewWindow
}}
# Don't convert if it already exists
Else{
	Write-Host "Exists"
	}
	