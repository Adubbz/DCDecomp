.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __kernel_cosf
/* 1BE78 0011BD78 00600244 */  mfc1       $2, $f12
/* 1BE7C 0011BD7C 2D204000 */  daddu      $4, $2, $0
/* 1BE80 0011BD80 FF7F033C */  lui        $3, (0x7FFFFFFF >> 16)
/* 1BE84 0011BD84 FFFF6334 */  ori        $3, $3, (0x7FFFFFFF & 0xFFFF)
/* 1BE88 0011BD88 FF31023C */  lui        $2, (0x31FFFFFF >> 16)
/* 1BE8C 0011BD8C 24208300 */  and        $4, $4, $3
/* 1BE90 0011BD90 FFFF4234 */  ori        $2, $2, (0x31FFFFFF & 0xFFFF)
/* 1BE94 0011BD94 2A104400 */  slt        $2, $2, $4
/* 1BE98 0011BD98 0B004054 */  bnel       $2, $0, .L0011BDC8
/* 1BE9C 0011BD9C 82610C46 */   mul.s     $f6, $f12, $f12
/* 1BEA0 0011BDA0 24600046 */  .word      0x46006024                    # cvt.w.s    $f0, $f12 # 00000000
/* 1BEA4 0011BDA4 00000244 */  mfc1       $2, $f0
/* 1BEA8 0011BDA8 00000000 */  nop
/* 1BEAC 0011BDAC 06004054 */  bnel       $2, $0, .L0011BDC8
/* 1BEB0 0011BDB0 82610C46 */   mul.s     $f6, $f12, $f12
/* 1BEB4 0011BDB4 803F013C */  lui        $at, (0x3F800000 >> 16)
/* 1BEB8 0011BDB8 00008144 */  mtc1       $at, $f0
/* 1BEBC 0011BDBC 0800E003 */  jr         $31
/* 1BEC0 0011BDC0 00000000 */   nop
/* 1BEC4 0011BDC4 00000000 */  nop
.L0011BDC8:
/* 1BEC8 0011BDC8 47AD013C */  lui        $at, (0xAD47D74E >> 16)
/* 1BECC 0011BDCC 4ED72134 */  ori        $at, $at, (0xAD47D74E & 0xFFFF)
/* 1BED0 0011BDD0 00008144 */  mtc1       $at, $f0
/* 1BED4 0011BDD4 0F31013C */  lui        $at, (0x310F74F6 >> 16)
/* 1BED8 0011BDD8 F6742134 */  ori        $at, $at, (0x310F74F6 & 0xFFFF)
/* 1BEDC 0011BDDC 00108144 */  mtc1       $at, $f2
/* 1BEE0 0011BDE0 993E023C */  lui        $2, (0x3E999999 >> 16)
/* 1BEE4 0011BDE4 93B4013C */  lui        $at, (0xB493F27C >> 16)
/* 1BEE8 0011BDE8 7CF22134 */  ori        $at, $at, (0xB493F27C & 0xFFFF)
/* 1BEEC 0011BDEC 00188144 */  mtc1       $at, $f3
/* 1BEF0 0011BDF0 99994234 */  ori        $2, $2, (0x3E999999 & 0xFFFF)
/* 1BEF4 0011BDF4 02300046 */  mul.s      $f0, $f6, $f0
/* 1BEF8 0011BDF8 D037013C */  lui        $at, (0x37D00D01 >> 16)
/* 1BEFC 0011BDFC 010D2134 */  ori        $at, $at, (0x37D00D01 & 0xFFFF)
/* 1BF00 0011BE00 00088144 */  mtc1       $at, $f1
/* 1BF04 0011BE04 B6BA013C */  lui        $at, (0xBAB60B61 >> 16)
/* 1BF08 0011BE08 610B2134 */  ori        $at, $at, (0xBAB60B61 & 0xFFFF)
/* 1BF0C 0011BE0C 00208144 */  mtc1       $at, $f4
/* 1BF10 0011BE10 2A104400 */  slt        $2, $2, $4
/* 1BF14 0011BE14 2A3D013C */  lui        $at, (0x3D2AAAAB >> 16)
/* 1BF18 0011BE18 ABAA2134 */  ori        $at, $at, (0x3D2AAAAB & 0xFFFF)
/* 1BF1C 0011BE1C 00288144 */  mtc1       $at, $f5
/* 1BF20 0011BE20 00000246 */  add.s      $f0, $f0, $f2
/* 1BF24 0011BE24 02300046 */  mul.s      $f0, $f6, $f0
/* 1BF28 0011BE28 00000346 */  add.s      $f0, $f0, $f3
/* 1BF2C 0011BE2C 02300046 */  mul.s      $f0, $f6, $f0
/* 1BF30 0011BE30 00000146 */  add.s      $f0, $f0, $f1
/* 1BF34 0011BE34 02300046 */  mul.s      $f0, $f6, $f0
/* 1BF38 0011BE38 00000446 */  add.s      $f0, $f0, $f4
/* 1BF3C 0011BE3C 02300046 */  mul.s      $f0, $f6, $f0
/* 1BF40 0011BE40 00000546 */  add.s      $f0, $f0, $f5
/* 1BF44 0011BE44 0C004014 */  bnez       $2, .L0011BE78
/* 1BF48 0011BE48 42300046 */   mul.s     $f1, $f6, $f0
/* 1BF4C 0011BE4C 42300146 */  mul.s      $f1, $f6, $f1
/* 1BF50 0011BE50 003F013C */  lui        $at, (0x3F000000 >> 16)
/* 1BF54 0011BE54 00008144 */  mtc1       $at, $f0
/* 1BF58 0011BE58 82600D46 */  mul.s      $f2, $f12, $f13
/* 1BF5C 0011BE5C 803F013C */  lui        $at, (0x3F800000 >> 16)
/* 1BF60 0011BE60 00188144 */  mtc1       $at, $f3
/* 1BF64 0011BE64 02300046 */  mul.s      $f0, $f6, $f0
/* 1BF68 0011BE68 41080246 */  sub.s      $f1, $f1, $f2
/* 1BF6C 0011BE6C 01000146 */  sub.s      $f0, $f0, $f1
/* 1BF70 0011BE70 0800E003 */  jr         $31
/* 1BF74 0011BE74 01180046 */   sub.s     $f0, $f3, $f0
.L0011BE78:
/* 1BF78 0011BE78 483F023C */  lui        $2, (0x3F480000 >> 16)
/* 1BF7C 0011BE7C 2A104400 */  slt        $2, $2, $4
/* 1BF80 0011BE80 04004010 */  beqz       $2, .L0011BE94
/* 1BF84 0011BE84 00FF023C */   lui       $2, (0xFF000000 >> 16)
/* 1BF88 0011BE88 903E023C */  lui        $2, (0x3E900000 >> 16)
/* 1BF8C 0011BE8C 02000010 */  b          .L0011BE98
/* 1BF90 0011BE90 00000000 */   nop
.L0011BE94:
/* 1BF94 0011BE94 21108200 */  addu       $2, $4, $2
.L0011BE98:
/* 1BF98 0011BE98 003F013C */  lui        $at, (0x3F000000 >> 16)
/* 1BF9C 0011BE9C 00008144 */  mtc1       $at, $f0
/* 1BFA0 0011BEA0 82300146 */  mul.s      $f2, $f6, $f1
/* 1BFA4 0011BEA4 C2600D46 */  mul.s      $f3, $f12, $f13
/* 1BFA8 0011BEA8 803F013C */  lui        $at, (0x3F800000 >> 16)
/* 1BFAC 0011BEAC 00088144 */  mtc1       $at, $f1
/* 1BFB0 0011BEB0 02300046 */  mul.s      $f0, $f6, $f0
/* 1BFB4 0011BEB4 00208244 */  mtc1       $2, $f4
/* 1BFB8 0011BEB8 81100346 */  sub.s      $f2, $f2, $f3
/* 1BFBC 0011BEBC 01000446 */  sub.s      $f0, $f0, $f4
/* 1BFC0 0011BEC0 41080446 */  sub.s      $f1, $f1, $f4
/* 1BFC4 0011BEC4 01000246 */  sub.s      $f0, $f0, $f2
/* 1BFC8 0011BEC8 0800E003 */  jr         $31
/* 1BFCC 0011BECC 01080046 */   sub.s     $f0, $f1, $f0
