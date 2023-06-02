.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GoNextPage__6ClsMesFv
/* 4E270 0014E170 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4E274 0014E174 1000BF7F */  sq         $31, 0x10($sp)
/* 4E278 0014E178 0000B07F */  sq         $16, 0x0($sp)
/* 4E27C 0014E17C 28868070 */  paddub     $16, $4, $0
/* 4E280 0014E180 AC00838C */  lw         $3, 0xAC($4)
/* 4E284 0014E184 07006010 */  beqz       $3, .L0014E1A4
/* 4E288 0014E188 00000000 */   nop
/* 4E28C 0014E18C AC0000AE */  sw         $0, 0xAC($16)
/* 4E290 0014E190 4C38050C */  jal        MyTextureMake_InitAll__6ClsMesFv
/* 4E294 0014E194 00000000 */   nop
/* 4E298 0014E198 B41600AE */  sw         $0, 0x16B4($16)
/* 4E29C 0014E19C C000038E */  lw         $3, 0xC0($16)
/* 4E2A0 0014E1A0 BC0003AE */  sw         $3, 0xBC($16)
.L0014E1A4:
/* 4E2A4 0014E1A4 1000BF7B */  lq         $31, 0x10($sp)
/* 4E2A8 0014E1A8 0000B07B */  lq         $16, 0x0($sp)
/* 4E2AC 0014E1AC 2000BD27 */  addiu      $sp, $sp, 0x20
/* 4E2B0 0014E1B0 0800E003 */  jr         $31
/* 4E2B4 0014E1B4 00000000 */   nop
/* 4E2B8 0014E1B8 00000000 */  nop
/* 4E2BC 0014E1BC 00000000 */  nop
