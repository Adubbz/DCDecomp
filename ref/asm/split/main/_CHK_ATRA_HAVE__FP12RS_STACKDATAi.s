.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _CHK_ATRA_HAVE__FP12RS_STACKDATAi
/* 0BC8F0 001BC7F0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 0BC8F4 001BC7F4 3000BF7F */  sq          $31, 0x30($29)
/* 0BC8F8 001BC7F8 2000B27F */  sq          $18, 0x20($29)
/* 0BC8FC 001BC7FC 1000B17F */  sq          $17, 0x10($29)
/* 0BC900 001BC800 0000B07F */  sq          $16, 0x0($29)
/* 0BC904 001BC804 08009224 */  addiu       $18, $4, 0x8
/* 0BC908 001BC808 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BC90C 001BC80C 00000000 */   nop
/* 0BC910 001BC810 28864070 */  paddub      $16, $2, $0
/* 0BC914 001BC814 789C828F */  lw          $2, -0x6388($28)
/* 0BC918 001BC818 00004580 */  lb          $5, 0x0($2)
/* 0BC91C 001BC81C 28260072 */  paddub      $4, $16, $0
/* 0BC920 001BC820 90AA080C */  jal         GetAtraTipNowHave__Fii
/* 0BC924 001BC824 00000000 */   nop
/* 0BC928 001BC828 288E4070 */  paddub      $17, $2, $0
/* 0BC92C 001BC82C 789C828F */  lw          $2, -0x6388($28)
/* 0BC930 001BC830 00004680 */  lb          $6, 0x0($2)
/* 0BC934 001BC834 2A00023C */  lui         $2, %hi(LIT_809)
/* 0BC938 001BC838 28BD4424 */  addiu       $4, $2, %lo(LIT_809)
/* 0BC93C 001BC83C 282E0072 */  paddub      $5, $16, $0
/* 0BC940 001BC840 283E2072 */  paddub      $7, $17, $0
/* 0BC944 001BC844 A611040C */  jal         printf
/* 0BC948 001BC848 00000000 */   nop
/* 0BC94C 001BC84C 28264072 */  paddub      $4, $18, $0
/* 0BC950 001BC850 282E2072 */  paddub      $5, $17, $0
/* 0BC954 001BC854 70EE060C */  jal         SetStack__FP12RS_STACKDATAi__2
/* 0BC958 001BC858 00000000 */   nop
/* 0BC95C 001BC85C 01000224 */  addiu       $2, $0, 0x1
/* 0BC960 001BC860 3000BF7B */  lq          $31, 0x30($29)
/* 0BC964 001BC864 2000B27B */  lq          $18, 0x20($29)
/* 0BC968 001BC868 1000B17B */  lq          $17, 0x10($29)
/* 0BC96C 001BC86C 0000B07B */  lq          $16, 0x0($29)
/* 0BC970 001BC870 4000BD27 */  addiu       $29, $29, 0x40
/* 0BC974 001BC874 0800E003 */  jr          $31
/* 0BC978 001BC878 00000000 */   nop
/* 0BC97C 001BC87C 00000000 */  nop
