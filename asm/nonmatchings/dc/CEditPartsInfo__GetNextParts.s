.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetNextParts__14CEditPartsInfoFi
/* 9A310 0019A210 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 9A314 0019A214 2000BF7F */  sq         $31, 0x20($sp)
/* 9A318 0019A218 1000B17F */  sq         $17, 0x10($sp)
/* 9A31C 0019A21C 0000B07F */  sq         $16, 0x0($sp)
/* 9A320 0019A220 288E8070 */  paddub     $17, $4, $0
/* 9A324 0019A224 2886A070 */  paddub     $16, $5, $0
.L0019A228:
/* 9A328 0019A228 01001026 */  addiu      $16, $16, 0x1
/* 9A32C 0019A22C 28262072 */  paddub     $4, $17, $0
/* 9A330 0019A230 282E0072 */  paddub     $5, $16, $0
/* 9A334 0019A234 F467060C */  jal        GetPartsInfo__14CEditPartsInfoFi
/* 9A338 0019A238 00000000 */   nop
/* 9A33C 0019A23C 09004010 */  beqz       $2, .L0019A264
/* 9A340 0019A240 00000000 */   nop
/* 9A344 0019A244 28264070 */  paddub     $4, $2, $0
/* 9A348 0019A248 E467060C */  jal        CheckPartsInfo__FP14EDITPARTS_INFO
/* 9A34C 0019A24C 00000000 */   nop
/* 9A350 0019A250 F5FF4010 */  beqz       $2, .L0019A228
/* 9A354 0019A254 00000000 */   nop
/* 9A358 0019A258 28160072 */  paddub     $2, $16, $0
/* 9A35C 0019A25C 02000010 */  b          .L0019A268
/* 9A360 0019A260 00000000 */   nop
.L0019A264:
/* 9A364 0019A264 FFFF0224 */  addiu      $2, $0, -0x1
.L0019A268:
/* 9A368 0019A268 2000BF7B */  lq         $31, 0x20($sp)
/* 9A36C 0019A26C 1000B17B */  lq         $17, 0x10($sp)
/* 9A370 0019A270 0000B07B */  lq         $16, 0x0($sp)
/* 9A374 0019A274 3000BD27 */  addiu      $sp, $sp, 0x30
/* 9A378 0019A278 0800E003 */  jr         $31
/* 9A37C 0019A27C 00000000 */   nop
