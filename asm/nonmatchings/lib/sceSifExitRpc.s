.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifExitRpc
/* 16F08 00116E08 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 16F0C 00116E0C 0000BFFF */  sd         $31, 0x0($sp)
/* 16F10 00116E10 005A040C */  jal        sceSifExitCmd
/* 16F14 00116E14 00000000 */   nop
/* 16F18 00116E18 2500023C */  lui        $2, (0x250A00 >> 16)
/* 16F1C 00116E1C 0000BFDF */  ld         $31, 0x0($sp)
/* 16F20 00116E20 000A40AC */  sw         $0, (0x250A00 & 0xFFFF)($2)
/* 16F24 00116E24 0800E003 */  jr         $31
/* 16F28 00116E28 1000BD27 */   addiu     $sp, $sp, 0x10
/* 16F2C 00116E2C 00000000 */  nop
