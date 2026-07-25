#pragma once

#include "common.h"

class CRunScript {
public:
    CRunScript(void); // @ 0x23D940 (0x40 bytes) -- mangled: __ct__10CRunScriptFv
    /* ?ret */ void check_stack(void); // @ 0x23D980 (0x40 bytes) -- mangled: check_stack__10CRunScriptFv
    /* ?ret */ void push(RS_STACKDATA); // @ 0x23D9C0 (0x50 bytes) -- mangled: push__10CRunScriptF12RS_STACKDATA
    /* ?ret */ void push_int(int); // @ 0x23DA10 (0x50 bytes) -- mangled: push_int__10CRunScriptFi
    /* ?ret */ void push_str(char *); // @ 0x23DA60 (0x60 bytes) -- mangled: push_str__10CRunScriptFPc
    /* ?ret */ void push_ptr(RS_STACKDATA *); // @ 0x23DAC0 (0x60 bytes) -- mangled: push_ptr__10CRunScriptFP12RS_STACKDATA
    /* ?ret */ void push_float(float); // @ 0x23DB20 (0x60 bytes) -- mangled: push_float__10CRunScriptFf
    /* ?ret */ void pop(void); // @ 0x23DB80 (0x30 bytes) -- mangled: pop__10CRunScriptFv
    /* ?ret */ void call_func(funcdata *, vmcode_t *); // @ 0x23DBB0 (0x110 bytes) -- mangled: call_func__10CRunScriptFP8funcdataP8vmcode_t
    /* ?ret */ void ret_func(void); // @ 0x23DCC0 (0x40 bytes) -- mangled: ret_func__10CRunScriptFv
    /* ?ret */ void ext(RS_STACKDATA *, int); // @ 0x23DD00 (0xC0 bytes) -- mangled: ext__10CRunScriptFP12RS_STACKDATAi
    /* ?ret */ void load(RS_PROG_HEADER *, RS_STACKDATA *, int, RS_CALLDATA *, int); // @ 0x23DDC0 (0x50 bytes) -- mangled: load__10CRunScriptFP14RS_PROG_HEADERP12RS_STACKDATAiP11RS_CALLDATAi
    /* ?ret */ void reload(RS_PROG_HEADER *); // @ 0x23DE10 (0x20 bytes) -- mangled: reload__10CRunScriptFP14RS_PROG_HEADER
    /* ?ret */ void ext_func(int (**)(RS_STACKDATA *, int), int); // @ 0x23DE30 (0x10 bytes) -- mangled: ext_func__10CRunScriptFPPFP12RS_STACKDATAi_ii
    /* ?ret */ void resume(void); // @ 0x23DE40 (0x30 bytes) -- mangled: resume__10CRunScriptFv
    /* ?ret */ void run(int); // @ 0x23DE70 (0x180 bytes) -- mangled: run__10CRunScriptFi
    /* ?ret */ void check_program(int); // @ 0x23DFF0 (0x60 bytes) -- mangled: check_program__10CRunScriptFi
    /* ?ret */ void skip(void); // @ 0x23E050 (0x30 bytes) -- mangled: skip__10CRunScriptFv
    /* ?ret */ void exe(vmcode_t *); // @ 0x23E080 (0x50 bytes) -- mangled: exe__10CRunScriptFP8vmcode_t
};
