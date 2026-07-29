.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _NPC_DRAW_SHADOW__FP12RS_STACKDATAi
/* 08EF60 0018EE60 B0FFBD27 */  addiu       $29, $29, -0x50
/* 08EF64 0018EE64 4000BF7F */  sq          $31, 0x40($29)
/* 08EF68 0018EE68 3000B37F */  sq          $19, 0x30($29)
/* 08EF6C 0018EE6C 2000B27F */  sq          $18, 0x20($29)
/* 08EF70 0018EE70 1000B17F */  sq          $17, 0x10($29)
/* 08EF74 0018EE74 0000B07F */  sq          $16, 0x0($29)
/* 08EF78 0018EE78 2896A070 */  paddub      $18, $5, $0
/* 08EF7C 0018EE7C 08009324 */  addiu       $19, $4, 0x8
/* 08EF80 0018EE80 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08EF84 0018EE84 00000000 */   nop
/* 08EF88 0018EE88 28864070 */  paddub      $16, $2, $0
/* 08EF8C 0018EE8C 288E0070 */  paddub      $17, $0, $0
/* 08EF90 0018EE90 19000010 */  b           .L0018EEF8
/* 08EF94 0018EE94 00000000 */   nop
.L0018EE98:
/* 08EF98 0018EE98 28266072 */  paddub      $4, $19, $0
/* 08EF9C 0018EE9C 08009324 */  addiu       $19, $4, 0x8
/* 08EFA0 0018EEA0 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08EFA4 0018EEA4 00000000 */   nop
/* 08EFA8 0018EEA8 28264070 */  paddub      $4, $2, $0
/* 08EFAC 0018EEAC 842C060C */  jal         GetChara__Fi
/* 08EFB0 0018EEB0 00000000 */   nop
/* 08EFB4 0018EEB4 0F004010 */  beqz        $2, .L0018EEF4
/* 08EFB8 0018EEB8 00000000 */   nop
/* 08EFBC 0018EEBC 03008104 */  bgez        $4, .L0018EECC
/* 08EFC0 0018EEC0 00000000 */   nop
/* 08EFC4 0018EEC4 D401013C */  lui         $1, %hi(EdEventInfo + 0x64)
/* 08EFC8 0018EEC8 34D230AC */  sw          $16, %lo(EdEventInfo + 0x64)($1)
.L0018EECC:
/* 08EFCC 0018EECC 09008004 */  bltz        $4, .L0018EEF4
/* 08EFD0 0018EED0 00000000 */   nop
/* 08EFD4 0018EED4 10008128 */  slti        $1, $4, 0x10
/* 08EFD8 0018EED8 06002010 */  beqz        $1, .L0018EEF4
/* 08EFDC 0018EEDC 00000000 */   nop
/* 08EFE0 0018EEE0 80180400 */  sll         $3, $4, 2
/* 08EFE4 0018EEE4 D401023C */  lui         $2, %hi(EdEventInfo + 0xF4)
/* 08EFE8 0018EEE8 C4D24224 */  addiu       $2, $2, %lo(EdEventInfo + 0xF4)
/* 08EFEC 0018EEEC 21104300 */  addu        $2, $2, $3
/* 08EFF0 0018EEF0 000050AC */  sw          $16, 0x0($2)
.L0018EEF4:
/* 08EFF4 0018EEF4 01003126 */  addiu       $17, $17, 0x1
.L0018EEF8:
/* 08EFF8 0018EEF8 FFFF4226 */  addiu       $2, $18, -0x1
/* 08EFFC 0018EEFC 2A102202 */  slt         $2, $17, $2
/* 08F000 0018EF00 E5FF4014 */  bnez        $2, .L0018EE98
/* 08F004 0018EF04 00000000 */   nop
/* 08F008 0018EF08 01000224 */  addiu       $2, $0, 0x1
/* 08F00C 0018EF0C 4000BF7B */  lq          $31, 0x40($29)
/* 08F010 0018EF10 3000B37B */  lq          $19, 0x30($29)
/* 08F014 0018EF14 2000B27B */  lq          $18, 0x20($29)
/* 08F018 0018EF18 1000B17B */  lq          $17, 0x10($29)
/* 08F01C 0018EF1C 0000B07B */  lq          $16, 0x0($29)
/* 08F020 0018EF20 5000BD27 */  addiu       $29, $29, 0x50
/* 08F024 0018EF24 0800E003 */  jr          $31
/* 08F028 0018EF28 00000000 */   nop
/* 08F02C 0018EF2C 00000000 */  nop
