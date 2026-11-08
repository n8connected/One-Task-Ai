# One Task: reusable Windows PowerShell 5.1 execution harness.
# Customize Invoke-Task for the requested operation.
[CmdletBinding()]
param(
    [switch]$Apply,
    [string]$OutputDirectory = (Join-Path $env:USERPROFILE 'OneTask-Reports')
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$runId = Get-Date -Format 'yyyyMMdd-HHmmss'
$runDirectory = Join-Path $OutputDirectory $runId
New-Item -ItemType Directory -Path $runDirectory -Force | Out-Null
$logPath = Join-Path $runDirectory 'run.log'
$resultPath = Join-Path $runDirectory 'result.json'
$results = [ordered]@{ RunId=$runId; Applied=[bool]$Apply; Changed=0; Skipped=0; Failed=0; Status='started'; Details=@() }
function Write-Log([string]$Message) {
    $line = '{0} {1}' -f (Get-Date -Format 's'), $Message
    Add-Content -LiteralPath $logPath -Value $line
    Write-Host $line
}
function Invoke-Task {
    # Replace this function with a verified, task-specific implementation.
    # Keep preview as the default; only modify state when $Apply is true.
    Write-Log 'No task actions configured. Customize Invoke-Task first.'
    $results.Skipped++
}
try {
    Write-Log ('Mode: ' + $(if ($Apply) {'APPLY'} else {'PREVIEW'}))
    Invoke-Task
    $results.Status = 'completed'
} catch {
    $results.Failed++
    $results.Status = 'failed'
    Write-Log ('ERROR: ' + $_.Exception.Message)
} finally {
    $results | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $resultPath -Encoding UTF8
    Write-Log ('Results: ' + $resultPath)
}
if ($results.Failed -gt 0) { exit 1 }
exit 0
