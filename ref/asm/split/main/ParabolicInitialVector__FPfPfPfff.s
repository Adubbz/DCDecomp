.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ParabolicInitialVector__FPfPfPfff
/* 0D4180 001D4080 0000C1C4 */  lwc1        $f1, 0x0($6)
/* 0D4184 001D4084 0000A0C4 */  lwc1        $f0, 0x0($5)
/* 0D4188 001D4088 01080046 */  sub.s       $f0, $f1, $f0
/* 0D418C 001D408C 03000D46 */  div.s       $f0, $f0, $f13
/* 0D4190 001D4090 000080E4 */  swc1        $f0, 0x0($4)
/* 0D4194 001D4094 0400C1C4 */  lwc1        $f1, 0x4($6)
/* 0D4198 001D4098 0400A0C4 */  lwc1        $f0, 0x4($5)
/* 0D419C 001D409C 01080046 */  sub.s       $f0, $f1, $f0
/* 0D41A0 001D40A0 0040033C */  lui         $3, (0x40000000 >> 16)
/* 0D41A4 001D40A4 00108344 */  mtc1        $3, $f2
/* 0D41A8 001D40A8 00000000 */  nop
/* 0D41AC 001D40AC 1A100046 */  mula.s      $f2, $f0
/* 0D41B0 001D40B0 02600D46 */  mul.s       $f0, $f12, $f13
/* 0D41B4 001D40B4 5D680046 */  msub.s      $f1, $f13, $f0
/* 0D41B8 001D40B8 02100D46 */  mul.s       $f0, $f2, $f13
/* 0D41BC 001D40BC 03080046 */  div.s       $f0, $f1, $f0
/* 0D41C0 001D40C0 040080E4 */  swc1        $f0, 0x4($4)
/* 0D41C4 001D40C4 0800C1C4 */  lwc1        $f1, 0x8($6)
/* 0D41C8 001D40C8 0800A0C4 */  lwc1        $f0, 0x8($5)
/* 0D41CC 001D40CC 01080046 */  sub.s       $f0, $f1, $f0
/* 0D41D0 001D40D0 03000D46 */  div.s       $f0, $f0, $f13
/* 0D41D4 001D40D4 080080E4 */  swc1        $f0, 0x8($4)
/* 0D41D8 001D40D8 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 0D41DC 001D40DC 0C0083AC */  sw          $3, 0xC($4)
/* 0D41E0 001D40E0 80BF033C */  lui         $3, (0xBF800000 >> 16)
/* 0D41E4 001D40E4 00088344 */  mtc1        $3, $f1
/* 0D41E8 001D40E8 040080C4 */  lwc1        $f0, 0x4($4)
/* 0D41EC 001D40EC 02000146 */  mul.s       $f0, $f0, $f1
/* 0D41F0 001D40F0 040080E4 */  swc1        $f0, 0x4($4)
/* 0D41F4 001D40F4 0800E003 */  jr          $31
/* 0D41F8 001D40F8 00000000 */   nop
/* 0D41FC 001D40FC 00000000 */  nop
