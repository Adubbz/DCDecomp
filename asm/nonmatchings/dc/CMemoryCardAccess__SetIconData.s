.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetIconData__17CMemoryCardAccessFP12MC_ICON_DATA
/* 113A90 00213990 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 113A94 00213994 2000BF7F */  sq         $31, 0x20($sp)
/* 113A98 00213998 1000B17F */  sq         $17, 0x10($sp)
/* 113A9C 0021399C 0000B07F */  sq         $16, 0x0($sp)
/* 113AA0 002139A0 288E8070 */  paddub     $17, $4, $0
/* 113AA4 002139A4 2886A070 */  paddub     $16, $5, $0
/* 113AA8 002139A8 B0042426 */  addiu      $4, $17, 0x4B0
/* 113AAC 002139AC 0C000624 */  addiu      $6, $0, 0xC
/* 113AB0 002139B0 EC0C040C */  jal        memcpy
/* 113AB4 002139B4 00000000 */   nop
/* 113AB8 002139B8 BC042426 */  addiu      $4, $17, 0x4BC
/* 113ABC 002139BC 0C000526 */  addiu      $5, $16, 0xC
/* 113AC0 002139C0 0C000624 */  addiu      $6, $0, 0xC
/* 113AC4 002139C4 EC0C040C */  jal        memcpy
/* 113AC8 002139C8 00000000 */   nop
/* 113ACC 002139CC C8042426 */  addiu      $4, $17, 0x4C8
/* 113AD0 002139D0 18000526 */  addiu      $5, $16, 0x18
/* 113AD4 002139D4 0C000624 */  addiu      $6, $0, 0xC
/* 113AD8 002139D8 EC0C040C */  jal        memcpy
/* 113ADC 002139DC 00000000 */   nop
/* 113AE0 002139E0 2000BF7B */  lq         $31, 0x20($sp)
/* 113AE4 002139E4 1000B17B */  lq         $17, 0x10($sp)
/* 113AE8 002139E8 0000B07B */  lq         $16, 0x0($sp)
/* 113AEC 002139EC 3000BD27 */  addiu      $sp, $sp, 0x30
/* 113AF0 002139F0 0800E003 */  jr         $31
/* 113AF4 002139F4 00000000 */   nop
/* 113AF8 002139F8 00000000 */  nop
/* 113AFC 002139FC 00000000 */  nop
