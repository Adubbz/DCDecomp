.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetOpenAttribute__FPc
/* 113640 00213540 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 113644 00213544 2000BF7F */  sq         $31, 0x20($sp)
/* 113648 00213548 1000B17F */  sq         $17, 0x10($sp)
/* 11364C 0021354C 0000B07F */  sq         $16, 0x0($sp)
/* 113650 00213550 288E8070 */  paddub     $17, $4, $0
/* 113654 00213554 28860070 */  paddub     $16, $0, $0
/* 113658 00213558 13000010 */  b          .L002135A8
/* 11365C 0021355C 00000000 */   nop
.L00213560:
/* 113660 00213560 80191000 */  sll        $3, $16, 6
/* 113664 00213564 DA01023C */  lui        $2, %hi(SaveFileInfo)
/* 113668 00213568 80EF4224 */  addiu      $2, $2, %lo(SaveFileInfo)
/* 11366C 0021356C 21104300 */  addu       $2, $2, $3
/* 113670 00213570 20004524 */  addiu      $5, $2, 0x20
/* 113674 00213574 28262072 */  paddub     $4, $17, $0
/* 113678 00213578 0815040C */  jal        strcmp
/* 11367C 0021357C 00000000 */   nop
/* 113680 00213580 08004014 */  bnez       $2, .L002135A4
/* 113684 00213584 00000000 */   nop
/* 113688 00213588 2A00023C */  lui        $2, %hi(_346_2)
/* 11368C 0021358C B0E44424 */  addiu      $4, $2, %lo(_346_2)
/* 113690 00213590 A611040C */  jal        printf
/* 113694 00213594 00000000 */   nop
/* 113698 00213598 01000224 */  addiu      $2, $0, 0x1
/* 11369C 0021359C 06000010 */  b          .L002135B8
/* 1136A0 002135A0 00000000 */   nop
.L002135A4:
/* 1136A4 002135A4 01001026 */  addiu      $16, $16, 0x1
.L002135A8:
/* 1136A8 002135A8 6300022A */  slti       $2, $16, 0x63
/* 1136AC 002135AC ECFF4014 */  bnez       $2, .L00213560
/* 1136B0 002135B0 00000000 */   nop
/* 1136B4 002135B4 28160070 */  paddub     $2, $0, $0
.L002135B8:
/* 1136B8 002135B8 2000BF7B */  lq         $31, 0x20($sp)
/* 1136BC 002135BC 1000B17B */  lq         $17, 0x10($sp)
/* 1136C0 002135C0 0000B07B */  lq         $16, 0x0($sp)
/* 1136C4 002135C4 3000BD27 */  addiu      $sp, $sp, 0x30
/* 1136C8 002135C8 0800E003 */  jr         $31
/* 1136CC 002135CC 00000000 */   nop
