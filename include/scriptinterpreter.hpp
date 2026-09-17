#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct SPI_FUNC_PARAM;

/** Describes one script tag and the types of arguments that follow it. */
struct TAG_PARAM {
    char *name;             /**< Text name used to find the tag. */
    int argument_types[24]; /**< Argument kinds, terminated by a negative value. */
};

STATIC_ASSERT(sizeof(TAG_PARAM) == 0x64);

class CScriptInterpreter {
public:
    /**
     * Reads the next tag out of the script and gives its number.
     *
     * @mangled GetNextTAG__18CScriptInterpreterFv
     * @address 0x15F100
     * @size 0x144
     */
    int GetNextTAG(void);

    /**
     * Gives the interpreter the table of tags it recognises.
     *
     * @mangled SetTAG__18CScriptInterpreterFP9TAG_PARAMi
     * @address 0x15F250
     * @size 0x10
     */
    void SetTAG(TAG_PARAM *, int);

    /**
     * Gives the interpreter the table of commands it may call.
     *
     * @mangled SetFunction__18CScriptInterpreterFP14SPI_FUNC_PARAMi
     * @address 0x15F260
     * @size 0x10
     */
    void SetFunction(SPI_FUNC_PARAM *, int);

    /**
     * Points the interpreter at the script text it is to read.
     *
     * @mangled SetScript__18CScriptInterpreterFPci
     * @address 0x15F270
     * @size 0x38
     */
    void SetScript(char *, int);

    /**
     * Constructs an interpreter with no script, tags or commands.
     *
     * @mangled __ct__18CScriptInterpreterFv
     * @address 0x15F2B0
     * @size 0x38
     */
    CScriptInterpreter(void);

    /**
     * Reads one control code out of the script.
     *
     * @mangled ControlCode__18CScriptInterpreterFv
     * @address 0x15F2F0
     * @size 0x178
     */
    void ControlCode(void);

    /**
     * Calls the command the script names, having gathered its arguments.
     *
     * @mangled CallFunction__18CScriptInterpreterFPi
     * @address 0x15F470
     * @size 0x320
     */
    void CallFunction(int *);

    /**
     * Reads one command argument out of the script.
     *
     * @mangled GetArg__18CScriptInterpreterFPi
     * @address 0x15F790
     * @size 0x3F0
     */
    void GetArg(int *);

    /**
     * Finds the command table entry the script's next word names.
     *
     * @mangled SearchCommand__18CScriptInterpreterFPi
     * @address 0x15FB80
     * @size 0x1A4
     */
    void SearchCommand(int *);

    u8 unk_000[0x424];         /**< Parser state and command lookup work. */
    void *arguments[24];       /**< Arguments decoded for the current command. */
    char argument_text[0x40C]; /**< Inline storage for decoded string arguments. */
};

STATIC_ASSERT(sizeof(CScriptInterpreter) == 0x890);
