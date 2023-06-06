@echo off

cd %~dp0\..\

where docker >nul 2>nul
if not %ERRORLEVEL% == 0 (
    echo Docker is not found! Please visit https://docs.docker.com/desktop/install/windows-install/
) else (
    docker build -t dcdecomp_build --target build .
    docker run --rm -v .\build:/output dcdecomp_build
)
