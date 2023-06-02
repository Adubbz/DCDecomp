.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _RELEASE_CHARA_CHARA__FP12RS_STACKDATAi
/* 8E030 0018DF30 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8E034 0018DF34 1000BF7F */  sq         $31, 0x10($sp)
/* 8E038 0018DF38 0000B07F */  sq         $16, 0x0($sp)
/* 8E03C 0018DF3C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8E040 0018DF40 00000000 */   nop
/* 8E044 0018DF44 28264070 */  paddub     $4, $2, $0
/* 8E048 0018DF48 842C060C */  jal        GetChara__Fi
/* 8E04C 0018DF4C 00000000 */   nop
/* 8E050 0018DF50 28864070 */  paddub     $16, $2, $0
/* 8E054 0018DF54 04000016 */  bnez       $16, .L0018DF68
/* 8E058 0018DF58 00000000 */   nop
/* 8E05C 0018DF5C 28160070 */  paddub     $2, $0, $0
/* 8E060 0018DF60 0C000010 */  b          .L0018DF94
/* 8E064 0018DF64 00000000 */   nop
.L0018DF68:
/* 8E068 0018DF68 BC00048E */  lw         $4, 0xBC($16)
/* 8E06C 0018DF6C 03008010 */  beqz       $4, .L0018DF7C
/* 8E070 0018DF70 00000000 */   nop
/* 8E074 0018DF74 68A0040C */  jal        DeleteReference__6CFrameFv
/* 8E078 0018DF78 00000000 */   nop
.L0018DF7C:
/* 8E07C 0018DF7C C000048E */  lw         $4, 0xC0($16)
/* 8E080 0018DF80 03008010 */  beqz       $4, .L0018DF90
/* 8E084 0018DF84 00000000 */   nop
/* 8E088 0018DF88 68A0040C */  jal        DeleteReference__6CFrameFv
/* 8E08C 0018DF8C 00000000 */   nop
.L0018DF90:
/* 8E090 0018DF90 01000224 */  addiu      $2, $0, 0x1
.L0018DF94:
/* 8E094 0018DF94 1000BF7B */  lq         $31, 0x10($sp)
/* 8E098 0018DF98 0000B07B */  lq         $16, 0x0($sp)
/* 8E09C 0018DF9C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 8E0A0 0018DFA0 0800E003 */  jr         $31
/* 8E0A4 0018DFA4 00000000 */   nop
/* 8E0A8 0018DFA8 00000000 */  nop
/* 8E0AC 0018DFAC 00000000 */  nop
