.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckItemGet__14CDngStatusDataFi
/* BDE40 001BDD40 28160070 */  paddub     $2, $0, $0
/* BDE44 001BDD44 17FFA324 */  addiu      $3, $5, -0xE9
/* BDE48 001BDD48 0200612C */  sltiu      $at, $3, 0x2
/* BDE4C 001BDD4C 04002014 */  bnez       $at, .L001BDD60
/* BDE50 001BDD50 00000000 */   nop
/* BDE54 001BDD54 EE000324 */  addiu      $3, $0, 0xEE
/* BDE58 001BDD58 0400A314 */  bne        $5, $3, .L001BDD6C
/* BDE5C 001BDD5C 00000000 */   nop
.L001BDD60:
/* BDE60 001BDD60 28160070 */  paddub     $2, $0, $0
/* BDE64 001BDD64 55000010 */  b          .L001BDEBC
/* BDE68 001BDD68 00000000 */   nop
.L001BDD6C:
/* BDE6C 001BDD6C 8400A328 */  slti       $3, $5, 0x84
/* BDE70 001BDD70 2F006014 */  bnez       $3, .L001BDE30
/* BDE74 001BDD74 00000000 */   nop
/* BDE78 001BDD78 0101A128 */  slti       $at, $5, 0x101
/* BDE7C 001BDD7C 2C002010 */  beqz       $at, .L001BDE30
/* BDE80 001BDD80 00000000 */   nop
/* BDE84 001BDD84 283E0070 */  paddub     $7, $0, $0
/* BDE88 001BDD88 28360070 */  paddub     $6, $0, $0
/* BDE8C 001BDD8C 0C000010 */  b          .L001BDDC0
/* BDE90 001BDD90 00000000 */   nop
.L001BDD94:
/* BDE94 001BDD94 40100600 */  sll        $2, $6, 1
/* BDE98 001BDD98 21104400 */  addu       $2, $2, $4
/* BDE9C 001BDD9C 6E434384 */  lh         $3, 0x436E($2)
/* BDEA0 001BDDA0 84006228 */  slti       $2, $3, 0x84
/* BDEA4 001BDDA4 05004014 */  bnez       $2, .L001BDDBC
/* BDEA8 001BDDA8 00000000 */   nop
/* BDEAC 001BDDAC 01016128 */  slti       $at, $3, 0x101
/* BDEB0 001BDDB0 02002010 */  beqz       $at, .L001BDDBC
/* BDEB4 001BDDB4 00000000 */   nop
/* BDEB8 001BDDB8 0100E724 */  addiu      $7, $7, 0x1
.L001BDDBC:
/* BDEBC 001BDDBC 0100C624 */  addiu      $6, $6, 0x1
.L001BDDC0:
/* BDEC0 001BDDC0 6400C228 */  slti       $2, $6, 0x64
/* BDEC4 001BDDC4 F3FF4014 */  bnez       $2, .L001BDD94
/* BDEC8 001BDDC8 00000000 */   nop
/* BDECC 001BDDCC 28460070 */  paddub     $8, $0, $0
/* BDED0 001BDDD0 0A000010 */  b          .L001BDDFC
/* BDED4 001BDDD4 00000000 */   nop
.L001BDDD8:
/* BDED8 001BDDD8 40100800 */  sll        $2, $8, 1
/* BDEDC 001BDDDC 21304400 */  addu       $6, $2, $4
/* BDEE0 001BDDE0 6243C384 */  lh         $3, 0x4362($6)
/* BDEE4 001BDDE4 FFFF0224 */  addiu      $2, $0, -0x1
/* BDEE8 001BDDE8 03006210 */  beq        $3, $2, .L001BDDF8
/* BDEEC 001BDDEC 00000000 */   nop
/* BDEF0 001BDDF0 6843C284 */  lh         $2, 0x4368($6)
/* BDEF4 001BDDF4 2138E200 */  addu       $7, $7, $2
.L001BDDF8:
/* BDEF8 001BDDF8 01000825 */  addiu      $8, $8, 0x1
.L001BDDFC:
/* BDEFC 001BDDFC 03000229 */  slti       $2, $8, 0x3
/* BDF00 001BDE00 F5FF4014 */  bnez       $2, .L001BDDD8
/* BDF04 001BDE04 00000000 */   nop
/* BDF08 001BDE08 60438280 */  lb         $2, 0x4360($4)
/* BDF0C 001BDE0C 2A08E200 */  slt        $at, $7, $2
/* BDF10 001BDE10 04002010 */  beqz       $at, .L001BDE24
/* BDF14 001BDE14 00000000 */   nop
/* BDF18 001BDE18 28160070 */  paddub     $2, $0, $0
/* BDF1C 001BDE1C 04000010 */  b          .L001BDE30
/* BDF20 001BDE20 00000000 */   nop
.L001BDE24:
/* BDF24 001BDE24 01000224 */  addiu      $2, $0, 0x1
/* BDF28 001BDE28 24000010 */  b          .L001BDEBC
/* BDF2C 001BDE2C 00000000 */   nop
.L001BDE30:
/* BDF30 001BDE30 5100A328 */  slti       $3, $5, 0x51
/* BDF34 001BDE34 21006014 */  bnez       $3, .L001BDEBC
/* BDF38 001BDE38 00000000 */   nop
/* BDF3C 001BDE3C 8400A128 */  slti       $at, $5, 0x84
/* BDF40 001BDE40 1E002010 */  beqz       $at, .L001BDEBC
/* BDF44 001BDE44 00000000 */   nop
/* BDF48 001BDE48 282E0070 */  paddub     $5, $0, $0
/* BDF4C 001BDE4C 28360070 */  paddub     $6, $0, $0
/* BDF50 001BDE50 0E000010 */  b          .L001BDE8C
/* BDF54 001BDE54 00000000 */   nop
.L001BDE58:
/* BDF58 001BDE58 40110600 */  sll        $2, $6, 5
/* BDF5C 001BDE5C 21104400 */  addu       $2, $2, $4
/* BDF60 001BDE60 0100013C */  lui        $at, (0x10000 >> 16)
/* BDF64 001BDE64 21084100 */  addu       $at, $2, $at
/* BDF68 001BDE68 FC842384 */  lh         $3, -0x7B04($at)
/* BDF6C 001BDE6C 51006228 */  slti       $2, $3, 0x51
/* BDF70 001BDE70 05004014 */  bnez       $2, .L001BDE88
/* BDF74 001BDE74 00000000 */   nop
/* BDF78 001BDE78 84006128 */  slti       $at, $3, 0x84
/* BDF7C 001BDE7C 02002010 */  beqz       $at, .L001BDE88
/* BDF80 001BDE80 00000000 */   nop
/* BDF84 001BDE84 0100A524 */  addiu      $5, $5, 0x1
.L001BDE88:
/* BDF88 001BDE88 0100C624 */  addiu      $6, $6, 0x1
.L001BDE8C:
/* BDF8C 001BDE8C 2800C228 */  slti       $2, $6, 0x28
/* BDF90 001BDE90 F1FF4014 */  bnez       $2, .L001BDE58
/* BDF94 001BDE94 00000000 */   nop
/* BDF98 001BDE98 2800A128 */  slti       $at, $5, 0x28
/* BDF9C 001BDE9C 04002010 */  beqz       $at, .L001BDEB0
/* BDFA0 001BDEA0 00000000 */   nop
/* BDFA4 001BDEA4 28160070 */  paddub     $2, $0, $0
/* BDFA8 001BDEA8 04000010 */  b          .L001BDEBC
/* BDFAC 001BDEAC 00000000 */   nop
.L001BDEB0:
/* BDFB0 001BDEB0 02000224 */  addiu      $2, $0, 0x2
/* BDFB4 001BDEB4 01000010 */  b          .L001BDEBC
/* BDFB8 001BDEB8 00000000 */   nop
.L001BDEBC:
/* BDFBC 001BDEBC 0800E003 */  jr         $31
/* BDFC0 001BDEC0 00000000 */   nop
/* BDFC4 001BDEC4 00000000 */  nop
/* BDFC8 001BDEC8 00000000 */  nop
/* BDFCC 001BDECC 00000000 */  nop
