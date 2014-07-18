###############################
# AUTOMATIC STARTUP GENERATOR #
# ASGEN v.1.0 by mnmnc @ 2014 # 
###############################

# VARIABLES

	# CURRENT PATH
	$current = $(pwd).ToString()

	# DESTINATION PATH
	$destination_path = "$env:userprofile\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\programs.bat"

# MOVING TO TEMP	
cd $env:systemroot\Temp

# REMOVING OLD FILE
del $destination_path

# EMPTY ARRAYS
$arr_names = @()
$arr_paths = @()

# FILLING ARRAYS
Get-Process | Where-Object {$_.Path -match "Program" } | foreach { $arr_names += $_.Name; $arr_paths += $_.Path }

# CREATING FILE
for($i = 0; $i -le $arr_names.count -1; $i++) 
{ 
	$out = "`"" + $arr_paths[$i] + "`""
	write-output $out | out-file "programs.bat" -append -Encoding ascii
}

# INFO
Write-host "`nFolowwing programs will be started on next boot:`n"
cat programs.bat
Write-host "`n"

# MOVING TO STARTUP FOLDER
mv programs.bat "$destination_path"

# RETURNING
cd $current

exit













