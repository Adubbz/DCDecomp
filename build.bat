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
rem rom\ and ref\ are mounted rather than copied in: rom\ keeps the 1.7GB ISO
rem out of the build context, and ref\ makes the extraction and disassembly
rem survive between runs. build\ receives the executable, the overlays and the
rem context.
%BUILDER% build -t dcdecomp_build --target build . || exit /b 1
if not exist ref mkdir ref
%BUILDER% run --rm -v .\rom:/dcdecomp/rom -v .\ref:/dcdecomp/ref -v .\build:/output dcdecomp_build
