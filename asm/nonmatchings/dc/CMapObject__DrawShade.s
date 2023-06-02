.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawShade__10CMapObjectFv
/* 57970 00157870 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 57974 00157874 1000BF7F */  sq         $31, 0x10($sp)
/* 57978 00157878 0000B07F */  sq         $16, 0x0($sp)
/* 5797C 0015787C 28868070 */  paddub     $16, $4, $0
/* 57980 00157880 C400838C */  lw         $3, 0xC4($4)
/* 57984 00157884 1A006010 */  beqz       $3, .L001578F0
/* 57988 00157888 00000000 */   nop
/* 5798C 0015788C D800038E */  lw         $3, 0xD8($16)
/* 57990 00157890 17006010 */  beqz       $3, .L001578F0
/* 57994 00157894 00000000 */   nop
/* 57998 00157898 2000A527 */  addiu      $5, $sp, 0x20
/* 5799C 0015789C A000198E */  lw         $25, 0xA0($16)
/* 579A0 001578A0 5800398F */  lw         $25, 0x58($25)
/* 579A4 001578A4 09F82003 */  jalr       $25
/* 579A8 001578A8 00000000 */   nop
/* 579AC 001578AC D800048E */  lw         $4, 0xD8($16)
/* 579B0 001578B0 2000ACC7 */  lwc1       $f12, 0x20($sp)
/* 579B4 001578B4 2400ADC7 */  lwc1       $f13, 0x24($sp)
/* 579B8 001578B8 2800AEC7 */  lwc1       $f14, 0x28($sp)
/* 579BC 001578BC 70A3040C */  jal        SetRotation__6CFrameFfff
/* 579C0 001578C0 00000000 */   nop
/* 579C4 001578C4 2000A427 */  addiu      $4, $sp, 0x20
/* 579C8 001578C8 10000526 */  addiu      $5, $16, 0x10
/* 579CC 001578CC 0C86040C */  jal        sceVu0CopyVector
/* 579D0 001578D0 00000000 */   nop
/* 579D4 001578D4 D800048E */  lw         $4, 0xD8($16)
/* 579D8 001578D8 2000A527 */  addiu      $5, $sp, 0x20
/* 579DC 001578DC B89F040C */  jal        SetPosition__6CFrameFPf
/* 579E0 001578E0 00000000 */   nop
/* 579E4 001578E4 D800048E */  lw         $4, 0xD8($16)
/* 579E8 001578E8 D8C1040C */  jal        MGDrawShade__FP6CFrame
/* 579EC 001578EC 00000000 */   nop
.L001578F0:
/* 579F0 001578F0 1000BF7B */  lq         $31, 0x10($sp)
/* 579F4 001578F4 0000B07B */  lq         $16, 0x0($sp)
/* 579F8 001578F8 3000BD27 */  addiu      $sp, $sp, 0x30
/* 579FC 001578FC 0800E003 */  jr         $31
/* 57A00 00157900 00000000 */   nop
/* 57A04 00157904 00000000 */  nop
/* 57A08 00157908 00000000 */  nop
/* 57A0C 0015790C 00000000 */  nop
