.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetDir__6CBoundFPfPf
/* 03D940 0013D840 D0FFBD27 */  addiu       $29, $29, -0x30
/* 03D944 0013D844 1000BF7F */  sq          $31, 0x10($29)
/* 03D948 0013D848 0000B07F */  sq          $16, 0x0($29)
/* 03D94C 0013D84C 28868070 */  paddub      $16, $4, $0
/* 03D950 0013D850 281EA070 */  paddub      $3, $5, $0
/* 03D954 0013D854 283EC070 */  paddub      $7, $6, $0
/* 03D958 0013D858 2500023C */  lui         $2, %hi(LIT_708)
/* 03D95C 0013D85C 60154224 */  addiu       $2, $2, %lo(LIT_708)
/* 03D960 0013D860 2000A527 */  addiu       $5, $29, 0x20
/* 03D964 0013D864 00004278 */  lq          $2, 0x0($2)
/* 03D968 0013D868 0000A27C */  sq          $2, 0x0($5)
/* 03D96C 0013D86C 80000426 */  addiu       $4, $16, 0x80
/* 03D970 0013D870 28366070 */  paddub      $6, $3, $0
/* 03D974 0013D874 EE86040C */  jal         sceVu0CameraMatrix
/* 03D978 0013D878 00000000 */   nop
/* 03D97C 0013D87C 40000426 */  addiu       $4, $16, 0x40
/* 03D980 0013D880 80000526 */  addiu       $5, $16, 0x80
/* 03D984 0013D884 A085040C */  jal         sceVu0TransposeMatrix
/* 03D988 0013D888 00000000 */   nop
/* 03D98C 0013D88C 1000BF7B */  lq          $31, 0x10($29)
/* 03D990 0013D890 0000B07B */  lq          $16, 0x0($29)
/* 03D994 0013D894 3000BD27 */  addiu       $29, $29, 0x30
/* 03D998 0013D898 0800E003 */  jr          $31
/* 03D99C 0013D89C 00000000 */   nop
