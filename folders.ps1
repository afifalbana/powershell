function listChildFolder($folderPath) {

    try {

        $folder = (Get-ChildItem -Path $folderPath -Directory -ErrorAction Stop | `
                Sort-Object LastWriteTime -Descending).Name

        if ($folder) {
            $result = '"{0}"' -f ($folder -join '","')
            $result
        }
        else {
            Write-Output "Folder empty"
        }
    }
    catch {

        $errorMessage = $_
        Write-Output "Error: $errorMessage"
    }

	return
}

function compareTwoFiles($firstFilePath, $secondFilePath) {
	
    try {

        $a = Get-Item $firstFilePath -ErrorAction Stop
        $b = Get-Item $secondFilePath -ErrorAction Stop  

        if ($a.Length -gt $b.Length) {
            Write-Output $a.Name
        } 
        elseif ($a.Length -lt $b.Length) {
            Write-Output $b.Name
        } 
        else {
            Write-Output "both file has same size"
        }
    }
    catch {

        $errorMessage = $_
        Write-Output "Error: $errorMessage"
    }

	return
}
