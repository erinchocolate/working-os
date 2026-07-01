param(
    [ValidateSet('daily', 'weekly', 'system')]
    [string]$Kind = 'daily'
)

$ErrorActionPreference = 'Stop'

$root = '/opt/processes/working-os'
$script = "$root/scripts/run-review-codex.sh"

$output = & wsl.exe -e bash -lc "$script $Kind" 2>&1
$message = ($output -join "`n")

if ([string]::IsNullOrWhiteSpace($message)) {
    $message = "working-os $Kind review automation finished. Check working-os reminders and reviews."
}

$title = "working-os $Kind review automation"

try {
    $shell = New-Object -ComObject WScript.Shell
    $null = $shell.Popup($message, 0, $title, 64)
} catch {
    Write-Host $message
}
