.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel VSyncCallBack__Fi
/* 2C270 0012C170 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2C274 0012C174 1000BF7F */  sq         $31, 0x10($sp)
/* 2C278 0012C178 0000B07F */  sq         $16, 0x0($sp)
/* 2C27C 0012C17C 28868070 */  paddub     $16, $4, $0
/* 2C280 0012C180 28260070 */  paddub     $4, $0, $0
/* 2C284 0012C184 7451040C */  jal        iFlushCache
/* 2C288 0012C188 00000000 */   nop
/* 2C28C 0012C18C 01000224 */  addiu      $2, $0, 0x1
/* 2C290 0012C190 1C8C82AF */  sw         $2, -0x73E4($gp)
/* 2C294 0012C194 0012023C */  lui        $2, (0x12001000 >> 16)
/* 2C298 0012C198 00104234 */  ori        $2, $2, (0x12001000 & 0xFFFF)
/* 2C29C 0012C19C 000042DC */  ld         $2, 0x0($2)
/* 2C2A0 0012C1A0 7A130200 */  dsrl       $2, $2, 13
/* 2C2A4 0012C1A4 01004230 */  andi       $2, $2, 0x1
/* 2C2A8 0012C1A8 2B100200 */  sltu       $2, $0, $2
/* 2C2AC 0012C1AC 01004238 */  xori       $2, $2, 0x1
/* 2C2B0 0012C1B0 FF004230 */  andi       $2, $2, 0xFF
/* 2C2B4 0012C1B4 D88B82AF */  sw         $2, -0x7428($gp)
/* 2C2B8 0012C1B8 188C828F */  lw         $2, -0x73E8($gp)
/* 2C2BC 0012C1BC 04004010 */  beqz       $2, .L0012C1D0
/* 2C2C0 0012C1C0 00000000 */   nop
/* 2C2C4 0012C1C4 28260072 */  paddub     $4, $16, $0
/* 2C2C8 0012C1C8 09F84000 */  jalr       $2
/* 2C2CC 0012C1CC 00000000 */   nop
.L0012C1D0:
/* 2C2D0 0012C1D0 108C828F */  lw         $2, -0x73F0($gp)
/* 2C2D4 0012C1D4 01004224 */  addiu      $2, $2, 0x1
/* 2C2D8 0012C1D8 108C82AF */  sw         $2, -0x73F0($gp)
/* 2C2DC 0012C1DC 1C8C80AF */  sw         $0, -0x73E4($gp)
/* 2C2E0 0012C1E0 0F000000 */  sync
/* 2C2E4 0012C1E4 38000042 */  ei # handwritten instruction
/* 2C2E8 0012C1E8 28260070 */  paddub     $4, $0, $0
/* 2C2EC 0012C1EC 7451040C */  jal        iFlushCache
/* 2C2F0 0012C1F0 00000000 */   nop
/* 2C2F4 0012C1F4 28160070 */  paddub     $2, $0, $0
/* 2C2F8 0012C1F8 1000BF7B */  lq         $31, 0x10($sp)
/* 2C2FC 0012C1FC 0000B07B */  lq         $16, 0x0($sp)
/* 2C300 0012C200 2000BD27 */  addiu      $sp, $sp, 0x20
/* 2C304 0012C204 0800E003 */  jr         $31
/* 2C308 0012C208 00000000 */   nop
/* 2C30C 0012C20C 00000000 */  nop
