.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _RELEASE_SCENE_CHARA__FP12RS_STACKDATAi
/* 8D950 0018D850 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8D954 0018D854 1000BF7F */  sq         $31, 0x10($sp)
/* 8D958 0018D858 0000B07F */  sq         $16, 0x0($sp)
/* 8D95C 0018D85C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8D960 0018D860 00000000 */   nop
/* 8D964 0018D864 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8D968 0018D868 1CD2308C */  lw         $16, -0x2DE4($at)
/* 8D96C 0018D86C 05004004 */  bltz       $2, .L0018D884
/* 8D970 0018D870 00000000 */   nop
/* 8D974 0018D874 28264070 */  paddub     $4, $2, $0
/* 8D978 0018D878 702C060C */  jal        GetNPC__Fi
/* 8D97C 0018D87C 00000000 */   nop
/* 8D980 0018D880 28864070 */  paddub     $16, $2, $0
.L0018D884:
/* 8D984 0018D884 04000016 */  bnez       $16, .L0018D898
/* 8D988 0018D888 00000000 */   nop
/* 8D98C 0018D88C 28160070 */  paddub     $2, $0, $0
/* 8D990 0018D890 0C000010 */  b          .L0018D8C4
/* 8D994 0018D894 00000000 */   nop
.L0018D898:
/* 8D998 0018D898 BC00048E */  lw         $4, 0xBC($16)
/* 8D99C 0018D89C 03008010 */  beqz       $4, .L0018D8AC
/* 8D9A0 0018D8A0 00000000 */   nop
/* 8D9A4 0018D8A4 68A0040C */  jal        DeleteReference__6CFrameFv
/* 8D9A8 0018D8A8 00000000 */   nop
.L0018D8AC:
/* 8D9AC 0018D8AC C000048E */  lw         $4, 0xC0($16)
/* 8D9B0 0018D8B0 03008010 */  beqz       $4, .L0018D8C0
/* 8D9B4 0018D8B4 00000000 */   nop
/* 8D9B8 0018D8B8 68A0040C */  jal        DeleteReference__6CFrameFv
/* 8D9BC 0018D8BC 00000000 */   nop
.L0018D8C0:
/* 8D9C0 0018D8C0 01000224 */  addiu      $2, $0, 0x1
.L0018D8C4:
/* 8D9C4 0018D8C4 1000BF7B */  lq         $31, 0x10($sp)
/* 8D9C8 0018D8C8 0000B07B */  lq         $16, 0x0($sp)
/* 8D9CC 0018D8CC 2000BD27 */  addiu      $sp, $sp, 0x20
/* 8D9D0 0018D8D0 0800E003 */  jr         $31
/* 8D9D4 0018D8D4 00000000 */   nop
/* 8D9D8 0018D8D8 00000000 */  nop
/* 8D9DC 0018D8DC 00000000 */  nop
