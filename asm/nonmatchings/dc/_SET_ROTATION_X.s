.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_ROTATION_X__FP12RS_STACKDATAi
/* E5410 001E5310 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* E5414 001E5314 2000BF7F */  sq         $31, 0x20($sp)
/* E5418 001E5318 1000B17F */  sq         $17, 0x10($sp)
/* E541C 001E531C 0000B07F */  sq         $16, 0x0($sp)
/* E5420 001E5320 E09C828F */  lw         $2, -0x6320($gp)
/* E5424 001E5324 9000458C */  lw         $5, 0x90($2)
/* E5428 001E5328 08008624 */  addiu      $6, $4, 0x8
/* E542C 001E532C A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E5430 001E5330 00000000 */   nop
/* E5434 001E5334 E09C848F */  lw         $4, -0x6320($gp)
/* E5438 001E5338 80100500 */  sll        $2, $5, 2
/* E543C 001E533C 21184500 */  addu       $3, $2, $5
/* E5440 001E5340 80100300 */  sll        $2, $3, 2
/* E5444 001E5344 21106200 */  addu       $2, $3, $2
/* E5448 001E5348 00810200 */  sll        $16, $2, 4
/* E544C 001E534C 21100402 */  addu       $2, $16, $4
/* E5450 001E5350 0200013C */  lui        $at, (0x20000 >> 16)
/* E5454 001E5354 21084100 */  addu       $at, $2, $at
/* E5458 001E5358 40E420E4 */  swc1       $f0, -0x1BC0($at)
/* E545C 001E535C 2826C070 */  paddub     $4, $6, $0
/* E5460 001E5360 08008624 */  addiu      $6, $4, 0x8
/* E5464 001E5364 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E5468 001E5368 00000000 */   nop
/* E546C 001E536C E09C828F */  lw         $2, -0x6320($gp)
/* E5470 001E5370 21100202 */  addu       $2, $16, $2
/* E5474 001E5374 0200013C */  lui        $at, (0x20000 >> 16)
/* E5478 001E5378 21084100 */  addu       $at, $2, $at
/* E547C 001E537C 44E420E4 */  swc1       $f0, -0x1BBC($at)
/* E5480 001E5380 2826C070 */  paddub     $4, $6, $0
/* E5484 001E5384 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E5488 001E5388 00000000 */   nop
/* E548C 001E538C E09C828F */  lw         $2, -0x6320($gp)
/* E5490 001E5390 21100202 */  addu       $2, $16, $2
/* E5494 001E5394 0200013C */  lui        $at, (0x20000 >> 16)
/* E5498 001E5398 21084100 */  addu       $at, $2, $at
/* E549C 001E539C 48E420E4 */  swc1       $f0, -0x1BB8($at)
/* E54A0 001E53A0 10350224 */  addiu      $2, $0, 0x3510
/* E54A4 001E53A4 1888A200 */  mult       $17, $5, $2
/* E54A8 001E53A8 E09C828F */  lw         $2, -0x6320($gp)
/* E54AC 001E53AC 21105100 */  addu       $2, $2, $17
/* E54B0 001E53B0 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E54B4 001E53B4 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E54B8 001E53B8 21204100 */  addu       $4, $2, $at
/* E54BC 001E53BC 3000A527 */  addiu      $5, $sp, 0x30
/* E54C0 001E53C0 A000998C */  lw         $25, 0xA0($4)
/* E54C4 001E53C4 A000398F */  lw         $25, 0xA0($25)
/* E54C8 001E53C8 09F82003 */  jalr       $25
/* E54CC 001E53CC 00000000 */   nop
/* E54D0 001E53D0 E09C828F */  lw         $2, -0x6320($gp)
/* E54D4 001E53D4 21105100 */  addu       $2, $2, $17
/* E54D8 001E53D8 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E54DC 001E53DC D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E54E0 001E53E0 21204100 */  addu       $4, $2, $at
/* E54E4 001E53E4 4000A527 */  addiu      $5, $sp, 0x40
/* E54E8 001E53E8 A000998C */  lw         $25, 0xA0($4)
/* E54EC 001E53EC 5800398F */  lw         $25, 0x58($25)
/* E54F0 001E53F0 09F82003 */  jalr       $25
/* E54F4 001E53F4 00000000 */   nop
/* E54F8 001E53F8 E09C828F */  lw         $2, -0x6320($gp)
/* E54FC 001E53FC 21105000 */  addu       $2, $2, $16
/* E5500 001E5400 5000A427 */  addiu      $4, $sp, 0x50
/* E5504 001E5404 0100013C */  lui        $at, (0x1E440 >> 16)
/* E5508 001E5408 40E42134 */  ori        $at, $at, (0x1E440 & 0xFFFF)
/* E550C 001E540C 21284100 */  addu       $5, $2, $at
/* E5510 001E5410 3000A627 */  addiu      $6, $sp, 0x30
/* E5514 001E5414 EE85040C */  jal        sceVu0SubVector
/* E5518 001E5418 00000000 */   nop
/* E551C 001E541C 5400ACC7 */  lwc1       $f12, 0x54($sp)
/* E5520 001E5420 5800ADC7 */  lwc1       $f13, 0x58($sp)
/* E5524 001E5424 5077040C */  jal        atan2f
/* E5528 001E5428 00000000 */   nop
/* E552C 001E542C 07000046 */  neg.s      $f0, $f0
/* E5530 001E5430 4000A0E7 */  swc1       $f0, 0x40($sp)
/* E5534 001E5434 E09C828F */  lw         $2, -0x6320($gp)
/* E5538 001E5438 21105100 */  addu       $2, $2, $17
/* E553C 001E543C 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E5540 001E5440 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E5544 001E5444 21204100 */  addu       $4, $2, $at
/* E5548 001E5448 4000A527 */  addiu      $5, $sp, 0x40
/* E554C 001E544C A000998C */  lw         $25, 0xA0($4)
/* E5550 001E5450 3400398F */  lw         $25, 0x34($25)
/* E5554 001E5454 09F82003 */  jalr       $25
/* E5558 001E5458 00000000 */   nop
/* E555C 001E545C 01000224 */  addiu      $2, $0, 0x1
/* E5560 001E5460 2000BF7B */  lq         $31, 0x20($sp)
/* E5564 001E5464 1000B17B */  lq         $17, 0x10($sp)
/* E5568 001E5468 0000B07B */  lq         $16, 0x0($sp)
/* E556C 001E546C 6000BD27 */  addiu      $sp, $sp, 0x60
/* E5570 001E5470 0800E003 */  jr         $31
/* E5574 001E5474 00000000 */   nop
/* E5578 001E5478 00000000 */  nop
/* E557C 001E547C 00000000 */  nop