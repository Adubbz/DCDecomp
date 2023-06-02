.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ReadBGSync__Fv
/* 3EF30 0013EE30 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 3EF34 0013EE34 0000BF7F */  sq         $31, 0x0($sp)
/* 3EF38 0013EE38 38FB040C */  jal        ReadBG__Fv
/* 3EF3C 0013EE3C 00000000 */   nop
/* 3EF40 0013EE40 CC01023C */  lui        $2, %hi(bg_read_info)
/* 3EF44 0013EE44 C0B04424 */  addiu      $4, $2, %lo(bg_read_info)
/* 3EF48 0013EE48 281E0070 */  paddub     $3, $0, $0
/* 3EF4C 0013EE4C 0C000010 */  b          .L0013EE80
/* 3EF50 0013EE50 00000000 */   nop
.L0013EE54:
/* 3EF54 0013EE54 0000828C */  lw         $2, 0x0($4)
/* 3EF58 0013EE58 07004010 */  beqz       $2, .L0013EE78
/* 3EF5C 0013EE5C 00000000 */   nop
/* 3EF60 0013EE60 0400828C */  lw         $2, 0x4($4)
/* 3EF64 0013EE64 09004010 */  beqz       $2, .L0013EE8C
/* 3EF68 0013EE68 00000000 */   nop
/* 3EF6C 0013EE6C 0800828C */  lw         $2, 0x8($4)
/* 3EF70 0013EE70 06004010 */  beqz       $2, .L0013EE8C
/* 3EF74 0013EE74 00000000 */   nop
.L0013EE78:
/* 3EF78 0013EE78 01006324 */  addiu      $3, $3, 0x1
/* 3EF7C 0013EE7C 9C008424 */  addiu      $4, $4, 0x9C
.L0013EE80:
/* 3EF80 0013EE80 20006228 */  slti       $2, $3, 0x20
/* 3EF84 0013EE84 F3FF4014 */  bnez       $2, .L0013EE54
/* 3EF88 0013EE88 00000000 */   nop
.L0013EE8C:
/* 3EF8C 0013EE8C 20000224 */  addiu      $2, $0, 0x20
/* 3EF90 0013EE90 04006214 */  bne        $3, $2, .L0013EEA4
/* 3EF94 0013EE94 00000000 */   nop
/* 3EF98 0013EE98 28160070 */  paddub     $2, $0, $0
/* 3EF9C 0013EE9C 02000010 */  b          .L0013EEA8
/* 3EFA0 0013EEA0 00000000 */   nop
.L0013EEA4:
/* 3EFA4 0013EEA4 01000224 */  addiu      $2, $0, 0x1
.L0013EEA8:
/* 3EFA8 0013EEA8 0000BF7B */  lq         $31, 0x0($sp)
/* 3EFAC 0013EEAC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 3EFB0 0013EEB0 0800E003 */  jr         $31
/* 3EFB4 0013EEB4 00000000 */   nop
/* 3EFB8 0013EEB8 00000000 */  nop
/* 3EFBC 0013EEBC 00000000 */  nop
