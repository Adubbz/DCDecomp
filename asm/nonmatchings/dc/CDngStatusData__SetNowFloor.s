.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetNowFloor__14CDngStatusDataFi
/* BDA00 001BD900 02008380 */  lb         $3, 0x2($4)
/* BDA04 001BD904 030083A0 */  sb         $3, 0x3($4)
/* BDA08 001BD908 020085A0 */  sb         $5, 0x2($4)
/* BDA0C 001BD90C 00008380 */  lb         $3, 0x0($4)
/* BDA10 001BD910 21186400 */  addu       $3, $3, $4
/* BDA14 001BD914 BF426424 */  addiu      $4, $3, 0x42BF
/* BDA18 001BD918 BF426380 */  lb         $3, 0x42BF($3)
/* BDA1C 001BD91C 2A086500 */  slt        $at, $3, $5
/* BDA20 001BD920 02002010 */  beqz       $at, .L001BD92C
/* BDA24 001BD924 00000000 */   nop
/* BDA28 001BD928 000085A0 */  sb         $5, 0x0($4)
.L001BD92C:
/* BDA2C 001BD92C 0800E003 */  jr         $31
/* BDA30 001BD930 00000000 */   nop
/* BDA34 001BD934 00000000 */  nop
/* BDA38 001BD938 00000000 */  nop
/* BDA3C 001BD93C 00000000 */  nop
