#pragma once

#include "common.h"

class CScript {
public:
    /* ?ret */ void Load(const char *); // @ 0x1DABD80 (0x160 bytes) -- mangled: Load__7CScriptFPCc
    /* ?ret */ void Step(void); // @ 0x1DABEE0 (0x230 bytes) -- mangled: Step__7CScriptFv
    /* ?ret */ void CheckScript(char *, int, CSCRIPT_COMMAND *, int); // @ 0x1DAC110 (0xB40 bytes) -- mangled: CheckScript__7CScriptFPciP15CSCRIPT_COMMANDi
    /* ?ret */ void CheckArg(char *, int, CSCRIPT_COMMAND *); // @ 0x1DACC50 (0x440 bytes) -- mangled: CheckArg__7CScriptFPciP15CSCRIPT_COMMAND
    /* ?ret */ void SkipSpace(char *, int); // @ 0x1DAD090 (0x150 bytes) -- mangled: SkipSpace__7CScriptFPci
};
