.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckWeaponUser__14CDngStatusDataFi
/* BDFD0 001BDED0 FFFF0224 */  addiu      $2, $0, -0x1
/* BDFD4 001BDED4 0101A328 */  slti       $3, $5, 0x101
/* BDFD8 001BDED8 05006014 */  bnez       $3, .L001BDEF0
/* BDFDC 001BDEDC 00000000 */   nop
/* BDFE0 001BDEE0 2B01A128 */  slti       $at, $5, 0x12B
/* BDFE4 001BDEE4 02002010 */  beqz       $at, .L001BDEF0
/* BDFE8 001BDEE8 00000000 */   nop
/* BDFEC 001BDEEC 28160070 */  paddub     $2, $0, $0
.L001BDEF0:
/* BDFF0 001BDEF0 2B01A328 */  slti       $3, $5, 0x12B
/* BDFF4 001BDEF4 05006014 */  bnez       $3, .L001BDF0C
/* BDFF8 001BDEF8 00000000 */   nop
/* BDFFC 001BDEFC 3A01A128 */  slti       $at, $5, 0x13A
/* BE000 001BDF00 02002010 */  beqz       $at, .L001BDF0C
/* BE004 001BDF04 00000000 */   nop
/* BE008 001BDF08 01000224 */  addiu      $2, $0, 0x1
.L001BDF0C:
/* BE00C 001BDF0C 3A01A328 */  slti       $3, $5, 0x13A
/* BE010 001BDF10 05006014 */  bnez       $3, .L001BDF28
/* BE014 001BDF14 00000000 */   nop
/* BE018 001BDF18 4B01A128 */  slti       $at, $5, 0x14B
/* BE01C 001BDF1C 02002010 */  beqz       $at, .L001BDF28
/* BE020 001BDF20 00000000 */   nop
/* BE024 001BDF24 02000224 */  addiu      $2, $0, 0x2
.L001BDF28:
/* BE028 001BDF28 4B01A328 */  slti       $3, $5, 0x14B
/* BE02C 001BDF2C 05006014 */  bnez       $3, .L001BDF44
/* BE030 001BDF30 00000000 */   nop
/* BE034 001BDF34 5B01A128 */  slti       $at, $5, 0x15B
/* BE038 001BDF38 02002010 */  beqz       $at, .L001BDF44
/* BE03C 001BDF3C 00000000 */   nop
/* BE040 001BDF40 03000224 */  addiu      $2, $0, 0x3
.L001BDF44:
/* BE044 001BDF44 5B01A328 */  slti       $3, $5, 0x15B
/* BE048 001BDF48 05006014 */  bnez       $3, .L001BDF60
/* BE04C 001BDF4C 00000000 */   nop
/* BE050 001BDF50 6B01A128 */  slti       $at, $5, 0x16B
/* BE054 001BDF54 02002010 */  beqz       $at, .L001BDF60
/* BE058 001BDF58 00000000 */   nop
/* BE05C 001BDF5C 04000224 */  addiu      $2, $0, 0x4
.L001BDF60:
/* BE060 001BDF60 6B01A328 */  slti       $3, $5, 0x16B
/* BE064 001BDF64 05006014 */  bnez       $3, .L001BDF7C
/* BE068 001BDF68 00000000 */   nop
/* BE06C 001BDF6C 7901A128 */  slti       $at, $5, 0x179
/* BE070 001BDF70 02002010 */  beqz       $at, .L001BDF7C
/* BE074 001BDF74 00000000 */   nop
/* BE078 001BDF78 05000224 */  addiu      $2, $0, 0x5
.L001BDF7C:
/* BE07C 001BDF7C 0800E003 */  jr         $31
/* BE080 001BDF80 00000000 */   nop
/* BE084 001BDF84 00000000 */  nop
/* BE088 001BDF88 00000000 */  nop
/* BE08C 001BDF8C 00000000 */  nop
