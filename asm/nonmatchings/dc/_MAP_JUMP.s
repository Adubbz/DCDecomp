.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _MAP_JUMP__FP12RS_STACKDATAi
/* 8C0E0 0018BFE0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 8C0E4 0018BFE4 3000BF7F */  sq         $31, 0x30($sp)
/* 8C0E8 0018BFE8 2000B27F */  sq         $18, 0x20($sp)
/* 8C0EC 0018BFEC 1000B17F */  sq         $17, 0x10($sp)
/* 8C0F0 0018BFF0 0000B07F */  sq         $16, 0x0($sp)
/* 8C0F4 0018BFF4 288EA070 */  paddub     $17, $5, $0
/* 8C0F8 0018BFF8 08009224 */  addiu      $18, $4, 0x8
/* 8C0FC 0018BFFC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8C100 0018C000 00000000 */   nop
/* 8C104 0018C004 FFFF5024 */  addiu      $16, $2, -0x1
/* 8C108 0018C008 FFFF0224 */  addiu      $2, $0, -0x1
/* 8C10C 0018C00C 0200232A */  slti       $3, $17, 0x2
/* 8C110 0018C010 04006014 */  bnez       $3, .L0018C024
/* 8C114 0018C014 00000000 */   nop
/* 8C118 0018C018 28264072 */  paddub     $4, $18, $0
/* 8C11C 0018C01C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8C120 0018C020 00000000 */   nop
.L0018C024:
/* 8C124 0018C024 28260072 */  paddub     $4, $16, $0
/* 8C128 0018C028 282E4070 */  paddub     $5, $2, $0
/* 8C12C 0018C02C 4C07050C */  jal        MapJump__Fii
/* 8C130 0018C030 00000000 */   nop
/* 8C134 0018C034 08000224 */  addiu      $2, $0, 0x8
/* 8C138 0018C038 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8C13C 0018C03C 18D622AC */  sw         $2, -0x29E8($at)
/* 8C140 0018C040 01000224 */  addiu      $2, $0, 0x1
/* 8C144 0018C044 3000BF7B */  lq         $31, 0x30($sp)
/* 8C148 0018C048 2000B27B */  lq         $18, 0x20($sp)
/* 8C14C 0018C04C 1000B17B */  lq         $17, 0x10($sp)
/* 8C150 0018C050 0000B07B */  lq         $16, 0x0($sp)
/* 8C154 0018C054 4000BD27 */  addiu      $sp, $sp, 0x40
/* 8C158 0018C058 0800E003 */  jr         $31
/* 8C15C 0018C05C 00000000 */   nop
