.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LostGateKey__14CDngStatusDataFv
/* 0BDCC0 001BDBC0 281E0070 */  paddub      $3, $0, $0
/* 0BDCC4 001BDBC4 44000010 */  b           .L001BDCD8
/* 0BDCC8 001BDBC8 00000000 */   nop
.L001BDBCC:
/* 0BDCCC 001BDBCC 40280300 */  sll         $5, $3, 1
/* 0BDCD0 001BDBD0 2130A400 */  addu        $6, $5, $4
/* 0BDCD4 001BDBD4 6E43C524 */  addiu       $5, $6, 0x436E
/* 0BDCD8 001BDBD8 6E43C784 */  lh          $7, 0x436E($6)
/* 0BDCDC 001BDBDC C3000624 */  addiu       $6, $0, 0xC3
/* 0BDCE0 001BDBE0 0300E614 */  bne         $7, $6, .L001BDBF0
/* 0BDCE4 001BDBE4 00000000 */   nop
/* 0BDCE8 001BDBE8 FFFF0624 */  addiu       $6, $0, -0x1
/* 0BDCEC 001BDBEC 0000A6A4 */  sh          $6, 0x0($5)
.L001BDBF0:
/* 0BDCF0 001BDBF0 0000A784 */  lh          $7, 0x0($5)
/* 0BDCF4 001BDBF4 C4000624 */  addiu       $6, $0, 0xC4
/* 0BDCF8 001BDBF8 0300E614 */  bne         $7, $6, .L001BDC08
/* 0BDCFC 001BDBFC 00000000 */   nop
/* 0BDD00 001BDC00 FFFF0624 */  addiu       $6, $0, -0x1
/* 0BDD04 001BDC04 0000A6A4 */  sh          $6, 0x0($5)
.L001BDC08:
/* 0BDD08 001BDC08 0000A784 */  lh          $7, 0x0($5)
/* 0BDD0C 001BDC0C C6000624 */  addiu       $6, $0, 0xC6
/* 0BDD10 001BDC10 0300E614 */  bne         $7, $6, .L001BDC20
/* 0BDD14 001BDC14 00000000 */   nop
/* 0BDD18 001BDC18 FFFF0624 */  addiu       $6, $0, -0x1
/* 0BDD1C 001BDC1C 0000A6A4 */  sh          $6, 0x0($5)
.L001BDC20:
/* 0BDD20 001BDC20 0000A784 */  lh          $7, 0x0($5)
/* 0BDD24 001BDC24 C9000624 */  addiu       $6, $0, 0xC9
/* 0BDD28 001BDC28 0300E614 */  bne         $7, $6, .L001BDC38
/* 0BDD2C 001BDC2C 00000000 */   nop
/* 0BDD30 001BDC30 FFFF0624 */  addiu       $6, $0, -0x1
/* 0BDD34 001BDC34 0000A6A4 */  sh          $6, 0x0($5)
.L001BDC38:
/* 0BDD38 001BDC38 0000A784 */  lh          $7, 0x0($5)
/* 0BDD3C 001BDC3C CA000624 */  addiu       $6, $0, 0xCA
/* 0BDD40 001BDC40 0300E614 */  bne         $7, $6, .L001BDC50
/* 0BDD44 001BDC44 00000000 */   nop
/* 0BDD48 001BDC48 FFFF0624 */  addiu       $6, $0, -0x1
/* 0BDD4C 001BDC4C 0000A6A4 */  sh          $6, 0x0($5)
.L001BDC50:
/* 0BDD50 001BDC50 0000A784 */  lh          $7, 0x0($5)
/* 0BDD54 001BDC54 CB000624 */  addiu       $6, $0, 0xCB
/* 0BDD58 001BDC58 0300E614 */  bne         $7, $6, .L001BDC68
/* 0BDD5C 001BDC5C 00000000 */   nop
/* 0BDD60 001BDC60 FFFF0624 */  addiu       $6, $0, -0x1
/* 0BDD64 001BDC64 0000A6A4 */  sh          $6, 0x0($5)
.L001BDC68:
/* 0BDD68 001BDC68 0000A784 */  lh          $7, 0x0($5)
/* 0BDD6C 001BDC6C CC000624 */  addiu       $6, $0, 0xCC
/* 0BDD70 001BDC70 0300E614 */  bne         $7, $6, .L001BDC80
/* 0BDD74 001BDC74 00000000 */   nop
/* 0BDD78 001BDC78 FFFF0624 */  addiu       $6, $0, -0x1
/* 0BDD7C 001BDC7C 0000A6A4 */  sh          $6, 0x0($5)
.L001BDC80:
/* 0BDD80 001BDC80 0000A784 */  lh          $7, 0x0($5)
/* 0BDD84 001BDC84 CD000624 */  addiu       $6, $0, 0xCD
/* 0BDD88 001BDC88 0300E614 */  bne         $7, $6, .L001BDC98
/* 0BDD8C 001BDC8C 00000000 */   nop
/* 0BDD90 001BDC90 FFFF0624 */  addiu       $6, $0, -0x1
/* 0BDD94 001BDC94 0000A6A4 */  sh          $6, 0x0($5)
.L001BDC98:
/* 0BDD98 001BDC98 0000A784 */  lh          $7, 0x0($5)
/* 0BDD9C 001BDC9C CE000624 */  addiu       $6, $0, 0xCE
/* 0BDDA0 001BDCA0 0300E614 */  bne         $7, $6, .L001BDCB0
/* 0BDDA4 001BDCA4 00000000 */   nop
/* 0BDDA8 001BDCA8 FFFF0624 */  addiu       $6, $0, -0x1
/* 0BDDAC 001BDCAC 0000A6A4 */  sh          $6, 0x0($5)
.L001BDCB0:
/* 0BDDB0 001BDCB0 0000A784 */  lh          $7, 0x0($5)
/* 0BDDB4 001BDCB4 D800E628 */  slti        $6, $7, 0xD8
/* 0BDDB8 001BDCB8 0600C014 */  bnez        $6, .L001BDCD4
/* 0BDDBC 001BDCBC 00000000 */   nop
/* 0BDDC0 001BDCC0 DF00E128 */  slti        $1, $7, 0xDF
/* 0BDDC4 001BDCC4 03002010 */  beqz        $1, .L001BDCD4
/* 0BDDC8 001BDCC8 00000000 */   nop
/* 0BDDCC 001BDCCC FFFF0624 */  addiu       $6, $0, -0x1
/* 0BDDD0 001BDCD0 0000A6A4 */  sh          $6, 0x0($5)
.L001BDCD4:
/* 0BDDD4 001BDCD4 01006324 */  addiu       $3, $3, 0x1
.L001BDCD8:
/* 0BDDD8 001BDCD8 67006528 */  slti        $5, $3, 0x67
/* 0BDDDC 001BDCDC BBFFA014 */  bnez        $5, .L001BDBCC
/* 0BDDE0 001BDCE0 00000000 */   nop
/* 0BDDE4 001BDCE4 0800E003 */  jr          $31
/* 0BDDE8 001BDCE8 00000000 */   nop
/* 0BDDEC 001BDCEC 00000000 */  nop
