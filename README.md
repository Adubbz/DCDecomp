DCDecomp is a work-in-progress decompilation project for Dark Cloud for the PlayStation 2.

# Requirements
Building is currently tested against Windows using chocolatey for dependencies. The following is a non-exhaustive list of package requirements:
* gnuwin32-coreutils

# Building
* Clone the repo with ``git clone --recurse-submodules https://github.com/Adubbz/DCDecomp.git``
* Place ``SCUS_971.11`` in the ``rom`` folder in the root of the repo.
* Place the ``ee`` folder from inside the zip [here](https://archive.org/download/SNSystemsProDGPs2/ProDGPs2usrLocalSceFiles.zip) into the ``tools`` folder.
* Run ``make extract``
* Run ``make``