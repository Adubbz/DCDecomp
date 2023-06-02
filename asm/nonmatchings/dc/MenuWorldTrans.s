.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MenuWorldTrans__FP7CCamera
/* 12BEF0 0022BDF0 10FFBD27 */  addiu      $sp, $sp, -0xF0
/* 12BEF4 0022BDF4 1000BF7F */  sq         $31, 0x10($sp)
/* 12BEF8 0022BDF8 0000B07F */  sq         $16, 0x0($sp)
/* 12BEFC 0022BDFC 28868070 */  paddub     $16, $4, $0
/* 12BF00 0022BE00 4844023C */  lui        $2, (0x44480000 >> 16)
/* 12BF04 0022BE04 00608244 */  mtc1       $2, $f12
/* 12BF08 0022BE08 58B6040C */  jal        MGSetProjection__Ff
/* 12BF0C 0022BE0C 00000000 */   nop
/* 12BF10 0022BE10 28260072 */  paddub     $4, $16, $0
/* 12BF14 0022BE14 2000A527 */  addiu      $5, $sp, 0x20
/* 12BF18 0022BE18 F890040C */  jal        GetCameraMatrix__7CCameraFPA4_f
/* 12BF1C 0022BE1C 00000000 */   nop
/* 12BF20 0022BE20 28260072 */  paddub     $4, $16, $0
/* 12BF24 0022BE24 01000524 */  addiu      $5, $0, 0x1
/* 12BF28 0022BE28 B802198E */  lw         $25, 0x2B8($16)
/* 12BF2C 0022BE2C 0800398F */  lw         $25, 0x8($25)
/* 12BF30 0022BE30 09F82003 */  jalr       $25
/* 12BF34 0022BE34 00000000 */   nop
/* 12BF38 0022BE38 28260072 */  paddub     $4, $16, $0
/* 12BF3C 0022BE3C 6000A527 */  addiu      $5, $sp, 0x60
/* 12BF40 0022BE40 9C91040C */  jal        GetPos__7CCameraFPf
/* 12BF44 0022BE44 00000000 */   nop
/* 12BF48 0022BE48 B000A427 */  addiu      $4, $sp, 0xB0
/* 12BF4C 0022BE4C 2A86040C */  jal        sceVu0UnitMatrix
/* 12BF50 0022BE50 00000000 */   nop
/* 12BF54 0022BE54 7000A427 */  addiu      $4, $sp, 0x70
/* 12BF58 0022BE58 B000A527 */  addiu      $5, $sp, 0xB0
/* 12BF5C 0022BE5C 2000A627 */  addiu      $6, $sp, 0x20
/* 12BF60 0022BE60 6E85040C */  jal        sceVu0MulMatrix
/* 12BF64 0022BE64 00000000 */   nop
/* 12BF68 0022BE68 7000A427 */  addiu      $4, $sp, 0x70
/* 12BF6C 0022BE6C 6000A527 */  addiu      $5, $sp, 0x60
/* 12BF70 0022BE70 E8B7040C */  jal        MGSetViewMatrix__FPA4_fPf
/* 12BF74 0022BE74 00000000 */   nop
/* 12BF78 0022BE78 1000BF7B */  lq         $31, 0x10($sp)
/* 12BF7C 0022BE7C 0000B07B */  lq         $16, 0x0($sp)
/* 12BF80 0022BE80 F000BD27 */  addiu      $sp, $sp, 0xF0
/* 12BF84 0022BE84 0800E003 */  jr         $31
/* 12BF88 0022BE88 00000000 */   nop
/* 12BF8C 0022BE8C 00000000 */  nop
