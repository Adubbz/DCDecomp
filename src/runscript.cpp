#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 68

#include "runscript.hpp"

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "battle_globals.hpp"

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
    if (sp >= stack_end)
        stkoverflow();
}

void CRunScript::push(RS_STACKDATA d) {
    check_stack();
    *sp++ = d;
}

void CRunScript::push_int(int i) {
    check_stack();
    sp->type = RS_INT;
    sp++->i = i;
}

void CRunScript::push_str(char *s) {
    check_stack();
    sp->type = RS_STR;
    sp++->s = s;
}

void CRunScript::push_ptr(RS_STACKDATA *p) {
    check_stack();
    sp->type = RS_PTR;
    sp++->p = p;
}

void CRunScript::push_float(float f) {
    check_stack();
    sp->type = RS_FLOAT;
    sp++->f = f;
}

RS_STACKDATA CRunScript::pop() {
    return *--sp;
}

/* A call takes its arguments from the operand stack in place: the new frame starts where the
   caller left them, so nothing is copied and only the locals past them have to be cleared. */
vmcode_t *CRunScript::call_func(funcdata *fd, vmcode_t *ret) {
    if (call_sp >= call_end) {
        printf("\202\261\202\352\210\310\217\343\212\326\220\224\214\304\202\321\217\157\202\265"
               "\202\252\202\305\202\253\202\334\202\271\202\361\201\102\n");
        exit__2(-2);
    }
    call_sp->ret = ret;
    call_sp->func = func;
    call_sp->frame = frame;
    frame = sp - fd->arg;
    sp = frame + fd->local;
    func = fd;
    call_sp++;
    memset(frame + func->arg, 0, (func->local - func->arg) * sizeof(RS_STACKDATA));
    check_stack();
    return (vmcode_t *) (code + (int) fd->addr);
}

vmcode_t *CRunScript::ret_func() {
    call_sp--;
    frame = call_sp->frame;
    func = call_sp->func;
    return call_sp->ret;
}

void CRunScript::ext(RS_STACKDATA *d, int argc) {
    if (d->i < 0 || d->i >= ext_func_num) {
        printf("not found ext %d\n", d->i);
    } else if (ext_func_table[d->i] == 0) {
        printf("not found ext %d\n", d->i);
    } else if ((*ext_func_table[d->i])(d + 1, argc - 1) == 0) {
        printf("illegal function call ext %d\n", d->i);
    }
}

