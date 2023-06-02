.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdInitVillagerOnOff__FP12CNPCharacterP13VILLAGER_INFOP11CEditGround
/* 86460 00186360 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 86464 00186364 6000BF7F */  sq         $31, 0x60($sp)
/* 86468 00186368 5000B57F */  sq         $21, 0x50($sp)
/* 8646C 0018636C 4000B47F */  sq         $20, 0x40($sp)
/* 86470 00186370 3000B37F */  sq         $19, 0x30($sp)
/* 86474 00186374 2000B27F */  sq         $18, 0x20($sp)
/* 86478 00186378 1000B17F */  sq         $17, 0x10($sp)
/* 8647C 0018637C 0000B07F */  sq         $16, 0x0($sp)
/* 86480 00186380 28AE8070 */  paddub     $21, $4, $0
/* 86484 00186384 28A6A070 */  paddub     $20, $5, $0
/* 86488 00186388 289EC070 */  paddub     $19, $6, $0
/* 8648C 0018638C 28860070 */  paddub     $16, $0, $0
/* 86490 00186390 4F000010 */  b          .L001864D0
/* 86494 00186394 00000000 */   nop
.L00186398:
/* 86498 00186398 C0181000 */  sll        $3, $16, 3
/* 8649C 0018639C 21187000 */  addu       $3, $3, $16
/* 864A0 001863A0 00190300 */  sll        $3, $3, 4
/* 864A4 001863A4 21888302 */  addu       $17, $20, $3
/* 864A8 001863A8 4000238E */  lw         $3, 0x40($17)
/* 864AC 001863AC 47006010 */  beqz       $3, .L001864CC
/* 864B0 001863B0 00000000 */   nop
/* 864B4 001863B4 28960070 */  paddub     $18, $0, $0
/* 864B8 001863B8 4800258E */  lw         $5, 0x48($17)
/* 864BC 001863BC 3400A004 */  bltz       $5, .L00186490
/* 864C0 001863C0 00000000 */   nop
/* 864C4 001863C4 40191000 */  sll        $3, $16, 5
/* 864C8 001863C8 21207000 */  addu       $4, $3, $16
/* 864CC 001863CC 80180400 */  sll        $3, $4, 2
/* 864D0 001863D0 21188300 */  addu       $3, $4, $3
/* 864D4 001863D4 40190300 */  sll        $3, $3, 5
/* 864D8 001863D8 21207500 */  addu       $4, $3, $21
/* 864DC 001863DC 4414838C */  lw         $3, 0x1444($4)
/* 864E0 001863E0 2B006004 */  bltz       $3, .L00186490
/* 864E4 001863E4 00000000 */   nop
/* 864E8 001863E8 401485AC */  sw         $5, 0x1440($4)
/* 864EC 001863EC 28266072 */  paddub     $4, $19, $0
/* 864F0 001863F0 4800258E */  lw         $5, 0x48($17)
/* 864F4 001863F4 2086060C */  jal        GetPartsObject__11CEditGroundFi
/* 864F8 001863F8 00000000 */   nop
/* 864FC 001863FC 2C004010 */  beqz       $2, .L001864B0
/* 86500 00186400 00000000 */   nop
/* 86504 00186404 D201023C */  lui        $2, %hi(EditPartsInfo)
/* 86508 00186408 F09B4424 */  addiu      $4, $2, %lo(EditPartsInfo)
/* 8650C 0018640C 4800258E */  lw         $5, 0x48($17)
/* 86510 00186410 F467060C */  jal        GetPartsInfo__14CEditPartsInfoFi
/* 86514 00186414 00000000 */   nop
/* 86518 00186418 0800438C */  lw         $3, 0x8($2)
/* 8651C 0018641C 08006018 */  blez       $3, .L00186440
/* 86520 00186420 00000000 */   nop
/* 86524 00186424 4C00238E */  lw         $3, 0x4C($17)
/* 86528 00186428 40190300 */  sll        $3, $3, 5
/* 8652C 0018642C 21106200 */  addu       $2, $3, $2
/* 86530 00186430 2C00428C */  lw         $2, 0x2C($2)
/* 86534 00186434 02004010 */  beqz       $2, .L00186440
/* 86538 00186438 00000000 */   nop
/* 8653C 0018643C 01001224 */  addiu      $18, $0, 0x1
.L00186440:
/* 86540 00186440 D201023C */  lui        $2, %hi(EditPartsInfo)
/* 86544 00186444 F09B4424 */  addiu      $4, $2, %lo(EditPartsInfo)
/* 86548 00186448 4800258E */  lw         $5, 0x48($17)
/* 8654C 0018644C 0868060C */  jal        CheckComplete__14CEditPartsInfoFi
/* 86550 00186450 00000000 */   nop
/* 86554 00186454 16004010 */  beqz       $2, .L001864B0
/* 86558 00186458 00000000 */   nop
/* 8655C 0018645C D201023C */  lui        $2, %hi(EditPartsInfo)
/* 86560 00186460 F09B4424 */  addiu      $4, $2, %lo(EditPartsInfo)
/* 86564 00186464 4800258E */  lw         $5, 0x48($17)
/* 86568 00186468 4068060C */  jal        GetCompEvent__14CEditPartsInfoFi
/* 8656C 0018646C 00000000 */   nop
/* 86570 00186470 0F004014 */  bnez       $2, .L001864B0
/* 86574 00186474 00000000 */   nop
/* 86578 00186478 5C00238E */  lw         $3, 0x5C($17)
/* 8657C 0018647C 0C006010 */  beqz       $3, .L001864B0
/* 86580 00186480 00000000 */   nop
/* 86584 00186484 28960070 */  paddub     $18, $0, $0
/* 86588 00186488 09000010 */  b          .L001864B0
/* 8658C 0018648C 00000000 */   nop
.L00186490:
/* 86590 00186490 40191000 */  sll        $3, $16, 5
/* 86594 00186494 21207000 */  addu       $4, $3, $16
/* 86598 00186498 80180400 */  sll        $3, $4, 2
/* 8659C 0018649C 21188300 */  addu       $3, $4, $3
/* 865A0 001864A0 40190300 */  sll        $3, $3, 5
/* 865A4 001864A4 21187500 */  addu       $3, $3, $21
/* 865A8 001864A8 401465AC */  sw         $5, 0x1440($3)
/* 865AC 001864AC 01001224 */  addiu      $18, $0, 0x1
.L001864B0:
/* 865B0 001864B0 40191000 */  sll        $3, $16, 5
/* 865B4 001864B4 21207000 */  addu       $4, $3, $16
/* 865B8 001864B8 80180400 */  sll        $3, $4, 2
/* 865BC 001864BC 21188300 */  addu       $3, $4, $3
/* 865C0 001864C0 40190300 */  sll        $3, $3, 5
/* 865C4 001864C4 21187500 */  addu       $3, $3, $21
/* 865C8 001864C8 701472AC */  sw         $18, 0x1470($3)
.L001864CC:
/* 865CC 001864CC 01001026 */  addiu      $16, $16, 0x1
.L001864D0:
/* 865D0 001864D0 0A00032A */  slti       $3, $16, 0xA
/* 865D4 001864D4 B0FF6014 */  bnez       $3, .L00186398
/* 865D8 001864D8 00000000 */   nop
/* 865DC 001864DC 6000BF7B */  lq         $31, 0x60($sp)
/* 865E0 001864E0 5000B57B */  lq         $21, 0x50($sp)
/* 865E4 001864E4 4000B47B */  lq         $20, 0x40($sp)
/* 865E8 001864E8 3000B37B */  lq         $19, 0x30($sp)
/* 865EC 001864EC 2000B27B */  lq         $18, 0x20($sp)
/* 865F0 001864F0 1000B17B */  lq         $17, 0x10($sp)
/* 865F4 001864F4 0000B07B */  lq         $16, 0x0($sp)
/* 865F8 001864F8 7000BD27 */  addiu      $sp, $sp, 0x70
/* 865FC 001864FC 0800E003 */  jr         $31
/* 86600 00186500 00000000 */   nop
/* 86604 00186504 00000000 */  nop
/* 86608 00186508 00000000 */  nop
/* 8660C 0018650C 00000000 */  nop
