.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AddSystemEventScript__Fv
/* BD900 001BD800 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* BD904 001BD804 1000BF7F */  sq         $31, 0x10($sp)
/* BD908 001BD808 0000B07F */  sq         $16, 0x0($sp)
/* BD90C 001BD80C 28860070 */  paddub     $16, $0, $0
.L001BD810:
/* BD910 001BD810 C0381000 */  sll        $7, $16, 3
/* BD914 001BD814 2700033C */  lui        $3, %hi(ext_func_info_2)
/* BD918 001BD818 10B36324 */  addiu      $3, $3, %lo(ext_func_info_2)
/* BD91C 001BD81C 21186700 */  addu       $3, $3, $7
/* BD920 001BD820 0000688C */  lw         $8, 0x0($3)
/* BD924 001BD824 30000011 */  beqz       $8, .L001BD8E8
/* BD928 001BD828 00000000 */   nop
/* BD92C 001BD82C 28360070 */  paddub     $6, $0, $0
/* BD930 001BD830 13000010 */  b          .L001BD880
/* BD934 001BD834 00000000 */   nop
.L001BD838:
/* BD938 001BD838 2700033C */  lui        $3, %hi(ext_func_info_2 + 0x4)
/* BD93C 001BD83C 14B36324 */  addiu      $3, $3, %lo(ext_func_info_2 + 0x4)
/* BD940 001BD840 21186700 */  addu       $3, $3, $7
/* BD944 001BD844 0000658C */  lw         $5, 0x0($3)
/* BD948 001BD848 C0200600 */  sll        $4, $6, 3
/* BD94C 001BD84C 2700033C */  lui        $3, %hi(ext_func_info_2 + 0x4)
/* BD950 001BD850 14B36324 */  addiu      $3, $3, %lo(ext_func_info_2 + 0x4)
/* BD954 001BD854 21186400 */  addu       $3, $3, $4
/* BD958 001BD858 0000638C */  lw         $3, 0x0($3)
/* BD95C 001BD85C 0700A314 */  bne        $5, $3, .L001BD87C
/* BD960 001BD860 00000000 */   nop
/* BD964 001BD864 2A00023C */  lui        $2, %hi(_974)
/* BD968 001BD868 60BD4424 */  addiu      $4, $2, %lo(_974)
/* BD96C 001BD86C A611040C */  jal        printf
/* BD970 001BD870 00000000 */   nop
.L001BD874:
/* BD974 001BD874 FFFF0010 */  b          .L001BD874
/* BD978 001BD878 00000000 */   nop
.L001BD87C:
/* BD97C 001BD87C 0100C624 */  addiu      $6, $6, 0x1
.L001BD880:
/* BD980 001BD880 2A18D000 */  slt        $3, $6, $16
/* BD984 001BD884 ECFF6014 */  bnez       $3, .L001BD838
/* BD988 001BD888 00000000 */   nop
/* BD98C 001BD88C 2700033C */  lui        $3, %hi(ext_func_info_2 + 0x4)
/* BD990 001BD890 14B36324 */  addiu      $3, $3, %lo(ext_func_info_2 + 0x4)
/* BD994 001BD894 21186700 */  addu       $3, $3, $7
/* BD998 001BD898 0000648C */  lw         $4, 0x0($3)
/* BD99C 001BD89C 04008004 */  bltz       $4, .L001BD8B0
/* BD9A0 001BD8A0 00000000 */   nop
/* BD9A4 001BD8A4 DC058328 */  slti       $3, $4, 0x5DC
/* BD9A8 001BD8A8 07006014 */  bnez       $3, .L001BD8C8
/* BD9AC 001BD8AC 00000000 */   nop
.L001BD8B0:
/* BD9B0 001BD8B0 2A00023C */  lui        $2, %hi(_975)
/* BD9B4 001BD8B4 80BD4424 */  addiu      $4, $2, %lo(_975)
/* BD9B8 001BD8B8 A611040C */  jal        printf
/* BD9BC 001BD8BC 00000000 */   nop
/* BD9C0 001BD8C0 06000010 */  b          .L001BD8DC
/* BD9C4 001BD8C4 00000000 */   nop
.L001BD8C8:
/* BD9C8 001BD8C8 80200400 */  sll        $4, $4, 2
/* BD9CC 001BD8CC D501033C */  lui        $3, %hi(ext_func_2)
/* BD9D0 001BD8D0 30A66324 */  addiu      $3, $3, %lo(ext_func_2)
/* BD9D4 001BD8D4 21186400 */  addu       $3, $3, $4
/* BD9D8 001BD8D8 000068AC */  sw         $8, 0x0($3)
.L001BD8DC:
/* BD9DC 001BD8DC 01001026 */  addiu      $16, $16, 0x1
/* BD9E0 001BD8E0 CBFF0010 */  b          .L001BD810
/* BD9E4 001BD8E4 00000000 */   nop
.L001BD8E8:
/* BD9E8 001BD8E8 1000BF7B */  lq         $31, 0x10($sp)
/* BD9EC 001BD8EC 0000B07B */  lq         $16, 0x0($sp)
/* BD9F0 001BD8F0 2000BD27 */  addiu      $sp, $sp, 0x20
/* BD9F4 001BD8F4 0800E003 */  jr         $31
/* BD9F8 001BD8F8 00000000 */   nop
/* BD9FC 001BD8FC 00000000 */  nop
