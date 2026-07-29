.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Set__17CDungeonEventDataFP13CDungeonEvent
/* 0CC920 001CC820 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0CC924 001CC824 0000BF7F */  sq          $31, 0x0($29)
/* 0CC928 001CC828 0700A014 */  bnez        $5, .L001CC848
/* 0CC92C 001CC82C 00000000 */   nop
/* 0CC930 001CC830 2A00023C */  lui         $2, %hi(LIT_3309)
/* 0CC934 001CC834 90BF4424 */  addiu       $4, $2, %lo(LIT_3309)
/* 0CC938 001CC838 A611040C */  jal         printf
/* 0CC93C 001CC83C 00000000 */   nop
.L001CC840:
/* 0CC940 001CC840 FFFF0010 */  b           .L001CC840
/* 0CC944 001CC844 00000000 */   nop
.L001CC848:
/* 0CC948 001CC848 000085AC */  sw          $5, 0x0($4)
/* 0CC94C 001CC84C 2800A38C */  lw          $3, 0x28($5)
/* 0CC950 001CC850 300083AC */  sw          $3, 0x30($4)
/* 0CC954 001CC854 3400A38C */  lw          $3, 0x34($5)
/* 0CC958 001CC858 340083AC */  sw          $3, 0x34($4)
/* 0CC95C 001CC85C 01000324 */  addiu       $3, $0, 0x1
/* 0CC960 001CC860 380083AC */  sw          $3, 0x38($4)
/* 0CC964 001CC864 FFFF0324 */  addiu       $3, $0, -0x1
/* 0CC968 001CC868 3C0083AC */  sw          $3, 0x3C($4)
/* 0CC96C 001CC86C 0000BF7B */  lq          $31, 0x0($29)
/* 0CC970 001CC870 1000BD27 */  addiu       $29, $29, 0x10
/* 0CC974 001CC874 0800E003 */  jr          $31
/* 0CC978 001CC878 00000000 */   nop
/* 0CC97C 001CC87C 00000000 */  nop
