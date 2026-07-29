.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__6CBoundFfff
/* 03DE70 0013DD70 C0FFBD27 */  addiu       $29, $29, -0x40
/* 03DE74 0013DD74 2000BF7F */  sq          $31, 0x20($29)
/* 03DE78 0013DD78 1000B07F */  sq          $16, 0x10($29)
/* 03DE7C 0013DD7C 0800B6E7 */  swc1        $f22, 0x8($29)
/* 03DE80 0013DD80 0400B5E7 */  swc1        $f21, 0x4($29)
/* 03DE84 0013DD84 0000B4E7 */  swc1        $f20, 0x0($29)
/* 03DE88 0013DD88 28868070 */  paddub      $16, $4, $0
/* 03DE8C 0013DD8C 86650046 */  mov.s       $f22, $f12
/* 03DE90 0013DD90 466D0046 */  mov.s       $f21, $f13
/* 03DE94 0013DD94 06750046 */  mov.s       $f20, $f14
/* 03DE98 0013DD98 2A00023C */  lui         $2, %hi(__vt__6CBound)
/* 03DE9C 0013DD9C 80134224 */  addiu       $2, $2, %lo(__vt__6CBound)
/* 03DEA0 0013DDA0 280182AC */  sw          $2, 0x128($4)
/* 03DEA4 0013DDA4 3CF7040C */  jal         InitParam__6CBoundFv
/* 03DEA8 0013DDA8 00000000 */   nop
/* 03DEAC 0013DDAC 100016E6 */  swc1        $f22, 0x10($16)
/* 03DEB0 0013DDB0 140015E6 */  swc1        $f21, 0x14($16)
/* 03DEB4 0013DDB4 180014E6 */  swc1        $f20, 0x18($16)
/* 03DEB8 0013DDB8 100001C6 */  lwc1        $f1, 0x10($16)
/* 03DEBC 0013DDBC 00008044 */  mtc1        $0, $f0
/* 03DEC0 0013DDC0 00000000 */  nop
/* 03DEC4 0013DDC4 36080046 */  c.le.s      $f1, $f0
/* 03DEC8 0013DDC8 00000000 */  nop
/* 03DECC 0013DDCC 06000145 */  bc1t        .L0013DDE8
/* 03DED0 0013DDD0 00000000 */   nop
/* 03DED4 0013DDD4 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 03DED8 0013DDD8 00008244 */  mtc1        $2, $f0
/* 03DEDC 0013DDDC 00000000 */  nop
/* 03DEE0 0013DDE0 03001646 */  div.s       $f0, $f0, $f22
/* 03DEE4 0013DDE4 200000E6 */  swc1        $f0, 0x20($16)
.L0013DDE8:
/* 03DEE8 0013DDE8 140001C6 */  lwc1        $f1, 0x14($16)
/* 03DEEC 0013DDEC 00008044 */  mtc1        $0, $f0
/* 03DEF0 0013DDF0 00000000 */  nop
/* 03DEF4 0013DDF4 36080046 */  c.le.s      $f1, $f0
/* 03DEF8 0013DDF8 00000000 */  nop
/* 03DEFC 0013DDFC 06000145 */  bc1t        .L0013DE18
/* 03DF00 0013DE00 00000000 */   nop
/* 03DF04 0013DE04 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 03DF08 0013DE08 00008244 */  mtc1        $2, $f0
/* 03DF0C 0013DE0C 00000000 */  nop
/* 03DF10 0013DE10 03001546 */  div.s       $f0, $f0, $f21
/* 03DF14 0013DE14 240000E6 */  swc1        $f0, 0x24($16)
.L0013DE18:
/* 03DF18 0013DE18 180001C6 */  lwc1        $f1, 0x18($16)
/* 03DF1C 0013DE1C 00008044 */  mtc1        $0, $f0
/* 03DF20 0013DE20 00000000 */  nop
/* 03DF24 0013DE24 36080046 */  c.le.s      $f1, $f0
/* 03DF28 0013DE28 00000000 */  nop
/* 03DF2C 0013DE2C 06000145 */  bc1t        .L0013DE48
/* 03DF30 0013DE30 00000000 */   nop
/* 03DF34 0013DE34 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 03DF38 0013DE38 00008244 */  mtc1        $2, $f0
/* 03DF3C 0013DE3C 00000000 */  nop
/* 03DF40 0013DE40 03001446 */  div.s       $f0, $f0, $f20
/* 03DF44 0013DE44 280000E6 */  swc1        $f0, 0x28($16)
.L0013DE48:
/* 03DF48 0013DE48 2500023C */  lui         $2, %hi(LIT_741__2)
/* 03DF4C 0013DE4C 70154224 */  addiu       $2, $2, %lo(LIT_741__2)
/* 03DF50 0013DE50 3000A527 */  addiu       $5, $29, 0x30
/* 03DF54 0013DE54 00004278 */  lq          $2, 0x0($2)
/* 03DF58 0013DE58 0000A27C */  sq          $2, 0x0($5)
/* 03DF5C 0013DE5C 28260072 */  paddub      $4, $16, $0
/* 03DF60 0013DE60 28F6040C */  jal         SetDir__6CBoundFPf
/* 03DF64 0013DE64 00000000 */   nop
/* 03DF68 0013DE68 28160072 */  paddub      $2, $16, $0
/* 03DF6C 0013DE6C 2000BF7B */  lq          $31, 0x20($29)
/* 03DF70 0013DE70 1000B07B */  lq          $16, 0x10($29)
/* 03DF74 0013DE74 0800B6C7 */  lwc1        $f22, 0x8($29)
/* 03DF78 0013DE78 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 03DF7C 0013DE7C 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 03DF80 0013DE80 4000BD27 */  addiu       $29, $29, 0x40
/* 03DF84 0013DE84 0800E003 */  jr          $31
/* 03DF88 0013DE88 00000000 */   nop
/* 03DF8C 0013DE8C 00000000 */  nop
