$ErrorActionPreference = 'Continue'

$tasks = @(
    'working-os daily review',
    'working-os weekly review',
    'working-os system review'
)

foreach ($task in $tasks) {
    schtasks.exe /Delete /F /TN $task
}

$wrapperPath = Join-Path (Join-Path $env:LOCALAPPDATA 'working-os') 'show-review-reminder.ps1'
if (Test-Path $wrapperPath) {
    Remove-Item -Force $wrapperPath
}

Write-Host 'Removed working-os review reminder tasks if they existed.'
