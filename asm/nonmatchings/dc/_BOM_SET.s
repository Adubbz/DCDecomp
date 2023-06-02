.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _BOM_SET__FP12RS_STACKDATAi
/* BD370 001BD270 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* BD374 001BD274 2000BF7F */  sq         $31, 0x20($sp)
/* BD378 001BD278 1000B17F */  sq         $17, 0x10($sp)
/* BD37C 001BD27C 0000B07F */  sq         $16, 0x0($sp)
/* BD380 001BD280 2700023C */  lui        $2, %hi(_896)
/* BD384 001BD284 00B34224 */  addiu      $2, $2, %lo(_896)
/* BD388 001BD288 4000A327 */  addiu      $3, $sp, 0x40
/* BD38C 001BD28C 00004278 */  lq         $2, 0x0($2)
/* BD390 001BD290 0000627C */  sq         $2, 0x0($3)
/* BD394 001BD294 3000A427 */  addiu      $4, $sp, 0x30
/* BD398 001BD298 EA01023C */  lui        $2, %hi(D_1EA1D30)
/* BD39C 001BD29C 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* BD3A0 001BD2A0 0C86040C */  jal        sceVu0CopyVector
/* BD3A4 001BD2A4 00000000 */   nop
/* BD3A8 001BD2A8 3400A1C7 */  lwc1       $f1, 0x34($sp)
/* BD3AC 001BD2AC 8041023C */  lui        $2, (0x41800000 >> 16)
/* BD3B0 001BD2B0 00008244 */  mtc1       $2, $f0
/* BD3B4 001BD2B4 00000000 */  nop
/* BD3B8 001BD2B8 00080046 */  add.s      $f0, $f1, $f0
/* BD3BC 001BD2BC 3400A0E7 */  swc1       $f0, 0x34($sp)
/* BD3C0 001BD2C0 3800A1C7 */  lwc1       $f1, 0x38($sp)
/* BD3C4 001BD2C4 4040023C */  lui        $2, (0x40400000 >> 16)
/* BD3C8 001BD2C8 00008244 */  mtc1       $2, $f0
/* BD3CC 001BD2CC 00000000 */  nop
/* BD3D0 001BD2D0 01080046 */  sub.s      $f0, $f1, $f0
/* BD3D4 001BD2D4 3800A0E7 */  swc1       $f0, 0x38($sp)
/* BD3D8 001BD2D8 A49D838F */  lw         $3, -0x625C($gp)
/* BD3DC 001BD2DC 80100300 */  sll        $2, $3, 2
/* BD3E0 001BD2E0 21104300 */  addu       $2, $2, $3
/* BD3E4 001BD2E4 80100200 */  sll        $2, $2, 2
/* BD3E8 001BD2E8 14004624 */  addiu      $6, $2, 0x14
/* BD3EC 001BD2EC 3000A427 */  addiu      $4, $sp, 0x30
/* BD3F0 001BD2F0 01000524 */  addiu      $5, $0, 0x1
/* BD3F4 001BD2F4 50818CC7 */  lwc1       $f12, -0x7EB0($gp)
/* BD3F8 001BD2F8 5056070C */  jal        SetBombEffect__FPfiif
/* BD3FC 001BD2FC 00000000 */   nop
/* BD400 001BD300 28864070 */  paddub     $16, $2, $0
/* BD404 001BD304 FFFF0224 */  addiu      $2, $0, -0x1
/* BD408 001BD308 0F000212 */  beq        $16, $2, .L001BD348
/* BD40C 001BD30C 00000000 */   nop
/* BD410 001BD310 F09D918F */  lw         $17, -0x6210($gp)
/* BD414 001BD314 5000A427 */  addiu      $4, $sp, 0x50
/* BD418 001BD318 4000A527 */  addiu      $5, $sp, 0x40
/* BD41C 001BD31C 9285040C */  jal        sceVu0Normalize
/* BD420 001BD320 00000000 */   nop
/* BD424 001BD324 80101000 */  sll        $2, $16, 2
/* BD428 001BD328 21105000 */  addu       $2, $2, $16
/* BD42C 001BD32C 40110200 */  sll        $2, $2, 5
/* BD430 001BD330 21102202 */  addu       $2, $17, $2
/* BD434 001BD334 20004424 */  addiu      $4, $2, 0x20
/* BD438 001BD338 5000A527 */  addiu      $5, $sp, 0x50
/* BD43C 001BD33C 50818CC7 */  lwc1       $f12, -0x7EB0($gp)
/* BD440 001BD340 4688040C */  jal        sceVu0ScaleVectorXYZ
/* BD444 001BD344 00000000 */   nop
.L001BD348:
/* BD448 001BD348 1E000224 */  addiu      $2, $0, 0x1E
/* BD44C 001BD34C DC01013C */  lui        $at, (0x1DC45C8 >> 16)
/* BD450 001BD350 C84522A4 */  sh         $2, (0x1DC45C8 & 0xFFFF)($at)
/* BD454 001BD354 01000224 */  addiu      $2, $0, 0x1
/* BD458 001BD358 2000BF7B */  lq         $31, 0x20($sp)
/* BD45C 001BD35C 1000B17B */  lq         $17, 0x10($sp)
/* BD460 001BD360 0000B07B */  lq         $16, 0x0($sp)
/* BD464 001BD364 6000BD27 */  addiu      $sp, $sp, 0x60
/* BD468 001BD368 0800E003 */  jr         $31
/* BD46C 001BD36C 00000000 */   nop
