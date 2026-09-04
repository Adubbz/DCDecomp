#pragma once

#include "common.h"

/**
 * A tagged value stored on the script interpreter's operand stack.
 */
struct RS_STACKDATA {
    int type; /**< Identifies the active value representation. */

    union {
        int i;
        float f;
        char *s;
        RS_STACKDATA *p;
    };
};

enum {
    RS_INT = 0,
    RS_FLOAT = 1,
    RS_STR = 2,
    RS_PTR = 3
};

/**
 * A single virtual-machine instruction and its two opcode-specific operands.
 */
struct vmcode_t {
    int op;   /**< Selects the operation to execute. */
    int arg1; /**< Supplies the operation's first operand. */
    int arg2; /**< Supplies the operation's second operand. */
};

/**
 * Describes a script function's code position and stack-frame requirements.
 */
struct funcdata {
    int addr;   /**< Stores the function's offset in the code block. */
    char *name; /**< Names the function for runtime diagnostics. */
    int local;  /**< Gives the total number of frame slots. */
    int arg;    /**< Gives the number of argument slots. */
};

/**
 * Preserves interpreter state for a suspended script call.
 */
struct RS_CALLDATA {
    vmcode_t *ret;       /**< Points to the caller's return instruction. */
    RS_STACKDATA *frame; /**< Points to the caller's stack frame. */
    funcdata *func;      /**< Describes the caller's function. */
};

/**
 * Maps an external program number to its function description.
 */
struct RS_PROGDATA {
    int no;   /**< Identifies the externally selectable program. */
    int func; /**< Stores the function-description offset. */
};

/**
 * Describes the offset-based sections of a compiled script program.
 */
struct RS_PROG_HEADER {
    int unk_0;    /**< Preserves an unidentified header word. */
    int main;     /**< Stores the main function-description offset. */
    int code;     /**< Stores the bytecode-section offset. */
    int prog;     /**< Stores the program-table offset. */
    int prog_num; /**< Gives the number of program-table entries. */
};

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
    RS_STACKDATA pop(void);

    /**
     * @mangled call_func__10CRunScriptFP8funcdataP8vmcode_t
     * @address 0x23DBB0
     * @size 0x110
     * @unknownret
     */
    vmcode_t *call_func(funcdata *, vmcode_t *);

    /**
     * @mangled ret_func__10CRunScriptFv
     * @address 0x23DCC0
     * @size 0x40
     * @unknownret
     */
    vmcode_t *ret_func(void);

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
    int run(int);

    /**
     * @mangled check_program__10CRunScriptFi
     * @address 0x23DFF0
     * @size 0x60
     * @unknownret
     */
    int check_program(int);

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

    int ext_func_num;                            /**< Gives the number of registered external functions. */
    int (**ext_func_table)(RS_STACKDATA *, int); /**< Points to the external function table. */
    int stack_num;                               /**< Gives the operand stack capacity. */
    RS_STACKDATA *stack;                         /**< Points to the operand stack storage. */
    RS_STACKDATA *sp;                            /**< Points to the next operand stack slot. */
    RS_STACKDATA *stack_end;                     /**< Points one past the operand stack storage. */
    int call_num;                                /**< Gives the call stack capacity. */
    RS_CALLDATA *call;                           /**< Points to the call stack storage. */
    RS_CALLDATA *call_sp;                        /**< Points to the next call stack entry. */
    RS_CALLDATA *call_end;                       /**< Points one past the call stack storage. */
    RS_STACKDATA *frame;                         /**< Points to the active operand frame. */
    funcdata *func;                              /**< Describes the active script function. */
    vmcode_t *pc;                                /**< Points to the next instruction. */
    int end;                                     /**< Records whether execution has completed. */
    int skip_wait;                               /**< Records whether wait operations should be skipped. */
    RS_PROG_HEADER *prog;                        /**< Points to the loaded program header. */
    char *code;                                  /**< Points to the loaded bytecode section. */
    int result;                                  /**< Stores the script's return value. */
};
