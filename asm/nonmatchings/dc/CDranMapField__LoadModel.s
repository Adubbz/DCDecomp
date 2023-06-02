.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadModel__13CDranMapFieldFPUiP14CDataAlloc2_1_
/* CD4C0 001CD3C0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* CD4C4 001CD3C4 3000BF7F */  sq         $31, 0x30($sp)
/* CD4C8 001CD3C8 2000B27F */  sq         $18, 0x20($sp)
/* CD4CC 001CD3CC 1000B17F */  sq         $17, 0x10($sp)
/* CD4D0 001CD3D0 0000B07F */  sq         $16, 0x0($sp)
/* CD4D4 001CD3D4 28968070 */  paddub     $18, $4, $0
/* CD4D8 001CD3D8 288EA070 */  paddub     $17, $5, $0
/* CD4DC 001CD3DC 2886C070 */  paddub     $16, $6, $0
/* CD4E0 001CD3E0 0100013C */  lui        $at, (0x10000 >> 16)
/* CD4E4 001CD3E4 21088100 */  addu       $at, $4, $at
/* CD4E8 001CD3E8 A0D4238C */  lw         $3, -0x2B60($at)
/* CD4EC 001CD3EC 0C006128 */  slti       $at, $3, 0xC
/* CD4F0 001CD3F0 3B002010 */  beqz       $at, .L001CD4E0
/* CD4F4 001CD3F4 00000000 */   nop
/* CD4F8 001CD3F8 B0110224 */  addiu      $2, $0, 0x11B0
/* CD4FC 001CD3FC 18106200 */  mult       $2, $3, $2
/* CD500 001CD400 21204202 */  addu       $4, $18, $2
/* CD504 001CD404 A000998C */  lw         $25, 0xA0($4)
/* CD508 001CD408 C400398F */  lw         $25, 0xC4($25)
/* CD50C 001CD40C 09F82003 */  jalr       $25
/* CD510 001CD410 00000000 */   nop
/* CD514 001CD414 0100013C */  lui        $at, (0x10000 >> 16)
/* CD518 001CD418 21084102 */  addu       $at, $18, $at
/* CD51C 001CD41C A0D4238C */  lw         $3, -0x2B60($at)
/* CD520 001CD420 B0110224 */  addiu      $2, $0, 0x11B0
/* CD524 001CD424 18106200 */  mult       $2, $3, $2
/* CD528 001CD428 21204202 */  addu       $4, $18, $2
/* CD52C 001CD42C 282E2072 */  paddub     $5, $17, $0
/* CD530 001CD430 2A00023C */  lui        $2, %hi(_1007_2)
/* CD534 001CD434 F8BD4624 */  addiu      $6, $2, %lo(_1007_2)
/* CD538 001CD438 283E0072 */  paddub     $7, $16, $0
/* CD53C 001CD43C 28460072 */  paddub     $8, $16, $0
/* CD540 001CD440 A000998C */  lw         $25, 0xA0($4)
/* CD544 001CD444 B400398F */  lw         $25, 0xB4($25)
/* CD548 001CD448 09F82003 */  jalr       $25
/* CD54C 001CD44C 00000000 */   nop
/* CD550 001CD450 00688044 */  mtc1       $0, $f13
/* CD554 001CD454 0100013C */  lui        $at, (0x10000 >> 16)
/* CD558 001CD458 21084102 */  addu       $at, $18, $at
/* CD55C 001CD45C A0D4238C */  lw         $3, -0x2B60($at)
/* CD560 001CD460 B0110224 */  addiu      $2, $0, 0x11B0
/* CD564 001CD464 18106200 */  mult       $2, $3, $2
/* CD568 001CD468 21204202 */  addu       $4, $18, $2
/* CD56C 001CD46C 066B0046 */  mov.s      $f12, $f13
/* CD570 001CD470 866B0046 */  mov.s      $f14, $f13
/* CD574 001CD474 A000998C */  lw         $25, 0xA0($4)
/* CD578 001CD478 1800398F */  lw         $25, 0x18($25)
/* CD57C 001CD47C 09F82003 */  jalr       $25
/* CD580 001CD480 00000000 */   nop
/* CD584 001CD484 00608044 */  mtc1       $0, $f12
/* CD588 001CD488 00000000 */  nop
/* CD58C 001CD48C 46630046 */  mov.s      $f13, $f12
/* CD590 001CD490 0100013C */  lui        $at, (0x10000 >> 16)
/* CD594 001CD494 21084102 */  addu       $at, $18, $at
/* CD598 001CD498 A0D4238C */  lw         $3, -0x2B60($at)
/* CD59C 001CD49C B0110224 */  addiu      $2, $0, 0x11B0
/* CD5A0 001CD4A0 18106200 */  mult       $2, $3, $2
/* CD5A4 001CD4A4 21204202 */  addu       $4, $18, $2
/* CD5A8 001CD4A8 86630046 */  mov.s      $f14, $f12
/* CD5AC 001CD4AC A000998C */  lw         $25, 0xA0($4)
/* CD5B0 001CD4B0 3000398F */  lw         $25, 0x30($25)
/* CD5B4 001CD4B4 09F82003 */  jalr       $25
/* CD5B8 001CD4B8 00000000 */   nop
/* CD5BC 001CD4BC 0100013C */  lui        $at, (0x10000 >> 16)
/* CD5C0 001CD4C0 21084102 */  addu       $at, $18, $at
/* CD5C4 001CD4C4 A0D4238C */  lw         $3, -0x2B60($at)
/* CD5C8 001CD4C8 01006324 */  addiu      $3, $3, 0x1
/* CD5CC 001CD4CC 0100013C */  lui        $at, (0x10000 >> 16)
/* CD5D0 001CD4D0 21084102 */  addu       $at, $18, $at
/* CD5D4 001CD4D4 A0D423AC */  sw         $3, -0x2B60($at)
/* CD5D8 001CD4D8 05000010 */  b          .L001CD4F0
/* CD5DC 001CD4DC 00000000 */   nop
.L001CD4E0:
/* CD5E0 001CD4E0 2A00023C */  lui        $2, %hi(_3606)
/* CD5E4 001CD4E4 D0BF4424 */  addiu      $4, $2, %lo(_3606)
/* CD5E8 001CD4E8 A611040C */  jal        printf
/* CD5EC 001CD4EC 00000000 */   nop
.L001CD4F0:
/* CD5F0 001CD4F0 3000BF7B */  lq         $31, 0x30($sp)
/* CD5F4 001CD4F4 2000B27B */  lq         $18, 0x20($sp)
/* CD5F8 001CD4F8 1000B17B */  lq         $17, 0x10($sp)
/* CD5FC 001CD4FC 0000B07B */  lq         $16, 0x0($sp)
/* CD600 001CD500 4000BD27 */  addiu      $sp, $sp, 0x40
/* CD604 001CD504 0800E003 */  jr         $31
/* CD608 001CD508 00000000 */   nop
/* CD60C 001CD50C 00000000 */  nop
