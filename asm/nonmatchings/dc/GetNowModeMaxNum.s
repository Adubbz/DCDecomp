.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetNowModeMaxNum__FiPi
/* 132390 00232290 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 132394 00232294 2000BF7F */  sq         $31, 0x20($sp)
/* 132398 00232298 1000B17F */  sq         $17, 0x10($sp)
/* 13239C 0023229C 0000B07F */  sq         $16, 0x0($sp)
/* 1323A0 002322A0 288E8070 */  paddub     $17, $4, $0
/* 1323A4 002322A4 2886A070 */  paddub     $16, $5, $0
/* 1323A8 002322A8 1C8D848F */  lw         $4, -0x72E4($gp)
/* 1323AC 002322AC 7860050C */  jal        GetDngStatus__9CSaveDataFv
/* 1323B0 002322B0 00000000 */   nop
/* 1323B4 002322B4 281E0070 */  paddub     $3, $0, $0
/* 1323B8 002322B8 02000424 */  addiu      $4, $0, 0x2
/* 1323BC 002322BC 55002412 */  beq        $17, $4, .L00232414
/* 1323C0 002322C0 00000000 */   nop
/* 1323C4 002322C4 01000424 */  addiu      $4, $0, 0x1
/* 1323C8 002322C8 2E002412 */  beq        $17, $4, .L00232384
/* 1323CC 002322CC 00000000 */   nop
/* 1323D0 002322D0 03002012 */  beqz       $17, .L002322E0
/* 1323D4 002322D4 00000000 */   nop
/* 1323D8 002322D8 65000010 */  b          .L00232470
/* 1323DC 002322DC 00000000 */   nop
.L002322E0:
/* 1323E0 002322E0 60434624 */  addiu      $6, $2, 0x4360
/* 1323E4 002322E4 28260070 */  paddub     $4, $0, $0
/* 1323E8 002322E8 09000010 */  b          .L00232310
/* 1323EC 002322EC 00000000 */   nop
.L002322F0:
/* 1323F0 002322F0 40100400 */  sll        $2, $4, 1
/* 1323F4 002322F4 21104600 */  addu       $2, $2, $6
/* 1323F8 002322F8 0E004284 */  lh         $2, 0xE($2)
/* 1323FC 002322FC 84004228 */  slti       $2, $2, 0x84
/* 132400 00232300 02004014 */  bnez       $2, .L0023230C
/* 132404 00232304 00000000 */   nop
/* 132408 00232308 01006324 */  addiu      $3, $3, 0x1
.L0023230C:
/* 13240C 0023230C 01008424 */  addiu      $4, $4, 0x1
.L00232310:
/* 132410 00232310 0000C780 */  lb         $7, 0x0($6)
/* 132414 00232314 0300E224 */  addiu      $2, $7, 0x3
/* 132418 00232318 2A108200 */  slt        $2, $4, $2
/* 13241C 0023231C F4FF4014 */  bnez       $2, .L002322F0
/* 132420 00232320 00000000 */   nop
/* 132424 00232324 282E0070 */  paddub     $5, $0, $0
/* 132428 00232328 0A000010 */  b          .L00232354
/* 13242C 0023232C 00000000 */   nop
.L00232330:
/* 132430 00232330 40100500 */  sll        $2, $5, 1
/* 132434 00232334 21204600 */  addu       $4, $2, $6
/* 132438 00232338 02008284 */  lh         $2, 0x2($4)
/* 13243C 0023233C 84004228 */  slti       $2, $2, 0x84
/* 132440 00232340 03004014 */  bnez       $2, .L00232350
/* 132444 00232344 00000000 */   nop
/* 132448 00232348 08008284 */  lh         $2, 0x8($4)
/* 13244C 0023234C 21186200 */  addu       $3, $3, $2
.L00232350:
/* 132450 00232350 0100A524 */  addiu      $5, $5, 0x1
.L00232354:
/* 132454 00232354 0300A228 */  slti       $2, $5, 0x3
/* 132458 00232358 F5FF4014 */  bnez       $2, .L00232330
/* 13245C 0023235C 00000000 */   nop
/* 132460 00232360 43000012 */  beqz       $16, .L00232470
/* 132464 00232364 00000000 */   nop
/* 132468 00232368 2A08E300 */  slt        $at, $7, $3
/* 13246C 0023236C 40002010 */  beqz       $at, .L00232470
/* 132470 00232370 00000000 */   nop
/* 132474 00232374 01000224 */  addiu      $2, $0, 0x1
/* 132478 00232378 000002AE */  sw         $2, 0x0($16)
/* 13247C 0023237C 3C000010 */  b          .L00232470
/* 132480 00232380 00000000 */   nop
.L00232384:
/* 132484 00232384 282E0070 */  paddub     $5, $0, $0
/* 132488 00232388 1D000010 */  b          .L00232400
/* 13248C 0023238C 00000000 */   nop
.L00232390:
/* 132490 00232390 A80A0424 */  addiu      $4, $0, 0xAA8
/* 132494 00232394 1820A400 */  mult       $4, $5, $4
/* 132498 00232398 21204400 */  addu       $4, $2, $4
/* 13249C 0023239C 0C458724 */  addiu      $7, $4, 0x450C
/* 1324A0 002323A0 28360070 */  paddub     $6, $0, $0
/* 1324A4 002323A4 12000010 */  b          .L002323F0
/* 1324A8 002323A8 00000000 */   nop
.L002323AC:
/* 1324AC 002323AC 40210600 */  sll        $4, $6, 5
/* 1324B0 002323B0 23208600 */  subu       $4, $4, $6
/* 1324B4 002323B4 C0200400 */  sll        $4, $4, 3
/* 1324B8 002323B8 2120E400 */  addu       $4, $7, $4
/* 1324BC 002323BC 00008484 */  lh         $4, 0x0($4)
/* 1324C0 002323C0 01018428 */  slti       $4, $4, 0x101
/* 1324C4 002323C4 09008014 */  bnez       $4, .L002323EC
/* 1324C8 002323C8 00000000 */   nop
/* 1324CC 002323CC 01006324 */  addiu      $3, $3, 0x1
/* 1324D0 002323D0 0A000424 */  addiu      $4, $0, 0xA
/* 1324D4 002323D4 0500C414 */  bne        $6, $4, .L002323EC
/* 1324D8 002323D8 00000000 */   nop
/* 1324DC 002323DC 03000012 */  beqz       $16, .L002323EC
/* 1324E0 002323E0 00000000 */   nop
/* 1324E4 002323E4 0100A424 */  addiu      $4, $5, 0x1
/* 1324E8 002323E8 000004AE */  sw         $4, 0x0($16)
.L002323EC:
/* 1324EC 002323EC 0100C624 */  addiu      $6, $6, 0x1
.L002323F0:
/* 1324F0 002323F0 0B00C428 */  slti       $4, $6, 0xB
/* 1324F4 002323F4 EDFF8014 */  bnez       $4, .L002323AC
/* 1324F8 002323F8 00000000 */   nop
/* 1324FC 002323FC 0100A524 */  addiu      $5, $5, 0x1
.L00232400:
/* 132500 00232400 0600A428 */  slti       $4, $5, 0x6
/* 132504 00232404 E2FF8014 */  bnez       $4, .L00232390
/* 132508 00232408 00000000 */   nop
/* 13250C 0023240C 18000010 */  b          .L00232470
/* 132510 00232410 00000000 */   nop
.L00232414:
/* 132514 00232414 04054524 */  addiu      $5, $2, 0x504
/* 132518 00232418 F87FA524 */  addiu      $5, $5, 0x7FF8
/* 13251C 0023241C 28260070 */  paddub     $4, $0, $0
/* 132520 00232420 09000010 */  b          .L00232448
/* 132524 00232424 00000000 */   nop
.L00232428:
/* 132528 00232428 40110400 */  sll        $2, $4, 5
/* 13252C 0023242C 2110A200 */  addu       $2, $5, $2
/* 132530 00232430 00004284 */  lh         $2, 0x0($2)
/* 132534 00232434 51004228 */  slti       $2, $2, 0x51
/* 132538 00232438 02004014 */  bnez       $2, .L00232444
/* 13253C 0023243C 00000000 */   nop
/* 132540 00232440 01006324 */  addiu      $3, $3, 0x1
.L00232444:
/* 132544 00232444 01008424 */  addiu      $4, $4, 0x1
.L00232448:
/* 132548 00232448 2B008228 */  slti       $2, $4, 0x2B
/* 13254C 0023244C F6FF4014 */  bnez       $2, .L00232428
/* 132550 00232450 00000000 */   nop
/* 132554 00232454 06000012 */  beqz       $16, .L00232470
/* 132558 00232458 00000000 */   nop
/* 13255C 0023245C 29006128 */  slti       $at, $3, 0x29
/* 132560 00232460 03002014 */  bnez       $at, .L00232470
/* 132564 00232464 00000000 */   nop
/* 132568 00232468 01000224 */  addiu      $2, $0, 0x1
/* 13256C 0023246C 000002AE */  sw         $2, 0x0($16)
.L00232470:
/* 132570 00232470 28166070 */  paddub     $2, $3, $0
/* 132574 00232474 2000BF7B */  lq         $31, 0x20($sp)
/* 132578 00232478 1000B17B */  lq         $17, 0x10($sp)
/* 13257C 0023247C 0000B07B */  lq         $16, 0x0($sp)
/* 132580 00232480 3000BD27 */  addiu      $sp, $sp, 0x30
/* 132584 00232484 0800E003 */  jr         $31
/* 132588 00232488 00000000 */   nop
/* 13258C 0023248C 00000000 */  nop
