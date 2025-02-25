param(
    [Parameter(Mandatory=$true)]
    [string]$in,
    [switch]$json
)

# Read the file content as raw text to preserve exact line endings
$content = Get-Content -Path $in -Raw

# Split the content into lines while preserving line endings
$lines = $content -split "(?<=\r\n|\n|\r)"

# Define the single quote and @ symbol separately to avoid terminating the here-string
$sq = "'"
$at = "@"

# Prepare our output
$output = "`$sq = `"'`"`n"
$output += "`$at = `"@`"`n"
$output += "`$script_chunks = @()`n"

$currentChunk = ""

foreach ($line in $lines) {
    # Check if line starts with '@ (would terminate here-string)
    if ($line -match "^'@") {
        # Close current chunk and start a new one
        if ($currentChunk.Length -gt 0) {
            $output += "`$script_chunks += $at$sq`n"
            $output += "$currentChunk"
            $output += "`n$sq$at`n"
            $output += "`$script_chunks += (`$sq + `$at)`n"
            $currentChunk = ""
        }
    }
    else {
        # Handle lines starting with @ by escaping them with backtick
        if ($line -match "^@") {
            # Properly add a backtick before @ by inserting the backtick character
            $line = '`' + $line
        }
        
        # Add to current chunk
        $currentChunk += $line
    }
}

# Add the last chunk if there is any content left
if ($currentChunk.Length -gt 0) {
    $output += "`$script_chunks += @$sq"
    $output += "`n$currentChunk"
    $output += "`n$sq$at`n"
}

# Add code to join all chunks
$output += "`$script = [string]::Join('', `$script_chunks)"

# Output the result
if ($json) {
    $output -split "`r`n|`r|`n" | ConvertTo-Json
}
else {
    $output
}