void CRunScript::load(RS_PROG_HEADER *prog, RS_STACKDATA *stack, int stack_num, RS_CALLDATA *call,
                      int call_num) {
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

void CRunScript::ext_func(int (**func)(RS_STACKDATA *, int), int func_num) {
    ext_func_table = func;
    ext_func_num = func_num;
}

void CRunScript::resume() {
    if (pc)
        exe(pc);
}

int CRunScript::run(int no) {
    RS_PROGDATA *p;
    int i;
    RS_PROG_HEADER *h;
    vmcode_t *pc;

    if (prog == 0)
        return -1;

    sp = stack;
    call_sp = call;
    func = 0;
    if (no < 0) {
        func = (funcdata *) ((char *) prog + prog->main);
    } else {
        h = prog;
        p = (RS_PROGDATA *) ((char *) h + h->prog);
        for (i = 0; i < h->prog_num; i++, p++) {
            if (p->no == no) {
                func = (funcdata *) ((char *) h + p->func);
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
    pc = (vmcode_t *) (code + (int) func->addr);
    end = 0;
    skip_wait = 0;
    exe(pc);
    return end != 0 ? 0 : 1;
}

int CRunScript::check_program(int no) {
    RS_PROGDATA *p;
    int i;
    RS_PROG_HEADER *h;

    h = prog;
    p = (RS_PROGDATA *) ((char *) h + h->prog);
    for (i = 0; i < h->prog_num; i++, p++) {
        if (p->no == no)
            return 1;
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
    RS_STACKDATA d;
    RS_STACKDATA d1;
    RS_STACKDATA d2;
    float f1;
    float f2;
    int i1;
    int i2;

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
                        i1 = chk_int(pop(), func);
                        (frame + pc->arg1 + i1)->type = RS_FLOAT;
                        push(*(frame + pc->arg1 + i1));
                        break;
                    case 32:
                        i1 = chk_int(pop(), func);
                        (frame[pc->arg1].p + i1)->type = RS_FLOAT;
                        push(*(frame[pc->arg1].p + i1));
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
                d = pop();
                *pop().p = d;
                push(d);
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
                        if (pc->arg2)
                            push_int(1);
                        pc = (vmcode_t *) (code + (int) pc->arg1);
                        continue;
                    }
                }
                break;
            case 17:
                if (!skip_wait) {
                    if (!is_true(pop())) {
                        if (pc->arg2)
                            push_int(0);
                        pc = (vmcode_t *) (code + (int) pc->arg1);
                        continue;
                    }
                }
                break;
            case 14:
                d1 = pop();
                d2 = pop();
                if (d2.type == RS_INT && d1.type == RS_INT) {
                    i1 = d1.i;
                    i2 = d2.i;
                    switch (pc->arg1) {
                        case 40:
                            push_int(i1 == i2);
                            break;
                        case 41:
                            push_int(i1 != i2);
                            break;
                        case 42:
                            push_int(i2 < i1);
                            break;
                        case 43:
                            push_int(i2 <= i1);
                            break;
                        case 44:
                            push_int(i2 > i1);
                            break;
                        case 45:
                            push_int(i2 >= i1);
                            break;
                    }
                } else {
                    if (d2.type == RS_FLOAT && d1.type == RS_FLOAT) {
                        f1 = d1.f;
                        f2 = d2.f;
                    } else if (d2.type == RS_INT && d1.type == RS_FLOAT) {
                        f1 = d1.f;
                        f2 = d2.i;
                    } else if (d2.type == RS_FLOAT && d1.type == RS_INT) {
                        f1 = d1.i;
                        f2 = d2.f;
                    } else {
                        fprintf(stderr, "RUNTIME ERROR at _CMP: %s: operand is not number\n",
                                func->name);
                        exit__2(-1);
                    }
                    switch (pc->arg1) {
                        case 40:
                            push_int(f1 == f2);
                            break;
                        case 41:
                            push_int(f1 != f2);
                            break;
                        case 42:
                            push_int(f2 < f1);
                            break;
                        case 43:
                            push_int(f2 <= f1);
                            break;
                        case 44:
                            push_int(f2 > f1);
                            break;
                        case 45:
                            push_int(f2 >= f1);
                            break;
                    }
                }
                break;
            case 6:
                d1 = pop();
                d2 = pop();
                if (d2.type == RS_INT && d1.type == RS_INT) {
                    push_int(d2.i + d1.i);
                } else if (d2.type == RS_FLOAT && d1.type == RS_FLOAT) {
                    push_float(d2.f + d1.f);
                } else if (d2.type == RS_INT && d1.type == RS_FLOAT) {
                    push_float(d2.i + d1.f);
                } else if (d2.type == RS_FLOAT && d1.type == RS_INT) {
                    push_float(d2.f + d1.i);
                } else {
                    fprintf(stderr, "RUNTIME ERROR at _ADD: %s: operand is not number\n",
                            func->name);
                    exit__2(-1);
                }
                break;
            case 7:
                d1 = pop();
                d2 = pop();
                if (d2.type == RS_INT && d1.type == RS_INT) {
                    push_int(d2.i - d1.i);
                } else if (d2.type == RS_FLOAT && d1.type == RS_FLOAT) {
                    push_float(d2.f - d1.f);
                } else if (d2.type == RS_INT && d1.type == RS_FLOAT) {
                    push_float(d2.i - d1.f);
                } else if (d2.type == RS_FLOAT && d1.type == RS_INT) {
                    push_float(d2.f - d1.i);
                } else {
                    fprintf(stderr, "RUNTIME ERROR at _SUB: %s: operand is not number\n",
                            func->name);
                    exit__2(-1);
                }
                break;
            case 8:
                d1 = pop();
                d2 = pop();
                if (d2.type == RS_INT && d1.type == RS_INT) {
                    push_int(d2.i * d1.i);
                } else if (d2.type == RS_FLOAT && d1.type == RS_FLOAT) {
                    push_float(d2.f * d1.f);
                } else if (d2.type == RS_INT && d1.type == RS_FLOAT) {
                    push_float(d2.i * d1.f);
                } else if (d2.type == RS_FLOAT && d1.type == RS_INT) {
                    push_float(d2.f * d1.i);
                } else {
                    fprintf(stderr, "RUNTIME ERROR _MUL: %s: operand is not number\n", func->name);
                    exit__2(-1);
                }
                break;
            case 9:
                d1 = pop();
                if (d1.i == 0)
                    divby0error();
                d2 = pop();
                if (d2.type == RS_INT && d1.type == RS_INT) {
                    push_int(d2.i / d1.i);
                } else if (d2.type == RS_FLOAT && d1.type == RS_FLOAT) {
                    push_float(d2.f / d1.f);
                } else if (d2.type == RS_INT && d1.type == RS_FLOAT) {
                    push_float(d2.i / d1.f);
                } else if (d2.type == RS_FLOAT && d1.type == RS_INT) {
                    push_float(d2.f / d1.i);
                } else {
                    fprintf(stderr, "RUNTIME ERROR at _DIV: %s: operand is not number\n",
                            func->name);
                    exit__2(-1);
                }
                break;
            case 10:
                i1 = chk_int(pop(), func);
                if (i1 == 0)
                    modby0error();
                push_int(chk_int(pop(), func) % i1);
                break;
            case 24:
                i1 = chk_int(pop(), func);
                push_int(i1 & chk_int(pop(), func));
                break;
            case 25:
                i1 = chk_int(pop(), func);
                push_int(i1 | chk_int(pop(), func));
                break;
            case 11:
                d1 = pop();
                if (d1.type == RS_INT) {
                    push_int(-d1.i);
                } else if (d1.type == RS_FLOAT) {
                    push_float(-d1.f);
                } else {
                    fprintf(stderr, "RUNTIME ERROR at _INVT: %s: operand is not number\n",
                            func->name);
                    exit__2(-1);
                }
                break;
            case 29:
                d1 = pop();
                if (d1.type == RS_INT) {
                    push_float(sinf(d1.i));
                } else if (d1.type == RS_FLOAT) {
                    push_float(sinf(d1.f));
                } else {
                    fprintf(stderr, "RUNTIME ERROR at _SIN: %s: operand is not number\n",
                            func->name);
                    exit__2(-1);
                }
                break;
            case 30:
                d1 = pop();
                if (d1.type == RS_INT) {
                    push_float(cosf(d1.i));
                } else if (d1.type == RS_FLOAT) {
                    push_float(cosf(d1.f));
                } else {
                    fprintf(stderr, "RUNTIME ERROR at _COS: %s: operand is not number\n",
                            func->name);
                    exit__2(-1);
                }
                break;
            case 26:
                d1 = pop();
                if (d1.type == RS_INT) {
                    push_int(!d1.i);
                } else {
                    fprintf(stderr,
                            "RUNTIME ERROR: %s: \220\256\220\224\202\305\202\310\202\242\203\111"
                            "\203\171\203\211\203\223\203\150\n",
                            func->name);
                    exit__2(-1);
                }
                break;
            case 12:
                d1 = pop();
                if (d1.type == RS_INT) {
                    push_float(d1.i);
                } else if (d1.type == RS_FLOAT) {
                    push_float(d1.f);
                } else {
                    fprintf(stderr, "RUNTIME ERROR at _ITOF: %s: operand is not number\n",
                            func->name);
                    exit__2(-1);
                }
                break;
            case 13:
                d1 = pop();
                if (d1.type == RS_INT) {
                    push_int((int) d1.i);
                } else if (d1.type == RS_FLOAT) {
                    push_int((int) d1.f);
                } else {
                    fprintf(stderr, "RUNTIME ERROR at _FTOI: %s: operand is not number\n",
                            func->name);
                    exit__2(-1);
                }
                break;
            case 20:
                sp -= pc->arg1;
                print(sp, pc->arg1);
                break;
            case 21:
                sp -= pc->arg1;
                if (!skip_wait)
                    ext(sp, pc->arg1);
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
                d = pop();
                if (call_sp != call) {
                    sp = frame;
                    pc = ret_func();
                } else {
                    result = d.i;
                    push(d);
                    pc = 0;
                    end = 1;
                    return;
                }
                push(d);
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
