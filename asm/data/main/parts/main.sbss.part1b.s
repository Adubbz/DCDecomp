.include "macro.inc"

.include "macro.inc"

.section .sbss, "wa"
glabel DBuffID
    /* 002A23B0 */ .space 0x04

glabel mgWaitVSync
    /* 002A23B4 */ .space 0x04

glabel DmaCH1
    /* 002A23B8 */ .space 0x04

glabel DmaCH2
    /* 002A23BC */ .space 0x04
