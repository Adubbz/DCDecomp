.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SeitonAttachBoardSub__FP11ATTACH_LIST_2
/* 131D70 00231C70 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 131D74 00231C74 6000BF7F */  sq         $31, 0x60($sp)
/* 131D78 00231C78 5000B57F */  sq         $21, 0x50($sp)
/* 131D7C 00231C7C 4000B47F */  sq         $20, 0x40($sp)
/* 131D80 00231C80 3000B37F */  sq         $19, 0x30($sp)
/* 131D84 00231C84 2000B27F */  sq         $18, 0x20($sp)
/* 131D88 00231C88 1000B17F */  sq         $17, 0x10($sp)
/* 131D8C 00231C8C 0000B07F */  sq         $16, 0x0($sp)
/* 131D90 00231C90 288E8070 */  paddub     $17, $4, $0
/* 131D94 00231C94 C489848F */  lw         $4, -0x763C($gp)
/* 131D98 00231C98 28860070 */  paddub     $16, $0, $0
/* 131D9C 00231C9C 0C000010 */  b          .L00231CD0
/* 131DA0 00231CA0 00000000 */   nop
.L00231CA4:
/* 131DA4 00231CA4 80180400 */  sll        $3, $4, 2
/* 131DA8 00231CA8 2900023C */  lui        $2, %hi(asort_table_2)
/* 131DAC 00231CAC 20564224 */  addiu      $2, $2, %lo(asort_table_2)
/* 131DB0 00231CB0 21104300 */  addu       $2, $2, $3
/* 131DB4 00231CB4 000050AC */  sw         $16, 0x0($2)
/* 131DB8 00231CB8 01008424 */  addiu      $4, $4, 0x1
/* 131DBC 00231CBC 05008228 */  slti       $2, $4, 0x5
/* 131DC0 00231CC0 02004014 */  bnez       $2, .L00231CCC
/* 131DC4 00231CC4 00000000 */   nop
/* 131DC8 00231CC8 28260070 */  paddub     $4, $0, $0
.L00231CCC:
/* 131DCC 00231CCC 01001026 */  addiu      $16, $16, 0x1
.L00231CD0:
/* 131DD0 00231CD0 0500022A */  slti       $2, $16, 0x5
/* 131DD4 00231CD4 F3FF4014 */  bnez       $2, .L00231CA4
/* 131DD8 00231CD8 00000000 */   nop
/* 131DDC 00231CDC 05000224 */  addiu      $2, $0, 0x5
/* 131DE0 00231CE0 2900013C */  lui        $at, (0x295620 >> 16)
/* 131DE4 00231CE4 205622AC */  sw         $2, (0x295620 & 0xFFFF)($at)
/* 131DE8 00231CE8 289E0070 */  paddub     $19, $0, $0
/* 131DEC 00231CEC 28860070 */  paddub     $16, $0, $0
/* 131DF0 00231CF0 18000010 */  b          .L00231D54
/* 131DF4 00231CF4 00000000 */   nop
.L00231CF8:
/* 131DF8 00231CF8 01001226 */  addiu      $18, $16, 0x1
/* 131DFC 00231CFC 11000010 */  b          .L00231D44
/* 131E00 00231D00 00000000 */   nop
.L00231D04:
/* 131E04 00231D04 40111000 */  sll        $2, $16, 5
/* 131E08 00231D08 21A82202 */  addu       $21, $17, $2
/* 131E0C 00231D0C 40111200 */  sll        $2, $18, 5
/* 131E10 00231D10 21A02202 */  addu       $20, $17, $2
/* 131E14 00231D14 2826A072 */  paddub     $4, $21, $0
/* 131E18 00231D18 282E8072 */  paddub     $5, $20, $0
/* 131E1C 00231D1C DCC6080C */  jal        CompAttach__FP11ATTACH_LISTP11ATTACH_LIST
/* 131E20 00231D20 00000000 */   nop
/* 131E24 00231D24 06004018 */  blez       $2, .L00231D40
/* 131E28 00231D28 00000000 */   nop
/* 131E2C 00231D2C 2826A072 */  paddub     $4, $21, $0
/* 131E30 00231D30 282E8072 */  paddub     $5, $20, $0
/* 131E34 00231D34 74B9080C */  jal        MenuDataSwap__FP11ATTACH_LISTP11ATTACH_LIST
/* 131E38 00231D38 00000000 */   nop
/* 131E3C 00231D3C 01001324 */  addiu      $19, $0, 0x1
.L00231D40:
/* 131E40 00231D40 01005226 */  addiu      $18, $18, 0x1
.L00231D44:
/* 131E44 00231D44 2800422A */  slti       $2, $18, 0x28
/* 131E48 00231D48 EEFF4014 */  bnez       $2, .L00231D04
/* 131E4C 00231D4C 00000000 */   nop
/* 131E50 00231D50 01001026 */  addiu      $16, $16, 0x1
.L00231D54:
/* 131E54 00231D54 2700022A */  slti       $2, $16, 0x27
/* 131E58 00231D58 E7FF4014 */  bnez       $2, .L00231CF8
/* 131E5C 00231D5C 00000000 */   nop
/* 131E60 00231D60 28166072 */  paddub     $2, $19, $0
/* 131E64 00231D64 6000BF7B */  lq         $31, 0x60($sp)
/* 131E68 00231D68 5000B57B */  lq         $21, 0x50($sp)
/* 131E6C 00231D6C 4000B47B */  lq         $20, 0x40($sp)
/* 131E70 00231D70 3000B37B */  lq         $19, 0x30($sp)
/* 131E74 00231D74 2000B27B */  lq         $18, 0x20($sp)
/* 131E78 00231D78 1000B17B */  lq         $17, 0x10($sp)
/* 131E7C 00231D7C 0000B07B */  lq         $16, 0x0($sp)
/* 131E80 00231D80 7000BD27 */  addiu      $sp, $sp, 0x70
/* 131E84 00231D84 0800E003 */  jr         $31
/* 131E88 00231D88 00000000 */   nop
/* 131E8C 00231D8C 00000000 */  nop