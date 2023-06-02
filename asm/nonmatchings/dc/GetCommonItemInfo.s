.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetCommonItemInfo__Fi
/* D0ED0 001D0DD0 0400801C */  bgtz       $4, .L001D0DE4
/* D0ED4 001D0DD4 00000000 */   nop
/* D0ED8 001D0DD8 28160070 */  paddub     $2, $0, $0
/* D0EDC 001D0DDC 0F000010 */  b          .L001D0E1C
/* D0EE0 001D0DE0 00000000 */   nop
.L001D0DE4:
/* D0EE4 001D0DE4 2A080400 */  slt        $at, $0, $4
/* D0EE8 001D0DE8 07002010 */  beqz       $at, .L001D0E08
/* D0EEC 001D0DEC 00000000 */   nop
/* D0EF0 001D0DF0 51008128 */  slti       $at, $4, 0x51
/* D0EF4 001D0DF4 04002010 */  beqz       $at, .L001D0E08
/* D0EF8 001D0DF8 00000000 */   nop
/* D0EFC 001D0DFC AF008424 */  addiu      $4, $4, 0xAF
/* D0F00 001D0E00 02000010 */  b          .L001D0E0C
/* D0F04 001D0E04 00000000 */   nop
.L001D0E08:
/* D0F08 001D0E08 AFFF8424 */  addiu      $4, $4, -0x51
.L001D0E0C:
/* D0F0C 001D0E0C C0180400 */  sll        $3, $4, 3
/* D0F10 001D0E10 2800023C */  lui        $2, %hi(ComItemInfo)
/* D0F14 001D0E14 50DE4224 */  addiu      $2, $2, %lo(ComItemInfo)
/* D0F18 001D0E18 21104300 */  addu       $2, $2, $3
.L001D0E1C:
/* D0F1C 001D0E1C 0800E003 */  jr         $31
/* D0F20 001D0E20 00000000 */   nop
/* D0F24 001D0E24 00000000 */  nop
/* D0F28 001D0E28 00000000 */  nop
/* D0F2C 001D0E2C 00000000 */  nop
