# Bulk Media Conversion

This is a set of PowerShell scripts that uses Handbrake to convert all videos in a folder and organizes them nicely with subtitles. Each script is currently set up to save them all in 720p .mp4 to a different folder.

I wrote these because, at one point, I had a mix of unoptimized media of varying quality that was starting to eat up all of my hard drive space. This converted everything to an acceptable (at the time) 720p.

`Convert*.ps1` is what actually converts the videos. They're basically the same script but with different input and output directories.

`Copy*Subtitles.ps1` finds all of the existing subtitles and renames them to match the converted videos. They're basically the same script but with different input and output directories.