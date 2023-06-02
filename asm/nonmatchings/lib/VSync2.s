.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VSync2
/* 148E0 001147E0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 148E4 001147E4 1000BFFF */  sd         $31, 0x10($sp)
/* 148E8 001147E8 2D20A003 */  daddu      $4, $sp, $0
/* 148EC 001147EC A451040C */  jal        SetVSyncFlag
/* 148F0 001147F0 0800A537 */   ori       $5, $sp, 0x8
/* 148F4 001147F4 0010033C */  lui        $3, (0x1000F000 >> 16)
/* 148F8 001147F8 0000A0AF */  sw         $0, 0x0($sp)
/* 148FC 001147FC 00F06334 */  ori        $3, $3, (0x1000F000 & 0xFFFF)
/* 14900 00114800 04000224 */  addiu      $2, $0, 0x4
/* 14904 00114804 000062AC */  sw         $2, 0x0($3)
.L00114808:
/* 14908 00114808 0110023C */  lui        $2, (0x10010000 >> 16)
/* 1490C 0011480C 00F0428C */  lw         $2, -0x1000($2)
/* 14910 00114810 04004230 */  andi       $2, $2, 0x4
/* 14914 00114814 04004014 */  bnez       $2, .L00114828
/* 14918 00114818 04000224 */   addiu     $2, $0, 0x4
/* 1491C 0011481C 0000A28F */  lw         $2, 0x0($sp)
/* 14920 00114820 F9FF4010 */  beqz       $2, .L00114808
/* 14924 00114824 04000224 */   addiu     $2, $0, 0x4
.L00114828:
/* 14928 00114828 1000BFDF */  ld         $31, 0x10($sp)
/* 1492C 0011482C 0110013C */  lui        $at, (0x10010000 >> 16)
/* 14930 00114830 00F022AC */  sw         $2, -0x1000($at)
/* 14934 00114834 0800A2DF */  ld         $2, 0x8($sp)
/* 14938 00114838 0800E003 */  jr         $31
/* 1493C 0011483C 2000BD27 */   addiu     $sp, $sp, 0x20