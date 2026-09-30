#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 15

#include "runscript.hpp"

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "battle_globals.hpp"

void runerror(const char *message) {
    fprintf(stderr, "RUNTIME ERROR: %s\n", message);
    exit__2(-1);
}

void stkoverflow() {
    runerror("stack overflow");
}

int chk_int(RS_STACKDATA data, funcdata *function) {
    if (data.type == RS_INT) {
        return data.i;
    }

    fprintf(stderr, "RUNTIME ERROR: %s: operand is not integer\n", function->name);
    exit__2(-1);
    return 0;
}

int is_true(RS_STACKDATA data) {
    return !(data.type == RS_INT && data.i == 0);
}

void divby0error() {
    runerror("Divide by 0");
}

void modby0error() {
    runerror("Modulo by 0");
}

void print(RS_STACKDATA *data, int count) {
    for (int index = 0; index < count; index++, data++) {
        if (data->type == RS_INT) {
            printf("%d", data->i);
        } else if (data->type == RS_STR) {
            printf("%s", data->s);
        } else if (data->type == RS_FLOAT) {
            printf("%f", data->f);
        }

        fflush(stdout);
    }
}

CRunScript::CRunScript() {
    sp = stack;
    stack_end = stack;
    call_sp = call;
    call_end = call;
    pc = 0;
    ext_func_num = 0;
    stack_num = 0;
    call_num = 0;
    skip_wait = 0;
}

void CRunScript::check_stack() {
    if (sp >= stack_end) {
        stkoverflow();
    }
}

void CRunScript::push(RS_STACKDATA value) {
    check_stack();
    *sp++ = value;
}

void CRunScript::push_int(int value) {
    check_stack();
    sp->type = RS_INT;
    sp++->i = value;
}

void CRunScript::push_str(char *string) {
    check_stack();
    sp->type = RS_STR;
    sp++->s = string;
}

void CRunScript::push_ptr(RS_STACKDATA *pointer) {
    check_stack();
    sp->type = RS_PTR;
    sp++->p = pointer;
}

void CRunScript::push_float(float value) {
    check_stack();
    sp->type = RS_FLOAT;
    sp++->f = value;
}

RS_STACKDATA CRunScript::pop() {
    return *--sp;
}

/* A call takes its arguments from the operand stack in place: the new frame starts where the
   caller left them, so nothing is copied and only the locals past them have to be cleared. */
vmcode_t *CRunScript::call_func(funcdata *callee, vmcode_t *return_pc) {
    if (call_sp >= call_end) {
        printf("\202\261\202\352\210\310\217\343\212\326\220\224\214\304\202\321\217\157\202\265"
               "\202\252\202\305\202\253\202\334\202\271\202\361\201\102\n");
        exit__2(-2);
    }

    call_sp->ret = return_pc;
    call_sp->func = func;
    call_sp->frame = frame;
    frame = sp - callee->arg;
    sp = frame + callee->local;
    func = callee;
    call_sp++;
    memset(frame + func->arg, 0, (func->local - func->arg) * sizeof(RS_STACKDATA));
    check_stack();
    return (vmcode_t *) (code + (int) callee->addr);
}

vmcode_t *CRunScript::ret_func() {
    call_sp--;
    frame = call_sp->frame;
    func = call_sp->func;
    return call_sp->ret;
}

void CRunScript::ext(RS_STACKDATA *args, int argc) {
    if (args->i < 0 || args->i >= ext_func_num) {
        printf("not found ext %d\n", args->i);
    } else if (ext_func_table[args->i] == 0) {
        printf("not found ext %d\n", args->i);
    } else if ((*ext_func_table[args->i])(args + 1, argc - 1) == 0) {
        printf("illegal function call ext %d\n", args->i);
    }
}

void CRunScript::load(RS_PROG_HEADER *prog, RS_STACKDATA *stack, int stack_num, RS_CALLDATA *call, int call_num) {
    this->stack = stack;
    this->stack_num = stack_num;
    this->call = call;
    this->call_num = call_num;
    this->stack_end = this->stack + stack_num;
    this->call_end = this->call + call_num;
    this->prog = prog;
    this->code = (char *) prog + prog->code;
}

void CRunScript::reload(RS_PROG_HEADER *prog) {
    this->prog = prog;
    code = (char *) prog + prog->code;
}

void CRunScript::ext_func(int (**table)(RS_STACKDATA *, int), int count) {
    ext_func_table = table;
    ext_func_num = count;
}

void CRunScript::resume() {
    if (pc) {
        exe(pc);
    }
}

