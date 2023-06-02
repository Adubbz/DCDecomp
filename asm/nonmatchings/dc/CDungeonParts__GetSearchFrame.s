.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetSearchFrame__13CDungeonPartsFPc
/* C1690 001C1590 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* C1694 001C1594 3000BF7F */  sq         $31, 0x30($sp)
/* C1698 001C1598 2000B27F */  sq         $18, 0x20($sp)
/* C169C 001C159C 1000B17F */  sq         $17, 0x10($sp)
/* C16A0 001C15A0 0000B07F */  sq         $16, 0x0($sp)
/* C16A4 001C15A4 28968070 */  paddub     $18, $4, $0
/* C16A8 001C15A8 288EA070 */  paddub     $17, $5, $0
/* C16AC 001C15AC 28860070 */  paddub     $16, $0, $0
/* C16B0 001C15B0 0E000010 */  b          .L001C15EC
/* C16B4 001C15B4 00000000 */   nop
.L001C15B8:
/* C16B8 001C15B8 80101000 */  sll        $2, $16, 2
/* C16BC 001C15BC 21105200 */  addu       $2, $2, $18
/* C16C0 001C15C0 B001448C */  lw         $4, 0x1B0($2)
/* C16C4 001C15C4 08008010 */  beqz       $4, .L001C15E8
/* C16C8 001C15C8 00000000 */   nop
/* C16CC 001C15CC 282E2072 */  paddub     $5, $17, $0
/* C16D0 001C15D0 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* C16D4 001C15D4 00000000 */   nop
/* C16D8 001C15D8 03004010 */  beqz       $2, .L001C15E8
/* C16DC 001C15DC 00000000 */   nop
/* C16E0 001C15E0 1A000010 */  b          .L001C164C
/* C16E4 001C15E4 00000000 */   nop
.L001C15E8:
/* C16E8 001C15E8 01001026 */  addiu      $16, $16, 0x1
.L001C15EC:
/* C16EC 001C15EC 0600022A */  slti       $2, $16, 0x6
/* C16F0 001C15F0 F1FF4014 */  bnez       $2, .L001C15B8
/* C16F4 001C15F4 00000000 */   nop
/* C16F8 001C15F8 0C00448E */  lw         $4, 0xC($18)
/* C16FC 001C15FC 08008010 */  beqz       $4, .L001C1620
/* C1700 001C1600 00000000 */   nop
/* C1704 001C1604 282E2072 */  paddub     $5, $17, $0
/* C1708 001C1608 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* C170C 001C160C 00000000 */   nop
/* C1710 001C1610 03004010 */  beqz       $2, .L001C1620
/* C1714 001C1614 00000000 */   nop
/* C1718 001C1618 0C000010 */  b          .L001C164C
/* C171C 001C161C 00000000 */   nop
.L001C1620:
/* C1720 001C1620 0400448E */  lw         $4, 0x4($18)
/* C1724 001C1624 08008010 */  beqz       $4, .L001C1648
/* C1728 001C1628 00000000 */   nop
/* C172C 001C162C 282E2072 */  paddub     $5, $17, $0
/* C1730 001C1630 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* C1734 001C1634 00000000 */   nop
/* C1738 001C1638 03004010 */  beqz       $2, .L001C1648
/* C173C 001C163C 00000000 */   nop
/* C1740 001C1640 02000010 */  b          .L001C164C
/* C1744 001C1644 00000000 */   nop
.L001C1648:
/* C1748 001C1648 28160070 */  paddub     $2, $0, $0
.L001C164C:
/* C174C 001C164C 3000BF7B */  lq         $31, 0x30($sp)
/* C1750 001C1650 2000B27B */  lq         $18, 0x20($sp)
/* C1754 001C1654 1000B17B */  lq         $17, 0x10($sp)
/* C1758 001C1658 0000B07B */  lq         $16, 0x0($sp)
/* C175C 001C165C 4000BD27 */  addiu      $sp, $sp, 0x40
/* C1760 001C1660 0800E003 */  jr         $31
/* C1764 001C1664 00000000 */   nop
/* C1768 001C1668 00000000 */  nop
/* C176C 001C166C 00000000 */  nop
