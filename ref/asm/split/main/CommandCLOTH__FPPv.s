.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandCLOTH__FPPv
/* 03A940 0013A840 E0FFBD27 */  addiu       $29, $29, -0x20
/* 03A944 0013A844 0000BF7F */  sq          $31, 0x0($29)
/* 03A948 0013A848 0000858C */  lw          $5, 0x0($4)
/* 03A94C 0013A84C B08C848F */  lw          $4, -0x7350($28)
/* 03A950 0013A850 1C00A627 */  addiu       $6, $29, 0x1C
/* 03A954 0013A854 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 03A958 0013A858 00000000 */   nop
/* 03A95C 0013A85C 18004010 */  beqz        $2, .L0013A8C0
/* 03A960 0013A860 00000000 */   nop
/* 03A964 0013A864 1400A327 */  addiu       $3, $29, 0x14
/* 03A968 0013A868 000060AC */  sw          $0, 0x0($3)
/* 03A96C 0013A86C 1800A427 */  addiu       $4, $29, 0x18
/* 03A970 0013A870 000080AC */  sw          $0, 0x0($4)
/* 03A974 0013A874 1000A2AF */  sw          $2, 0x10($29)
/* 03A978 0013A878 1C00A28F */  lw          $2, 0x1C($29)
/* 03A97C 0013A87C 000062AC */  sw          $2, 0x0($3)
/* 03A980 0013A880 000080AC */  sw          $0, 0x0($4)
/* 03A984 0013A884 A08C828F */  lw          $2, -0x7360($28)
/* 03A988 0013A888 BC00448C */  lw          $4, 0xBC($2)
/* 03A98C 0013A88C 1000A527 */  addiu       $5, $29, 0x10
/* 03A990 0013A890 908C868F */  lw          $6, -0x7370($28)
/* 03A994 0013A894 70FE040C */  jal         InitCloth__FP9CFrameVu1R9input_strP14CDataAlloc2_1_
/* 03A998 0013A898 00000000 */   nop
/* 03A99C 0013A89C A08C858F */  lw          $5, -0x7360($28)
/* 03A9A0 0013A8A0 C48C838F */  lw          $3, -0x733C($28)
/* 03A9A4 0013A8A4 80200300 */  sll         $4, $3, 2
/* 03A9A8 0013A8A8 740CA38C */  lw          $3, 0xC74($5)
/* 03A9AC 0013A8AC 21186400 */  addu        $3, $3, $4
/* 03A9B0 0013A8B0 000062AC */  sw          $2, 0x0($3)
/* 03A9B4 0013A8B4 C48C838F */  lw          $3, -0x733C($28)
/* 03A9B8 0013A8B8 01006324 */  addiu       $3, $3, 0x1
/* 03A9BC 0013A8BC C48C83AF */  sw          $3, -0x733C($28)
.L0013A8C0:
/* 03A9C0 0013A8C0 0000BF7B */  lq          $31, 0x0($29)
/* 03A9C4 0013A8C4 2000BD27 */  addiu       $29, $29, 0x20
/* 03A9C8 0013A8C8 0800E003 */  jr          $31
/* 03A9CC 0013A8CC 00000000 */   nop
