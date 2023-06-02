DCDecomp is a work-in-progress decompilation project for Dark Cloud for the PlayStation 2.

This project is targeting the NTSC 1.02 version of the game. Other versions may be considered in the future, though they aren't currently planned.

ISO SHA256: ``9B440CDB921EB393A6BAA9B6AF1CD3D523A20EB5F95CEA8ED14E9D19404BB875``

# Building
It is highly likely that you may run into issues with setups other than mine (particularly with things like WSL). Contributions to improve the build system are more than welcome.

* Clone the repo with ``git clone --recurse-submodules https://github.com/Adubbz/DCDecomp.git``
* Place ``SCUS_971.11`` in the ``rom`` folder in the root of the repo.
* Place the ``ee`` folder from inside the zip [here](https://archive.org/download/SNSystemsProDGPs2/ProDGPs2usrLocalSceFiles.zip) into the ``tools`` folder.
* Run ``make extract``
* Run ``make``