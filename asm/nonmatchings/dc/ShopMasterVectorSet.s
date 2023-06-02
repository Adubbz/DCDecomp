.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ShopMasterVectorSet__Fi
/* E84B0 001E83B0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* E84B4 001E83B4 1000BF7F */  sq         $31, 0x10($sp)
/* E84B8 001E83B8 0000B07F */  sq         $16, 0x0($sp)
/* E84BC 001E83BC 01000224 */  addiu      $2, $0, 0x1
/* E84C0 001E83C0 0A008210 */  beq        $4, $2, .L001E83EC
/* E84C4 001E83C4 00000000 */   nop
/* E84C8 001E83C8 03008010 */  beqz       $4, .L001E83D8
/* E84CC 001E83CC 00000000 */   nop
/* E84D0 001E83D0 06000010 */  b          .L001E83EC
/* E84D4 001E83D4 00000000 */   nop
.L001E83D8:
/* E84D8 001E83D8 DA01023C */  lui        $2, %hi(MenuCamera)
/* E84DC 001E83DC D0084424 */  addiu      $4, $2, %lo(MenuCamera)
/* E84E0 001E83E0 2000A527 */  addiu      $5, $sp, 0x20
/* E84E4 001E83E4 9C91040C */  jal        GetPos__7CCameraFPf
/* E84E8 001E83E8 00000000 */   nop
.L001E83EC:
/* E84EC 001E83EC 3000A427 */  addiu      $4, $sp, 0x30
/* E84F0 001E83F0 D901023C */  lui        $2, %hi(D_1D90490)
/* E84F4 001E83F4 90044524 */  addiu      $5, $2, %lo(D_1D90490)
/* E84F8 001E83F8 0C86040C */  jal        sceVu0CopyVector
/* E84FC 001E83FC 00000000 */   nop
/* E8500 001E8400 D901023C */  lui        $2, %hi(MenuCharaFrame)
/* E8504 001E8404 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* E8508 001E8408 4000A527 */  addiu      $5, $sp, 0x40
/* E850C 001E840C BC5B050C */  jal        GetRotation__7CObjectFPf
/* E8510 001E8410 00000000 */   nop
/* E8514 001E8414 5000A427 */  addiu      $4, $sp, 0x50
/* E8518 001E8418 3000A527 */  addiu      $5, $sp, 0x30
/* E851C 001E841C 2000A627 */  addiu      $6, $sp, 0x20
/* E8520 001E8420 EE85040C */  jal        sceVu0SubVector
/* E8524 001E8424 00000000 */   nop
/* E8528 001E8428 5000A0C7 */  lwc1       $f0, 0x50($sp)
/* E852C 001E842C 07030046 */  neg.s      $f12, $f0
/* E8530 001E8430 5800A0C7 */  lwc1       $f0, 0x58($sp)
/* E8534 001E8434 47030046 */  neg.s      $f13, $f0
/* E8538 001E8438 5077040C */  jal        atan2f
/* E853C 001E843C 00000000 */   nop
/* E8540 001E8440 4400B027 */  addiu      $16, $sp, 0x44
/* E8544 001E8444 00000CC6 */  lwc1       $f12, 0x0($16)
/* E8548 001E8448 46030046 */  mov.s      $f13, $f0
/* E854C 001E844C 80808EC7 */  lwc1       $f14, -0x7F80($gp)
/* E8550 001E8450 28260070 */  paddub     $4, $0, $0
/* E8554 001E8454 748E040C */  jal        AngleInterpolate__Ffffi
/* E8558 001E8458 00000000 */   nop
/* E855C 001E845C 000000E6 */  swc1       $f0, 0x0($16)
/* E8560 001E8460 D901023C */  lui        $2, %hi(MenuCharaFrame)
/* E8564 001E8464 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* E8568 001E8468 4000A527 */  addiu      $5, $sp, 0x40
/* E856C 001E846C 78E4040C */  jal        SetRotation__10CCharacterFPf
/* E8570 001E8470 00000000 */   nop
/* E8574 001E8474 1000BF7B */  lq         $31, 0x10($sp)
/* E8578 001E8478 0000B07B */  lq         $16, 0x0($sp)
/* E857C 001E847C 6000BD27 */  addiu      $sp, $sp, 0x60
/* E8580 001E8480 0800E003 */  jr         $31
/* E8584 001E8484 00000000 */   nop
/* E8588 001E8488 00000000 */  nop
/* E858C 001E848C 00000000 */  nop
