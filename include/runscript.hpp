#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct RS_CALLDATA;
struct RS_PROG_HEADER;
struct RS_STACKDATA;
struct funcdata;
struct vmcode_t;


class CRunScript {
public:
    /**
     * @mangled __ct__10CRunScriptFv
     * @address 0x23D940
     * @size 0x40
     */
    CRunScript(void);

    /**
     * @mangled check_stack__10CRunScriptFv
     * @address 0x23D980
     * @size 0x40
     * @unknownret
     */
    void check_stack(void);

    /**
     * @mangled push__10CRunScriptF12RS_STACKDATA
     * @address 0x23D9C0
     * @size 0x50
     * @unknownret
     */
    void push(RS_STACKDATA);

    /**
     * @mangled push_int__10CRunScriptFi
     * @address 0x23DA10
     * @size 0x50
     * @unknownret
     */
    void push_int(int);

    /**
     * @mangled push_str__10CRunScriptFPc
     * @address 0x23DA60
     * @size 0x60
     * @unknownret
     */
    void push_str(char *);

    /**
     * @mangled push_ptr__10CRunScriptFP12RS_STACKDATA
     * @address 0x23DAC0
     * @size 0x60
     * @unknownret
     */
    void push_ptr(RS_STACKDATA *);

    /**
     * @mangled push_float__10CRunScriptFf
     * @address 0x23DB20
     * @size 0x60
     * @unknownret
     */
    void push_float(float);

    /**
     * @mangled pop__10CRunScriptFv
     * @address 0x23DB80
     * @size 0x30
     * @unknownret
     */
    void pop(void);

    /**
     * @mangled call_func__10CRunScriptFP8funcdataP8vmcode_t
     * @address 0x23DBB0
     * @size 0x110
     * @unknownret
     */
    void call_func(funcdata *, vmcode_t *);

    /**
     * @mangled ret_func__10CRunScriptFv
     * @address 0x23DCC0
     * @size 0x40
     * @unknownret
     */
    void ret_func(void);

    /**
     * @mangled ext__10CRunScriptFP12RS_STACKDATAi
     * @address 0x23DD00
     * @size 0xC0
     * @unknownret
     */
    void ext(RS_STACKDATA *, int);

    /**
     * @mangled load__10CRunScriptFP14RS_PROG_HEADERP12RS_STACKDATAiP11RS_CALLDATAi
     * @address 0x23DDC0
     * @size 0x50
     * @unknownret
     */
    void load(RS_PROG_HEADER *, RS_STACKDATA *, int, RS_CALLDATA *, int);

    /**
     * @mangled reload__10CRunScriptFP14RS_PROG_HEADER
     * @address 0x23DE10
     * @size 0x20
     * @unknownret
     */
    void reload(RS_PROG_HEADER *);

    /**
     * @mangled ext_func__10CRunScriptFPPFP12RS_STACKDATAi_ii
     * @address 0x23DE30
     * @size 0x10
     * @unknownret
     */
    void ext_func(int (**)(RS_STACKDATA *, int), int);

    /**
     * @mangled resume__10CRunScriptFv
     * @address 0x23DE40
     * @size 0x30
     * @unknownret
     */
    void resume(void);

    /**
     * @mangled run__10CRunScriptFi
     * @address 0x23DE70
     * @size 0x180
     * @unknownret
     */
    void run(int);

    /**
     * @mangled check_program__10CRunScriptFi
     * @address 0x23DFF0
     * @size 0x60
     * @unknownret
     */
    void check_program(int);

    /**
     * @mangled skip__10CRunScriptFv
     * @address 0x23E050
     * @size 0x30
     * @unknownret
     */
    void skip(void);

    /**
     * @mangled exe__10CRunScriptFP8vmcode_t
     * @address 0x23E080
     * @size 0x50
     * @unknownret
     */
    void exe(vmcode_t *);
};
