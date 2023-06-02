.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel TalkMode__Fv
/* 7E870 0017E770 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 7E874 0017E774 2000BF7F */  sq         $31, 0x20($sp)
/* 7E878 0017E778 1000B17F */  sq         $17, 0x10($sp)
/* 7E87C 0017E77C 0000B07F */  sq         $16, 0x0($sp)
/* 7E880 0017E780 3C91838F */  lw         $3, -0x6EC4($gp)
/* 7E884 0017E784 04006004 */  bltz       $3, .L0017E798
/* 7E888 0017E788 00000000 */   nop
/* 7E88C 0017E78C 0A006328 */  slti       $3, $3, 0xA
/* 7E890 0017E790 05006014 */  bnez       $3, .L0017E7A8
/* 7E894 0017E794 00000000 */   nop
.L0017E798:
/* 7E898 0017E798 01000324 */  addiu      $3, $0, 0x1
/* 7E89C 0017E79C 608783AF */  sw         $3, -0x78A0($gp)
/* 7E8A0 0017E7A0 6D000010 */  b          .L0017E958
/* 7E8A4 0017E7A4 00000000 */   nop
.L0017E7A8:
/* 7E8A8 0017E7A8 6487838F */  lw         $3, -0x789C($gp)
/* 7E8AC 0017E7AC 680C60AC */  sw         $0, 0xC68($3)
/* 7E8B0 0017E7B0 640C60AC */  sw         $0, 0xC64($3)
/* 7E8B4 0017E7B4 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 7E8B8 0017E7B8 600C62AC */  sw         $2, 0xC60($3)
/* 7E8BC 0017E7BC 3000A0AF */  sw         $0, 0x30($sp)
/* 7E8C0 0017E7C0 3400A0AF */  sw         $0, 0x34($sp)
/* 7E8C4 0017E7C4 3800A0AF */  sw         $0, 0x38($sp)
/* 7E8C8 0017E7C8 6487848F */  lw         $4, -0x789C($gp)
/* 7E8CC 0017E7CC 3000A527 */  addiu      $5, $sp, 0x30
/* 7E8D0 0017E7D0 A000998C */  lw         $25, 0xA0($4)
/* 7E8D4 0017E7D4 1C00398F */  lw         $25, 0x1C($25)
/* 7E8D8 0017E7D8 09F82003 */  jalr       $25
/* 7E8DC 0017E7DC 00000000 */   nop
/* 7E8E0 0017E7E0 6487848F */  lw         $4, -0x789C($gp)
/* 7E8E4 0017E7E4 A000998C */  lw         $25, 0xA0($4)
/* 7E8E8 0017E7E8 0800398F */  lw         $25, 0x8($25)
/* 7E8EC 0017E7EC 09F82003 */  jalr       $25
/* 7E8F0 0017E7F0 00000000 */   nop
/* 7E8F4 0017E7F4 6487848F */  lw         $4, -0x789C($gp)
/* 7E8F8 0017E7F8 A000998C */  lw         $25, 0xA0($4)
/* 7E8FC 0017E7FC 9000398F */  lw         $25, 0x90($25)
/* 7E900 0017E800 09F82003 */  jalr       $25
/* 7E904 0017E804 00000000 */   nop
/* 7E908 0017E808 6487848F */  lw         $4, -0x789C($gp)
/* 7E90C 0017E80C 282E0070 */  paddub     $5, $0, $0
/* 7E910 0017E810 A000998C */  lw         $25, 0xA0($4)
/* 7E914 0017E814 9400398F */  lw         $25, 0x94($25)
/* 7E918 0017E818 09F82003 */  jalr       $25
/* 7E91C 0017E81C 00000000 */   nop
/* 7E920 0017E820 28860070 */  paddub     $16, $0, $0
/* 7E924 0017E824 10000010 */  b          .L0017E868
/* 7E928 0017E828 00000000 */   nop
.L0017E82C:
/* 7E92C 0017E82C 80000424 */  addiu      $4, $0, 0x80
/* 7E930 0017E830 40111000 */  sll        $2, $16, 5
/* 7E934 0017E834 21185000 */  addu       $3, $2, $16
/* 7E938 0017E838 80100300 */  sll        $2, $3, 2
/* 7E93C 0017E83C 21106200 */  addu       $2, $3, $2
/* 7E940 0017E840 40190200 */  sll        $3, $2, 5
/* 7E944 0017E844 D201023C */  lui        $2, %hi(D_1D27018)
/* 7E948 0017E848 18704224 */  addiu      $2, $2, %lo(D_1D27018)
/* 7E94C 0017E84C 21104300 */  addu       $2, $2, $3
/* 7E950 0017E850 000044AC */  sw         $4, 0x0($2)
/* 7E954 0017E854 D201023C */  lui        $2, %hi(D_1D27004)
/* 7E958 0017E858 04704224 */  addiu      $2, $2, %lo(D_1D27004)
/* 7E95C 0017E85C 21104300 */  addu       $2, $2, $3
/* 7E960 0017E860 000040AC */  sw         $0, 0x0($2)
/* 7E964 0017E864 01001026 */  addiu      $16, $16, 0x1
.L0017E868:
/* 7E968 0017E868 0A00022A */  slti       $2, $16, 0xA
/* 7E96C 0017E86C EFFF4014 */  bnez       $2, .L0017E82C
/* 7E970 0017E870 00000000 */   nop
/* 7E974 0017E874 6487848F */  lw         $4, -0x789C($gp)
/* 7E978 0017E878 D301023C */  lui        $2, %hi(TalkCamera)
/* 7E97C 0017E87C 404E4524 */  addiu      $5, $2, %lo(TalkCamera)
/* 7E980 0017E880 28360070 */  paddub     $6, $0, $0
/* 7E984 0017E884 4C00A727 */  addiu      $7, $sp, 0x4C
/* 7E988 0017E888 2464060C */  jal        EdTalkMode__FP10CCharacterP13CCameraFollowiPi
/* 7E98C 0017E88C 00000000 */   nop
/* 7E990 0017E890 1B004010 */  beqz       $2, .L0017E900
/* 7E994 0017E894 00000000 */   nop
/* 7E998 0017E898 02000324 */  addiu      $3, $0, 0x2
/* 7E99C 0017E89C 03004314 */  bne        $2, $3, .L0017E8AC
/* 7E9A0 0017E8A0 00000000 */   nop
/* 7E9A4 0017E8A4 03000324 */  addiu      $3, $0, 0x3
/* 7E9A8 0017E8A8 989083AF */  sw         $3, -0x6F68($gp)
.L0017E8AC:
/* 7E9AC 0017E8AC 03000324 */  addiu      $3, $0, 0x3
/* 7E9B0 0017E8B0 03004314 */  bne        $2, $3, .L0017E8C0
/* 7E9B4 0017E8B4 00000000 */   nop
/* 7E9B8 0017E8B8 04000324 */  addiu      $3, $0, 0x4
/* 7E9BC 0017E8BC 989083AF */  sw         $3, -0x6F68($gp)
.L0017E8C0:
/* 7E9C0 0017E8C0 04000324 */  addiu      $3, $0, 0x4
/* 7E9C4 0017E8C4 07004314 */  bne        $2, $3, .L0017E8E4
/* 7E9C8 0017E8C8 00000000 */   nop
/* 7E9CC 0017E8CC 4C00A48F */  lw         $4, 0x4C($sp)
/* 7E9D0 0017E8D0 04008018 */  blez       $4, .L0017E8E4
/* 7E9D4 0017E8D4 00000000 */   nop
/* 7E9D8 0017E8D8 0091858F */  lw         $5, -0x6F00($gp)
/* 7E9DC 0017E8DC 7CDE050C */  jal        RunEvent__FiP7CCamera
/* 7E9E0 0017E8E0 00000000 */   nop
.L0017E8E4:
/* 7E9E4 0017E8E4 01000324 */  addiu      $3, $0, 0x1
/* 7E9E8 0017E8E8 608783AF */  sw         $3, -0x78A0($gp)
/* 7E9EC 0017E8EC D301033C */  lui        $3, %hi(MainCamera)
/* 7E9F0 0017E8F0 40456324 */  addiu      $3, $3, %lo(MainCamera)
/* 7E9F4 0017E8F4 009183AF */  sw         $3, -0x6F00($gp)
/* 7E9F8 0017E8F8 17000010 */  b          .L0017E958
/* 7E9FC 0017E8FC 00000000 */   nop
.L0017E900:
/* 7EA00 0017E900 28860070 */  paddub     $16, $0, $0
/* 7EA04 0017E904 11000010 */  b          .L0017E94C
/* 7EA08 0017E908 00000000 */   nop
.L0017E90C:
/* 7EA0C 0017E90C 40111000 */  sll        $2, $16, 5
/* 7EA10 0017E910 21185000 */  addu       $3, $2, $16
/* 7EA14 0017E914 80100300 */  sll        $2, $3, 2
/* 7EA18 0017E918 21106200 */  addu       $2, $3, $2
/* 7EA1C 0017E91C 40190200 */  sll        $3, $2, 5
/* 7EA20 0017E920 D201023C */  lui        $2, %hi(EdVillager)
/* 7EA24 0017E924 905B4224 */  addiu      $2, $2, %lo(EdVillager)
/* 7EA28 0017E928 21884300 */  addu       $17, $2, $3
/* 7EA2C 0017E92C 28262072 */  paddub     $4, $17, $0
/* 7EA30 0017E930 EC57050C */  jal        Step__12CNPCharacterFv
/* 7EA34 0017E934 00000000 */   nop
/* 7EA38 0017E938 28262072 */  paddub     $4, $17, $0
/* 7EA3C 0017E93C 282E0070 */  paddub     $5, $0, $0
/* 7EA40 0017E940 94E3040C */  jal        ClothStep__10CCharacterFi
/* 7EA44 0017E944 00000000 */   nop
/* 7EA48 0017E948 01001026 */  addiu      $16, $16, 0x1
.L0017E94C:
/* 7EA4C 0017E94C 0A00032A */  slti       $3, $16, 0xA
/* 7EA50 0017E950 EEFF6014 */  bnez       $3, .L0017E90C
/* 7EA54 0017E954 00000000 */   nop
.L0017E958:
/* 7EA58 0017E958 2000BF7B */  lq         $31, 0x20($sp)
/* 7EA5C 0017E95C 1000B17B */  lq         $17, 0x10($sp)
/* 7EA60 0017E960 0000B07B */  lq         $16, 0x0($sp)
/* 7EA64 0017E964 5000BD27 */  addiu      $sp, $sp, 0x50
/* 7EA68 0017E968 0800E003 */  jr         $31
/* 7EA6C 0017E96C 00000000 */   nop
