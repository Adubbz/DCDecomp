# Dark Cloud Decompilation Project

DCDecomp is a work-in-progress decompilation project for Dark Cloud for the PlayStation 2.

This project is targeting the NTSC 1.02 version of the game. Other versions may be considered in the future, though they aren't currently planned.

This aims to be a matching decompilation project. Currently an elf is produced with text and data sections identical to the original. The compiler used by Level 5 (and by extension this project) is `MWCC/MWLD 2.3.1.01`. In future strategies of matching the symbol/strings tables may be explored, though this isn't a current priority.

# Building

## Windows

1. Install [Docker for Windows](https://docs.docker.com/desktop/install/windows-install/)
2. Install [git](https://git-scm.com/download/win)
3. Clone the project with `git clone --recurse-submodules https://github.com/Adubbz/DCDecomp.git`
4. Place the NTSC 1.02 ISO with the name `Dark Cloud (USA).iso` inside the `rom` folder at the root of the project.
5. Run `scripts\build.bat` within the project directory.

## Linux (works on immutable distros with SELinux enabled)

1. Install [Docker for Linux](https://docs.docker.com/desktop/setup/install/linux/)
2. Clone the project with `git clone --recurse-submodules https://github.com/Adubbz/DCDecomp.git`
3. Place the NTSC 1.02 ISO with the name `Dark Cloud (USA).iso` inside the `rom` folder at the root of the project.
4. Run `scripts\build.sh` within the project directory.

# Development

## Windows

It is strongly advised that when developing with WSL 2 that you **DO NOT** store the project in a subdirectory of `/mnt`. This is severely detrimental to filesystem performance and by extension compilation performance.
