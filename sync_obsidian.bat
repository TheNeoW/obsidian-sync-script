@echo off
REM Set the path to your Obsidian vault
set VAULT_PATH=<vauults path>
REM Get the current date and time
for /f "tokens=2 delims==." %%A in ('wmic os get localdatetime /value') do set dt=%%A
set TIMESTAMP=%dt:~0,4%-%dt:~4,2%-%dt:~6,2% %dt:~8,2%:%dt:~10,2%:%dt:~12,2%

REM Navigate to the vault directory
cd /d %VAULT_PATH%

REM Pull the latest changes from the remote repository
echo Pulling the latest changes from GitHub...
git pull origin main

REM Add all changes to Git
echo Staging changes...
git add .

REM Commit the changes with a timestamp
echo Committing changes...
git commit -m "Sync on %TIMESTAMP%"

REM Push changes to the remote repository
echo Pushing changes to GitHub...
git push origin main

echo Sync complete!
pause
