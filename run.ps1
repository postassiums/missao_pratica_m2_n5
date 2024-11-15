function Run-DockerCompose {
    param (
        [string]$ComposeFilePattern
    )

    $composeFile = Get-ChildItem -Path $ComposeFilePattern -File | Select-Object -First 1
    if (-not $composeFile) {
        Write-Error "No docker-compose file found matching $ComposeFilePattern"
        exit 1
    }

    docker compose -f $composeFile.FullName up -d
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Docker compose failed for $ComposeFilePattern"
        exit $LASTEXITCODE
    }
}

Run-DockerCompose "backend/docker-compose*"
Run-DockerCompose "frontends/livros-angular/docker-compose*"
Run-DockerCompose "frontends/livros-next/docker-compose*"
Run-DockerCompose "frontends/livros-react/docker-compose*"
