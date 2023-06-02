.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandALLOC_SHADOW_MDT__FPPv
/* 3AAB0 0013A9B0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 3AAB4 0013A9B4 0000BF7F */  sq         $31, 0x0($sp)
/* 3AAB8 0013A9B8 DC8C838F */  lw         $3, -0x7324($gp)
/* 3AABC 0013A9BC 08006128 */  slti       $at, $3, 0x8
/* 3AAC0 0013A9C0 0B002010 */  beqz       $at, .L0013A9F0
/* 3AAC4 0013A9C4 00000000 */   nop
/* 3AAC8 0013A9C8 01006224 */  addiu      $2, $3, 0x1
/* 3AACC 0013A9CC DC8C82AF */  sw         $2, -0x7324($gp)
/* 3AAD0 0013A9D0 00190300 */  sll        $3, $3, 4
/* 3AAD4 0013A9D4 C801023C */  lui        $2, %hi(alloc_smdt)
/* 3AAD8 0013A9D8 90AF4224 */  addiu      $2, $2, %lo(alloc_smdt)
/* 3AADC 0013A9DC 21104300 */  addu       $2, $2, $3
/* 3AAE0 0013A9E0 0000858C */  lw         $5, 0x0($4)
/* 3AAE4 0013A9E4 28264070 */  paddub     $4, $2, $0
/* 3AAE8 0013A9E8 5A15040C */  jal        strcpy
/* 3AAEC 0013A9EC 00000000 */   nop
.L0013A9F0:
/* 3AAF0 0013A9F0 0000BF7B */  lq         $31, 0x0($sp)
/* 3AAF4 0013A9F4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 3AAF8 0013A9F8 0800E003 */  jr         $31
/* 3AAFC 0013A9FC 00000000 */   nop
