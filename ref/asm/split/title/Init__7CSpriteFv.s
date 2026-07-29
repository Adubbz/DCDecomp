.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Init__7CSpriteFv
/* 028770 01DD4470 28360070 */  paddub      $6, $0, $0
/* 028774 01DD4474 07000010 */  b           .L01DD4494_2D9C94
/* 028778 01DD4478 00000000 */   nop
.L01DD447C_2D9C7C:
/* 02877C 01DD447C 80180600 */  sll         $3, $6, 2
/* 028780 01DD4480 21288300 */  addu        $5, $4, $3
/* 028784 01DD4484 0000A0AC */  sw          $0, 0x0($5)
/* 028788 01DD4488 1643033C */  lui         $3, (0x43160000 >> 16)
/* 02878C 01DD448C 3000A3AC */  sw          $3, 0x30($5)
/* 028790 01DD4490 0100C624 */  addiu       $6, $6, 0x1
.L01DD4494_2D9C94:
/* 028794 01DD4494 0C00C328 */  slti        $3, $6, 0xC
/* 028798 01DD4498 F8FF6014 */  bnez        $3, .L01DD447C_2D9C7C
/* 02879C 01DD449C 00000000 */   nop
/* 0287A0 01DD44A0 048180C7 */  lwc1        $f0, -0x7EFC($28)
/* 0287A4 01DD44A4 600080E4 */  swc1        $f0, 0x60($4)
/* 0287A8 01DD44A8 640080AC */  sw          $0, 0x64($4)
/* 0287AC 01DD44AC 0800E003 */  jr          $31
/* 0287B0 01DD44B0 00000000 */   nop
/* 0287B4 01DD44B4 00000000 */  nop
/* 0287B8 01DD44B8 00000000 */  nop
/* 0287BC 01DD44BC 00000000 */  nop
