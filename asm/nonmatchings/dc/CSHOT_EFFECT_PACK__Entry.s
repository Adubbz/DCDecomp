.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Entry__17CSHOT_EFFECT_PACKFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i
/* AE5C0 001AE4C0 80FFBD27 */  addiu      $sp, $sp, -0x80
/* AE5C4 001AE4C4 7000BF7F */  sq         $31, 0x70($sp)
/* AE5C8 001AE4C8 6000B67F */  sq         $22, 0x60($sp)
/* AE5CC 001AE4CC 5000B57F */  sq         $21, 0x50($sp)
/* AE5D0 001AE4D0 4000B47F */  sq         $20, 0x40($sp)
/* AE5D4 001AE4D4 3000B37F */  sq         $19, 0x30($sp)
/* AE5D8 001AE4D8 2000B27F */  sq         $18, 0x20($sp)
/* AE5DC 001AE4DC 1000B17F */  sq         $17, 0x10($sp)
/* AE5E0 001AE4E0 0000B07F */  sq         $16, 0x0($sp)
/* AE5E4 001AE4E4 28B68070 */  paddub     $22, $4, $0
/* AE5E8 001AE4E8 28AEA070 */  paddub     $21, $5, $0
/* AE5EC 001AE4EC 28A6C070 */  paddub     $20, $6, $0
/* AE5F0 001AE4F0 289EE070 */  paddub     $19, $7, $0
/* AE5F4 001AE4F4 28960071 */  paddub     $18, $8, $0
/* AE5F8 001AE4F8 288E2071 */  paddub     $17, $9, $0
/* AE5FC 001AE4FC 28160070 */  paddub     $2, $0, $0
/* AE600 001AE500 0A000010 */  b          .L001AE52C
/* AE604 001AE504 00000000 */   nop
.L001AE508:
/* AE608 001AE508 60A10334 */  ori        $3, $0, 0xA160
/* AE60C 001AE50C 18184300 */  mult       $3, $2, $3
/* AE610 001AE510 2118C302 */  addu       $3, $22, $3
/* AE614 001AE514 0000638C */  lw         $3, 0x0($3)
/* AE618 001AE518 03007514 */  bne        $3, $21, .L001AE528
/* AE61C 001AE51C 00000000 */   nop
/* AE620 001AE520 1C000010 */  b          .L001AE594
/* AE624 001AE524 00000000 */   nop
.L001AE528:
/* AE628 001AE528 01004224 */  addiu      $2, $2, 0x1
.L001AE52C:
/* AE62C 001AE52C 05004328 */  slti       $3, $2, 0x5
/* AE630 001AE530 F5FF6014 */  bnez       $3, .L001AE508
/* AE634 001AE534 00000000 */   nop
/* AE638 001AE538 28860070 */  paddub     $16, $0, $0
/* AE63C 001AE53C 11000010 */  b          .L001AE584
/* AE640 001AE540 00000000 */   nop
.L001AE544:
/* AE644 001AE544 60A10234 */  ori        $2, $0, 0xA160
/* AE648 001AE548 18100202 */  mult       $2, $16, $2
/* AE64C 001AE54C 2120C202 */  addu       $4, $22, $2
/* AE650 001AE550 282EA072 */  paddub     $5, $21, $0
/* AE654 001AE554 28368072 */  paddub     $6, $20, $0
/* AE658 001AE558 283E6072 */  paddub     $7, $19, $0
/* AE65C 001AE55C 28464072 */  paddub     $8, $18, $0
/* AE660 001AE560 284E2072 */  paddub     $9, $17, $0
/* AE664 001AE564 1CB3060C */  jal        Entry__12CSHOT_EFFECTFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i
/* AE668 001AE568 00000000 */   nop
/* AE66C 001AE56C 04004010 */  beqz       $2, .L001AE580
/* AE670 001AE570 00000000 */   nop
/* AE674 001AE574 28160072 */  paddub     $2, $16, $0
/* AE678 001AE578 06000010 */  b          .L001AE594
/* AE67C 001AE57C 00000000 */   nop
.L001AE580:
/* AE680 001AE580 01001026 */  addiu      $16, $16, 0x1
.L001AE584:
/* AE684 001AE584 0500022A */  slti       $2, $16, 0x5
/* AE688 001AE588 EEFF4014 */  bnez       $2, .L001AE544
/* AE68C 001AE58C 00000000 */   nop
/* AE690 001AE590 FFFF0224 */  addiu      $2, $0, -0x1
.L001AE594:
/* AE694 001AE594 7000BF7B */  lq         $31, 0x70($sp)
/* AE698 001AE598 6000B67B */  lq         $22, 0x60($sp)
/* AE69C 001AE59C 5000B57B */  lq         $21, 0x50($sp)
/* AE6A0 001AE5A0 4000B47B */  lq         $20, 0x40($sp)
/* AE6A4 001AE5A4 3000B37B */  lq         $19, 0x30($sp)
/* AE6A8 001AE5A8 2000B27B */  lq         $18, 0x20($sp)
/* AE6AC 001AE5AC 1000B17B */  lq         $17, 0x10($sp)
/* AE6B0 001AE5B0 0000B07B */  lq         $16, 0x0($sp)
/* AE6B4 001AE5B4 8000BD27 */  addiu      $sp, $sp, 0x80
/* AE6B8 001AE5B8 0800E003 */  jr         $31
/* AE6BC 001AE5BC 00000000 */   nop
