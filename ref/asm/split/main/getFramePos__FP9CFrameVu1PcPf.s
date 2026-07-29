.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel getFramePos__FP9CFrameVu1PcPf
/* 0B7030 001B6F30 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0B7034 001B6F34 1000BF7F */  sq          $31, 0x10($29)
/* 0B7038 001B6F38 0000B07F */  sq          $16, 0x0($29)
/* 0B703C 001B6F3C 2886C070 */  paddub      $16, $6, $0
/* 0B7040 001B6F40 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 0B7044 001B6F44 00000000 */   nop
/* 0B7048 001B6F48 2800A0AF */  sw          $0, 0x28($29)
/* 0B704C 001B6F4C 2400A0AF */  sw          $0, 0x24($29)
/* 0B7050 001B6F50 2000A0AF */  sw          $0, 0x20($29)
/* 0B7054 001B6F54 2C00A0AF */  sw          $0, 0x2C($29)
/* 0B7058 001B6F58 28264070 */  paddub      $4, $2, $0
/* 0B705C 001B6F5C 282E0072 */  paddub      $5, $16, $0
/* 0B7060 001B6F60 2000A627 */  addiu       $6, $29, 0x20
/* 0B7064 001B6F64 58A3040C */  jal         GetWorldPosition__6CFrameFPfPf
/* 0B7068 001B6F68 00000000 */   nop
/* 0B706C 001B6F6C 1000BF7B */  lq          $31, 0x10($29)
/* 0B7070 001B6F70 0000B07B */  lq          $16, 0x0($29)
/* 0B7074 001B6F74 3000BD27 */  addiu       $29, $29, 0x30
/* 0B7078 001B6F78 0800E003 */  jr          $31
/* 0B707C 001B6F7C 00000000 */   nop
