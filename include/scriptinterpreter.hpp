#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct SPI_FUNC_PARAM;
struct TAG_PARAM;


class CScriptInterpreter {
public:
    /* ?ret */ void GetNextTAG(void); // @ 0x15F100 (0x150 bytes) -- mangled: GetNextTAG__18CScriptInterpreterFv
    /* ?ret */ void SetTAG(TAG_PARAM *, int); // @ 0x15F250 (0x10 bytes) -- mangled: SetTAG__18CScriptInterpreterFP9TAG_PARAMi
    /* ?ret */ void SetFunction(SPI_FUNC_PARAM *, int); // @ 0x15F260 (0x10 bytes) -- mangled: SetFunction__18CScriptInterpreterFP14SPI_FUNC_PARAMi
    /* ?ret */ void SetScript(char *, int); // @ 0x15F270 (0x40 bytes) -- mangled: SetScript__18CScriptInterpreterFPci
    CScriptInterpreter(void); // @ 0x15F2B0 (0x40 bytes) -- mangled: __ct__18CScriptInterpreterFv
    /* ?ret */ void ControlCode(void); // @ 0x15F2F0 (0x180 bytes) -- mangled: ControlCode__18CScriptInterpreterFv
    /* ?ret */ void CallFunction(int *); // @ 0x15F470 (0x320 bytes) -- mangled: CallFunction__18CScriptInterpreterFPi
    /* ?ret */ void GetArg(int *); // @ 0x15F790 (0x3F0 bytes) -- mangled: GetArg__18CScriptInterpreterFPi
    /* ?ret */ void SearchCommand(int *); // @ 0x15FB80 (0x1B0 bytes) -- mangled: SearchCommand__18CScriptInterpreterFPi
};
