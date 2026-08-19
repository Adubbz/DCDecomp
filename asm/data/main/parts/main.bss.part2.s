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
