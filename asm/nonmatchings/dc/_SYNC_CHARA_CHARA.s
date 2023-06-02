.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SYNC_CHARA_CHARA__FP12RS_STACKDATAi
/* 8DF00 0018DE00 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8DF04 0018DE04 2000BF7F */  sq         $31, 0x20($sp)
/* 8DF08 0018DE08 1000B17F */  sq         $17, 0x10($sp)
/* 8DF0C 0018DE0C 0000B07F */  sq         $16, 0x0($sp)
/* 8DF10 0018DE10 08009124 */  addiu      $17, $4, 0x8
/* 8DF14 0018DE14 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8DF18 0018DE18 00000000 */   nop
/* 8DF1C 0018DE1C 28264070 */  paddub     $4, $2, $0
/* 8DF20 0018DE20 842C060C */  jal        GetChara__Fi
/* 8DF24 0018DE24 00000000 */   nop
/* 8DF28 0018DE28 282E4070 */  paddub     $5, $2, $0
/* 8DF2C 0018DE2C 0400A014 */  bnez       $5, .L0018DE40
/* 8DF30 0018DE30 00000000 */   nop
/* 8DF34 0018DE34 28160070 */  paddub     $2, $0, $0
/* 8DF38 0018DE38 37000010 */  b          .L0018DF18
/* 8DF3C 0018DE3C 00000000 */   nop
.L0018DE40:
/* 8DF40 0018DE40 28262072 */  paddub     $4, $17, $0
/* 8DF44 0018DE44 08009124 */  addiu      $17, $4, 0x8
/* 8DF48 0018DE48 F428060C */  jal        GetStackString__FP12RS_STACKDATA
/* 8DF4C 0018DE4C 00000000 */   nop
/* 8DF50 0018DE50 04004014 */  bnez       $2, .L0018DE64
/* 8DF54 0018DE54 00000000 */   nop
/* 8DF58 0018DE58 28160070 */  paddub     $2, $0, $0
/* 8DF5C 0018DE5C 2E000010 */  b          .L0018DF18
/* 8DF60 0018DE60 00000000 */   nop
.L0018DE64:
/* 8DF64 0018DE64 00004380 */  lb         $3, 0x0($2)
/* 8DF68 0018DE68 07006010 */  beqz       $3, .L0018DE88
/* 8DF6C 0018DE6C 00000000 */   nop
/* 8DF70 0018DE70 BC00A48C */  lw         $4, 0xBC($5)
/* 8DF74 0018DE74 282E4070 */  paddub     $5, $2, $0
/* 8DF78 0018DE78 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* 8DF7C 0018DE7C 00000000 */   nop
/* 8DF80 0018DE80 03000010 */  b          .L0018DE90
/* 8DF84 0018DE84 00000000 */   nop
.L0018DE88:
/* 8DF88 0018DE88 BC00A28C */  lw         $2, 0xBC($5)
/* 8DF8C 0018DE8C 00000000 */  nop
.L0018DE90:
/* 8DF90 0018DE90 28864070 */  paddub     $16, $2, $0
/* 8DF94 0018DE94 04000016 */  bnez       $16, .L0018DEA8
/* 8DF98 0018DE98 00000000 */   nop
/* 8DF9C 0018DE9C 28160070 */  paddub     $2, $0, $0
/* 8DFA0 0018DEA0 1D000010 */  b          .L0018DF18
/* 8DFA4 0018DEA4 00000000 */   nop
.L0018DEA8:
/* 8DFA8 0018DEA8 28262072 */  paddub     $4, $17, $0
/* 8DFAC 0018DEAC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8DFB0 0018DEB0 00000000 */   nop
/* 8DFB4 0018DEB4 28264070 */  paddub     $4, $2, $0
/* 8DFB8 0018DEB8 842C060C */  jal        GetChara__Fi
/* 8DFBC 0018DEBC 00000000 */   nop
/* 8DFC0 0018DEC0 288E4070 */  paddub     $17, $2, $0
/* 8DFC4 0018DEC4 04002016 */  bnez       $17, .L0018DED8
/* 8DFC8 0018DEC8 00000000 */   nop
/* 8DFCC 0018DECC 28160070 */  paddub     $2, $0, $0
/* 8DFD0 0018DED0 11000010 */  b          .L0018DF18
/* 8DFD4 0018DED4 00000000 */   nop
.L0018DED8:
/* 8DFD8 0018DED8 BC00248E */  lw         $4, 0xBC($17)
/* 8DFDC 0018DEDC 04008014 */  bnez       $4, .L0018DEF0
/* 8DFE0 0018DEE0 00000000 */   nop
/* 8DFE4 0018DEE4 28160070 */  paddub     $2, $0, $0
/* 8DFE8 0018DEE8 0B000010 */  b          .L0018DF18
/* 8DFEC 0018DEEC 00000000 */   nop
.L0018DEF0:
/* 8DFF0 0018DEF0 282E0072 */  paddub     $5, $16, $0
/* 8DFF4 0018DEF4 60A0040C */  jal        SetReference__6CFrameFP6CFrame
/* 8DFF8 0018DEF8 00000000 */   nop
/* 8DFFC 0018DEFC C000248E */  lw         $4, 0xC0($17)
/* 8E000 0018DF00 04008010 */  beqz       $4, .L0018DF14
/* 8E004 0018DF04 00000000 */   nop
/* 8E008 0018DF08 282E0072 */  paddub     $5, $16, $0
/* 8E00C 0018DF0C 60A0040C */  jal        SetReference__6CFrameFP6CFrame
/* 8E010 0018DF10 00000000 */   nop
.L0018DF14:
/* 8E014 0018DF14 01000224 */  addiu      $2, $0, 0x1
.L0018DF18:
/* 8E018 0018DF18 2000BF7B */  lq         $31, 0x20($sp)
/* 8E01C 0018DF1C 1000B17B */  lq         $17, 0x10($sp)
/* 8E020 0018DF20 0000B07B */  lq         $16, 0x0($sp)
/* 8E024 0018DF24 3000BD27 */  addiu      $sp, $sp, 0x30
/* 8E028 0018DF28 0800E003 */  jr         $31
/* 8E02C 0018DF2C 00000000 */   nop
