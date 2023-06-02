.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMenuHebikiriFlag__Fv
/* 10C080 0020BF80 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 10C084 0020BF84 0000BF7F */  sq         $31, 0x0($sp)
/* 10C088 0020BF88 1C8D848F */  lw         $4, -0x72E4($gp)
/* 10C08C 0020BF8C 30000524 */  addiu      $5, $0, 0x30
/* 10C090 0020BF90 8060050C */  jal        GetGameFlag__9CSaveDataFi
/* 10C094 0020BF94 00000000 */   nop
/* 10C098 0020BF98 0000BF7B */  lq         $31, 0x0($sp)
/* 10C09C 0020BF9C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 10C0A0 0020BFA0 0800E003 */  jr         $31
/* 10C0A4 0020BFA4 00000000 */   nop
/* 10C0A8 0020BFA8 00000000 */  nop
/* 10C0AC 0020BFAC 00000000 */  nop
