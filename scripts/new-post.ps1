# Create a new post in _posts/. Usage: new-post.bat "Title" [slug]
param(
  [string]$Title,
  [string]$Slug
)
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path $PSScriptRoot -Parent)

if (-not $Title) { $Title = Read-Host 'Post title' }
if (-not $Title) { Write-Host 'Title is required.' -ForegroundColor Red; exit 1 }

if (-not $Slug) {
  # Keep ASCII letters/digits from the title; fall back to a timestamp for non-ASCII titles
  $Slug = ($Title.ToLower() -replace '[^a-z0-9]+', '-').Trim('-')
  if (-not $Slug) { $Slug = 'post-' + (Get-Date -Format 'HHmmss') }
}

$now  = Get-Date
$path = Join-Path '_posts' ('{0}-{1}.md' -f $now.ToString('yyyy-MM-dd'), $Slug)
if (Test-Path $path) { Write-Host "Already exists: $path" -ForegroundColor Red; exit 1 }

$content = @"
---
title: $Title
date: $($now.ToString('yyyy-MM-dd HH:mm:ss')) +0800
tags: []
description:
---

"@

# Jekyll expects UTF-8 without BOM
[IO.File]::WriteAllText((Join-Path (Get-Location) $path), $content, (New-Object Text.UTF8Encoding $false))
Write-Host "Created: $path" -ForegroundColor Green
