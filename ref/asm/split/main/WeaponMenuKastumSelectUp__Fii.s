.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel WeaponMenuKastumSelectUp__Fii
/* 0FDF70 001FDE70 02008014 */  bnez        $4, .L001FDE7C
/* 0FDF74 001FDE74 00000000 */   nop
/* 0FDF78 001FDE78 07000424 */  addiu       $4, $0, 0x7
.L001FDE7C:
/* 0FDF7C 001FDE7C 03000224 */  addiu       $2, $0, 0x3
/* 0FDF80 001FDE80 0B000010 */  b           .L001FDEB0
/* 0FDF84 001FDE84 00000000 */   nop
.L001FDE88:
/* 0FDF88 001FDE88 FCFF8624 */  addiu       $6, $4, -0x4
/* 0FDF8C 001FDE8C 01000324 */  addiu       $3, $0, 0x1
/* 0FDF90 001FDE90 0418C300 */  sllv        $3, $3, $6
/* 0FDF94 001FDE94 2418A300 */  and         $3, $5, $3
/* 0FDF98 001FDE98 04006010 */  beqz        $3, .L001FDEAC
/* 0FDF9C 001FDE9C 00000000 */   nop
/* 0FDFA0 001FDEA0 FFFF8224 */  addiu       $2, $4, -0x1
/* 0FDFA4 001FDEA4 05000010 */  b           .L001FDEBC
/* 0FDFA8 001FDEA8 00000000 */   nop
.L001FDEAC:
/* 0FDFAC 001FDEAC FFFF8424 */  addiu       $4, $4, -0x1
.L001FDEB0:
/* 0FDFB0 001FDEB0 04008128 */  slti        $1, $4, 0x4
/* 0FDFB4 001FDEB4 F4FF2010 */  beqz        $1, .L001FDE88
/* 0FDFB8 001FDEB8 00000000 */   nop
.L001FDEBC:
/* 0FDFBC 001FDEBC 0800E003 */  jr          $31
/* 0FDFC0 001FDEC0 00000000 */   nop
/* 0FDFC4 001FDEC4 00000000 */  nop
/* 0FDFC8 001FDEC8 00000000 */  nop
/* 0FDFCC 001FDECC 00000000 */  nop
