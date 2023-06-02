.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawEffect__9CMapPartsFP7CCamerafP12CEffectGroup
/* 9B650 0019B550 70FFBD27 */  addiu      $sp, $sp, -0x90
/* 9B654 0019B554 6000BF7F */  sq         $31, 0x60($sp)
/* 9B658 0019B558 5000B47F */  sq         $20, 0x50($sp)
/* 9B65C 0019B55C 4000B37F */  sq         $19, 0x40($sp)
/* 9B660 0019B560 3000B27F */  sq         $18, 0x30($sp)
/* 9B664 0019B564 2000B17F */  sq         $17, 0x20($sp)
/* 9B668 0019B568 1000B07F */  sq         $16, 0x10($sp)
/* 9B66C 0019B56C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 9B670 0019B570 28968070 */  paddub     $18, $4, $0
/* 9B674 0019B574 288EA070 */  paddub     $17, $5, $0
/* 9B678 0019B578 06650046 */  mov.s      $f20, $f12
/* 9B67C 0019B57C 2886C070 */  paddub     $16, $6, $0
/* 9B680 0019B580 E800838C */  lw         $3, 0xE8($4)
/* 9B684 0019B584 34006004 */  bltz       $3, .L0019B658
/* 9B688 0019B588 00000000 */   nop
/* 9B68C 0019B58C C400438E */  lw         $3, 0xC4($18)
/* 9B690 0019B590 31006010 */  beqz       $3, .L0019B658
/* 9B694 0019B594 00000000 */   nop
/* 9B698 0019B598 289E0070 */  paddub     $19, $0, $0
/* 9B69C 0019B59C 2B000010 */  b          .L0019B64C
/* 9B6A0 0019B5A0 00000000 */   nop
.L0019B5A4:
/* 9B6A4 0019B5A4 80181300 */  sll        $3, $19, 2
/* 9B6A8 0019B5A8 21187200 */  addu       $3, $3, $18
/* 9B6AC 0019B5AC D801648C */  lw         $4, 0x1D8($3)
/* 9B6B0 0019B5B0 29008004 */  bltz       $4, .L0019B658
/* 9B6B4 0019B5B4 00000000 */   nop
/* 9B6B8 0019B5B8 23008010 */  beqz       $4, .L0019B648
/* 9B6BC 0019B5BC 00000000 */   nop
/* 9B6C0 0019B5C0 3802748C */  lw         $20, 0x238($3)
/* 9B6C4 0019B5C4 20008012 */  beqz       $20, .L0019B648
/* 9B6C8 0019B5C8 00000000 */   nop
/* 9B6CC 0019B5CC 28268072 */  paddub     $4, $20, $0
/* 9B6D0 0019B5D0 06A30046 */  mov.s      $f12, $f20
/* 9B6D4 0019B5D4 EC9A050C */  jal        CheckEditEffect__FP16EDIT_EFFECT_INFOf
/* 9B6D8 0019B5D8 00000000 */   nop
/* 9B6DC 0019B5DC 1A004010 */  beqz       $2, .L0019B648
/* 9B6E0 0019B5E0 00000000 */   nop
/* 9B6E4 0019B5E4 7000A427 */  addiu      $4, $sp, 0x70
/* 9B6E8 0019B5E8 10004526 */  addiu      $5, $18, 0x10
/* 9B6EC 0019B5EC 0C86040C */  jal        sceVu0CopyVector
/* 9B6F0 0019B5F0 00000000 */   nop
/* 9B6F4 0019B5F4 60004526 */  addiu      $5, $18, 0x60
/* 9B6F8 0019B5F8 8000A427 */  addiu      $4, $sp, 0x80
/* 9B6FC 0019B5FC 0C86040C */  jal        sceVu0CopyVector
/* 9B700 0019B600 00000000 */   nop
/* 9B704 0019B604 B000448E */  lw         $4, 0xB0($18)
/* 9B708 0019B608 0A008010 */  beqz       $4, .L0019B634
/* 9B70C 0019B60C 00000000 */   nop
/* 9B710 0019B610 7000A527 */  addiu      $5, $sp, 0x70
/* 9B714 0019B614 B89F040C */  jal        SetPosition__6CFrameFPf
/* 9B718 0019B618 00000000 */   nop
/* 9B71C 0019B61C B000448E */  lw         $4, 0xB0($18)
/* 9B720 0019B620 8000ACC7 */  lwc1       $f12, 0x80($sp)
/* 9B724 0019B624 8400ADC7 */  lwc1       $f13, 0x84($sp)
/* 9B728 0019B628 8800AEC7 */  lwc1       $f14, 0x88($sp)
/* 9B72C 0019B62C 70A3040C */  jal        SetRotation__6CFrameFfff
/* 9B730 0019B630 00000000 */   nop
.L0019B634:
/* 9B734 0019B634 28268072 */  paddub     $4, $20, $0
/* 9B738 0019B638 282E2072 */  paddub     $5, $17, $0
/* 9B73C 0019B63C 28360072 */  paddub     $6, $16, $0
/* 9B740 0019B640 849B050C */  jal        DrawEditEffect__FP16EDIT_EFFECT_INFOP7CCameraP12CEffectGroup
/* 9B744 0019B644 00000000 */   nop
.L0019B648:
/* 9B748 0019B648 01007326 */  addiu      $19, $19, 0x1
.L0019B64C:
/* 9B74C 0019B64C 1800632A */  slti       $3, $19, 0x18
/* 9B750 0019B650 D4FF6014 */  bnez       $3, .L0019B5A4
/* 9B754 0019B654 00000000 */   nop
.L0019B658:
/* 9B758 0019B658 6000BF7B */  lq         $31, 0x60($sp)
/* 9B75C 0019B65C 5000B47B */  lq         $20, 0x50($sp)
/* 9B760 0019B660 4000B37B */  lq         $19, 0x40($sp)
/* 9B764 0019B664 3000B27B */  lq         $18, 0x30($sp)
/* 9B768 0019B668 2000B17B */  lq         $17, 0x20($sp)
/* 9B76C 0019B66C 1000B07B */  lq         $16, 0x10($sp)
/* 9B770 0019B670 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 9B774 0019B674 9000BD27 */  addiu      $sp, $sp, 0x90
/* 9B778 0019B678 0800E003 */  jr         $31
/* 9B77C 0019B67C 00000000 */   nop
