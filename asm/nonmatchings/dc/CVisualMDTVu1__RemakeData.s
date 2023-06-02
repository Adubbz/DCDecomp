.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RemakeData__13CVisualMDTVu1FPUi
/* 36340 00136240 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 36344 00136244 0000BF7F */  sq         $31, 0x0($sp)
/* 36348 00136248 2000868C */  lw         $6, 0x20($4)
/* 3634C 0013624C 0400C014 */  bnez       $6, .L00136260
/* 36350 00136250 00000000 */   nop
/* 36354 00136254 28160070 */  paddub     $2, $0, $0
/* 36358 00136258 08000010 */  b          .L0013627C
/* 3635C 0013625C 00000000 */   nop
.L00136260:
/* 36360 00136260 C08B828F */  lw         $2, -0x7440($gp)
/* 36364 00136264 80100200 */  sll        $2, $2, 2
/* 36368 00136268 21104400 */  addu       $2, $2, $4
/* 3636C 0013626C 2800458C */  lw         $5, 0x28($2)
/* 36370 00136270 01000724 */  addiu      $7, $0, 0x1
/* 36374 00136274 94D7040C */  jal        CreateVUdataFromMDTRemake__10CVisualVu1FPUiPUii
/* 36378 00136278 00000000 */   nop
.L0013627C:
/* 3637C 0013627C 0000BF7B */  lq         $31, 0x0($sp)
/* 36380 00136280 1000BD27 */  addiu      $sp, $sp, 0x10
/* 36384 00136284 0800E003 */  jr         $31
/* 36388 00136288 00000000 */   nop
/* 3638C 0013628C 00000000 */  nop
