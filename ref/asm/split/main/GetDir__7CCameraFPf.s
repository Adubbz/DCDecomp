.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetDir__7CCameraFPf
/* 0244A0 001243A0 700281C4 */  lwc1        $f1, 0x270($4)
/* 0244A4 001243A4 600280C4 */  lwc1        $f0, 0x260($4)
/* 0244A8 001243A8 01080046 */  sub.s       $f0, $f1, $f0
/* 0244AC 001243AC 0000A0E4 */  swc1        $f0, 0x0($5)
/* 0244B0 001243B0 740281C4 */  lwc1        $f1, 0x274($4)
/* 0244B4 001243B4 640280C4 */  lwc1        $f0, 0x264($4)
/* 0244B8 001243B8 01080046 */  sub.s       $f0, $f1, $f0
/* 0244BC 001243BC 0400A0E4 */  swc1        $f0, 0x4($5)
/* 0244C0 001243C0 780281C4 */  lwc1        $f1, 0x278($4)
/* 0244C4 001243C4 680280C4 */  lwc1        $f0, 0x268($4)
/* 0244C8 001243C8 01080046 */  sub.s       $f0, $f1, $f0
/* 0244CC 001243CC 0800A0E4 */  swc1        $f0, 0x8($5)
/* 0244D0 001243D0 0800E003 */  jr          $31
/* 0244D4 001243D4 00000000 */   nop
/* 0244D8 001243D8 00000000 */  nop
/* 0244DC 001243DC 00000000 */  nop
