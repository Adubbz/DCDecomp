.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__13CCollisionMDTFv
/* 25A70 00125970 300080AC */  sw         $0, 0x30($4)
/* 25A74 00125974 340080AC */  sw         $0, 0x34($4)
/* 25A78 00125978 380080AC */  sw         $0, 0x38($4)
/* 25A7C 0012597C 0800E003 */  jr         $31
/* 25A80 00125980 00000000 */   nop
/* 25A84 00125984 00000000 */  nop
/* 25A88 00125988 00000000 */  nop
/* 25A8C 0012598C 00000000 */  nop
