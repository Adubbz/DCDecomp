.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Alloc64__21CDataAlloc_1_1690000_Fi
/* 27B00 00127A00 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 27B04 00127A04 2000BF7F */  sq         $31, 0x20($sp)
/* 27B08 00127A08 1000B17F */  sq         $17, 0x10($sp)
/* 27B0C 00127A0C 0000B07F */  sq         $16, 0x0($sp)
/* 27B10 00127A10 288E8070 */  paddub     $17, $4, $0
/* 27B14 00127A14 2886A070 */  paddub     $16, $5, $0
/* 27B18 00127A18 A89E040C */  jal        Align64__21CDataAlloc_1_1690000_Fv
/* 27B1C 00127A1C 00000000 */   nop
/* 27B20 00127A20 9D01013C */  lui        $at, (0x19D0000 >> 16)
/* 27B24 00127A24 21082102 */  addu       $at, $17, $at
/* 27B28 00127A28 0099238C */  lw         $3, -0x6700($at)
/* 27B2C 00127A2C 00110300 */  sll        $2, $3, 4
/* 27B30 00127A30 21102202 */  addu       $2, $17, $2
/* 27B34 00127A34 21187000 */  addu       $3, $3, $16
/* 27B38 00127A38 9D01013C */  lui        $at, (0x19D0000 >> 16)
/* 27B3C 00127A3C 21082102 */  addu       $at, $17, $at
/* 27B40 00127A40 009923AC */  sw         $3, -0x6700($at)
/* 27B44 00127A44 9D01013C */  lui        $at, (0x19D0000 >> 16)
/* 27B48 00127A48 21082102 */  addu       $at, $17, $at
/* 27B4C 00127A4C 0099258C */  lw         $5, -0x6700($at)
/* 27B50 00127A50 1900033C */  lui        $3, (0x19C990 >> 16)
/* 27B54 00127A54 90C96634 */  ori        $6, $3, (0x19C990 & 0xFFFF)
/* 27B58 00127A58 2A18A600 */  slt        $3, $5, $6
/* 27B5C 00127A5C 07006014 */  bnez       $3, .L00127A7C
/* 27B60 00127A60 00000000 */   nop
/* 27B64 00127A64 2A00023C */  lui        $2, %hi(_744)
/* 27B68 00127A68 D08D4424 */  addiu      $4, $2, %lo(_744)
/* 27B6C 00127A6C A611040C */  jal        printf
/* 27B70 00127A70 00000000 */   nop
.L00127A74:
/* 27B74 00127A74 FFFF0010 */  b          .L00127A74
/* 27B78 00127A78 00000000 */   nop
.L00127A7C:
/* 27B7C 00127A7C 2000BF7B */  lq         $31, 0x20($sp)
/* 27B80 00127A80 1000B17B */  lq         $17, 0x10($sp)
/* 27B84 00127A84 0000B07B */  lq         $16, 0x0($sp)
/* 27B88 00127A88 3000BD27 */  addiu      $sp, $sp, 0x30
/* 27B8C 00127A8C 0800E003 */  jr         $31
/* 27B90 00127A90 00000000 */   nop
/* 27B94 00127A94 00000000 */  nop
/* 27B98 00127A98 00000000 */  nop
/* 27B9C 00127A9C 00000000 */  nop