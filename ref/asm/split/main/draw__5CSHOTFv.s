.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel draw__5CSHOTFv
/* 0ABD40 001ABC40 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0ABD44 001ABC44 2000BF7F */  sq          $31, 0x20($29)
/* 0ABD48 001ABC48 1000B17F */  sq          $17, 0x10($29)
/* 0ABD4C 001ABC4C 0000B07F */  sq          $16, 0x0($29)
/* 0ABD50 001ABC50 288E8070 */  paddub      $17, $4, $0
/* 0ABD54 001ABC54 28860070 */  paddub      $16, $0, $0
/* 0ABD58 001ABC58 23000010 */  b           .L001ABCE8
/* 0ABD5C 001ABC5C 00000000 */   nop
.L001ABC60:
/* 0ABD60 001ABC60 80201000 */  sll         $4, $16, 2
/* 0ABD64 001ABC64 21189100 */  addu        $3, $4, $17
/* 0ABD68 001ABC68 D003638C */  lw          $3, 0x3D0($3)
/* 0ABD6C 001ABC6C 1D006010 */  beqz        $3, .L001ABCE4
/* 0ABD70 001ABC70 00000000 */   nop
/* 0ABD74 001ABC74 049D828F */  lw          $2, -0x62FC($28)
/* 0ABD78 001ABC78 00004284 */  lh          $2, 0x0($2)
/* 0ABD7C 001ABC7C D5FE4324 */  addiu       $3, $2, -0x12B
/* 0ABD80 001ABC80 FFFF6324 */  addiu       $3, $3, -0x1
/* 0ABD84 001ABC84 0200601C */  bgtz        $3, .L001ABC90
/* 0ABD88 001ABC88 00000000 */   nop
/* 0ABD8C 001ABC8C 281E0070 */  paddub      $3, $0, $0
.L001ABC90:
/* 0ABD90 001ABC90 03006230 */  andi        $2, $3, 0x3
/* 0ABD94 001ABC94 04006104 */  bgez        $3, .L001ABCA8
/* 0ABD98 001ABC98 00000000 */   nop
/* 0ABD9C 001ABC9C 02004010 */  beqz        $2, .L001ABCA8
/* 0ABDA0 001ABCA0 00000000 */   nop
/* 0ABDA4 001ABCA4 FCFF4224 */  addiu       $2, $2, -0x4
.L001ABCA8:
/* 0ABDA8 001ABCA8 40310200 */  sll         $6, $2, 5
/* 0ABDAC 001ABCAC 83100300 */  sra         $2, $3, 2
/* 0ABDB0 001ABCB0 40390200 */  sll         $7, $2, 5
/* 0ABDB4 001ABCB4 00111000 */  sll         $2, $16, 4
/* 0ABDB8 001ABCB8 21102202 */  addu        $2, $17, $2
/* 0ABDBC 001ABCBC 21189100 */  addu        $3, $4, $17
/* 0ABDC0 001ABCC0 40004424 */  addiu       $4, $2, 0x40
/* 0ABDC4 001ABCC4 2A00023C */  lui         $2, %hi(LIT_625__2)
/* 0ABDC8 001ABCC8 C8B44524 */  addiu       $5, $2, %lo(LIT_625__2)
/* 0ABDCC 001ABCCC 10036CC4 */  lwc1        $f12, 0x310($3)
/* 0ABDD0 001ABCD0 20000824 */  addiu       $8, $0, 0x20
/* 0ABDD4 001ABCD4 284E0071 */  paddub      $9, $8, $0
/* 0ABDD8 001ABCD8 80000A24 */  addiu       $10, $0, 0x80
/* 0ABDDC 001ABCDC C0AE060C */  jal         set3DCellModel__FPfPcfiiiiUc
/* 0ABDE0 001ABCE0 00000000 */   nop
.L001ABCE4:
/* 0ABDE4 001ABCE4 01001026 */  addiu       $16, $16, 0x1
.L001ABCE8:
/* 0ABDE8 001ABCE8 0C00032A */  slti        $3, $16, 0xC
/* 0ABDEC 001ABCEC DCFF6014 */  bnez        $3, .L001ABC60
/* 0ABDF0 001ABCF0 00000000 */   nop
/* 0ABDF4 001ABCF4 2000BF7B */  lq          $31, 0x20($29)
/* 0ABDF8 001ABCF8 1000B17B */  lq          $17, 0x10($29)
/* 0ABDFC 001ABCFC 0000B07B */  lq          $16, 0x0($29)
/* 0ABE00 001ABD00 3000BD27 */  addiu       $29, $29, 0x30
/* 0ABE04 001ABD04 0800E003 */  jr          $31
/* 0ABE08 001ABD08 00000000 */   nop
/* 0ABE0C 001ABD0C 00000000 */  nop
