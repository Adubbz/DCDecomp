.include "macro.inc"

.include "macro.inc"

.section .sbss, "wa"
glabel read_buffer
    /* 002A2384 */ .space 0x04

glabel WorkBuffer__2
    /* 002A2388 */ .space 0x04

glabel ActiveData
    /* 002A238C */ .space 0x04

glabel dset_mds_packet
    /* 002A2390 */ .space 0x04

glabel dset_mds_objnum
    /* 002A2394 */ .space 0x04

glabel flag$332
    /* 002A2398 */ .space 0x04

glabel init$333
    /* 002A239C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A239D
    /* 002A239D */ .space 0x03

glabel rpad$180
    /* 002A23A0 */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A23A2
    /* 002A23A2 */ .space 0x02

glabel init$181
    /* 002A23A4 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A23A5
    /* 002A23A5 */ .space 0x03

glabel cnt$250
    /* 002A23A8 */ .space 0x04

glabel init$251
    /* 002A23AC */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A23AD
    /* 002A23AD */ .space 0x03

glabel DBuffID
    /* 002A23B0 */ .space 0x04

glabel mgWaitVSync
    /* 002A23B4 */ .space 0x04

glabel DmaCH1
    /* 002A23B8 */ .space 0x04

glabel DmaCH2
    /* 002A23BC */ .space 0x04

