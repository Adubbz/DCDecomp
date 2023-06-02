.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel run__10CRunScriptFi
/* 13DF70 0023DE70 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 13DF74 0023DE74 1000BF7F */  sq         $31, 0x10($sp)
/* 13DF78 0023DE78 0000B07F */  sq         $16, 0x0($sp)
/* 13DF7C 0023DE7C 28868070 */  paddub     $16, $4, $0
/* 13DF80 0023DE80 3C00828C */  lw         $2, 0x3C($4)
/* 13DF84 0023DE84 04004014 */  bnez       $2, .L0023DE98
/* 13DF88 0023DE88 00000000 */   nop
/* 13DF8C 0023DE8C FFFF0224 */  addiu      $2, $0, -0x1
/* 13DF90 0023DE90 52000010 */  b          .L0023DFDC
/* 13DF94 0023DE94 00000000 */   nop
.L0023DE98:
/* 13DF98 0023DE98 0C00028E */  lw         $2, 0xC($16)
/* 13DF9C 0023DE9C 100002AE */  sw         $2, 0x10($16)
/* 13DFA0 0023DEA0 1C00028E */  lw         $2, 0x1C($16)
/* 13DFA4 0023DEA4 200002AE */  sw         $2, 0x20($16)
/* 13DFA8 0023DEA8 2C0000AE */  sw         $0, 0x2C($16)
/* 13DFAC 0023DEAC 0700A104 */  bgez       $5, .L0023DECC
/* 13DFB0 0023DEB0 00000000 */   nop
/* 13DFB4 0023DEB4 3C00038E */  lw         $3, 0x3C($16)
/* 13DFB8 0023DEB8 0400628C */  lw         $2, 0x4($3)
/* 13DFBC 0023DEBC 21106200 */  addu       $2, $3, $2
/* 13DFC0 0023DEC0 2C0002AE */  sw         $2, 0x2C($16)
/* 13DFC4 0023DEC4 15000010 */  b          .L0023DF1C
/* 13DFC8 0023DEC8 00000000 */   nop
.L0023DECC:
/* 13DFCC 0023DECC 3C00068E */  lw         $6, 0x3C($16)
/* 13DFD0 0023DED0 0C00C28C */  lw         $2, 0xC($6)
/* 13DFD4 0023DED4 2118C200 */  addu       $3, $6, $2
/* 13DFD8 0023DED8 28260070 */  paddub     $4, $0, $0
/* 13DFDC 0023DEDC 0B000010 */  b          .L0023DF0C
/* 13DFE0 0023DEE0 00000000 */   nop
.L0023DEE4:
/* 13DFE4 0023DEE4 0000628C */  lw         $2, 0x0($3)
/* 13DFE8 0023DEE8 06004514 */  bne        $2, $5, .L0023DF04
/* 13DFEC 0023DEEC 00000000 */   nop
/* 13DFF0 0023DEF0 0400628C */  lw         $2, 0x4($3)
/* 13DFF4 0023DEF4 2110C200 */  addu       $2, $6, $2
/* 13DFF8 0023DEF8 2C0002AE */  sw         $2, 0x2C($16)
/* 13DFFC 0023DEFC 07000010 */  b          .L0023DF1C
/* 13E000 0023DF00 00000000 */   nop
.L0023DF04:
/* 13E004 0023DF04 01008424 */  addiu      $4, $4, 0x1
/* 13E008 0023DF08 08006324 */  addiu      $3, $3, 0x8
.L0023DF0C:
/* 13E00C 0023DF0C 1000C28C */  lw         $2, 0x10($6)
/* 13E010 0023DF10 2A108200 */  slt        $2, $4, $2
/* 13E014 0023DF14 F3FF4014 */  bnez       $2, .L0023DEE4
/* 13E018 0023DF18 00000000 */   nop
.L0023DF1C:
/* 13E01C 0023DF1C 2C00028E */  lw         $2, 0x2C($16)
/* 13E020 0023DF20 08004014 */  bnez       $2, .L0023DF44
/* 13E024 0023DF24 00000000 */   nop
/* 13E028 0023DF28 2A00023C */  lui        $2, %hi(_110)
/* 13E02C 0023DF2C 80F84424 */  addiu      $4, $2, %lo(_110)
/* 13E030 0023DF30 A611040C */  jal        printf
/* 13E034 0023DF34 00000000 */   nop
/* 13E038 0023DF38 FFFF0224 */  addiu      $2, $0, -0x1
/* 13E03C 0023DF3C 27000010 */  b          .L0023DFDC
/* 13E040 0023DF40 00000000 */   nop
.L0023DF44:
/* 13E044 0023DF44 1000038E */  lw         $3, 0x10($16)
/* 13E048 0023DF48 0C00428C */  lw         $2, 0xC($2)
/* 13E04C 0023DF4C C0100200 */  sll        $2, $2, 3
/* 13E050 0023DF50 23106200 */  subu       $2, $3, $2
/* 13E054 0023DF54 280002AE */  sw         $2, 0x28($16)
/* 13E058 0023DF58 2C00028E */  lw         $2, 0x2C($16)
/* 13E05C 0023DF5C 0800428C */  lw         $2, 0x8($2)
/* 13E060 0023DF60 C0180200 */  sll        $3, $2, 3
/* 13E064 0023DF64 2800028E */  lw         $2, 0x28($16)
/* 13E068 0023DF68 21104300 */  addu       $2, $2, $3
/* 13E06C 0023DF6C 100002AE */  sw         $2, 0x10($16)
/* 13E070 0023DF70 28260072 */  paddub     $4, $16, $0
/* 13E074 0023DF74 60F6080C */  jal        check_stack__10CRunScriptFv
/* 13E078 0023DF78 00000000 */   nop
/* 13E07C 0023DF7C 2C00058E */  lw         $5, 0x2C($16)
/* 13E080 0023DF80 0C00A68C */  lw         $6, 0xC($5)
/* 13E084 0023DF84 C0180600 */  sll        $3, $6, 3
/* 13E088 0023DF88 2800028E */  lw         $2, 0x28($16)
/* 13E08C 0023DF8C 21204300 */  addu       $4, $2, $3
/* 13E090 0023DF90 0800A28C */  lw         $2, 0x8($5)
/* 13E094 0023DF94 23104600 */  subu       $2, $2, $6
/* 13E098 0023DF98 C0300200 */  sll        $6, $2, 3
/* 13E09C 0023DF9C 282E0070 */  paddub     $5, $0, $0
/* 13E0A0 0023DFA0 5A0D040C */  jal        memset
/* 13E0A4 0023DFA4 00000000 */   nop
/* 13E0A8 0023DFA8 2C00028E */  lw         $2, 0x2C($16)
/* 13E0AC 0023DFAC 0000438C */  lw         $3, 0x0($2)
/* 13E0B0 0023DFB0 4000028E */  lw         $2, 0x40($16)
/* 13E0B4 0023DFB4 21284300 */  addu       $5, $2, $3
/* 13E0B8 0023DFB8 340000AE */  sw         $0, 0x34($16)
/* 13E0BC 0023DFBC 380000AE */  sw         $0, 0x38($16)
/* 13E0C0 0023DFC0 28260072 */  paddub     $4, $16, $0
/* 13E0C4 0023DFC4 20F8080C */  jal        exe__10CRunScriptFP8vmcode_t
/* 13E0C8 0023DFC8 00000000 */   nop
/* 13E0CC 0023DFCC 3400048E */  lw         $4, 0x34($16)
/* 13E0D0 0023DFD0 28160070 */  paddub     $2, $0, $0
/* 13E0D4 0023DFD4 01000324 */  addiu      $3, $0, 0x1
/* 13E0D8 0023DFD8 0A106400 */  movz       $2, $3, $4
.L0023DFDC:
/* 13E0DC 0023DFDC 1000BF7B */  lq         $31, 0x10($sp)
/* 13E0E0 0023DFE0 0000B07B */  lq         $16, 0x0($sp)
/* 13E0E4 0023DFE4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 13E0E8 0023DFE8 0800E003 */  jr         $31
/* 13E0EC 0023DFEC 00000000 */   nop
