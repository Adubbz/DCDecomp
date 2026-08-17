@echo off
rem Build everything in the container and leave the results in build\.

cd %~dp0

if not exist "rom\Dark Cloud (USA).iso" (
    echo rom\Dark Cloud ^(USA^).iso is missing; place the NTSC 1.02 ISO there first.
    exit /b 1
)

rem Podman is what the project targets; the image is plain OCI, so Docker works.
rem Each check is its own statement: %ERRORLEVEL% inside a parenthesised block
rem would be expanded before the block runs.
set BUILDER=
where podman >nul 2>nul
if %ERRORLEVEL% == 0 set BUILDER=podman
if defined BUILDER goto build

where docker >nul 2>nul
if %ERRORLEVEL% == 0 set BUILDER=docker
if defined BUILDER goto build

echo Podman or Docker not found! Please visit https://podman.io/docs/installation
exit /b 1

:build
rem rom\ is mounted rather than copied in, to keep the 1.7GB ISO out of the
rem build context. The reference assembly is checked in, so nothing else has to
rem survive between runs. build\ receives the executable and the overlays.
%BUILDER% build -t dcdecomp_build --target build . || exit /b 1
if not exist build mkdir build
%BUILDER% run --rm -v .\rom:/dcdecomp/rom -v .\build:/output dcdecomp_build
