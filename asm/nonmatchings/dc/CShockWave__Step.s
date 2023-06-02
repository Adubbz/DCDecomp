.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step__10CShockWaveFv
/* D65E0 001D64E0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* D65E4 001D64E4 1000BF7F */  sq         $31, 0x10($sp)
/* D65E8 001D64E8 0000B07F */  sq         $16, 0x0($sp)
/* D65EC 001D64EC 28868070 */  paddub     $16, $4, $0
/* D65F0 001D64F0 2800838C */  lw         $3, 0x28($4)
/* D65F4 001D64F4 2B006010 */  beqz       $3, .L001D65A4
/* D65F8 001D64F8 00000000 */   nop
/* D65FC 001D64FC 200002C6 */  lwc1       $f2, 0x20($16)
/* D6600 001D6500 C88081C7 */  lwc1       $f1, -0x7F38($gp)
/* D6604 001D6504 34100146 */  c.lt.s     $f2, $f1
/* D6608 001D6508 00000000 */  nop
/* D660C 001D650C 11000045 */  bc1f       .L001D6554
/* D6610 001D6510 00000000 */   nop
/* D6614 001D6514 1C0000C6 */  lwc1       $f0, 0x1C($16)
/* D6618 001D6518 03080046 */  div.s      $f0, $f1, $f0
/* D661C 001D651C 00130046 */  add.s      $f12, $f2, $f0
/* D6620 001D6520 20000CE6 */  swc1       $f12, 0x20($16)
/* D6624 001D6524 2876040C */  jal        sinf
/* D6628 001D6528 00000000 */   nop
/* D662C 001D652C 2043033C */  lui        $3, (0x43200000 >> 16)
/* D6630 001D6530 00088344 */  mtc1       $3, $f1
/* D6634 001D6534 00000000 */  nop
/* D6638 001D6538 42080046 */  mul.s      $f1, $f1, $f0
/* D663C 001D653C 240001E6 */  swc1       $f1, 0x24($16)
/* D6640 001D6540 140002C6 */  lwc1       $f2, 0x14($16)
/* D6644 001D6544 100001C6 */  lwc1       $f1, 0x10($16)
/* D6648 001D6548 02080046 */  mul.s      $f0, $f1, $f0
/* D664C 001D654C 00100046 */  add.s      $f0, $f2, $f0
/* D6650 001D6550 180000E6 */  swc1       $f0, 0x18($16)
.L001D6554:
/* D6654 001D6554 200001C6 */  lwc1       $f1, 0x20($16)
/* D6658 001D6558 C88080C7 */  lwc1       $f0, -0x7F38($gp)
/* D665C 001D655C 34080046 */  c.lt.s     $f1, $f0
/* D6660 001D6560 00000000 */  nop
/* D6664 001D6564 0F000145 */  bc1t       .L001D65A4
/* D6668 001D6568 00000000 */   nop
/* D666C 001D656C 240001C6 */  lwc1       $f1, 0x24($16)
/* D6670 001D6570 A040033C */  lui        $3, (0x40A00000 >> 16)
/* D6674 001D6574 00008344 */  mtc1       $3, $f0
/* D6678 001D6578 00000000 */  nop
/* D667C 001D657C 41080046 */  sub.s      $f1, $f1, $f0
/* D6680 001D6580 240001E6 */  swc1       $f1, 0x24($16)
/* D6684 001D6584 00008044 */  mtc1       $0, $f0
/* D6688 001D6588 00000000 */  nop
/* D668C 001D658C 36080046 */  c.le.s     $f1, $f0
/* D6690 001D6590 00000000 */  nop
/* D6694 001D6594 03000045 */  bc1f       .L001D65A4
/* D6698 001D6598 00000000 */   nop
/* D669C 001D659C 240000AE */  sw         $0, 0x24($16)
/* D66A0 001D65A0 280000AE */  sw         $0, 0x28($16)
.L001D65A4:
/* D66A4 001D65A4 1000BF7B */  lq         $31, 0x10($sp)
/* D66A8 001D65A8 0000B07B */  lq         $16, 0x0($sp)
/* D66AC 001D65AC 2000BD27 */  addiu      $sp, $sp, 0x20
/* D66B0 001D65B0 0800E003 */  jr         $31
/* D66B4 001D65B4 00000000 */   nop
/* D66B8 001D65B8 00000000 */  nop
/* D66BC 001D65BC 00000000 */  nop