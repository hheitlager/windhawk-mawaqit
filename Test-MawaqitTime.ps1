
#Requires -RunAsAdministrator

param(
    [Parameter(Position = 0)]
    [ValidatePattern('^([01]\d|2[0-3]):[0-5]\d:[0-5]\d$')]
    [string]$Time = "16:07:55"
)

$ErrorActionPreference = "Stop"

# Preserve the current Windows Time service state.
$service = Get-Service -Name W32Time
$wasRunning = $service.Status -eq 'Running'

try {
    Write-Host "`n[Mawaqit] Preparing test clock..." -ForegroundColor Cyan

    # Stop Windows Time synchronization.
    if ($wasRunning) {
        Stop-Service -Name W32Time -ErrorAction Stop
    }

    # Disable automatic time synchronization through W32Time.
    Set-Service -Name W32Time -StartupType Disabled

    # Use today's date with the requested time.
    $today = Get-Date
    $target = [datetime]::Today.Add(
        [TimeSpan]::ParseExact(
            $Time, "hh\:mm\:ss", $null
        )
    )

    Write-Host "[Mawaqit] Setting time to $Time..." -ForegroundColor Yellow

    Set-Date -Date $target | Out-Null

    Write-Host "[Mawaqit] Clock changed successfully!" -ForegroundColor Green
    Write-Host "[Mawaqit] Current time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

    Write-Host "`nTest your Mawaqit mod now." -ForegroundColor Cyan
    Read-Host "Press ENTER to restore automatic time synchronization"
}
finally {
    Write-Host "`n[Mawaqit] Restoring Windows Time..." -ForegroundColor Yellow

    # Restore automatic service startup.
    Set-Service -Name W32Time -StartupType Automatic

    # Restart time synchronization.
    Start-Service -Name W32Time

    # Ask Windows to synchronize immediately.
    & w32tm.exe /resync /rediscover

    if (-not $wasRunning) {
        Stop-Service -Name W32Time
    }

    Write-Host "[Mawaqit] Restoration attempted." -ForegroundColor Green
    Write-Host "[Mawaqit] Current time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
}
