.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel pad_button_read__FP10PAD_STATUSii
/* 2A930 0012A830 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 2A934 0012A834 2000BF7F */  sq         $31, 0x20($sp)
/* 2A938 0012A838 1000B17F */  sq         $17, 0x10($sp)
/* 2A93C 0012A83C 0000B07F */  sq         $16, 0x0($sp)
/* 2A940 0012A840 28868070 */  paddub     $16, $4, $0
/* 2A944 0012A844 B48B8283 */  lb         $2, -0x744C($gp)
/* 2A948 0012A848 04004014 */  bnez       $2, .L0012A85C
/* 2A94C 0012A84C 00000000 */   nop
/* 2A950 0012A850 B08B80A7 */  sh         $0, -0x7450($gp)
/* 2A954 0012A854 01000224 */  addiu      $2, $0, 0x1
/* 2A958 0012A858 B48B82A3 */  sb         $2, -0x744C($gp)
.L0012A85C:
/* 2A95C 0012A85C 288E0070 */  paddub     $17, $0, $0
/* 2A960 0012A860 2826A070 */  paddub     $4, $5, $0
/* 2A964 0012A864 282EC070 */  paddub     $5, $6, $0
/* 2A968 0012A868 3000A627 */  addiu      $6, $sp, 0x30
/* 2A96C 0012A86C B87E040C */  jal        scePadRead
/* 2A970 0012A870 00000000 */   nop
/* 2A974 0012A874 04004014 */  bnez       $2, .L0012A888
/* 2A978 0012A878 00000000 */   nop
/* 2A97C 0012A87C 28160070 */  paddub     $2, $0, $0
/* 2A980 0012A880 17000010 */  b          .L0012A8E0
/* 2A984 0012A884 00000000 */   nop
.L0012A888:
/* 2A988 0012A888 3000A293 */  lbu        $2, 0x30($sp)
/* 2A98C 0012A88C 13004014 */  bnez       $2, .L0012A8DC
/* 2A990 0012A890 00000000 */   nop
/* 2A994 0012A894 3200A293 */  lbu        $2, 0x32($sp)
/* 2A998 0012A898 001A0200 */  sll        $3, $2, 8
/* 2A99C 0012A89C 3300A293 */  lbu        $2, 0x33($sp)
/* 2A9A0 0012A8A0 25106200 */  or         $2, $3, $2
/* 2A9A4 0012A8A4 FFFF4338 */  xori       $3, $2, 0xFFFF
/* 2A9A8 0012A8A8 FFFF6230 */  andi       $2, $3, 0xFFFF
/* 2A9AC 0012A8AC 000002AE */  sw         $2, 0x0($16)
/* 2A9B0 0012A8B0 3400A293 */  lbu        $2, 0x34($sp)
/* 2A9B4 0012A8B4 100002AE */  sw         $2, 0x10($16)
/* 2A9B8 0012A8B8 3500A293 */  lbu        $2, 0x35($sp)
/* 2A9BC 0012A8BC 0C0002AE */  sw         $2, 0xC($16)
/* 2A9C0 0012A8C0 3600A293 */  lbu        $2, 0x36($sp)
/* 2A9C4 0012A8C4 080002AE */  sw         $2, 0x8($16)
/* 2A9C8 0012A8C8 3700A293 */  lbu        $2, 0x37($sp)
/* 2A9CC 0012A8CC 040002AE */  sw         $2, 0x4($16)
/* 2A9D0 0012A8D0 B08B83A7 */  sh         $3, -0x7450($gp)
/* 2A9D4 0012A8D4 3100A293 */  lbu        $2, 0x31($sp)
/* 2A9D8 0012A8D8 03890200 */  sra        $17, $2, 4
.L0012A8DC:
/* 2A9DC 0012A8DC 28162072 */  paddub     $2, $17, $0
.L0012A8E0:
/* 2A9E0 0012A8E0 2000BF7B */  lq         $31, 0x20($sp)
/* 2A9E4 0012A8E4 1000B17B */  lq         $17, 0x10($sp)
/* 2A9E8 0012A8E8 0000B07B */  lq         $16, 0x0($sp)
/* 2A9EC 0012A8EC 5000BD27 */  addiu      $sp, $sp, 0x50
/* 2A9F0 0012A8F0 0800E003 */  jr         $31
/* 2A9F4 0012A8F4 00000000 */   nop
/* 2A9F8 0012A8F8 00000000 */  nop
/* 2A9FC 0012A8FC 00000000 */  nop
