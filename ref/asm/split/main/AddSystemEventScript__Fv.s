.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel AddSystemEventScript__Fv
/* 0BD900 001BD800 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0BD904 001BD804 1000BF7F */  sq          $31, 0x10($29)
/* 0BD908 001BD808 0000B07F */  sq          $16, 0x0($29)
/* 0BD90C 001BD80C 28860070 */  paddub      $16, $0, $0
.L001BD810:
/* 0BD910 001BD810 C0381000 */  sll         $7, $16, 3
/* 0BD914 001BD814 2700033C */  lui         $3, %hi(ext_func_info__2)
/* 0BD918 001BD818 10B36324 */  addiu       $3, $3, %lo(ext_func_info__2)
/* 0BD91C 001BD81C 21186700 */  addu        $3, $3, $7
/* 0BD920 001BD820 0000688C */  lw          $8, 0x0($3)
/* 0BD924 001BD824 30000011 */  beqz        $8, .L001BD8E8
/* 0BD928 001BD828 00000000 */   nop
/* 0BD92C 001BD82C 28360070 */  paddub      $6, $0, $0
/* 0BD930 001BD830 13000010 */  b           .L001BD880
/* 0BD934 001BD834 00000000 */   nop
.L001BD838:
/* 0BD938 001BD838 2700033C */  lui         $3, %hi(ext_func_info__2 + 0x4)
/* 0BD93C 001BD83C 14B36324 */  addiu       $3, $3, %lo(ext_func_info__2 + 0x4)
/* 0BD940 001BD840 21186700 */  addu        $3, $3, $7
/* 0BD944 001BD844 0000658C */  lw          $5, 0x0($3)
/* 0BD948 001BD848 C0200600 */  sll         $4, $6, 3
/* 0BD94C 001BD84C 2700033C */  lui         $3, %hi(ext_func_info__2 + 0x4)
/* 0BD950 001BD850 14B36324 */  addiu       $3, $3, %lo(ext_func_info__2 + 0x4)
/* 0BD954 001BD854 21186400 */  addu        $3, $3, $4
/* 0BD958 001BD858 0000638C */  lw          $3, 0x0($3)
/* 0BD95C 001BD85C 0700A314 */  bne         $5, $3, .L001BD87C
/* 0BD960 001BD860 00000000 */   nop
/* 0BD964 001BD864 2A00023C */  lui         $2, %hi(LIT_974)
/* 0BD968 001BD868 60BD4424 */  addiu       $4, $2, %lo(LIT_974)
/* 0BD96C 001BD86C A611040C */  jal         printf
/* 0BD970 001BD870 00000000 */   nop
.L001BD874:
/* 0BD974 001BD874 FFFF0010 */  b           .L001BD874
/* 0BD978 001BD878 00000000 */   nop
.L001BD87C:
/* 0BD97C 001BD87C 0100C624 */  addiu       $6, $6, 0x1
.L001BD880:
/* 0BD980 001BD880 2A18D000 */  slt         $3, $6, $16
/* 0BD984 001BD884 ECFF6014 */  bnez        $3, .L001BD838
/* 0BD988 001BD888 00000000 */   nop
/* 0BD98C 001BD88C 2700033C */  lui         $3, %hi(ext_func_info__2 + 0x4)
/* 0BD990 001BD890 14B36324 */  addiu       $3, $3, %lo(ext_func_info__2 + 0x4)
/* 0BD994 001BD894 21186700 */  addu        $3, $3, $7
/* 0BD998 001BD898 0000648C */  lw          $4, 0x0($3)
/* 0BD99C 001BD89C 04008004 */  bltz        $4, .L001BD8B0
/* 0BD9A0 001BD8A0 00000000 */   nop
/* 0BD9A4 001BD8A4 DC058328 */  slti        $3, $4, 0x5DC
/* 0BD9A8 001BD8A8 07006014 */  bnez        $3, .L001BD8C8
/* 0BD9AC 001BD8AC 00000000 */   nop
.L001BD8B0:
/* 0BD9B0 001BD8B0 2A00023C */  lui         $2, %hi(LIT_975)
/* 0BD9B4 001BD8B4 80BD4424 */  addiu       $4, $2, %lo(LIT_975)
/* 0BD9B8 001BD8B8 A611040C */  jal         printf
/* 0BD9BC 001BD8BC 00000000 */   nop
/* 0BD9C0 001BD8C0 06000010 */  b           .L001BD8DC
/* 0BD9C4 001BD8C4 00000000 */   nop
.L001BD8C8:
/* 0BD9C8 001BD8C8 80200400 */  sll         $4, $4, 2
/* 0BD9CC 001BD8CC D501033C */  lui         $3, %hi(ext_func__2)
/* 0BD9D0 001BD8D0 30A66324 */  addiu       $3, $3, %lo(ext_func__2)
/* 0BD9D4 001BD8D4 21186400 */  addu        $3, $3, $4
/* 0BD9D8 001BD8D8 000068AC */  sw          $8, 0x0($3)
.L001BD8DC:
/* 0BD9DC 001BD8DC 01001026 */  addiu       $16, $16, 0x1
/* 0BD9E0 001BD8E0 CBFF0010 */  b           .L001BD810
/* 0BD9E4 001BD8E4 00000000 */   nop
.L001BD8E8:
/* 0BD9E8 001BD8E8 1000BF7B */  lq          $31, 0x10($29)
/* 0BD9EC 001BD8EC 0000B07B */  lq          $16, 0x0($29)
/* 0BD9F0 001BD8F0 2000BD27 */  addiu       $29, $29, 0x20
/* 0BD9F4 001BD8F4 0800E003 */  jr          $31
/* 0BD9F8 001BD8F8 00000000 */   nop
/* 0BD9FC 001BD8FC 00000000 */  nop
