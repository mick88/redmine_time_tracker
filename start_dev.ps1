# Check if docker is running
$dockerInfo = docker info 2>&1
if ($LastExitCode -ne 0) {
    Write-Host "Docker is not running. Please start Docker Desktop and try again." -ForegroundColor Red
    exit 1
}

Write-Host "Starting Redmine with Time Tracker plugin..." -ForegroundColor Green
docker-compose up -d

Write-Host "Waiting for Redmine to start..." -ForegroundColor Yellow
# Simple wait loop or just let the user know
Write-Host "Redmine is starting up. It might take a minute to install dependencies and migrate database."
Write-Host "You can follow logs with: docker-compose logs -f redmine"
Write-Host "Access Redmine at: http://localhost:3000"
