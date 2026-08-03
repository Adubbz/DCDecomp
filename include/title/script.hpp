#pragma once

#include "common.h"

class CScript {
public:
    /**
     * @mangled Load__7CScriptFPCc
     * @address 0x1DABD80
     * @size 0x160
     * @unknownret
     */
    void Load(const char *);

    /**
     * @mangled Step__7CScriptFv
     * @address 0x1DABEE0
     * @size 0x230
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled CheckScript__7CScriptFPciP15CSCRIPT_COMMANDi
     * @address 0x1DAC110
     * @size 0xB40
     * @unknownret
     */
    void CheckScript(char *, int, CSCRIPT_COMMAND *, int);

    /**
     * @mangled CheckArg__7CScriptFPciP15CSCRIPT_COMMAND
     * @address 0x1DACC50
     * @size 0x440
     * @unknownret
     */
    void CheckArg(char *, int, CSCRIPT_COMMAND *);

    /**
     * @mangled SkipSpace__7CScriptFPci
     * @address 0x1DAD090
     * @size 0x150
     * @unknownret
     */
    void SkipSpace(char *, int);
};
