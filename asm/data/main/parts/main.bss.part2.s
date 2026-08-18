.include "macro.inc"

.include "macro.inc"

.section .bss, "wa"
glabel VariousData
    /* 002AB050 */ .space 0x10

glabel ActiveData0
    /* 002AB060 */ .space 0x10

glabel ActiveData1
    /* 002AB070 */ .space 0x10

glabel GlobalDataBuffer
    /* 002AB080 */ .space 0x19C9910

glabel workbuffer
    /* 01C74990 */ .space 0x10

/* Automatically generated and unreferenced pad */
glabel D_01C749A0
    /* 01C749A0 */ .space 0x20

glabel pad_dma_buf
    /* 01C749C0 */ .space 0x400

glabel pad_dma_buf2
    /* 01C74DC0 */ .space 0x400

glabel mgPickZBuff
    /* 01C751C0 */ .space 0x100

glabel GiftagAD
    /* 01C752C0 */ .space 0x10

glabel mgDBuff
    /* 01C752D0 */ .space 0x230

glabel mgBackColor
    /* 01C75500 */ .space 0x10

