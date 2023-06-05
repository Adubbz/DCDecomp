# Dark Cloud Decompilation Project

DCDecomp is a work-in-progress decompilation project for Dark Cloud for the PlayStation 2.

This project is targeting the NTSC 1.02 version of the game. Other versions may be considered in the future, though they aren't currently planned.

ISO SHA256: ``9B440CDB921EB393A6BAA9B6AF1CD3D523A20EB5F95CEA8ED14E9D19404BB875``

This aims to be a matching decompilation project. Currently an elf is produced with text and data sections identical to the original. The compiler used by Level 5 (and by extension this project) is ``MWCC/MWLD 2.3.1.01``. In future strategies of matching the symbol/strings tables may be explored, though this isn't a current priority.

# Building
It is highly likely that you may run into with building as it has not been tested under a broad range of conditions. Contributions to improve the build system are more than welcome.

* Clone the repo with ``git clone --recurse-submodules https://github.com/Adubbz/DCDecomp.git``
* Place ``SCUS_971.11`` in the ``rom`` folder in the root of the repo.
* Place the ``ee`` folder from inside the zip [here](https://archive.org/download/SNSystemsProDGPs2/ProDGPs2usrLocalSceFiles.zip) into the ``tools`` folder.
* Run ``make extract``
* Run ``make``