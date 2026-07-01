param(
    [string]$DailyTime = '16:05',
    [string]$WeeklyTime = '16:05',
    [string]$SystemTime = '15:30'
)

$ErrorActionPreference = 'Stop'

$scriptWsl = '/opt/processes/working-os/scripts/show-review-reminder.ps1'
$scriptWin = (wsl.exe -e wslpath -w $scriptWsl).Trim()
$powershell = Join-Path $env:WINDIR 'System32\WindowsPowerShell\v1.0\powershell.exe'
$wrapperDir = Join-Path $env:LOCALAPPDATA 'working-os'
$wrapperPath = Join-Path $wrapperDir 'show-review-reminder.ps1'

New-Item -ItemType Directory -Force -Path $wrapperDir | Out-Null
Copy-Item -Force -Path $scriptWin -Destination $wrapperPath

function Register-ReviewTask {
    param(
        [string]$Name,
        [string]$Kind,
        [string]$ScheduleArgs
    )

    $taskRun = "`"$powershell`" -NoProfile -ExecutionPolicy Bypass -File `"$wrapperPath`" -Kind $Kind"
    $args = @('/Create', '/F', '/TN', $Name, '/TR', $taskRun) + ($ScheduleArgs -split ' ')
    & schtasks.exe @args
}

Register-ReviewTask `
    -Name 'working-os daily review' `
    -Kind 'daily' `
    -ScheduleArgs "/SC WEEKLY /D MON,TUE,WED,THU,FRI /ST $DailyTime /IT"

Register-ReviewTask `
    -Name 'working-os weekly review' `
    -Kind 'weekly' `
    -ScheduleArgs "/SC WEEKLY /D FRI /ST $WeeklyTime /IT"

Register-ReviewTask `
    -Name 'working-os system review' `
    -Kind 'system' `
    -ScheduleArgs "/SC MONTHLY /MO FIRST /D FRI /ST $SystemTime /IT"

Write-Host 'Installed working-os review reminders:'
Write-Host "- Daily review: weekdays at $DailyTime"
Write-Host "- Weekly review: Fridays at $WeeklyTime"
Write-Host "- System review: first Friday of each month at $SystemTime"
Write-Host "Wrapper copied to: $wrapperPath"
