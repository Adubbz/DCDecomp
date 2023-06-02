.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetAreaCode__11CEditGroundFfff
/* A17B0 001A16B0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* A17B4 001A16B4 3000BF7F */  sq         $31, 0x30($sp)
/* A17B8 001A16B8 2000B17F */  sq         $17, 0x20($sp)
/* A17BC 001A16BC 1000B07F */  sq         $16, 0x10($sp)
/* A17C0 001A16C0 0800B6E7 */  swc1       $f22, 0x8($sp)
/* A17C4 001A16C4 0400B5E7 */  swc1       $f21, 0x4($sp)
/* A17C8 001A16C8 0000B4E7 */  swc1       $f20, 0x0($sp)
/* A17CC 001A16CC 288E8070 */  paddub     $17, $4, $0
/* A17D0 001A16D0 86650046 */  mov.s      $f22, $f12
/* A17D4 001A16D4 466D0046 */  mov.s      $f21, $f13
/* A17D8 001A16D8 06750046 */  mov.s      $f20, $f14
/* A17DC 001A16DC 28860070 */  paddub     $16, $0, $0
/* A17E0 001A16E0 11000010 */  b          .L001A1728
/* A17E4 001A16E4 00000000 */   nop
.L001A16E8:
/* A17E8 001A16E8 80101000 */  sll        $2, $16, 2
/* A17EC 001A16EC 21105100 */  addu       $2, $2, $17
/* A17F0 001A16F0 0400448C */  lw         $4, 0x4($2)
/* A17F4 001A16F4 0F008010 */  beqz       $4, .L001A1734
/* A17F8 001A16F8 00000000 */   nop
/* A17FC 001A16FC 06B30046 */  mov.s      $f12, $f22
/* A1800 001A1700 46AB0046 */  mov.s      $f13, $f21
/* A1804 001A1704 86A30046 */  mov.s      $f14, $f20
/* A1808 001A1708 24BC050C */  jal        CheckArea__9CEditAreaFfff
/* A180C 001A170C 00000000 */   nop
/* A1810 001A1710 04004010 */  beqz       $2, .L001A1724
/* A1814 001A1714 00000000 */   nop
/* A1818 001A1718 28160072 */  paddub     $2, $16, $0
/* A181C 001A171C 06000010 */  b          .L001A1738
/* A1820 001A1720 00000000 */   nop
.L001A1724:
/* A1824 001A1724 01001026 */  addiu      $16, $16, 0x1
.L001A1728:
/* A1828 001A1728 0400022A */  slti       $2, $16, 0x4
/* A182C 001A172C EEFF4014 */  bnez       $2, .L001A16E8
/* A1830 001A1730 00000000 */   nop
.L001A1734:
/* A1834 001A1734 FFFF0224 */  addiu      $2, $0, -0x1
.L001A1738:
/* A1838 001A1738 3000BF7B */  lq         $31, 0x30($sp)
/* A183C 001A173C 2000B17B */  lq         $17, 0x20($sp)
/* A1840 001A1740 1000B07B */  lq         $16, 0x10($sp)
/* A1844 001A1744 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* A1848 001A1748 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* A184C 001A174C 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* A1850 001A1750 4000BD27 */  addiu      $sp, $sp, 0x40
/* A1854 001A1754 0800E003 */  jr         $31
/* A1858 001A1758 00000000 */   nop
/* A185C 001A175C 00000000 */  nop
