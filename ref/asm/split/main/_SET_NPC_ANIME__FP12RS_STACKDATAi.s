.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_NPC_ANIME__FP12RS_STACKDATAi
/* 08ECB0 0018EBB0 A0FFBD27 */  addiu       $29, $29, -0x60
/* 08ECB4 0018EBB4 5000BF7F */  sq          $31, 0x50($29)
/* 08ECB8 0018EBB8 4000B47F */  sq          $20, 0x40($29)
/* 08ECBC 0018EBBC 3000B37F */  sq          $19, 0x30($29)
/* 08ECC0 0018EBC0 2000B27F */  sq          $18, 0x20($29)
/* 08ECC4 0018EBC4 1000B17F */  sq          $17, 0x10($29)
/* 08ECC8 0018EBC8 0000B07F */  sq          $16, 0x0($29)
/* 08ECCC 0018EBCC 289EA070 */  paddub      $19, $5, $0
/* 08ECD0 0018EBD0 08009424 */  addiu       $20, $4, 0x8
/* 08ECD4 0018EBD4 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08ECD8 0018EBD8 00000000 */   nop
/* 08ECDC 0018EBDC FFFF0324 */  addiu       $3, $0, -0x1
/* 08ECE0 0018EBE0 05004314 */  bne         $2, $3, .L0018EBF8
/* 08ECE4 0018EBE4 00000000 */   nop
/* 08ECE8 0018EBE8 D401013C */  lui         $1, %hi(EdEventInfo + 0x4C)
/* 08ECEC 0018EBEC 1CD2228C */  lw          $2, %lo(EdEventInfo + 0x4C)($1)
/* 08ECF0 0018EBF0 04000010 */  b           .L0018EC04
/* 08ECF4 0018EBF4 00000000 */   nop
.L0018EBF8:
/* 08ECF8 0018EBF8 28264070 */  paddub      $4, $2, $0
/* 08ECFC 0018EBFC 702C060C */  jal         GetNPC__Fi
/* 08ED00 0018EC00 00000000 */   nop
.L0018EC04:
/* 08ED04 0018EC04 28864070 */  paddub      $16, $2, $0
/* 08ED08 0018EC08 04000016 */  bnez        $16, .L0018EC1C
/* 08ED0C 0018EC0C 00000000 */   nop
/* 08ED10 0018EC10 28160070 */  paddub      $2, $0, $0
/* 08ED14 0018EC14 23000010 */  b           .L0018ECA4
/* 08ED18 0018EC18 00000000 */   nop
.L0018EC1C:
/* 08ED1C 0018EC1C 28268072 */  paddub      $4, $20, $0
/* 08ED20 0018EC20 08009424 */  addiu       $20, $4, 0x8
/* 08ED24 0018EC24 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08ED28 0018EC28 00000000 */   nop
/* 08ED2C 0018EC2C 288E4070 */  paddub      $17, $2, $0
/* 08ED30 0018EC30 01001224 */  addiu       $18, $0, 0x1
/* 08ED34 0018EC34 03000224 */  addiu       $2, $0, 0x3
/* 08ED38 0018EC38 05006216 */  bne         $19, $2, .L0018EC50
/* 08ED3C 0018EC3C 00000000 */   nop
/* 08ED40 0018EC40 28268072 */  paddub      $4, $20, $0
/* 08ED44 0018EC44 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08ED48 0018EC48 00000000 */   nop
/* 08ED4C 0018EC4C 28964070 */  paddub      $18, $2, $0
.L0018EC50:
/* 08ED50 0018EC50 FFFF0224 */  addiu       $2, $0, -0x1
/* 08ED54 0018EC54 06002216 */  bne         $17, $2, .L0018EC70
/* 08ED58 0018EC58 00000000 */   nop
/* 08ED5C 0018EC5C 04004016 */  bnez        $18, .L0018EC70
/* 08ED60 0018EC60 00000000 */   nop
/* 08ED64 0018EC64 28260072 */  paddub      $4, $16, $0
/* 08ED68 0018EC68 08E0040C */  jal         ClearTexAnime__10CCharacterFv
/* 08ED6C 0018EC6C 00000000 */   nop
.L0018EC70:
/* 08ED70 0018EC70 07004012 */  beqz        $18, .L0018EC90
/* 08ED74 0018EC74 00000000 */   nop
/* 08ED78 0018EC78 28260072 */  paddub      $4, $16, $0
/* 08ED7C 0018EC7C 282E2072 */  paddub      $5, $17, $0
/* 08ED80 0018EC80 20E0040C */  jal         TexAnimeOn__10CCharacterFi
/* 08ED84 0018EC84 00000000 */   nop
/* 08ED88 0018EC88 05000010 */  b           .L0018ECA0
/* 08ED8C 0018EC8C 00000000 */   nop
.L0018EC90:
/* 08ED90 0018EC90 28260072 */  paddub      $4, $16, $0
/* 08ED94 0018EC94 282E2072 */  paddub      $5, $17, $0
/* 08ED98 0018EC98 2CE0040C */  jal         TexAnimeOff__10CCharacterFi
/* 08ED9C 0018EC9C 00000000 */   nop
.L0018ECA0:
/* 08EDA0 0018ECA0 01000224 */  addiu       $2, $0, 0x1
.L0018ECA4:
/* 08EDA4 0018ECA4 5000BF7B */  lq          $31, 0x50($29)
/* 08EDA8 0018ECA8 4000B47B */  lq          $20, 0x40($29)
/* 08EDAC 0018ECAC 3000B37B */  lq          $19, 0x30($29)
/* 08EDB0 0018ECB0 2000B27B */  lq          $18, 0x20($29)
/* 08EDB4 0018ECB4 1000B17B */  lq          $17, 0x10($29)
/* 08EDB8 0018ECB8 0000B07B */  lq          $16, 0x0($29)
/* 08EDBC 0018ECBC 6000BD27 */  addiu       $29, $29, 0x60
/* 08EDC0 0018ECC0 0800E003 */  jr          $31
/* 08EDC4 0018ECC4 00000000 */   nop
/* 08EDC8 0018ECC8 00000000 */  nop
/* 08EDCC 0018ECCC 00000000 */  nop
