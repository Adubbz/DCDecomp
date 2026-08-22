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
