.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ext__10CRunScriptFP12RS_STACKDATAi
/* 13DE00 0023DD00 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 13DE04 0023DD04 1000BF7F */  sq         $31, 0x10($sp)
/* 13DE08 0023DD08 0000B07F */  sq         $16, 0x0($sp)
/* 13DE0C 0023DD0C 2886A070 */  paddub     $16, $5, $0
/* 13DE10 0023DD10 0400A58C */  lw         $5, 0x4($5)
/* 13DE14 0023DD14 0500A004 */  bltz       $5, .L0023DD2C
/* 13DE18 0023DD18 00000000 */   nop
/* 13DE1C 0023DD1C 0000828C */  lw         $2, 0x0($4)
/* 13DE20 0023DD20 2A10A200 */  slt        $2, $5, $2
/* 13DE24 0023DD24 07004014 */  bnez       $2, .L0023DD44
/* 13DE28 0023DD28 00000000 */   nop
.L0023DD2C:
/* 13DE2C 0023DD2C 2A00023C */  lui        $2, %hi(_79)
/* 13DE30 0023DD30 40F84424 */  addiu      $4, $2, %lo(_79)
/* 13DE34 0023DD34 A611040C */  jal        printf
/* 13DE38 0023DD38 00000000 */   nop
/* 13DE3C 0023DD3C 18000010 */  b          .L0023DDA0
/* 13DE40 0023DD40 00000000 */   nop
.L0023DD44:
/* 13DE44 0023DD44 80180500 */  sll        $3, $5, 2
/* 13DE48 0023DD48 0400828C */  lw         $2, 0x4($4)
/* 13DE4C 0023DD4C 21104300 */  addu       $2, $2, $3
/* 13DE50 0023DD50 0000428C */  lw         $2, 0x0($2)
/* 13DE54 0023DD54 07004014 */  bnez       $2, .L0023DD74
/* 13DE58 0023DD58 00000000 */   nop
/* 13DE5C 0023DD5C 2A00023C */  lui        $2, %hi(_79)
/* 13DE60 0023DD60 40F84424 */  addiu      $4, $2, %lo(_79)
/* 13DE64 0023DD64 A611040C */  jal        printf
/* 13DE68 0023DD68 00000000 */   nop
/* 13DE6C 0023DD6C 0C000010 */  b          .L0023DDA0
/* 13DE70 0023DD70 00000000 */   nop
.L0023DD74:
/* 13DE74 0023DD74 FFFFC524 */  addiu      $5, $6, -0x1
/* 13DE78 0023DD78 08000426 */  addiu      $4, $16, 0x8
/* 13DE7C 0023DD7C 09F84000 */  jalr       $2
/* 13DE80 0023DD80 00000000 */   nop
/* 13DE84 0023DD84 06004014 */  bnez       $2, .L0023DDA0
/* 13DE88 0023DD88 00000000 */   nop
/* 13DE8C 0023DD8C 2A00023C */  lui        $2, %hi(_80)
/* 13DE90 0023DD90 60F84424 */  addiu      $4, $2, %lo(_80)
/* 13DE94 0023DD94 0400058E */  lw         $5, 0x4($16)
/* 13DE98 0023DD98 A611040C */  jal        printf
/* 13DE9C 0023DD9C 00000000 */   nop
.L0023DDA0:
/* 13DEA0 0023DDA0 1000BF7B */  lq         $31, 0x10($sp)
/* 13DEA4 0023DDA4 0000B07B */  lq         $16, 0x0($sp)
/* 13DEA8 0023DDA8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 13DEAC 0023DDAC 0800E003 */  jr         $31
/* 13DEB0 0023DDB0 00000000 */   nop
/* 13DEB4 0023DDB4 00000000 */  nop
/* 13DEB8 0023DDB8 00000000 */  nop
/* 13DEBC 0023DDBC 00000000 */  nop
