.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GOTO_OUTSIDE__FP12RS_STACKDATAi
/* 8C070 0018BF70 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8C074 0018BF74 0000BF7F */  sq         $31, 0x0($sp)
/* 8C078 0018BF78 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8C07C 0018BF7C 00000000 */   nop
/* 8C080 0018BF80 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8C084 0018BF84 A4D422AC */  sw         $2, -0x2B5C($at)
/* 8C088 0018BF88 07000224 */  addiu      $2, $0, 0x7
/* 8C08C 0018BF8C D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8C090 0018BF90 18D622AC */  sw         $2, -0x29E8($at)
/* 8C094 0018BF94 01000224 */  addiu      $2, $0, 0x1
/* 8C098 0018BF98 0000BF7B */  lq         $31, 0x0($sp)
/* 8C09C 0018BF9C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8C0A0 0018BFA0 0800E003 */  jr         $31
/* 8C0A4 0018BFA4 00000000 */   nop
/* 8C0A8 0018BFA8 00000000 */  nop
/* 8C0AC 0018BFAC 00000000 */  nop
