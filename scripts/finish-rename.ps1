# finish-rename.ps1 - Complete the NeoAPI to ZyroAPI rename

Write-Host "`n╔════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║     Finishing NeoAPI → ZyroAPI Rename                  ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════╝`n" -ForegroundColor Cyan

$rootPath = Split-Path -Parent (Split-Path -Parent $PSCommandPath)
$filesUpdated = 0
$filesSkipped = 0

# Files to update with case-insensitive replacement
$filesToUpdate = @(
    "docs\getting-started.md",
    "docs\routing.md",
    "docs\middleware.md",
    "docs\plugins.md",
    "docs\error-handling.md",
    "docs\advanced-routing.md",
    "docs\response.md",
    "docs\server.md",
    "docs\optimizations.md",
    "docs\how to create plugins.md",
    "docs\critical-optimizations-applied.md",
    "scripts\validate-release.js",
    "scripts\check-npm-package.js",
    "benchmark\benchmark.js",
    "benchmark\simple-route.js",
    "test\README.md",
    "test\run-tests.js"
)

Write-Host "📝 Updating remaining files...`n" -ForegroundColor Yellow

foreach ($file in $filesToUpdate) {
    $fullPath = Join-Path $rootPath $file
    
    if (Test-Path $fullPath) {
        try {
            $content = Get-Content $fullPath -Raw -ErrorAction Stop
            
            # Replace all variations
            $newContent = $content `
                -replace 'NeoAPI', 'ZyroAPI' `
                -replace 'neoapi', 'zyroapi' `
                -replace 'NEOAPI', 'ZYROAPI' `
            
            if ($content -ne $newContent) {
                Set-Content $fullPath $newContent -NoNewline
                Write-Host "  ✅ Updated: $file" -ForegroundColor Green
                $filesUpdated++
            } else {
                Write-Host "  ⏭️  Skipped: $file (no changes needed)" -ForegroundColor Gray
                $filesSkipped++
            }
        } catch {
            Write-Host "  ❌ Error: $file - $($_.Exception.Message)" -ForegroundColor Red
        }
    } else {
        Write-Host "  ⚠️  Not found: $file" -ForegroundColor Yellow
    }
}

Write-Host "`n═══════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "                    SUMMARY" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════════`n" -ForegroundColor Cyan

Write-Host "  Files Updated: $filesUpdated" -ForegroundColor Green
Write-Host "  Files Skipped: $filesSkipped" -ForegroundColor Gray
Write-Host "`n✅ Rename complete!`n" -ForegroundColor Green

Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "  1. Run: npm test" -ForegroundColor White
Write-Host "  2. Run: npm run validate" -ForegroundColor White
Write-Host "  3. Run: npm run check-package" -ForegroundColor White
Write-Host "  4. Commit changes" -ForegroundColor White
Write-Host "  5. Publish to npm`n" -ForegroundColor White
