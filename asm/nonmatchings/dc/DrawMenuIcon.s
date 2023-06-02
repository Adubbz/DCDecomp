.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMenuIcon__Fi
/* 110420 00210320 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 110424 00210324 3000BF7F */  sq         $31, 0x30($sp)
/* 110428 00210328 2000B27F */  sq         $18, 0x20($sp)
/* 11042C 0021032C 1000B17F */  sq         $17, 0x10($sp)
/* 110430 00210330 0000B07F */  sq         $16, 0x0($sp)
/* 110434 00210334 288E8070 */  paddub     $17, $4, $0
/* 110438 00210338 08898227 */  addiu      $2, $gp, -0x76F8
/* 11043C 0021033C 21104400 */  addu       $2, $2, $4
/* 110440 00210340 00004480 */  lb         $4, 0x0($2)
/* 110444 00210344 D0B7080C */  jal        GetMenuIconInfo__Fi
/* 110448 00210348 00000000 */   nop
/* 11044C 0021034C 28864070 */  paddub     $16, $2, $0
/* 110450 00210350 C0881100 */  sll        $17, $17, 3
/* 110454 00210354 DA01023C */  lui        $2, %hi(MenuIconPos)
/* 110458 00210358 20EF4224 */  addiu      $2, $2, %lo(MenuIconPos)
/* 11045C 0021035C 21105100 */  addu       $2, $2, $17
/* 110460 00210360 000041C4 */  lwc1       $f1, 0x0($2)
/* 110464 00210364 C040023C */  lui        $2, (0x40C00000 >> 16)
/* 110468 00210368 00008244 */  mtc1       $2, $f0
/* 11046C 0021036C 00000000 */  nop
/* 110470 00210370 010B0046 */  sub.s      $f12, $f1, $f0
/* 110474 00210374 2C44040C */  jal        fptosi
/* 110478 00210378 00000000 */   nop
/* 11047C 0021037C 28964070 */  paddub     $18, $2, $0
/* 110480 00210380 DA01023C */  lui        $2, %hi(D_1D9EF24)
/* 110484 00210384 24EF4224 */  addiu      $2, $2, %lo(D_1D9EF24)
/* 110488 00210388 21105100 */  addu       $2, $2, $17
/* 11048C 0021038C 000041C4 */  lwc1       $f1, 0x0($2)
/* 110490 00210390 8040023C */  lui        $2, (0x40800000 >> 16)
/* 110494 00210394 00008244 */  mtc1       $2, $f0
/* 110498 00210398 00000000 */  nop
/* 11049C 0021039C 010B0046 */  sub.s      $f12, $f1, $f0
/* 1104A0 002103A0 2C44040C */  jal        fptosi
/* 1104A4 002103A4 00000000 */   nop
/* 1104A8 002103A8 00000686 */  lh         $6, 0x0($16)
/* 1104AC 002103AC 28264072 */  paddub     $4, $18, $0
/* 1104B0 002103B0 282E4070 */  paddub     $5, $2, $0
/* 1104B4 002103B4 01000724 */  addiu      $7, $0, 0x1
/* 1104B8 002103B8 80000824 */  addiu      $8, $0, 0x80
/* 1104BC 002103BC 284E0071 */  paddub     $9, $8, $0
/* 1104C0 002103C0 E8B7080C */  jal        DrawMainMenuIcon__Fiiiiii
/* 1104C4 002103C4 00000000 */   nop
/* 1104C8 002103C8 3000BF7B */  lq         $31, 0x30($sp)
/* 1104CC 002103CC 2000B27B */  lq         $18, 0x20($sp)
/* 1104D0 002103D0 1000B17B */  lq         $17, 0x10($sp)
/* 1104D4 002103D4 0000B07B */  lq         $16, 0x0($sp)
/* 1104D8 002103D8 4000BD27 */  addiu      $sp, $sp, 0x40
/* 1104DC 002103DC 0800E003 */  jr         $31
/* 1104E0 002103E0 00000000 */   nop
/* 1104E4 002103E4 00000000 */  nop
/* 1104E8 002103E8 00000000 */  nop
/* 1104EC 002103EC 00000000 */  nop