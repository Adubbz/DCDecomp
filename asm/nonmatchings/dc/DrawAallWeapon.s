.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawAallWeapon__FiifP10CCharacterP11WEAPON_HAVEiii
/* FB300 001FB200 20FFBD27 */  addiu      $sp, $sp, -0xE0
/* FB304 001FB204 9000BF7F */  sq         $31, 0x90($sp)
/* FB308 001FB208 8000B77F */  sq         $23, 0x80($sp)
/* FB30C 001FB20C 7000B67F */  sq         $22, 0x70($sp)
/* FB310 001FB210 6000B57F */  sq         $21, 0x60($sp)
/* FB314 001FB214 5000B47F */  sq         $20, 0x50($sp)
/* FB318 001FB218 4000B37F */  sq         $19, 0x40($sp)
/* FB31C 001FB21C 3000B27F */  sq         $18, 0x30($sp)
/* FB320 001FB220 2000B17F */  sq         $17, 0x20($sp)
/* FB324 001FB224 1000B07F */  sq         $16, 0x10($sp)
/* FB328 001FB228 0800B6E7 */  swc1       $f22, 0x8($sp)
/* FB32C 001FB22C 0400B5E7 */  swc1       $f21, 0x4($sp)
/* FB330 001FB230 0000B4E7 */  swc1       $f20, 0x0($sp)
/* FB334 001FB234 288E8070 */  paddub     $17, $4, $0
/* FB338 001FB238 2886A070 */  paddub     $16, $5, $0
/* FB33C 001FB23C 46650046 */  mov.s      $f21, $f12
/* FB340 001FB240 2896C070 */  paddub     $18, $6, $0
/* FB344 001FB244 28AEE070 */  paddub     $21, $7, $0
/* FB348 001FB248 28B60071 */  paddub     $22, $8, $0
/* FB34C 001FB24C 28A62071 */  paddub     $20, $9, $0
/* FB350 001FB250 289E4071 */  paddub     $19, $10, $0
/* FB354 001FB254 3201A012 */  beqz       $21, .L001FB720
/* FB358 001FB258 00000000 */   nop
/* FB35C 001FB25C 0095848F */  lw         $4, -0x6B00($gp)
/* FB360 001FB260 38B4080C */  jal        MenuTextureReload__Fi
/* FB364 001FB264 00000000 */   nop
/* FB368 001FB268 00A08044 */  mtc1       $0, $f20
/* FB36C 001FB26C 2900023C */  lui        $2, %hi(_2127_3)
/* FB370 001FB270 E0314224 */  addiu      $2, $2, %lo(_2127_3)
/* FB374 001FB274 A000A327 */  addiu      $3, $sp, 0xA0
/* FB378 001FB278 00004278 */  lq         $2, 0x0($2)
/* FB37C 001FB27C 0000627C */  sq         $2, 0x0($3)
/* FB380 001FB280 A000B5E7 */  swc1       $f21, 0xA0($sp)
/* FB384 001FB284 92004012 */  beqz       $18, .L001FB4D0
/* FB388 001FB288 00000000 */   nop
/* FB38C 001FB28C 1900C012 */  beqz       $22, .L001FB2F4
/* FB390 001FB290 00000000 */   nop
/* FB394 001FB294 78958CC7 */  lwc1       $f12, -0x6A88($gp)
/* FB398 001FB298 2876040C */  jal        sinf
/* FB39C 001FB29C 00000000 */   nop
/* FB3A0 001FB2A0 F08281C7 */  lwc1       $f1, -0x7D10($gp)
/* FB3A4 001FB2A4 00080046 */  add.s      $f0, $f1, $f0
/* FB3A8 001FB2A8 A400A0E7 */  swc1       $f0, 0xA4($sp)
/* FB3AC 001FB2AC 789581C7 */  lwc1       $f1, -0x6A88($gp)
/* FB3B0 001FB2B0 F48280C7 */  lwc1       $f0, -0x7D0C($gp)
/* FB3B4 001FB2B4 00080046 */  add.s      $f0, $f1, $f0
/* FB3B8 001FB2B8 789580E7 */  swc1       $f0, -0x6A88($gp)
/* FB3BC 001FB2BC B08081C7 */  lwc1       $f1, -0x7F50($gp)
/* FB3C0 001FB2C0 789580C7 */  lwc1       $f0, -0x6A88($gp)
/* FB3C4 001FB2C4 36080046 */  c.le.s     $f1, $f0
/* FB3C8 001FB2C8 00000000 */  nop
/* FB3CC 001FB2CC 02000045 */  bc1f       .L001FB2D8
/* FB3D0 001FB2D0 00000000 */   nop
/* FB3D4 001FB2D4 789581E7 */  swc1       $f1, -0x6A88($gp)
.L001FB2D8:
/* FB3D8 001FB2D8 B08081C7 */  lwc1       $f1, -0x7F50($gp)
/* FB3DC 001FB2DC 789580C7 */  lwc1       $f0, -0x6A88($gp)
/* FB3E0 001FB2E0 32080046 */  c.eq.s     $f1, $f0
/* FB3E4 001FB2E4 00000000 */  nop
/* FB3E8 001FB2E8 02000145 */  bc1t       .L001FB2F4
/* FB3EC 001FB2EC 00000000 */   nop
/* FB3F0 001FB2F0 00A08044 */  mtc1       $0, $f20
.L001FB2F4:
/* FB3F4 001FB2F4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FB3F8 001FB2F8 75EA2380 */  lb         $3, -0x158B($at)
/* FB3FC 001FB2FC 80100300 */  sll        $2, $3, 2
/* FB400 001FB300 21104300 */  addu       $2, $2, $3
/* FB404 001FB304 C0180200 */  sll        $3, $2, 3
/* FB408 001FB308 2900023C */  lui        $2, %hi(MenuWepPolyOffset)
/* FB40C 001FB30C C02B4224 */  addiu      $2, $2, %lo(MenuWepPolyOffset)
/* FB410 001FB310 21B84300 */  addu       $23, $2, $3
/* FB414 001FB314 A000A1C7 */  lwc1       $f1, 0xA0($sp)
/* FB418 001FB318 0000E0C6 */  lwc1       $f0, 0x0($23)
/* FB41C 001FB31C 00080046 */  add.s      $f0, $f1, $f0
/* FB420 001FB320 A000A0E7 */  swc1       $f0, 0xA0($sp)
/* FB424 001FB324 0400E1C6 */  lwc1       $f1, 0x4($23)
/* FB428 001FB328 A400A0C7 */  lwc1       $f0, 0xA4($sp)
/* FB42C 001FB32C 00000146 */  add.s      $f0, $f0, $f1
/* FB430 001FB330 A400A0E7 */  swc1       $f0, 0xA4($sp)
/* FB434 001FB334 28264072 */  paddub     $4, $18, $0
/* FB438 001FB338 A000A527 */  addiu      $5, $sp, 0xA0
/* FB43C 001FB33C A000598E */  lw         $25, 0xA0($18)
/* FB440 001FB340 1400398F */  lw         $25, 0x14($25)
/* FB444 001FB344 09F82003 */  jalr       $25
/* FB448 001FB348 00000000 */   nop
/* FB44C 001FB34C 0C00ECC6 */  lwc1       $f12, 0xC($23)
/* FB450 001FB350 28264072 */  paddub     $4, $18, $0
/* FB454 001FB354 46630046 */  mov.s      $f13, $f12
/* FB458 001FB358 86630046 */  mov.s      $f14, $f12
/* FB45C 001FB35C A000598E */  lw         $25, 0xA0($18)
/* FB460 001FB360 8400398F */  lw         $25, 0x84($25)
/* FB464 001FB364 09F82003 */  jalr       $25
/* FB468 001FB368 00000000 */   nop
/* FB46C 001FB36C 1A008012 */  beqz       $20, .L001FB3D8
/* FB470 001FB370 00000000 */   nop
/* FB474 001FB374 F896838F */  lw         $3, -0x6908($gp)
/* FB478 001FB378 DB000224 */  addiu      $2, $0, 0xDB
/* FB47C 001FB37C 1A006200 */  div        $0, $3, $2
/* FB480 001FB380 00000000 */  nop
/* FB484 001FB384 00000000 */  nop
/* FB488 001FB388 10100000 */  mfhi       $2
/* FB48C 001FB38C 92FF4424 */  addiu      $4, $2, -0x6E
/* FB490 001FB390 FC40040C */  jal        litodp
/* FB494 001FB394 00000000 */   nop
/* FB498 001FB398 188084DF */  ld         $4, -0x7FE8($gp)
/* FB49C 001FB39C 282E4070 */  paddub     $5, $2, $0
/* FB4A0 001FB3A0 9E3F040C */  jal        dpmul
/* FB4A4 001FB3A4 00000000 */   nop
/* FB4A8 001FB3A8 28BE4070 */  paddub     $23, $2, $0
/* FB4AC 001FB3AC 6E000424 */  addiu      $4, $0, 0x6E
/* FB4B0 001FB3B0 FC40040C */  jal        litodp
/* FB4B4 001FB3B4 00000000 */   nop
/* FB4B8 001FB3B8 2826E072 */  paddub     $4, $23, $0
/* FB4BC 001FB3BC 282E4070 */  paddub     $5, $2, $0
/* FB4C0 001FB3C0 4840040C */  jal        dpdiv
/* FB4C4 001FB3C4 00000000 */   nop
/* FB4C8 001FB3C8 28264070 */  paddub     $4, $2, $0
/* FB4CC 001FB3CC 9241040C */  jal        dptofp
/* FB4D0 001FB3D0 00000000 */   nop
/* FB4D4 001FB3D4 06050046 */  mov.s      $f20, $f0
.L001FB3D8:
/* FB4D8 001FB3D8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* FB4DC 001FB3DC E2BB2384 */  lh         $3, -0x441E($at)
/* FB4E0 001FB3E0 FFFF0224 */  addiu      $2, $0, -0x1
/* FB4E4 001FB3E4 07006210 */  beq        $3, $2, .L001FB404
/* FB4E8 001FB3E8 00000000 */   nop
/* FB4EC 001FB3EC 03000224 */  addiu      $2, $0, 0x3
/* FB4F0 001FB3F0 04006210 */  beq        $3, $2, .L001FB404
/* FB4F4 001FB3F4 00000000 */   nop
/* FB4F8 001FB3F8 02000224 */  addiu      $2, $0, 0x2
/* FB4FC 001FB3FC 2F006214 */  bne        $3, $2, .L001FB4BC
/* FB500 001FB400 00000000 */   nop
.L001FB404:
/* FB504 001FB404 F88295C7 */  lwc1       $f21, -0x7D08($gp)
/* FB508 001FB408 06AB0046 */  mov.s      $f12, $f21
/* FB50C 001FB40C 9044040C */  jal        fptodp
/* FB510 001FB410 00000000 */   nop
/* FB514 001FB414 188085DF */  ld         $5, -0x7FE8($gp)
/* FB518 001FB418 28264070 */  paddub     $4, $2, $0
/* FB51C 001FB41C 5800040C */  jal        _dpfgt
/* FB520 001FB420 00000000 */   nop
/* FB524 001FB424 03004010 */  beqz       $2, .L001FB434
/* FB528 001FB428 00000000 */   nop
/* FB52C 001FB42C B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* FB530 001FB430 41AD0046 */  sub.s      $f21, $f21, $f0
.L001FB434:
/* FB534 001FB434 00008044 */  mtc1       $0, $f0
/* FB538 001FB438 00000000 */  nop
/* FB53C 001FB43C 00051446 */  add.s      $f20, $f0, $f20
/* FB540 001FB440 06A30046 */  mov.s      $f12, $f20
/* FB544 001FB444 9044040C */  jal        fptodp
/* FB548 001FB448 00000000 */   nop
/* FB54C 001FB44C 188085DF */  ld         $5, -0x7FE8($gp)
/* FB550 001FB450 28264070 */  paddub     $4, $2, $0
/* FB554 001FB454 5800040C */  jal        _dpfgt
/* FB558 001FB458 00000000 */   nop
/* FB55C 001FB45C 03004010 */  beqz       $2, .L001FB46C
/* FB560 001FB460 00000000 */   nop
/* FB564 001FB464 B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* FB568 001FB468 01A50046 */  sub.s      $f20, $f20, $f0
.L001FB46C:
/* FB56C 001FB46C FC8296C7 */  lwc1       $f22, -0x7D04($gp)
/* FB570 001FB470 06B30046 */  mov.s      $f12, $f22
/* FB574 001FB474 9044040C */  jal        fptodp
/* FB578 001FB478 00000000 */   nop
/* FB57C 001FB47C 188085DF */  ld         $5, -0x7FE8($gp)
/* FB580 001FB480 28264070 */  paddub     $4, $2, $0
/* FB584 001FB484 5800040C */  jal        _dpfgt
/* FB588 001FB488 00000000 */   nop
/* FB58C 001FB48C 03004010 */  beqz       $2, .L001FB49C
/* FB590 001FB490 00000000 */   nop
/* FB594 001FB494 B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* FB598 001FB498 81B50046 */  sub.s      $f22, $f22, $f0
.L001FB49C:
/* FB59C 001FB49C 28264072 */  paddub     $4, $18, $0
/* FB5A0 001FB4A0 06AB0046 */  mov.s      $f12, $f21
/* FB5A4 001FB4A4 46A30046 */  mov.s      $f13, $f20
/* FB5A8 001FB4A8 86B30046 */  mov.s      $f14, $f22
/* FB5AC 001FB4AC A000598E */  lw         $25, 0xA0($18)
/* FB5B0 001FB4B0 3000398F */  lw         $25, 0x30($25)
/* FB5B4 001FB4B4 09F82003 */  jalr       $25
/* FB5B8 001FB4B8 00000000 */   nop
.L001FB4BC:
/* FB5BC 001FB4BC 28264072 */  paddub     $4, $18, $0
/* FB5C0 001FB4C0 A000598E */  lw         $25, 0xA0($18)
/* FB5C4 001FB4C4 AC00398F */  lw         $25, 0xAC($25)
/* FB5C8 001FB4C8 09F82003 */  jalr       $25
/* FB5CC 001FB4CC 00000000 */   nop
.L001FB4D0:
/* FB5D0 001FB4D0 E094848F */  lw         $4, -0x6B20($gp)
/* FB5D4 001FB4D4 38B4080C */  jal        MenuTextureReload__Fi
/* FB5D8 001FB4D8 00000000 */   nop
/* FB5DC 001FB4DC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FB5E0 001FB4E0 72EA2484 */  lh         $4, -0x158E($at)
/* FB5E4 001FB4E4 0C00812C */  sltiu      $at, $4, 0xC
/* FB5E8 001FB4E8 16002010 */  beqz       $at, .L001FB544
/* FB5EC 001FB4EC 00000000 */   nop
/* FB5F0 001FB4F0 2A00023C */  lui        $2, %hi(_2194)
/* FB5F4 001FB4F4 00D84324 */  addiu      $3, $2, %lo(_2194)
/* FB5F8 001FB4F8 80100400 */  sll        $2, $4, 2
/* FB5FC 001FB4FC 21104300 */  addu       $2, $2, $3
/* FB600 001FB500 0000428C */  lw         $2, 0x0($2)
/* FB604 001FB504 08004000 */  jr         $2
/* FB608 001FB508 00000000 */   nop
/* FB60C 001FB50C 02003226 */  addiu      $18, $17, 0x2
/* FB610 001FB510 66000526 */  addiu      $5, $16, 0x66
/* FB614 001FB514 28264072 */  paddub     $4, $18, $0
/* FB618 001FB518 2836A072 */  paddub     $6, $21, $0
/* FB61C 001FB51C 283EC072 */  paddub     $7, $22, $0
/* FB620 001FB520 28466072 */  paddub     $8, $19, $0
/* FB624 001FB524 7CE4070C */  jal        DrawWepStatus__FiiP11WEAPON_HAVEii
/* FB628 001FB528 00000000 */   nop
/* FB62C 001FB52C 14000526 */  addiu      $5, $16, 0x14
/* FB630 001FB530 28262072 */  paddub     $4, $17, $0
/* FB634 001FB534 2836A072 */  paddub     $6, $21, $0
/* FB638 001FB538 283E6072 */  paddub     $7, $19, $0
/* FB63C 001FB53C B4E4070C */  jal        DrawWepVolumeDisplay__FiiP11WEAPON_HAVEi
/* FB640 001FB540 00000000 */   nop
.L001FB544:
/* FB644 001FB544 EFFF2426 */  addiu      $4, $17, -0x11
/* FB648 001FB548 CEFF0526 */  addiu      $5, $16, -0x32
/* FB64C 001FB54C 2836C072 */  paddub     $6, $22, $0
/* FB650 001FB550 283E6072 */  paddub     $7, $19, $0
/* FB654 001FB554 80000824 */  addiu      $8, $0, 0x80
/* FB658 001FB558 60E5070C */  jal        DrawWeaponNameBoard__Fiiiii
/* FB65C 001FB55C 00000000 */   nop
/* FB660 001FB560 1500C012 */  beqz       $22, .L001FB5B8
/* FB664 001FB564 00000000 */   nop
/* FB668 001FB568 D4000224 */  addiu      $2, $0, 0xD4
/* FB66C 001FB56C C000A2AF */  sw         $2, 0xC0($sp)
/* FB670 001FB570 41010224 */  addiu      $2, $0, 0x141
/* FB674 001FB574 C400A2AF */  sw         $2, 0xC4($sp)
/* FB678 001FB578 40000424 */  addiu      $4, $0, 0x40
/* FB67C 001FB57C C800A4AF */  sw         $4, 0xC8($sp)
/* FB680 001FB580 17000324 */  addiu      $3, $0, 0x17
/* FB684 001FB584 CC00A3AF */  sw         $3, 0xCC($sp)
/* FB688 001FB588 0A002226 */  addiu      $2, $17, 0xA
/* FB68C 001FB58C B000A2AF */  sw         $2, 0xB0($sp)
/* FB690 001FB590 EBFF0226 */  addiu      $2, $16, -0x15
/* FB694 001FB594 B400A2AF */  sw         $2, 0xB4($sp)
/* FB698 001FB598 B800A4AF */  sw         $4, 0xB8($sp)
/* FB69C 001FB59C BC00A3AF */  sw         $3, 0xBC($sp)
/* FB6A0 001FB5A0 2C95848F */  lw         $4, -0x6AD4($gp)
/* FB6A4 001FB5A4 B000A527 */  addiu      $5, $sp, 0xB0
/* FB6A8 001FB5A8 C000A627 */  addiu      $6, $sp, 0xC0
/* FB6AC 001FB5AC 283E6072 */  paddub     $7, $19, $0
/* FB6B0 001FB5B0 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* FB6B4 001FB5B4 00000000 */   nop
.L001FB5B8:
/* FB6B8 001FB5B8 04002426 */  addiu      $4, $17, 0x4
/* FB6BC 001FB5BC 3C000526 */  addiu      $5, $16, 0x3C
/* FB6C0 001FB5C0 2836A072 */  paddub     $6, $21, $0
/* FB6C4 001FB5C4 283E6072 */  paddub     $7, $19, $0
/* FB6C8 001FB5C8 883E080C */  jal        WeaponStarDraw__FiiP11WEAPON_HAVEi
/* FB6CC 001FB5CC 00000000 */   nop
/* FB6D0 001FB5D0 09008012 */  beqz       $20, .L001FB5F8
/* FB6D4 001FB5D4 00000000 */   nop
/* FB6D8 001FB5D8 BE002226 */  addiu      $2, $17, 0xBE
/* FB6DC 001FB5DC D901013C */  lui        $at, (0x1D903F8 >> 16)
/* FB6E0 001FB5E0 F80322AC */  sw         $2, (0x1D903F8 & 0xFFFF)($at)
/* FB6E4 001FB5E4 0E000226 */  addiu      $2, $16, 0xE
/* FB6E8 001FB5E8 D901013C */  lui        $at, (0x1D903FC >> 16)
/* FB6EC 001FB5EC FC0322AC */  sw         $2, (0x1D903FC & 0xFFFF)($at)
/* FB6F0 001FB5F0 0C000010 */  b          .L001FB624
/* FB6F4 001FB5F4 00000000 */   nop
.L001FB5F8:
/* FB6F8 001FB5F8 80020224 */  addiu      $2, $0, 0x280
/* FB6FC 001FB5FC D901013C */  lui        $at, (0x1D903F8 >> 16)
/* FB700 001FB600 F80322AC */  sw         $2, (0x1D903F8 & 0xFFFF)($at)
/* FB704 001FB604 D901013C */  lui        $at, (0x1D903FC >> 16)
/* FB708 001FB608 FC0320AC */  sw         $0, (0x1D903FC & 0xFFFF)($at)
/* FB70C 001FB60C 50002526 */  addiu      $5, $17, 0x50
/* FB710 001FB610 EEFF0626 */  addiu      $6, $16, -0x12
/* FB714 001FB614 2826A072 */  paddub     $4, $21, $0
/* FB718 001FB618 283E6072 */  paddub     $7, $19, $0
/* FB71C 001FB61C FC3D080C */  jal        WeaponOptionStatusDraw__FP11WEAPON_HAVEiii
/* FB720 001FB620 00000000 */   nop
.L001FB624:
/* FB724 001FB624 09008012 */  beqz       $20, .L001FB64C
/* FB728 001FB628 00000000 */   nop
/* FB72C 001FB62C A0002226 */  addiu      $2, $17, 0xA0
/* FB730 001FB630 D901013C */  lui        $at, (0x1D903F8 >> 16)
/* FB734 001FB634 F80322AC */  sw         $2, (0x1D903F8 & 0xFFFF)($at)
/* FB738 001FB638 0E000226 */  addiu      $2, $16, 0xE
/* FB73C 001FB63C D901013C */  lui        $at, (0x1D903FC >> 16)
/* FB740 001FB640 FC0322AC */  sw         $2, (0x1D903FC & 0xFFFF)($at)
/* FB744 001FB644 07000010 */  b          .L001FB664
/* FB748 001FB648 00000000 */   nop
.L001FB64C:
/* FB74C 001FB64C 50002526 */  addiu      $5, $17, 0x50
/* FB750 001FB650 EEFF0626 */  addiu      $6, $16, -0x12
/* FB754 001FB654 2826A072 */  paddub     $4, $21, $0
/* FB758 001FB658 283E6072 */  paddub     $7, $19, $0
/* FB75C 001FB65C FC3D080C */  jal        WeaponOptionStatusDraw__FP11WEAPON_HAVEiii
/* FB760 001FB660 00000000 */   nop
.L001FB664:
/* FB764 001FB664 D800A327 */  addiu      $3, $sp, 0xD8
/* FB768 001FB668 808882DF */  ld         $2, -0x7780($gp)
/* FB76C 001FB66C 000062FC */  sd         $2, 0x0($3)
/* FB770 001FB670 0000A486 */  lh         $4, 0x0($21)
/* FB774 001FB674 C4C7080C */  jal        GetWeaponHoleNum__Fi
/* FB778 001FB678 00000000 */   nop
/* FB77C 001FB67C C0180200 */  sll        $3, $2, 3
/* FB780 001FB680 21106200 */  addu       $2, $3, $2
/* FB784 001FB684 40100200 */  sll        $2, $2, 1
/* FB788 001FB688 0A004224 */  addiu      $2, $2, 0xA
/* FB78C 001FB68C 00008244 */  mtc1       $2, $f0
/* FB790 001FB690 00000000 */  nop
/* FB794 001FB694 60008046 */  cvt.s.w    $f1, $f0
/* FB798 001FB698 80101400 */  sll        $2, $20, 2
/* FB79C 001FB69C 21105D00 */  addu       $2, $2, $sp
/* FB7A0 001FB6A0 D80040C4 */  lwc1       $f0, 0xD8($2)
/* FB7A4 001FB6A4 42080046 */  mul.s      $f1, $f1, $f0
/* FB7A8 001FB6A8 52002226 */  addiu      $2, $17, 0x52
/* FB7AC 001FB6AC 00008244 */  mtc1       $2, $f0
/* FB7B0 001FB6B0 00000000 */  nop
/* FB7B4 001FB6B4 20008046 */  cvt.s.w    $f0, $f0
/* FB7B8 001FB6B8 01030146 */  sub.s      $f12, $f0, $f1
/* FB7BC 001FB6BC 2C44040C */  jal        fptosi
/* FB7C0 001FB6C0 00000000 */   nop
/* FB7C4 001FB6C4 28964070 */  paddub     $18, $2, $0
/* FB7C8 001FB6C8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FB7CC 001FB6CC 72EA2384 */  lh         $3, -0x158E($at)
/* FB7D0 001FB6D0 08006328 */  slti       $3, $3, 0x8
/* FB7D4 001FB6D4 12006014 */  bnez       $3, .L001FB720
/* FB7D8 001FB6D8 00000000 */   nop
/* FB7DC 001FB6DC 28264072 */  paddub     $4, $18, $0
/* FB7E0 001FB6E0 B8000524 */  addiu      $5, $0, 0xB8
/* FB7E4 001FB6E4 2836A072 */  paddub     $6, $21, $0
/* FB7E8 001FB6E8 283E8072 */  paddub     $7, $20, $0
/* FB7EC 001FB6EC 28466072 */  paddub     $8, $19, $0
/* FB7F0 001FB6F0 B82C080C */  jal        DrawWepHole__FiiP11WEAPON_HAVEii
/* FB7F4 001FB6F4 00000000 */   nop
/* FB7F8 001FB6F8 F494848F */  lw         $4, -0x6B0C($gp)
/* FB7FC 001FB6FC 38B4080C */  jal        MenuTextureReload__Fi
/* FB800 001FB700 00000000 */   nop
/* FB804 001FB704 0E004426 */  addiu      $4, $18, 0xE
/* FB808 001FB708 BE000524 */  addiu      $5, $0, 0xBE
/* FB80C 001FB70C 2836A072 */  paddub     $6, $21, $0
/* FB810 001FB710 283E8072 */  paddub     $7, $20, $0
/* FB814 001FB714 28466072 */  paddub     $8, $19, $0
/* FB818 001FB718 20AA080C */  jal        DrawWepAttach__FiiP11WEAPON_HAVEii
/* FB81C 001FB71C 00000000 */   nop
.L001FB720:
/* FB820 001FB720 9000BF7B */  lq         $31, 0x90($sp)
/* FB824 001FB724 8000B77B */  lq         $23, 0x80($sp)
/* FB828 001FB728 7000B67B */  lq         $22, 0x70($sp)
/* FB82C 001FB72C 6000B57B */  lq         $21, 0x60($sp)
/* FB830 001FB730 5000B47B */  lq         $20, 0x50($sp)
/* FB834 001FB734 4000B37B */  lq         $19, 0x40($sp)
/* FB838 001FB738 3000B27B */  lq         $18, 0x30($sp)
/* FB83C 001FB73C 2000B17B */  lq         $17, 0x20($sp)
/* FB840 001FB740 1000B07B */  lq         $16, 0x10($sp)
/* FB844 001FB744 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* FB848 001FB748 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* FB84C 001FB74C 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* FB850 001FB750 E000BD27 */  addiu      $sp, $sp, 0xE0
/* FB854 001FB754 0800E003 */  jr         $31
/* FB858 001FB758 00000000 */   nop
/* FB85C 001FB75C 00000000 */  nop
