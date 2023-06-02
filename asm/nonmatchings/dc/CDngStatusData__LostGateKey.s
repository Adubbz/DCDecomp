.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LostGateKey__14CDngStatusDataFv
/* BDCC0 001BDBC0 281E0070 */  paddub     $3, $0, $0
/* BDCC4 001BDBC4 44000010 */  b          .L001BDCD8
/* BDCC8 001BDBC8 00000000 */   nop
.L001BDBCC:
/* BDCCC 001BDBCC 40280300 */  sll        $5, $3, 1
/* BDCD0 001BDBD0 2130A400 */  addu       $6, $5, $4
/* BDCD4 001BDBD4 6E43C524 */  addiu      $5, $6, 0x436E
/* BDCD8 001BDBD8 6E43C784 */  lh         $7, 0x436E($6)
/* BDCDC 001BDBDC C3000624 */  addiu      $6, $0, 0xC3
/* BDCE0 001BDBE0 0300E614 */  bne        $7, $6, .L001BDBF0
/* BDCE4 001BDBE4 00000000 */   nop
/* BDCE8 001BDBE8 FFFF0624 */  addiu      $6, $0, -0x1
/* BDCEC 001BDBEC 0000A6A4 */  sh         $6, 0x0($5)
.L001BDBF0:
/* BDCF0 001BDBF0 0000A784 */  lh         $7, 0x0($5)
/* BDCF4 001BDBF4 C4000624 */  addiu      $6, $0, 0xC4
/* BDCF8 001BDBF8 0300E614 */  bne        $7, $6, .L001BDC08
/* BDCFC 001BDBFC 00000000 */   nop
/* BDD00 001BDC00 FFFF0624 */  addiu      $6, $0, -0x1
/* BDD04 001BDC04 0000A6A4 */  sh         $6, 0x0($5)
.L001BDC08:
/* BDD08 001BDC08 0000A784 */  lh         $7, 0x0($5)
/* BDD0C 001BDC0C C6000624 */  addiu      $6, $0, 0xC6
/* BDD10 001BDC10 0300E614 */  bne        $7, $6, .L001BDC20
/* BDD14 001BDC14 00000000 */   nop
/* BDD18 001BDC18 FFFF0624 */  addiu      $6, $0, -0x1
/* BDD1C 001BDC1C 0000A6A4 */  sh         $6, 0x0($5)
.L001BDC20:
/* BDD20 001BDC20 0000A784 */  lh         $7, 0x0($5)
/* BDD24 001BDC24 C9000624 */  addiu      $6, $0, 0xC9
/* BDD28 001BDC28 0300E614 */  bne        $7, $6, .L001BDC38
/* BDD2C 001BDC2C 00000000 */   nop
/* BDD30 001BDC30 FFFF0624 */  addiu      $6, $0, -0x1
/* BDD34 001BDC34 0000A6A4 */  sh         $6, 0x0($5)
.L001BDC38:
/* BDD38 001BDC38 0000A784 */  lh         $7, 0x0($5)
/* BDD3C 001BDC3C CA000624 */  addiu      $6, $0, 0xCA
/* BDD40 001BDC40 0300E614 */  bne        $7, $6, .L001BDC50
/* BDD44 001BDC44 00000000 */   nop
/* BDD48 001BDC48 FFFF0624 */  addiu      $6, $0, -0x1
/* BDD4C 001BDC4C 0000A6A4 */  sh         $6, 0x0($5)
.L001BDC50:
/* BDD50 001BDC50 0000A784 */  lh         $7, 0x0($5)
/* BDD54 001BDC54 CB000624 */  addiu      $6, $0, 0xCB
/* BDD58 001BDC58 0300E614 */  bne        $7, $6, .L001BDC68
/* BDD5C 001BDC5C 00000000 */   nop
/* BDD60 001BDC60 FFFF0624 */  addiu      $6, $0, -0x1
/* BDD64 001BDC64 0000A6A4 */  sh         $6, 0x0($5)
.L001BDC68:
/* BDD68 001BDC68 0000A784 */  lh         $7, 0x0($5)
/* BDD6C 001BDC6C CC000624 */  addiu      $6, $0, 0xCC
/* BDD70 001BDC70 0300E614 */  bne        $7, $6, .L001BDC80
/* BDD74 001BDC74 00000000 */   nop
/* BDD78 001BDC78 FFFF0624 */  addiu      $6, $0, -0x1
/* BDD7C 001BDC7C 0000A6A4 */  sh         $6, 0x0($5)
.L001BDC80:
/* BDD80 001BDC80 0000A784 */  lh         $7, 0x0($5)
/* BDD84 001BDC84 CD000624 */  addiu      $6, $0, 0xCD
/* BDD88 001BDC88 0300E614 */  bne        $7, $6, .L001BDC98
/* BDD8C 001BDC8C 00000000 */   nop
/* BDD90 001BDC90 FFFF0624 */  addiu      $6, $0, -0x1
/* BDD94 001BDC94 0000A6A4 */  sh         $6, 0x0($5)
.L001BDC98:
/* BDD98 001BDC98 0000A784 */  lh         $7, 0x0($5)
/* BDD9C 001BDC9C CE000624 */  addiu      $6, $0, 0xCE
/* BDDA0 001BDCA0 0300E614 */  bne        $7, $6, .L001BDCB0
/* BDDA4 001BDCA4 00000000 */   nop
/* BDDA8 001BDCA8 FFFF0624 */  addiu      $6, $0, -0x1
/* BDDAC 001BDCAC 0000A6A4 */  sh         $6, 0x0($5)
.L001BDCB0:
/* BDDB0 001BDCB0 0000A784 */  lh         $7, 0x0($5)
/* BDDB4 001BDCB4 D800E628 */  slti       $6, $7, 0xD8
/* BDDB8 001BDCB8 0600C014 */  bnez       $6, .L001BDCD4
/* BDDBC 001BDCBC 00000000 */   nop
/* BDDC0 001BDCC0 DF00E128 */  slti       $at, $7, 0xDF
/* BDDC4 001BDCC4 03002010 */  beqz       $at, .L001BDCD4
/* BDDC8 001BDCC8 00000000 */   nop
/* BDDCC 001BDCCC FFFF0624 */  addiu      $6, $0, -0x1
/* BDDD0 001BDCD0 0000A6A4 */  sh         $6, 0x0($5)
.L001BDCD4:
/* BDDD4 001BDCD4 01006324 */  addiu      $3, $3, 0x1
.L001BDCD8:
/* BDDD8 001BDCD8 67006528 */  slti       $5, $3, 0x67
/* BDDDC 001BDCDC BBFFA014 */  bnez       $5, .L001BDBCC
/* BDDE0 001BDCE0 00000000 */   nop
/* BDDE4 001BDCE4 0800E003 */  jr         $31
/* BDDE8 001BDCE8 00000000 */   nop
/* BDDEC 001BDCEC 00000000 */  nop
