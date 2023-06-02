.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRot__10CActionSeqFPf
/* 552E0 001551E0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 552E4 001551E4 2000BF7F */  sq         $31, 0x20($sp)
/* 552E8 001551E8 1000B17F */  sq         $17, 0x10($sp)
/* 552EC 001551EC 0000B07F */  sq         $16, 0x0($sp)
/* 552F0 001551F0 288EA070 */  paddub     $17, $5, $0
/* 552F4 001551F4 4053050C */  jal        NextMoveSeq__10CActionSeqFv
/* 552F8 001551F8 00000000 */   nop
/* 552FC 001551FC 28864070 */  paddub     $16, $2, $0
/* 55300 00155200 08000012 */  beqz       $16, .L00155224
/* 55304 00155204 00000000 */   nop
/* 55308 00155208 0A000224 */  addiu      $2, $0, 0xA
/* 5530C 0015520C 000002AE */  sw         $2, 0x0($16)
/* 55310 00155210 10000426 */  addiu      $4, $16, 0x10
/* 55314 00155214 282E2072 */  paddub     $5, $17, $0
/* 55318 00155218 0C86040C */  jal        sceVu0CopyVector
/* 5531C 0015521C 00000000 */   nop
/* 55320 00155220 040000AE */  sw         $0, 0x4($16)
.L00155224:
/* 55324 00155224 2000BF7B */  lq         $31, 0x20($sp)
/* 55328 00155228 1000B17B */  lq         $17, 0x10($sp)
/* 5532C 0015522C 0000B07B */  lq         $16, 0x0($sp)
/* 55330 00155230 3000BD27 */  addiu      $sp, $sp, 0x30
/* 55334 00155234 0800E003 */  jr         $31
/* 55338 00155238 00000000 */   nop
/* 5533C 0015523C 00000000 */  nop
