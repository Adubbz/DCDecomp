.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Initialize__13CCollisionMDTFv
/* 025A70 00125970 300080AC */  sw          $0, 0x30($4)
/* 025A74 00125974 340080AC */  sw          $0, 0x34($4)
/* 025A78 00125978 380080AC */  sw          $0, 0x38($4)
/* 025A7C 0012597C 0800E003 */  jr          $31
/* 025A80 00125980 00000000 */   nop
/* 025A84 00125984 00000000 */  nop
/* 025A88 00125988 00000000 */  nop
/* 025A8C 0012598C 00000000 */  nop
