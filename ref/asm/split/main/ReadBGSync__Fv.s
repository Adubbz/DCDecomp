.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ReadBGSync__Fv
/* 03EF30 0013EE30 F0FFBD27 */  addiu       $29, $29, -0x10
/* 03EF34 0013EE34 0000BF7F */  sq          $31, 0x0($29)
/* 03EF38 0013EE38 38FB040C */  jal         ReadBG__Fv
/* 03EF3C 0013EE3C 00000000 */   nop
/* 03EF40 0013EE40 CC01023C */  lui         $2, %hi(bg_read_info)
/* 03EF44 0013EE44 C0B04424 */  addiu       $4, $2, %lo(bg_read_info)
/* 03EF48 0013EE48 281E0070 */  paddub      $3, $0, $0
/* 03EF4C 0013EE4C 0C000010 */  b           .L0013EE80
/* 03EF50 0013EE50 00000000 */   nop
.L0013EE54:
/* 03EF54 0013EE54 0000828C */  lw          $2, 0x0($4)
/* 03EF58 0013EE58 07004010 */  beqz        $2, .L0013EE78
/* 03EF5C 0013EE5C 00000000 */   nop
/* 03EF60 0013EE60 0400828C */  lw          $2, 0x4($4)
/* 03EF64 0013EE64 09004010 */  beqz        $2, .L0013EE8C
/* 03EF68 0013EE68 00000000 */   nop
/* 03EF6C 0013EE6C 0800828C */  lw          $2, 0x8($4)
/* 03EF70 0013EE70 06004010 */  beqz        $2, .L0013EE8C
/* 03EF74 0013EE74 00000000 */   nop
.L0013EE78:
/* 03EF78 0013EE78 01006324 */  addiu       $3, $3, 0x1
/* 03EF7C 0013EE7C 9C008424 */  addiu       $4, $4, 0x9C
.L0013EE80:
/* 03EF80 0013EE80 20006228 */  slti        $2, $3, 0x20
/* 03EF84 0013EE84 F3FF4014 */  bnez        $2, .L0013EE54
/* 03EF88 0013EE88 00000000 */   nop
.L0013EE8C:
/* 03EF8C 0013EE8C 20000224 */  addiu       $2, $0, 0x20
/* 03EF90 0013EE90 04006214 */  bne         $3, $2, .L0013EEA4
/* 03EF94 0013EE94 00000000 */   nop
/* 03EF98 0013EE98 28160070 */  paddub      $2, $0, $0
/* 03EF9C 0013EE9C 02000010 */  b           .L0013EEA8
/* 03EFA0 0013EEA0 00000000 */   nop
.L0013EEA4:
/* 03EFA4 0013EEA4 01000224 */  addiu       $2, $0, 0x1
.L0013EEA8:
/* 03EFA8 0013EEA8 0000BF7B */  lq          $31, 0x0($29)
/* 03EFAC 0013EEAC 1000BD27 */  addiu       $29, $29, 0x10
/* 03EFB0 0013EEB0 0800E003 */  jr          $31
/* 03EFB4 0013EEB4 00000000 */   nop
/* 03EFB8 0013EEB8 00000000 */  nop
/* 03EFBC 0013EEBC 00000000 */  nop
