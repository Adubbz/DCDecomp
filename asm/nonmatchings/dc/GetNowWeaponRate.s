.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetNowWeaponRate__FP11WEAPON_HAVE
/* 10CED0 0020CDD0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 10CED4 0020CDD4 00008244 */  mtc1       $2, $f0
/* 10CED8 0020CDD8 12008010 */  beqz       $4, .L0020CE24
/* 10CEDC 0020CDDC 00000000 */   nop
/* 10CEE0 0020CDE0 00008384 */  lh         $3, 0x0($4)
/* 10CEE4 0020CDE4 10010224 */  addiu      $2, $0, 0x110
/* 10CEE8 0020CDE8 0E006214 */  bne        $3, $2, .L0020CE24
/* 10CEEC 0020CDEC 00000000 */   nop
/* 10CEF0 0020CDF0 0C008284 */  lh         $2, 0xC($4)
/* 10CEF4 0020CDF4 00088244 */  mtc1       $2, $f1
/* 10CEF8 0020CDF8 00000000 */  nop
/* 10CEFC 0020CDFC A0088046 */  cvt.s.w    $f2, $f1
/* 10CF00 0020CE00 9C8081C7 */  lwc1       $f1, -0x7F64($gp)
/* 10CF04 0020CE04 82080246 */  mul.s      $f2, $f1, $f2
/* 10CF08 0020CE08 100081C4 */  lwc1       $f1, 0x10($4)
/* 10CF0C 0020CE0C 36080246 */  c.le.s     $f1, $f2
/* 10CF10 0020CE10 00000000 */  nop
/* 10CF14 0020CE14 03000045 */  bc1f       .L0020CE24
/* 10CF18 0020CE18 00000000 */   nop
/* 10CF1C 0020CE1C C03F023C */  lui        $2, (0x3FC00000 >> 16)
/* 10CF20 0020CE20 00008244 */  mtc1       $2, $f0
.L0020CE24:
/* 10CF24 0020CE24 0800E003 */  jr         $31
/* 10CF28 0020CE28 00000000 */   nop
/* 10CF2C 0020CE2C 00000000 */  nop
