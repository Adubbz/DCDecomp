.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetHandModel__14CMainItemModelFi
/* D4920 001D4820 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* D4924 001D4824 5000BF7F */  sq         $31, 0x50($sp)
/* D4928 001D4828 4000B47F */  sq         $20, 0x40($sp)
/* D492C 001D482C 3000B37F */  sq         $19, 0x30($sp)
/* D4930 001D4830 2000B27F */  sq         $18, 0x20($sp)
/* D4934 001D4834 1000B17F */  sq         $17, 0x10($sp)
/* D4938 001D4838 0000B07F */  sq         $16, 0x0($sp)
/* D493C 001D483C 289E8070 */  paddub     $19, $4, $0
/* D4940 001D4840 2896A070 */  paddub     $18, $5, $0
/* D4944 001D4844 6451070C */  jal        GetFreeModelNo__14CMainItemModelFv
/* D4948 001D4848 00000000 */   nop
/* D494C 001D484C 28864070 */  paddub     $16, $2, $0
/* D4950 001D4850 FFFF0224 */  addiu      $2, $0, -0x1
/* D4954 001D4854 03000216 */  bne        $16, $2, .L001D4864
/* D4958 001D4858 00000000 */   nop
/* D495C 001D485C 2F000010 */  b          .L001D491C
/* D4960 001D4860 00000000 */   nop
.L001D4864:
/* D4964 001D4864 01000324 */  addiu      $3, $0, 0x1
/* D4968 001D4868 80881000 */  sll        $17, $16, 2
/* D496C 001D486C 21103302 */  addu       $2, $17, $19
/* D4970 001D4870 480043AC */  sw         $3, 0x48($2)
/* D4974 001D4874 00688044 */  mtc1       $0, $f13
/* D4978 001D4878 00000000 */  nop
/* D497C 001D487C 866B0046 */  mov.s      $f14, $f13
/* D4980 001D4880 C0101000 */  sll        $2, $16, 3
/* D4984 001D4884 21105000 */  addu       $2, $2, $16
/* D4988 001D4888 40100200 */  sll        $2, $2, 1
/* D498C 001D488C 21105000 */  addu       $2, $2, $16
/* D4990 001D4890 40110200 */  sll        $2, $2, 5
/* D4994 001D4894 21106202 */  addu       $2, $19, $2
/* D4998 001D4898 D0005424 */  addiu      $20, $2, 0xD0
/* D499C 001D489C 066B0046 */  mov.s      $f12, $f13
/* D49A0 001D48A0 28268072 */  paddub     $4, $20, $0
/* D49A4 001D48A4 A09F040C */  jal        SetPosition__6CFrameFfff
/* D49A8 001D48A8 00000000 */   nop
/* D49AC 001D48AC 00708044 */  mtc1       $0, $f14
/* D49B0 001D48B0 00000000 */  nop
/* D49B4 001D48B4 46730046 */  mov.s      $f13, $f14
/* D49B8 001D48B8 28268072 */  paddub     $4, $20, $0
/* D49BC 001D48BC C8808CC7 */  lwc1       $f12, -0x7F38($gp)
/* D49C0 001D48C0 70A3040C */  jal        SetRotation__6CFrameFfff
/* D49C4 001D48C4 00000000 */   nop
/* D49C8 001D48C8 80101200 */  sll        $2, $18, 2
/* D49CC 001D48CC 21205300 */  addu       $4, $2, $19
/* D49D0 001D48D0 8800838C */  lw         $3, 0x88($4)
/* D49D4 001D48D4 21103302 */  addu       $2, $17, $19
/* D49D8 001D48D8 880043AC */  sw         $3, 0x88($2)
/* D49DC 001D48DC 8800828C */  lw         $2, 0x88($4)
/* D49E0 001D48E0 80100200 */  sll        $2, $2, 2
/* D49E4 001D48E4 21185300 */  addu       $3, $2, $19
/* D49E8 001D48E8 3000628C */  lw         $2, 0x30($3)
/* D49EC 001D48EC 01004224 */  addiu      $2, $2, 0x1
/* D49F0 001D48F0 300062AC */  sw         $2, 0x30($3)
/* D49F4 001D48F4 8800828C */  lw         $2, 0x88($4)
/* D49F8 001D48F8 80100200 */  sll        $2, $2, 2
/* D49FC 001D48FC 21185300 */  addu       $3, $2, $19
/* D4A00 001D4900 2A00023C */  lui        $2, %hi(_892_4)
/* D4A04 001D4904 A0CE4424 */  addiu      $4, $2, %lo(_892_4)
/* D4A08 001D4908 282E0072 */  paddub     $5, $16, $0
/* D4A0C 001D490C 3000668C */  lw         $6, 0x30($3)
/* D4A10 001D4910 A611040C */  jal        printf
/* D4A14 001D4914 00000000 */   nop
/* D4A18 001D4918 28160072 */  paddub     $2, $16, $0
.L001D491C:
/* D4A1C 001D491C 5000BF7B */  lq         $31, 0x50($sp)
/* D4A20 001D4920 4000B47B */  lq         $20, 0x40($sp)
/* D4A24 001D4924 3000B37B */  lq         $19, 0x30($sp)
/* D4A28 001D4928 2000B27B */  lq         $18, 0x20($sp)
/* D4A2C 001D492C 1000B17B */  lq         $17, 0x10($sp)
/* D4A30 001D4930 0000B07B */  lq         $16, 0x0($sp)
/* D4A34 001D4934 6000BD27 */  addiu      $sp, $sp, 0x60
/* D4A38 001D4938 0800E003 */  jr         $31
/* D4A3C 001D493C 00000000 */   nop