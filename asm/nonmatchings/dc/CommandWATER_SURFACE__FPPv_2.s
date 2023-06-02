.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandWATER_SURFACE__FPPv_2
/* A0340 001A0240 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* A0344 001A0244 2000BF7F */  sq         $31, 0x20($sp)
/* A0348 001A0248 1000B17F */  sq         $17, 0x10($sp)
/* A034C 001A024C 0000B07F */  sq         $16, 0x0($sp)
/* A0350 001A0250 288E8070 */  paddub     $17, $4, $0
/* A0354 001A0254 2893848F */  lw         $4, -0x6CD8($gp)
/* A0358 001A0258 08008128 */  slti       $at, $4, 0x8
/* A035C 001A025C 53002010 */  beqz       $at, .L001A03AC
/* A0360 001A0260 00000000 */   nop
/* A0364 001A0264 40100400 */  sll        $2, $4, 1
/* A0368 001A0268 21104400 */  addu       $2, $2, $4
/* A036C 001A026C 80190200 */  sll        $3, $2, 6
/* A0370 001A0270 9092828F */  lw         $2, -0x6D70($gp)
/* A0374 001A0274 21104300 */  addu       $2, $2, $3
/* A0378 001A0278 C03E5024 */  addiu      $16, $2, 0x3EC0
/* A037C 001A027C 01008224 */  addiu      $2, $4, 0x1
/* A0380 001A0280 289382AF */  sw         $2, -0x6CD8($gp)
/* A0384 001A0284 0000258E */  lw         $5, 0x0($17)
/* A0388 001A0288 28260072 */  paddub     $4, $16, $0
/* A038C 001A028C 5A15040C */  jal        strcpy
/* A0390 001A0290 00000000 */   nop
/* A0394 001A0294 0400238E */  lw         $3, 0x4($17)
/* A0398 001A0298 0000638C */  lw         $3, 0x0($3)
/* A039C 001A029C 100003AE */  sw         $3, 0x10($16)
/* A03A0 001A02A0 0800238E */  lw         $3, 0x8($17)
/* A03A4 001A02A4 0000638C */  lw         $3, 0x0($3)
/* A03A8 001A02A8 140003AE */  sw         $3, 0x14($16)
/* A03AC 001A02AC 0C00238E */  lw         $3, 0xC($17)
/* A03B0 001A02B0 000060C4 */  lwc1       $f0, 0x0($3)
/* A03B4 001A02B4 200000E6 */  swc1       $f0, 0x20($16)
/* A03B8 001A02B8 1000238E */  lw         $3, 0x10($17)
/* A03BC 001A02BC 000060C4 */  lwc1       $f0, 0x0($3)
/* A03C0 001A02C0 240000E6 */  swc1       $f0, 0x24($16)
/* A03C4 001A02C4 1400238E */  lw         $3, 0x14($17)
/* A03C8 001A02C8 000060C4 */  lwc1       $f0, 0x0($3)
/* A03CC 001A02CC 280000E6 */  swc1       $f0, 0x28($16)
/* A03D0 001A02D0 803F043C */  lui        $4, (0x3F800000 >> 16)
/* A03D4 001A02D4 2C0004AE */  sw         $4, 0x2C($16)
/* A03D8 001A02D8 1800238E */  lw         $3, 0x18($17)
/* A03DC 001A02DC 000060C4 */  lwc1       $f0, 0x0($3)
/* A03E0 001A02E0 300000E6 */  swc1       $f0, 0x30($16)
/* A03E4 001A02E4 1C00238E */  lw         $3, 0x1C($17)
/* A03E8 001A02E8 000060C4 */  lwc1       $f0, 0x0($3)
/* A03EC 001A02EC 340000E6 */  swc1       $f0, 0x34($16)
/* A03F0 001A02F0 2000238E */  lw         $3, 0x20($17)
/* A03F4 001A02F4 000060C4 */  lwc1       $f0, 0x0($3)
/* A03F8 001A02F8 380000E6 */  swc1       $f0, 0x38($16)
/* A03FC 001A02FC 3C0004AE */  sw         $4, 0x3C($16)
/* A0400 001A0300 2400238E */  lw         $3, 0x24($17)
/* A0404 001A0304 000060C4 */  lwc1       $f0, 0x0($3)
/* A0408 001A0308 400000E6 */  swc1       $f0, 0x40($16)
/* A040C 001A030C 2800238E */  lw         $3, 0x28($17)
/* A0410 001A0310 000060C4 */  lwc1       $f0, 0x0($3)
/* A0414 001A0314 440000E6 */  swc1       $f0, 0x44($16)
/* A0418 001A0318 2C00238E */  lw         $3, 0x2C($17)
/* A041C 001A031C 000060C4 */  lwc1       $f0, 0x0($3)
/* A0420 001A0320 480000E6 */  swc1       $f0, 0x48($16)
/* A0424 001A0324 4C0004AE */  sw         $4, 0x4C($16)
/* A0428 001A0328 3000238E */  lw         $3, 0x30($17)
/* A042C 001A032C 000060C4 */  lwc1       $f0, 0x0($3)
/* A0430 001A0330 600000E6 */  swc1       $f0, 0x60($16)
/* A0434 001A0334 3400238E */  lw         $3, 0x34($17)
/* A0438 001A0338 000060C4 */  lwc1       $f0, 0x0($3)
/* A043C 001A033C 640000E6 */  swc1       $f0, 0x64($16)
/* A0440 001A0340 3800238E */  lw         $3, 0x38($17)
/* A0444 001A0344 000060C4 */  lwc1       $f0, 0x0($3)
/* A0448 001A0348 680000E6 */  swc1       $f0, 0x68($16)
/* A044C 001A034C 3C00238E */  lw         $3, 0x3C($17)
/* A0450 001A0350 000060C4 */  lwc1       $f0, 0x0($3)
/* A0454 001A0354 6C0000E6 */  swc1       $f0, 0x6C($16)
/* A0458 001A0358 4000238E */  lw         $3, 0x40($17)
/* A045C 001A035C 0000638C */  lw         $3, 0x0($3)
/* A0460 001A0360 500003AE */  sw         $3, 0x50($16)
/* A0464 001A0364 4400238E */  lw         $3, 0x44($17)
/* A0468 001A0368 0000638C */  lw         $3, 0x0($3)
/* A046C 001A036C 540003AE */  sw         $3, 0x54($16)
/* A0470 001A0370 4800238E */  lw         $3, 0x48($17)
/* A0474 001A0374 0000638C */  lw         $3, 0x0($3)
/* A0478 001A0378 580003AE */  sw         $3, 0x58($16)
/* A047C 001A037C 4C00238E */  lw         $3, 0x4C($17)
/* A0480 001A0380 0000638C */  lw         $3, 0x0($3)
/* A0484 001A0384 700003AE */  sw         $3, 0x70($16)
/* A0488 001A0388 5000238E */  lw         $3, 0x50($17)
/* A048C 001A038C 0000638C */  lw         $3, 0x0($3)
/* A0490 001A0390 740003AE */  sw         $3, 0x74($16)
/* A0494 001A0394 5400238E */  lw         $3, 0x54($17)
/* A0498 001A0398 0000638C */  lw         $3, 0x0($3)
/* A049C 001A039C 780003AE */  sw         $3, 0x78($16)
/* A04A0 001A03A0 FFFF0324 */  addiu      $3, $0, -0x1
/* A04A4 001A03A4 180003AE */  sw         $3, 0x18($16)
/* A04A8 001A03A8 2C9390AF */  sw         $16, -0x6CD4($gp)
.L001A03AC:
/* A04AC 001A03AC 2000BF7B */  lq         $31, 0x20($sp)
/* A04B0 001A03B0 1000B17B */  lq         $17, 0x10($sp)
/* A04B4 001A03B4 0000B07B */  lq         $16, 0x0($sp)
/* A04B8 001A03B8 3000BD27 */  addiu      $sp, $sp, 0x30
/* A04BC 001A03BC 0800E003 */  jr         $31
/* A04C0 001A03C0 00000000 */   nop
/* A04C4 001A03C4 00000000 */  nop
/* A04C8 001A03C8 00000000 */  nop
/* A04CC 001A03CC 00000000 */  nop