int CRunScript::run(int no) {
    RS_PROGDATA    *entry;
    int             i;
    RS_PROG_HEADER *header;
    vmcode_t       *start;

    if (prog == 0) {
        return -1;
    }

    sp = stack;
    call_sp = call;
    func = 0;

    if (no < 0) {
        func = (funcdata *) ((char *) prog + prog->main);
    } else {
        header = prog;
        entry = (RS_PROGDATA *) ((char *) header + header->prog);

        for (i = 0; i < header->prog_num; i++, entry++) {
            if (entry->no == no) {
                func = (funcdata *) ((char *) header + entry->func);
                break;
            }
        }
    }

    if (func == 0) {
        printf("not found program %d\n", no);
        return -1;
    }

    frame = sp - func->arg;
    sp = frame + func->local;
    check_stack();
    memset(frame + func->arg, 0, (func->local - func->arg) * sizeof(RS_STACKDATA));
    start = (vmcode_t *) (code + (int) func->addr);
    end = 0;
    skip_wait = 0;
    exe(start);
    return end != 0 ? 0 : 1;
}

int CRunScript::check_program(int no) {
    RS_PROGDATA    *entry;
    int             i;
    RS_PROG_HEADER *header;

    header = prog;
    entry = (RS_PROGDATA *) ((char *) header + header->prog);

    for (i = 0; i < header->prog_num; i++, entry++) {
        if (entry->no == no) {
            return 1;
        }
    }

    return 0;
}

void CRunScript::skip() {
    skip_wait = 1;
    resume();
}

/* The loop runs on pc rather than on the argument, because three of the opcodes leave the
   machine suspended and the only thing that makes a later resume possible is the program counter
   being in the object when they return. Every case that does not redirect control falls out of
   the switch to the step at the bottom, so an opcode that jumps writes pc and continues. */
