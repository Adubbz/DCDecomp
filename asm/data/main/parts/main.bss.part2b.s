.include "macro.inc"

.section .bss, "wa"
glabel mgPickZBuff
    /* 01C751C0 */ .space 0x100

glabel GiftagAD
    /* 01C752C0 */ .space 0x10

glabel mgDBuff
    /* 01C752D0 */ .space 0x230

glabel mgBackColor
    /* 01C75500 */ .space 0x10
