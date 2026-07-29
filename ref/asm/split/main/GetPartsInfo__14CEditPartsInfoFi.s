.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetPartsInfo__14CEditPartsInfoFi
/* 09A0D0 00199FD0 0400A004 */  bltz        $5, .L00199FE4
/* 09A0D4 00199FD4 00000000 */   nop
/* 09A0D8 00199FD8 1800A228 */  slti        $2, $5, 0x18
/* 09A0DC 00199FDC 04004014 */  bnez        $2, .L00199FF0
/* 09A0E0 00199FE0 00000000 */   nop
.L00199FE4:
/* 09A0E4 00199FE4 28160070 */  paddub      $2, $0, $0
/* 09A0E8 00199FE8 08000010 */  b           .L0019A00C
/* 09A0EC 00199FEC 00000000 */   nop
.L00199FF0:
/* 09A0F0 00199FF0 C0100500 */  sll         $2, $5, 3
/* 09A0F4 00199FF4 23104500 */  subu        $2, $2, $5
/* 09A0F8 00199FF8 80100200 */  sll         $2, $2, 2
/* 09A0FC 00199FFC 21104500 */  addu        $2, $2, $5
/* 09A100 0019A000 C0100200 */  sll         $2, $2, 3
/* 09A104 0019A004 21108200 */  addu        $2, $4, $2
/* 09A108 0019A008 64004224 */  addiu       $2, $2, 0x64
.L0019A00C:
/* 09A10C 0019A00C 0800E003 */  jr          $31
/* 09A110 0019A010 00000000 */   nop
/* 09A114 0019A014 00000000 */  nop
/* 09A118 0019A018 00000000 */  nop
/* 09A11C 0019A01C 00000000 */  nop