void CRunScript::exe(vmcode_t *entry) {
    RS_STACKDATA value;
    RS_STACKDATA rhs;
    RS_STACKDATA lhs;
    float        rhs_f;
    float        lhs_f;
    int          rhs_i;
    int          lhs_i;

    pc = entry;

    for (;;) {
        switch (pc->op) {
            case 1:
                switch (pc->arg2) {
                    case 1:
                        push(*(frame + pc->arg1));
                        break;
                    case 2:
                        push(*(frame + pc->arg1 + chk_int(pop(), func)));
                        break;
                    case 4:
                        push(*(frame[pc->arg1].p + chk_int(pop(), func)));
                        break;
                    case 8:
                        (frame + pc->arg1)->type = RS_FLOAT;
                        push(*(frame + pc->arg1));
                        break;
                    case 16:
                        rhs_i = chk_int(pop(), func);
                        (frame + pc->arg1 + rhs_i)->type = RS_FLOAT;
                        push(*(frame + pc->arg1 + rhs_i));
                        break;
                    case 32:
                        rhs_i = chk_int(pop(), func);
                        (frame[pc->arg1].p + rhs_i)->type = RS_FLOAT;
                        push(*(frame[pc->arg1].p + rhs_i));
                        break;
                }

                break;
            case 2:
                switch (pc->arg2) {
                    case 1:
                        push_ptr(frame + pc->arg1);
                        break;
                    case 2:
                        push_ptr(frame + pc->arg1 + chk_int(pop(), func));
                        break;
                    case 4:
                        push_ptr(frame[pc->arg1].p + chk_int(pop(), func));
                        break;
                    case 8:
                        push_ptr(frame + pc->arg1);
                        break;
                    case 16:
                        push_ptr(frame + pc->arg1 + chk_int(pop(), func));
                        break;
                    case 32:
                        push_ptr(frame[pc->arg1].p + chk_int(pop(), func));
                        break;
                }

                break;
            case 5:
                value = pop();
                *pop().p = value;
                push(value);
                break;
            case 3:
                if (pc->arg1 == 1) {
                    push_int(pc->arg2);
                } else if (pc->arg1 == 3) {
                    push_str(code + (int) pc->arg2);
                } else if (pc->arg1 == 2) {
                    push_float(*(float *) &pc->arg2);
                }

                break;
            case 4:
                sp--;
                break;
            case 16:
                if (!skip_wait) {
                    pc = (vmcode_t *) (code + (int) pc->arg1);
                    continue;
                }

                break;
            case 18:
                if (!skip_wait) {
                    if (is_true(pop())) {
                        if (pc->arg2) {
                            push_int(1);
                        }

                        pc = (vmcode_t *) (code + (int) pc->arg1);
                        continue;
                    }
                }

                break;
            case 17:
                if (!skip_wait) {
                    if (!is_true(pop())) {
                        if (pc->arg2) {
                            push_int(0);
                        }

                        pc = (vmcode_t *) (code + (int) pc->arg1);
                        continue;
                    }
                }

                break;
            case 14:
                rhs = pop();
                lhs = pop();

                if (lhs.type == RS_INT && rhs.type == RS_INT) {
                    rhs_i = rhs.i;
                    lhs_i = lhs.i;

                    switch (pc->arg1) {
                        case 40:
                            push_int(rhs_i == lhs_i);
                            break;
                        case 41:
                            push_int(rhs_i != lhs_i);
                            break;
                        case 42:
                            push_int(lhs_i < rhs_i);
                            break;
                        case 43:
                            push_int(lhs_i <= rhs_i);
                            break;
                        case 44:
                            push_int(lhs_i > rhs_i);
                            break;
                        case 45:
                            push_int(lhs_i >= rhs_i);
                            break;
                    }
                } else {
                    if (lhs.type == RS_FLOAT && rhs.type == RS_FLOAT) {
                        rhs_f = rhs.f;
                        lhs_f = lhs.f;
                    } else if (lhs.type == RS_INT && rhs.type == RS_FLOAT) {
                        rhs_f = rhs.f;
                        lhs_f = lhs.i;
                    } else if (lhs.type == RS_FLOAT && rhs.type == RS_INT) {
                        rhs_f = rhs.i;
                        lhs_f = lhs.f;
                    } else {
                        fprintf(stderr, "RUNTIME ERROR at _CMP: %s: operand is not number\n", func->name);
                        exit__2(-1);
                    }

                    switch (pc->arg1) {
                        case 40:
                            push_int(rhs_f == lhs_f);
                            break;
                        case 41:
                            push_int(rhs_f != lhs_f);
                            break;
                        case 42:
                            push_int(lhs_f < rhs_f);
                            break;
                        case 43:
                            push_int(lhs_f <= rhs_f);
                            break;
                        case 44:
                            push_int(lhs_f > rhs_f);
                            break;
                        case 45:
                            push_int(lhs_f >= rhs_f);
                            break;
                    }
                }

                break;
            case 6:
                rhs = pop();
                lhs = pop();

                if (lhs.type == RS_INT && rhs.type == RS_INT) {
                    push_int(lhs.i + rhs.i);
                } else if (lhs.type == RS_FLOAT && rhs.type == RS_FLOAT) {
                    push_float(lhs.f + rhs.f);
                } else if (lhs.type == RS_INT && rhs.type == RS_FLOAT) {
                    push_float(lhs.i + rhs.f);
                } else if (lhs.type == RS_FLOAT && rhs.type == RS_INT) {
                    push_float(lhs.f + rhs.i);
                } else {
                    fprintf(stderr, "RUNTIME ERROR at _ADD: %s: operand is not number\n", func->name);
                    exit__2(-1);
                }

                break;
            case 7:
                rhs = pop();
                lhs = pop();

                if (lhs.type == RS_INT && rhs.type == RS_INT) {
                    push_int(lhs.i - rhs.i);
                } else if (lhs.type == RS_FLOAT && rhs.type == RS_FLOAT) {
                    push_float(lhs.f - rhs.f);
                } else if (lhs.type == RS_INT && rhs.type == RS_FLOAT) {
                    push_float(lhs.i - rhs.f);
                } else if (lhs.type == RS_FLOAT && rhs.type == RS_INT) {
                    push_float(lhs.f - rhs.i);
                } else {
                    fprintf(stderr, "RUNTIME ERROR at _SUB: %s: operand is not number\n", func->name);
                    exit__2(-1);
                }

                break;
            case 8:
                rhs = pop();
                lhs = pop();

                if (lhs.type == RS_INT && rhs.type == RS_INT) {
                    push_int(lhs.i * rhs.i);
                } else if (lhs.type == RS_FLOAT && rhs.type == RS_FLOAT) {
                    push_float(lhs.f * rhs.f);
                } else if (lhs.type == RS_INT && rhs.type == RS_FLOAT) {
                    push_float(lhs.i * rhs.f);
                } else if (lhs.type == RS_FLOAT && rhs.type == RS_INT) {
                    push_float(lhs.f * rhs.i);
                } else {
                    fprintf(stderr, "RUNTIME ERROR _MUL: %s: operand is not number\n", func->name);
                    exit__2(-1);
                }

                break;
            case 9:
                rhs = pop();

                if (rhs.i == 0) {
                    divby0error();
                }

                lhs = pop();

                if (lhs.type == RS_INT && rhs.type == RS_INT) {
                    push_int(lhs.i / rhs.i);
                } else if (lhs.type == RS_FLOAT && rhs.type == RS_FLOAT) {
                    push_float(lhs.f / rhs.f);
                } else if (lhs.type == RS_INT && rhs.type == RS_FLOAT) {
                    push_float(lhs.i / rhs.f);
                } else if (lhs.type == RS_FLOAT && rhs.type == RS_INT) {
                    push_float(lhs.f / rhs.i);
                } else {
                    fprintf(stderr, "RUNTIME ERROR at _DIV: %s: operand is not number\n", func->name);
                    exit__2(-1);
                }

                break;
            case 10:
                rhs_i = chk_int(pop(), func);

                if (rhs_i == 0) {
                    modby0error();
                }

                push_int(chk_int(pop(), func) % rhs_i);
                break;
            case 24:
                rhs_i = chk_int(pop(), func);
                push_int(rhs_i & chk_int(pop(), func));
                break;
            case 25:
                rhs_i = chk_int(pop(), func);
                push_int(rhs_i | chk_int(pop(), func));
                break;
            case 11:
                rhs = pop();

                if (rhs.type == RS_INT) {
                    push_int(-rhs.i);
                } else if (rhs.type == RS_FLOAT) {
                    push_float(-rhs.f);
                } else {
                    fprintf(stderr, "RUNTIME ERROR at _INVT: %s: operand is not number\n", func->name);
                    exit__2(-1);
                }

                break;
            case 29:
                rhs = pop();

                if (rhs.type == RS_INT) {
                    push_float(sinf(rhs.i));
                } else if (rhs.type == RS_FLOAT) {
                    push_float(sinf(rhs.f));
                } else {
                    fprintf(stderr, "RUNTIME ERROR at _SIN: %s: operand is not number\n", func->name);
                    exit__2(-1);
                }

                break;
            case 30:
                rhs = pop();

                if (rhs.type == RS_INT) {
                    push_float(cosf(rhs.i));
                } else if (rhs.type == RS_FLOAT) {
                    push_float(cosf(rhs.f));
                } else {
                    fprintf(stderr, "RUNTIME ERROR at _COS: %s: operand is not number\n", func->name);
                    exit__2(-1);
                }

                break;
            case 26:
                rhs = pop();

                if (rhs.type == RS_INT) {
                    push_int(!rhs.i);
                } else {
                    fprintf(stderr, "RUNTIME ERROR: %s: \220\256\220\224\202\305\202\310\202\242\203\111"
                                    "\203\171\203\211\203\223\203\150\n",
                            func->name);
                    exit__2(-1);
                }

                break;
            case 12:
                rhs = pop();

                if (rhs.type == RS_INT) {
                    push_float(rhs.i);
                } else if (rhs.type == RS_FLOAT) {
                    push_float(rhs.f);
                } else {
                    fprintf(stderr, "RUNTIME ERROR at _ITOF: %s: operand is not number\n", func->name);
                    exit__2(-1);
                }

                break;
            case 13:
                rhs = pop();

                if (rhs.type == RS_INT) {
                    push_int((int) rhs.i);
                } else if (rhs.type == RS_FLOAT) {
                    push_int((int) rhs.f);
                } else {
                    fprintf(stderr, "RUNTIME ERROR at _FTOI: %s: operand is not number\n", func->name);
                    exit__2(-1);
                }

                break;
            case 20:
                sp -= pc->arg1;
                print(sp, pc->arg1);
                break;
            case 21:
                sp -= pc->arg1;

                if (!skip_wait) {
                    ext(sp, pc->arg1);
                }

                break;
            case 27:
                end = 1;
                pc = 0;
                return;
            case 19:
                pc = call_func((funcdata *) (code + (int) pc->arg2), pc);
                pc--;
                break;
            case 15:
                value = pop();

                if (call_sp != call) {
                    sp = frame;
                    pc = ret_func();
                } else {
                    result = value.i;
                    push(value);
                    pc = 0;
                    end = 1;
                    return;
                }

                push(value);
                break;
            case 23:
                if (!skip_wait) {
                    pc++;
                    return;
                }

                break;
            case 28:
                if (skip_wait) {
                    skip_wait = 0;
                    pc++;
                    return;
                }

                break;
        }

        pc++;
    }
}
