#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct SPI_FUNC_PARAM;
struct TAG_PARAM;


class CScriptInterpreter {
public:
    /**
     * @mangled GetNextTAG__18CScriptInterpreterFv
     * @address 0x15F100
     * @size 0x150
     * @unknownret
     */
    void GetNextTAG(void);

    /**
     * @mangled SetTAG__18CScriptInterpreterFP9TAG_PARAMi
     * @address 0x15F250
     * @size 0x10
     * @unknownret
     */
    void SetTAG(TAG_PARAM *, int);

    /**
     * @mangled SetFunction__18CScriptInterpreterFP14SPI_FUNC_PARAMi
     * @address 0x15F260
     * @size 0x10
     * @unknownret
     */
    void SetFunction(SPI_FUNC_PARAM *, int);

    /**
     * @mangled SetScript__18CScriptInterpreterFPci
     * @address 0x15F270
     * @size 0x40
     * @unknownret
     */
    void SetScript(char *, int);

    /**
     * @mangled __ct__18CScriptInterpreterFv
     * @address 0x15F2B0
     * @size 0x40
     */
    CScriptInterpreter(void);

    /**
     * @mangled ControlCode__18CScriptInterpreterFv
     * @address 0x15F2F0
     * @size 0x180
     * @unknownret
     */
    void ControlCode(void);

    /**
     * @mangled CallFunction__18CScriptInterpreterFPi
     * @address 0x15F470
     * @size 0x320
     * @unknownret
     */
    void CallFunction(int *);

    /**
     * @mangled GetArg__18CScriptInterpreterFPi
     * @address 0x15F790
     * @size 0x3F0
     * @unknownret
     */
    void GetArg(int *);

    /**
     * @mangled SearchCommand__18CScriptInterpreterFPi
     * @address 0x15FB80
     * @size 0x1B0
     * @unknownret
     */
    void SearchCommand(int *);
};
