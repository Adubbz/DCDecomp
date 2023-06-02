.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _LOAD_SCENE__FP12RS_STACKDATAi
/* 8D690 0018D590 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 8D694 0018D594 3000BF7F */  sq         $31, 0x30($sp)
/* 8D698 0018D598 2000B27F */  sq         $18, 0x20($sp)
/* 8D69C 0018D59C 1000B17F */  sq         $17, 0x10($sp)
/* 8D6A0 0018D5A0 0000B07F */  sq         $16, 0x0($sp)
/* 8D6A4 0018D5A4 288EA070 */  paddub     $17, $5, $0
/* 8D6A8 0018D5A8 08009224 */  addiu      $18, $4, 0x8
/* 8D6AC 0018D5AC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8D6B0 0018D5B0 00000000 */   nop
/* 8D6B4 0018D5B4 28264070 */  paddub     $4, $2, $0
/* 8D6B8 0018D5B8 6C2C060C */  jal        GetScene__Fi
/* 8D6BC 0018D5BC 00000000 */   nop
/* 8D6C0 0018D5C0 28864070 */  paddub     $16, $2, $0
/* 8D6C4 0018D5C4 04000016 */  bnez       $16, .L0018D5D8
/* 8D6C8 0018D5C8 00000000 */   nop
/* 8D6CC 0018D5CC 28160070 */  paddub     $2, $0, $0
/* 8D6D0 0018D5D0 29000010 */  b          .L0018D678
/* 8D6D4 0018D5D4 00000000 */   nop
.L0018D5D8:
/* 8D6D8 0018D5D8 28264072 */  paddub     $4, $18, $0
/* 8D6DC 0018D5DC 08009224 */  addiu      $18, $4, 0x8
/* 8D6E0 0018D5E0 F428060C */  jal        GetStackString__FP12RS_STACKDATA
/* 8D6E4 0018D5E4 00000000 */   nop
/* 8D6E8 0018D5E8 28364070 */  paddub     $6, $2, $0
/* 8D6EC 0018D5EC 0400C014 */  bnez       $6, .L0018D600
/* 8D6F0 0018D5F0 00000000 */   nop
/* 8D6F4 0018D5F4 28160070 */  paddub     $2, $0, $0
/* 8D6F8 0018D5F8 1F000010 */  b          .L0018D678
/* 8D6FC 0018D5FC 00000000 */   nop
.L0018D600:
/* 8D700 0018D600 A830060C */  jal        get_pack_file__Fv
/* 8D704 0018D604 00000000 */   nop
/* 8D708 0018D608 282E4070 */  paddub     $5, $2, $0
/* 8D70C 0018D60C 0400A014 */  bnez       $5, .L0018D620
/* 8D710 0018D610 00000000 */   nop
/* 8D714 0018D614 28160070 */  paddub     $2, $0, $0
/* 8D718 0018D618 17000010 */  b          .L0018D678
/* 8D71C 0018D61C 00000000 */   nop
.L0018D620:
/* 8D720 0018D620 B030060C */  jal        get_buffer__Fv
/* 8D724 0018D624 00000000 */   nop
/* 8D728 0018D628 283E4070 */  paddub     $7, $2, $0
/* 8D72C 0018D62C B030060C */  jal        get_buffer__Fv
/* 8D730 0018D630 00000000 */   nop
/* 8D734 0018D634 28260072 */  paddub     $4, $16, $0
/* 8D738 0018D638 28464070 */  paddub     $8, $2, $0
/* 8D73C 0018D63C A000198E */  lw         $25, 0xA0($16)
/* 8D740 0018D640 B400398F */  lw         $25, 0xB4($25)
/* 8D744 0018D644 09F82003 */  jalr       $25
/* 8D748 0018D648 00000000 */   nop
/* 8D74C 0018D64C D501023C */  lui        $2, %hi(DmmyCamera)
/* 8D750 0018D650 70A14224 */  addiu      $2, $2, %lo(DmmyCamera)
/* 8D754 0018D654 100302AE */  sw         $2, 0x310($16)
/* 8D758 0018D658 0300222A */  slti       $2, $17, 0x3
/* 8D75C 0018D65C 05004014 */  bnez       $2, .L0018D674
/* 8D760 0018D660 00000000 */   nop
/* 8D764 0018D664 28264072 */  paddub     $4, $18, $0
/* 8D768 0018D668 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8D76C 0018D66C 00000000 */   nop
/* 8D770 0018D670 600C00E6 */  swc1       $f0, 0xC60($16)
.L0018D674:
/* 8D774 0018D674 01000224 */  addiu      $2, $0, 0x1
.L0018D678:
/* 8D778 0018D678 3000BF7B */  lq         $31, 0x30($sp)
/* 8D77C 0018D67C 2000B27B */  lq         $18, 0x20($sp)
/* 8D780 0018D680 1000B17B */  lq         $17, 0x10($sp)
/* 8D784 0018D684 0000B07B */  lq         $16, 0x0($sp)
/* 8D788 0018D688 4000BD27 */  addiu      $sp, $sp, 0x40
/* 8D78C 0018D68C 0800E003 */  jr         $31
/* 8D790 0018D690 00000000 */   nop
/* 8D794 0018D694 00000000 */  nop
/* 8D798 0018D698 00000000 */  nop
/* 8D79C 0018D69C 00000000 */  nop
