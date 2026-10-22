@echo off
cd /d "%~dp0"
where bundle >nul 2>nul || (
  echo Ruby/Bundler not found. Please run setup.bat first.
  pause
  exit /b 1
)
call bundle check >nul 2>nul || call bundle install || (
  pause
  exit /b 1
)
echo Starting local server at http://localhost:4000  ^(Ctrl+C to stop^)
start "" http://localhost:4000
call bundle exec jekyll serve --livereload --drafts %*
pause
