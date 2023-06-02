.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Save__11CEditGroundFPc
/* A4880 001A4780 E0EFBD27 */  addiu      $sp, $sp, -0x1020
/* A4884 001A4784 6000BF7F */  sq         $31, 0x60($sp)
/* A4888 001A4788 5000B57F */  sq         $21, 0x50($sp)
/* A488C 001A478C 4000B47F */  sq         $20, 0x40($sp)
/* A4890 001A4790 3000B37F */  sq         $19, 0x30($sp)
/* A4894 001A4794 2000B27F */  sq         $18, 0x20($sp)
/* A4898 001A4798 1000B17F */  sq         $17, 0x10($sp)
/* A489C 001A479C 0000B07F */  sq         $16, 0x0($sp)
/* A48A0 001A47A0 28AE8070 */  paddub     $21, $4, $0
/* A48A4 001A47A4 7000B027 */  addiu      $16, $sp, 0x70
/* A48A8 001A47A8 08001126 */  addiu      $17, $16, 0x8
/* A48AC 001A47AC 08000224 */  addiu      $2, $0, 0x8
/* A48B0 001A47B0 040002A6 */  sh         $2, 0x4($16)
/* A48B4 001A47B4 000000A6 */  sh         $0, 0x0($16)
/* A48B8 001A47B8 28960070 */  paddub     $18, $0, $0
/* A48BC 001A47BC 36000010 */  b          .L001A4898
/* A48C0 001A47C0 00000000 */   nop
.L001A47C4:
/* A48C4 001A47C4 C0101200 */  sll        $2, $18, 3
/* A48C8 001A47C8 23185200 */  subu       $3, $2, $18
/* A48CC 001A47CC 80100300 */  sll        $2, $3, 2
/* A48D0 001A47D0 23104300 */  subu       $2, $2, $3
/* A48D4 001A47D4 40110200 */  sll        $2, $2, 5
/* A48D8 001A47D8 2110A202 */  addu       $2, $21, $2
/* A48DC 001A47DC 30005324 */  addiu      $19, $2, 0x30
/* A48E0 001A47E0 1801548C */  lw         $20, 0x118($2)
/* A48E4 001A47E4 2B008006 */  bltz       $20, .L001A4894
/* A48E8 001A47E8 00000000 */   nop
/* A48EC 001A47EC 1801658E */  lw         $5, 0x118($19)
/* A48F0 001A47F0 1700A018 */  blez       $5, .L001A4850
/* A48F4 001A47F4 00000000 */   nop
/* A48F8 001A47F8 28260070 */  paddub     $4, $0, $0
/* A48FC 001A47FC 11000010 */  b          .L001A4844
/* A4900 001A4800 00000000 */   nop
.L001A4804:
/* A4904 001A4804 0100013C */  lui        $at, (0x15F30 >> 16)
/* A4908 001A4808 2108A102 */  addu       $at, $21, $at
/* A490C 001A480C 305F268C */  lw         $6, (0x15F30 & 0xFFFF)($at)
/* A4910 001A4810 C0100400 */  sll        $2, $4, 3
/* A4914 001A4814 23184400 */  subu       $3, $2, $4
/* A4918 001A4818 80100300 */  sll        $2, $3, 2
/* A491C 001A481C 23104300 */  subu       $2, $2, $3
/* A4920 001A4820 40110200 */  sll        $2, $2, 5
/* A4924 001A4824 21184600 */  addu       $3, $2, $6
/* A4928 001A4828 1801628C */  lw         $2, 0x118($3)
/* A492C 001A482C 0400A214 */  bne        $5, $2, .L001A4840
/* A4930 001A4830 00000000 */   nop
/* A4934 001A4834 E800748C */  lw         $20, 0xE8($3)
/* A4938 001A4838 05000010 */  b          .L001A4850
/* A493C 001A483C 00000000 */   nop
.L001A4840:
/* A4940 001A4840 01008424 */  addiu      $4, $4, 0x1
.L001A4844:
/* A4944 001A4844 18008228 */  slti       $2, $4, 0x18
/* A4948 001A4848 EEFF4014 */  bnez       $2, .L001A4804
/* A494C 001A484C 00000000 */   nop
.L001A4850:
/* A4950 001A4850 28266072 */  paddub     $4, $19, $0
/* A4954 001A4854 1010A527 */  addiu      $5, $sp, 0x1010
/* A4958 001A4858 EC69060C */  jal        GetPosition__9CMapPartsFPf
/* A495C 001A485C 00000000 */   nop
/* A4960 001A4860 000034A6 */  sh         $20, 0x0($17)
/* A4964 001A4864 F8006286 */  lh         $2, 0xF8($19)
/* A4968 001A4868 020022A6 */  sh         $2, 0x2($17)
/* A496C 001A486C 1010A0C7 */  lwc1       $f0, 0x1010($sp)
/* A4970 001A4870 040020E6 */  swc1       $f0, 0x4($17)
/* A4974 001A4874 1410A0C7 */  lwc1       $f0, 0x1014($sp)
/* A4978 001A4878 080020E6 */  swc1       $f0, 0x8($17)
/* A497C 001A487C 1810A0C7 */  lwc1       $f0, 0x1018($sp)
/* A4980 001A4880 0C0020E6 */  swc1       $f0, 0xC($17)
/* A4984 001A4884 10003126 */  addiu      $17, $17, 0x10
/* A4988 001A4888 00000286 */  lh         $2, 0x0($16)
/* A498C 001A488C 01004224 */  addiu      $2, $2, 0x1
/* A4990 001A4890 000002A6 */  sh         $2, 0x0($16)
.L001A4894:
/* A4994 001A4894 01005226 */  addiu      $18, $18, 0x1
.L001A4898:
/* A4998 001A4898 8000422A */  slti       $2, $18, 0x80
/* A499C 001A489C C9FF4014 */  bnez       $2, .L001A47C4
/* A49A0 001A48A0 00000000 */   nop
/* A49A4 001A48A4 FFFF0224 */  addiu      $2, $0, -0x1
/* A49A8 001A48A8 000022A6 */  sh         $2, 0x0($17)
/* A49AC 001A48AC 020022A6 */  sh         $2, 0x2($17)
/* A49B0 001A48B0 040020AE */  sw         $0, 0x4($17)
/* A49B4 001A48B4 080020AE */  sw         $0, 0x8($17)
/* A49B8 001A48B8 0C0020AE */  sw         $0, 0xC($17)
/* A49BC 001A48BC 10002226 */  addiu      $2, $17, 0x10
/* A49C0 001A48C0 7000A527 */  addiu      $5, $sp, 0x70
/* A49C4 001A48C4 23104500 */  subu       $2, $2, $5
/* A49C8 001A48C8 020002A6 */  sh         $2, 0x2($16)
/* A49CC 001A48CC 02000686 */  lh         $6, 0x2($16)
/* A49D0 001A48D0 2A00023C */  lui        $2, %hi(_1263)
/* A49D4 001A48D4 30B44424 */  addiu      $4, $2, %lo(_1263)
/* A49D8 001A48D8 88FD040C */  jal        WriteFile__FPcPvi
/* A49DC 001A48DC 00000000 */   nop
/* A49E0 001A48E0 6000BF7B */  lq         $31, 0x60($sp)
/* A49E4 001A48E4 5000B57B */  lq         $21, 0x50($sp)
/* A49E8 001A48E8 4000B47B */  lq         $20, 0x40($sp)
/* A49EC 001A48EC 3000B37B */  lq         $19, 0x30($sp)
/* A49F0 001A48F0 2000B27B */  lq         $18, 0x20($sp)
/* A49F4 001A48F4 1000B17B */  lq         $17, 0x10($sp)
/* A49F8 001A48F8 0000B07B */  lq         $16, 0x0($sp)
/* A49FC 001A48FC 2010BD27 */  addiu      $sp, $sp, 0x1020
/* A4A00 001A4900 0800E003 */  jr         $31
/* A4A04 001A4904 00000000 */   nop
/* A4A08 001A4908 00000000 */  nop
/* A4A0C 001A490C 00000000 */  nop
