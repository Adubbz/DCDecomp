.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__6CBoundFfff
/* 3DE70 0013DD70 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 3DE74 0013DD74 2000BF7F */  sq         $31, 0x20($sp)
/* 3DE78 0013DD78 1000B07F */  sq         $16, 0x10($sp)
/* 3DE7C 0013DD7C 0800B6E7 */  swc1       $f22, 0x8($sp)
/* 3DE80 0013DD80 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 3DE84 0013DD84 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 3DE88 0013DD88 28868070 */  paddub     $16, $4, $0
/* 3DE8C 0013DD8C 86650046 */  mov.s      $f22, $f12
/* 3DE90 0013DD90 466D0046 */  mov.s      $f21, $f13
/* 3DE94 0013DD94 06750046 */  mov.s      $f20, $f14
/* 3DE98 0013DD98 2A00023C */  lui        $2, %hi(__vt__6CBound)
/* 3DE9C 0013DD9C 80134224 */  addiu      $2, $2, %lo(__vt__6CBound)
/* 3DEA0 0013DDA0 280182AC */  sw         $2, 0x128($4)
/* 3DEA4 0013DDA4 3CF7040C */  jal        InitParam__6CBoundFv
/* 3DEA8 0013DDA8 00000000 */   nop
/* 3DEAC 0013DDAC 100016E6 */  swc1       $f22, 0x10($16)
/* 3DEB0 0013DDB0 140015E6 */  swc1       $f21, 0x14($16)
/* 3DEB4 0013DDB4 180014E6 */  swc1       $f20, 0x18($16)
/* 3DEB8 0013DDB8 100001C6 */  lwc1       $f1, 0x10($16)
/* 3DEBC 0013DDBC 00008044 */  mtc1       $0, $f0
/* 3DEC0 0013DDC0 00000000 */  nop
/* 3DEC4 0013DDC4 36080046 */  c.le.s     $f1, $f0
/* 3DEC8 0013DDC8 00000000 */  nop
/* 3DECC 0013DDCC 06000145 */  bc1t       .L0013DDE8
/* 3DED0 0013DDD0 00000000 */   nop
/* 3DED4 0013DDD4 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 3DED8 0013DDD8 00008244 */  mtc1       $2, $f0
/* 3DEDC 0013DDDC 00000000 */  nop
/* 3DEE0 0013DDE0 03001646 */  div.s      $f0, $f0, $f22
/* 3DEE4 0013DDE4 200000E6 */  swc1       $f0, 0x20($16)
.L0013DDE8:
/* 3DEE8 0013DDE8 140001C6 */  lwc1       $f1, 0x14($16)
/* 3DEEC 0013DDEC 00008044 */  mtc1       $0, $f0
/* 3DEF0 0013DDF0 00000000 */  nop
/* 3DEF4 0013DDF4 36080046 */  c.le.s     $f1, $f0
/* 3DEF8 0013DDF8 00000000 */  nop
/* 3DEFC 0013DDFC 06000145 */  bc1t       .L0013DE18
/* 3DF00 0013DE00 00000000 */   nop
/* 3DF04 0013DE04 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 3DF08 0013DE08 00008244 */  mtc1       $2, $f0
/* 3DF0C 0013DE0C 00000000 */  nop
/* 3DF10 0013DE10 03001546 */  div.s      $f0, $f0, $f21
/* 3DF14 0013DE14 240000E6 */  swc1       $f0, 0x24($16)
.L0013DE18:
/* 3DF18 0013DE18 180001C6 */  lwc1       $f1, 0x18($16)
/* 3DF1C 0013DE1C 00008044 */  mtc1       $0, $f0
/* 3DF20 0013DE20 00000000 */  nop
/* 3DF24 0013DE24 36080046 */  c.le.s     $f1, $f0
/* 3DF28 0013DE28 00000000 */  nop
/* 3DF2C 0013DE2C 06000145 */  bc1t       .L0013DE48
/* 3DF30 0013DE30 00000000 */   nop
/* 3DF34 0013DE34 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 3DF38 0013DE38 00008244 */  mtc1       $2, $f0
/* 3DF3C 0013DE3C 00000000 */  nop
/* 3DF40 0013DE40 03001446 */  div.s      $f0, $f0, $f20
/* 3DF44 0013DE44 280000E6 */  swc1       $f0, 0x28($16)
.L0013DE48:
/* 3DF48 0013DE48 2500023C */  lui        $2, %hi(_741_2)
/* 3DF4C 0013DE4C 70154224 */  addiu      $2, $2, %lo(_741_2)
/* 3DF50 0013DE50 3000A527 */  addiu      $5, $sp, 0x30
/* 3DF54 0013DE54 00004278 */  lq         $2, 0x0($2)
/* 3DF58 0013DE58 0000A27C */  sq         $2, 0x0($5)
/* 3DF5C 0013DE5C 28260072 */  paddub     $4, $16, $0
/* 3DF60 0013DE60 28F6040C */  jal        SetDir__6CBoundFPf
/* 3DF64 0013DE64 00000000 */   nop
/* 3DF68 0013DE68 28160072 */  paddub     $2, $16, $0
/* 3DF6C 0013DE6C 2000BF7B */  lq         $31, 0x20($sp)
/* 3DF70 0013DE70 1000B07B */  lq         $16, 0x10($sp)
/* 3DF74 0013DE74 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* 3DF78 0013DE78 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 3DF7C 0013DE7C 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 3DF80 0013DE80 4000BD27 */  addiu      $sp, $sp, 0x40
/* 3DF84 0013DE84 0800E003 */  jr         $31
/* 3DF88 0013DE88 00000000 */   nop
/* 3DF8C 0013DE8C 00000000 */  nop
