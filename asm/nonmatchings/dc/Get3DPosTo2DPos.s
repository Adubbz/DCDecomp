.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Get3DPosTo2DPos__FP6CFramePi
/* 12C120 0022C020 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 12C124 0022C024 1000BF7F */  sq         $31, 0x10($sp)
/* 12C128 0022C028 0000B07F */  sq         $16, 0x0($sp)
/* 12C12C 0022C02C 2886A070 */  paddub     $16, $5, $0
/* 12C130 0022C030 2900023C */  lui        $2, %hi(_617_3)
/* 12C134 0022C034 90454224 */  addiu      $2, $2, %lo(_617_3)
/* 12C138 0022C038 3000A627 */  addiu      $6, $sp, 0x30
/* 12C13C 0022C03C 00004278 */  lq         $2, 0x0($2)
/* 12C140 0022C040 0000C27C */  sq         $2, 0x0($6)
/* 12C144 0022C044 2000A527 */  addiu      $5, $sp, 0x20
/* 12C148 0022C048 58A3040C */  jal        GetWorldPosition__6CFrameFPfPf
/* 12C14C 0022C04C 00000000 */   nop
/* 12C150 0022C050 4000A427 */  addiu      $4, $sp, 0x40
/* 12C154 0022C054 2000A527 */  addiu      $5, $sp, 0x20
/* 12C158 0022C058 28360070 */  paddub     $6, $0, $0
/* 12C15C 0022C05C 38B9040C */  jal        MGRotTransPers2D__FPiPfi
/* 12C160 0022C060 00000000 */   nop
/* 12C164 0022C064 4000A38F */  lw         $3, 0x40($sp)
/* 12C168 0022C068 000003AE */  sw         $3, 0x0($16)
/* 12C16C 0022C06C 4400A38F */  lw         $3, 0x44($sp)
/* 12C170 0022C070 040003AE */  sw         $3, 0x4($16)
/* 12C174 0022C074 1000BF7B */  lq         $31, 0x10($sp)
/* 12C178 0022C078 0000B07B */  lq         $16, 0x0($sp)
/* 12C17C 0022C07C 5000BD27 */  addiu      $sp, $sp, 0x50
/* 12C180 0022C080 0800E003 */  jr         $31
/* 12C184 0022C084 00000000 */   nop
/* 12C188 0022C088 00000000 */  nop
/* 12C18C 0022C08C 00000000 */  nop
