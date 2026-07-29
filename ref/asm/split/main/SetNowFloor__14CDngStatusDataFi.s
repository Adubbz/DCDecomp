.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetNowFloor__14CDngStatusDataFi
/* 0BDA00 001BD900 02008380 */  lb          $3, 0x2($4)
/* 0BDA04 001BD904 030083A0 */  sb          $3, 0x3($4)
/* 0BDA08 001BD908 020085A0 */  sb          $5, 0x2($4)
/* 0BDA0C 001BD90C 00008380 */  lb          $3, 0x0($4)
/* 0BDA10 001BD910 21186400 */  addu        $3, $3, $4
/* 0BDA14 001BD914 BF426424 */  addiu       $4, $3, 0x42BF
/* 0BDA18 001BD918 BF426380 */  lb          $3, 0x42BF($3)
/* 0BDA1C 001BD91C 2A086500 */  slt         $1, $3, $5
/* 0BDA20 001BD920 02002010 */  beqz        $1, .L001BD92C
/* 0BDA24 001BD924 00000000 */   nop
/* 0BDA28 001BD928 000085A0 */  sb          $5, 0x0($4)
.L001BD92C:
/* 0BDA2C 001BD92C 0800E003 */  jr          $31
/* 0BDA30 001BD930 00000000 */   nop
/* 0BDA34 001BD934 00000000 */  nop
/* 0BDA38 001BD938 00000000 */  nop
/* 0BDA3C 001BD93C 00000000 */  nop
