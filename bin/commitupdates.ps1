# Get the root of the repo
$REPOROOT = git rev-parse --show-toplevel
Push-Location $REPOROOT
foreach ($Change in $(git status --porcelain)) {
    # Get the change type and filename
    $ChangeType = $Change.Substring(0, 2)
    $FileName = $Change.Substring(3)
    # Check if the change type is a modification
    if ($ChangeType -like "*M*") {
        Write-Output "$FileName was modified"
        $Diff = git diff --unified=0 $FileName | Out-String
        if ($Diff -match "-\s*""version"":\s*""(?<OldVersion>.*)"",\s*`n\+\s*""version"":\s*""(?<NewVersion>.*)"",") {
            $OldVersion = $Matches.OldVersion
            $NewVersion = $Matches.NewVersion
            Write-Output "Updating version from $OldVersion to $NewVersion..."
            $AppName = (Get-Item $FileName).BaseName
            git commit $FileName -m "update $AppName to $NewVersion" #--dry-run
        }
        else {
            Write-Output "No version change detected. Skipping..."
        }
    }
    elseif ($ChangeType -like "*A*") {
        Write-Output "$FileName was manually added. Skipping..."
    }
    elseif ($ChangeType -eq "??") {
        Write-Output "$FileName is untracked"
        if ($FileName -like "bucket/*.json") {
            Write-Output "This is an app manifest. Adding..."
            git add $FileName #--dry-run
            # Get basename of the manifest without extension
            $AppName = (Get-Item $FileName).BaseName
            git commit $FileName -m "add $AppName" #--dry-run
        }
        else {
            Write-Output "This is not an app manifest. Skipping..."
        }
    }
    else {
        Write-Output "Unknown change type: $ChangeType. Skipping..."
    }
}
Pop-Location