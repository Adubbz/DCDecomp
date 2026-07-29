.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Draw_Fire__14CWeaponElementFv
/* 0BA400 001BA300 00FFBD27 */  addiu       $29, $29, -0x100
/* 0BA404 001BA304 8000BF7F */  sq          $31, 0x80($29)
/* 0BA408 001BA308 7000B77F */  sq          $23, 0x70($29)
/* 0BA40C 001BA30C 6000B67F */  sq          $22, 0x60($29)
/* 0BA410 001BA310 5000B57F */  sq          $21, 0x50($29)
/* 0BA414 001BA314 4000B47F */  sq          $20, 0x40($29)
/* 0BA418 001BA318 3000B37F */  sq          $19, 0x30($29)
/* 0BA41C 001BA31C 2000B27F */  sq          $18, 0x20($29)
/* 0BA420 001BA320 1000B17F */  sq          $17, 0x10($29)
/* 0BA424 001BA324 0000B07F */  sq          $16, 0x0($29)
/* 0BA428 001BA328 28AE8070 */  paddub      $21, $4, $0
/* 0BA42C 001BA32C C701023C */  lui         $2, %hi(TexManager)
/* 0BA430 001BA330 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0BA434 001BA334 2A00023C */  lui         $2, %hi(LIT_1182)
/* 0BA438 001BA338 88BC4524 */  addiu       $5, $2, %lo(LIT_1182)
/* 0BA43C 001BA33C FFFF0624 */  addiu       $6, $0, -0x1
/* 0BA440 001BA340 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0BA444 001BA344 00000000 */   nop
/* 0BA448 001BA348 28864070 */  paddub      $16, $2, $0
/* 0BA44C 001BA34C D000A427 */  addiu       $4, $29, 0xD0
/* 0BA450 001BA350 1000A526 */  addiu       $5, $21, 0x10
/* 0BA454 001BA354 0C86040C */  jal         sceVu0CopyVector
/* 0BA458 001BA358 00000000 */   nop
/* 0BA45C 001BA35C 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 0BA460 001BA360 EC00A3AF */  sw          $3, 0xEC($29)
/* 0BA464 001BA364 288E0070 */  paddub      $17, $0, $0
/* 0BA468 001BA368 50000010 */  b           .L001BA4AC
/* 0BA46C 001BA36C 00000000 */   nop
.L001BA370:
/* 0BA470 001BA370 40181100 */  sll         $3, $17, 1
/* 0BA474 001BA374 21187500 */  addu        $3, $3, $21
/* 0BA478 001BA378 FA067284 */  lh          $18, 0x6FA($3)
/* 0BA47C 001BA37C 80181100 */  sll         $3, $17, 2
/* 0BA480 001BA380 21187500 */  addu        $3, $3, $21
/* 0BA484 001BA384 20057424 */  addiu       $20, $3, 0x520
/* 0BA488 001BA388 200561C4 */  lwc1        $f1, 0x520($3)
/* 0BA48C 001BA38C 00008044 */  mtc1        $0, $f0
/* 0BA490 001BA390 00000000 */  nop
/* 0BA494 001BA394 36080046 */  c.le.s      $f1, $f0
/* 0BA498 001BA398 00000000 */  nop
/* 0BA49C 001BA39C 42000145 */  bc1t        .L001BA4A8
/* 0BA4A0 001BA3A0 00000000 */   nop
/* 0BA4A4 001BA3A4 200461C4 */  lwc1        $f1, 0x420($3)
/* 0BA4A8 001BA3A8 A00460C4 */  lwc1        $f0, 0x4A0($3)
/* 0BA4AC 001BA3AC 42080046 */  mul.s       $f1, $f1, $f0
/* 0BA4B0 001BA3B0 B005A0C6 */  lwc1        $f0, 0x5B0($21)
/* 0BA4B4 001BA3B4 02030146 */  mul.s       $f12, $f0, $f1
/* 0BA4B8 001BA3B8 00111100 */  sll         $2, $17, 4
/* 0BA4BC 001BA3BC 21105500 */  addu        $2, $2, $21
/* 0BA4C0 001BA3C0 200041C4 */  lwc1        $f1, 0x20($2)
/* 0BA4C4 001BA3C4 D000A0C7 */  lwc1        $f0, 0xD0($29)
/* 0BA4C8 001BA3C8 00000146 */  add.s       $f0, $f0, $f1
/* 0BA4CC 001BA3CC E000A0E7 */  swc1        $f0, 0xE0($29)
/* 0BA4D0 001BA3D0 240041C4 */  lwc1        $f1, 0x24($2)
/* 0BA4D4 001BA3D4 D400A0C7 */  lwc1        $f0, 0xD4($29)
/* 0BA4D8 001BA3D8 00000146 */  add.s       $f0, $f0, $f1
/* 0BA4DC 001BA3DC E400A0E7 */  swc1        $f0, 0xE4($29)
/* 0BA4E0 001BA3E0 280041C4 */  lwc1        $f1, 0x28($2)
/* 0BA4E4 001BA3E4 D800A0C7 */  lwc1        $f0, 0xD8($29)
/* 0BA4E8 001BA3E8 00000146 */  add.s       $f0, $f0, $f1
/* 0BA4EC 001BA3EC E800A0E7 */  swc1        $f0, 0xE8($29)
/* 0BA4F0 001BA3F0 C000B327 */  addiu       $19, $29, 0xC0
/* 0BA4F4 001BA3F4 0040023C */  lui         $2, (0x40000000 >> 16)
/* 0BA4F8 001BA3F8 00008244 */  mtc1        $2, $f0
/* 0BA4FC 001BA3FC 00000000 */  nop
/* 0BA500 001BA400 43630046 */  div.s       $f13, $f12, $f0
/* 0BA504 001BA404 9000A427 */  addiu       $4, $29, 0x90
/* 0BA508 001BA408 282E6072 */  paddub      $5, $19, $0
/* 0BA50C 001BA40C E000A627 */  addiu       $6, $29, 0xE0
/* 0BA510 001BA410 283E0070 */  paddub      $7, $0, $0
/* 0BA514 001BA414 D0B9040C */  jal         MGRotTransPers3DSprite__FPiPiPfffi
/* 0BA518 001BA418 00000000 */   nop
/* 0BA51C 001BA41C 01000324 */  addiu       $3, $0, 0x1
/* 0BA520 001BA420 21004314 */  bne         $2, $3, .L001BA4A8
/* 0BA524 001BA424 00000000 */   nop
/* 0BA528 001BA428 0000628E */  lw          $2, 0x0($19)
/* 0BA52C 001BA42C A000B627 */  addiu       $22, $29, 0xA0
/* 0BA530 001BA430 0000C2AE */  sw          $2, 0x0($22)
/* 0BA534 001BA434 9400A28F */  lw          $2, 0x94($29)
/* 0BA538 001BA438 A400A2AF */  sw          $2, 0xA4($29)
/* 0BA53C 001BA43C 9800A28F */  lw          $2, 0x98($29)
/* 0BA540 001BA440 A800A2AF */  sw          $2, 0xA8($29)
/* 0BA544 001BA444 9000A28F */  lw          $2, 0x90($29)
/* 0BA548 001BA448 B000B727 */  addiu       $23, $29, 0xB0
/* 0BA54C 001BA44C 0000E2AE */  sw          $2, 0x0($23)
/* 0BA550 001BA450 C400A28F */  lw          $2, 0xC4($29)
/* 0BA554 001BA454 B400A2AF */  sw          $2, 0xB4($29)
/* 0BA558 001BA458 C800A28F */  lw          $2, 0xC8($29)
/* 0BA55C 001BA45C B800A2AF */  sw          $2, 0xB8($29)
/* 0BA560 001BA460 30000224 */  addiu       $2, $0, 0x30
/* 0BA564 001BA464 F000A2AF */  sw          $2, 0xF0($29)
/* 0BA568 001BA468 F400B2AF */  sw          $18, 0xF4($29)
/* 0BA56C 001BA46C F800A2AF */  sw          $2, 0xF8($29)
/* 0BA570 001BA470 FC00A2AF */  sw          $2, 0xFC($29)
/* 0BA574 001BA474 00008CC6 */  lwc1        $f12, 0x0($20)
/* 0BA578 001BA478 5044040C */  jal         fptoui
/* 0BA57C 001BA47C 00000000 */   nop
/* 0BA580 001BA480 D48B848F */  lw          $4, -0x742C($28)
/* 0BA584 001BA484 282E0072 */  paddub      $5, $16, $0
/* 0BA588 001BA488 F000A627 */  addiu       $6, $29, 0xF0
/* 0BA58C 001BA48C 9000A727 */  addiu       $7, $29, 0x90
/* 0BA590 001BA490 2846C072 */  paddub      $8, $22, $0
/* 0BA594 001BA494 284EE072 */  paddub      $9, $23, $0
/* 0BA598 001BA498 28566072 */  paddub      $10, $19, $0
/* 0BA59C 001BA49C 285E4070 */  paddub      $11, $2, $0
/* 0BA5A0 001BA4A0 1C75050C */  jal         set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* 0BA5A4 001BA4A4 00000000 */   nop
.L001BA4A8:
/* 0BA5A8 001BA4A8 01003126 */  addiu       $17, $17, 0x1
.L001BA4AC:
/* 0BA5AC 001BA4AC 2000232A */  slti        $3, $17, 0x20
/* 0BA5B0 001BA4B0 AFFF6014 */  bnez        $3, .L001BA370
/* 0BA5B4 001BA4B4 00000000 */   nop
/* 0BA5B8 001BA4B8 8000BF7B */  lq          $31, 0x80($29)
/* 0BA5BC 001BA4BC 7000B77B */  lq          $23, 0x70($29)
/* 0BA5C0 001BA4C0 6000B67B */  lq          $22, 0x60($29)
/* 0BA5C4 001BA4C4 5000B57B */  lq          $21, 0x50($29)
/* 0BA5C8 001BA4C8 4000B47B */  lq          $20, 0x40($29)
/* 0BA5CC 001BA4CC 3000B37B */  lq          $19, 0x30($29)
/* 0BA5D0 001BA4D0 2000B27B */  lq          $18, 0x20($29)
/* 0BA5D4 001BA4D4 1000B17B */  lq          $17, 0x10($29)
/* 0BA5D8 001BA4D8 0000B07B */  lq          $16, 0x0($29)
/* 0BA5DC 001BA4DC 0001BD27 */  addiu       $29, $29, 0x100
/* 0BA5E0 001BA4E0 0800E003 */  jr          $31
/* 0BA5E4 001BA4E4 00000000 */   nop
/* 0BA5E8 001BA4E8 00000000 */  nop
/* 0BA5EC 001BA4EC 00000000 */  nop
