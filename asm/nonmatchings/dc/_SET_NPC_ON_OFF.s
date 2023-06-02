.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_NPC_ON_OFF__FP12RS_STACKDATAi
/* BCE40 001BCD40 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* BCE44 001BCD44 2000BF7F */  sq         $31, 0x20($sp)
/* BCE48 001BCD48 1000B17F */  sq         $17, 0x10($sp)
/* BCE4C 001BCD4C 0000B07F */  sq         $16, 0x0($sp)
/* BCE50 001BCD50 08009124 */  addiu      $17, $4, 0x8
/* BCE54 001BCD54 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BCE58 001BCD58 00000000 */   nop
/* BCE5C 001BCD5C 28864070 */  paddub     $16, $2, $0
/* BCE60 001BCD60 28262072 */  paddub     $4, $17, $0
/* BCE64 001BCD64 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BCE68 001BCD68 00000000 */   nop
/* BCE6C 001BCD6C C89C848F */  lw         $4, -0x6338($gp)
/* BCE70 001BCD70 30130324 */  addiu      $3, $0, 0x1330
/* BCE74 001BCD74 18180302 */  mult       $3, $16, $3
/* BCE78 001BCD78 21206400 */  addu       $4, $3, $4
/* BCE7C 001BCD7C 0100013C */  lui        $at, (0x10000 >> 16)
/* BCE80 001BCD80 21088100 */  addu       $at, $4, $at
/* BCE84 001BCD84 ACBE238C */  lw         $3, -0x4154($at)
/* BCE88 001BCD88 04006014 */  bnez       $3, .L001BCD9C
/* BCE8C 001BCD8C 00000000 */   nop
/* BCE90 001BCD90 01000224 */  addiu      $2, $0, 0x1
/* BCE94 001BCD94 05000010 */  b          .L001BCDAC
/* BCE98 001BCD98 00000000 */   nop
.L001BCD9C:
/* BCE9C 001BCD9C 0100013C */  lui        $at, (0x10000 >> 16)
/* BCEA0 001BCDA0 21088100 */  addu       $at, $4, $at
/* BCEA4 001BCDA4 C8CF22AC */  sw         $2, -0x3038($at)
/* BCEA8 001BCDA8 01000224 */  addiu      $2, $0, 0x1
.L001BCDAC:
/* BCEAC 001BCDAC 2000BF7B */  lq         $31, 0x20($sp)
/* BCEB0 001BCDB0 1000B17B */  lq         $17, 0x10($sp)
/* BCEB4 001BCDB4 0000B07B */  lq         $16, 0x0($sp)
/* BCEB8 001BCDB8 3000BD27 */  addiu      $sp, $sp, 0x30
/* BCEBC 001BCDBC 0800E003 */  jr         $31
/* BCEC0 001BCDC0 00000000 */   nop
/* BCEC4 001BCDC4 00000000 */  nop
/* BCEC8 001BCDC8 00000000 */  nop
/* BCECC 001BCDCC 00000000 */  nop
