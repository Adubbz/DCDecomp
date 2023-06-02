.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel set2DSprite_End__FP13sceVif1PacketP8CTexture
/* 4C5F0 0014C4F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 4C5F4 0014C4F4 0000BF7F */  sq         $31, 0x0($sp)
/* 4C5F8 0014C4F8 C08D838F */  lw         $3, -0x7240($gp)
/* 4C5FC 0014C4FC E88B8227 */  addiu      $2, $gp, -0x7418
/* 4C600 0014C500 000042DC */  ld         $2, 0x0($2)
/* 4C604 0014C504 000062FC */  sd         $2, 0x0($3)
/* 4C608 0014C508 47000224 */  addiu      $2, $0, 0x47
/* 4C60C 0014C50C 080062FC */  sd         $2, 0x8($3)
/* 4C610 0014C510 F08B8227 */  addiu      $2, $gp, -0x7410
/* 4C614 0014C514 000042DC */  ld         $2, 0x0($2)
/* 4C618 0014C518 100062FC */  sd         $2, 0x10($3)
/* 4C61C 0014C51C 4E000224 */  addiu      $2, $0, 0x4E
/* 4C620 0014C520 180062FC */  sd         $2, 0x18($3)
/* 4C624 0014C524 20006224 */  addiu      $2, $3, 0x20
/* 4C628 0014C528 C08D82AF */  sw         $2, -0x7240($gp)
/* 4C62C 0014C52C C48D858F */  lw         $5, -0x723C($gp)
/* 4C630 0014C530 C08D838F */  lw         $3, -0x7240($gp)
/* 4C634 0014C534 BC8D828F */  lw         $2, -0x7244($gp)
/* 4C638 0014C538 23106200 */  subu       $2, $3, $2
/* 4C63C 0014C53C 03110200 */  sra        $2, $2, 4
/* 4C640 0014C540 FFFF4324 */  addiu      $3, $2, -0x1
/* 4C644 0014C544 0010023C */  lui        $2, (0x10000000 >> 16)
/* 4C648 0014C548 25106200 */  or         $2, $3, $2
/* 4C64C 0014C54C 0000A2AC */  sw         $2, 0x0($5)
/* 4C650 0014C550 0050023C */  lui        $2, (0x50000000 >> 16)
/* 4C654 0014C554 25106200 */  or         $2, $3, $2
/* 4C658 0014C558 0C00A2AC */  sw         $2, 0xC($5)
/* 4C65C 0014C55C FFFF6224 */  addiu      $2, $3, -0x1
/* 4C660 0014C560 00804234 */  ori        $2, $2, 0x8000
/* 4C664 0014C564 1000A2AC */  sw         $2, 0x10($5)
/* 4C668 0014C568 C08D838F */  lw         $3, -0x7240($gp)
/* 4C66C 0014C56C BC8D828F */  lw         $2, -0x7244($gp)
/* 4C670 0014C570 23106200 */  subu       $2, $3, $2
/* 4C674 0014C574 03110200 */  sra        $2, $2, 4
/* 4C678 0014C578 80280200 */  sll        $5, $2, 2
/* 4C67C 0014C57C DE83040C */  jal        sceVif1PkReserve
/* 4C680 0014C580 00000000 */   nop
/* 4C684 0014C584 0000BF7B */  lq         $31, 0x0($sp)
/* 4C688 0014C588 1000BD27 */  addiu      $sp, $sp, 0x10
/* 4C68C 0014C58C 0800E003 */  jr         $31
/* 4C690 0014C590 00000000 */   nop
/* 4C694 0014C594 00000000 */  nop
/* 4C698 0014C598 00000000 */  nop
/* 4C69C 0014C59C 00000000 */  nop