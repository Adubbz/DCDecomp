.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishingExchangeLoop__Fv
/* F2EB0 001F2DB0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* F2EB4 001F2DB4 1000BF7F */  sq         $31, 0x10($sp)
/* F2EB8 001F2DB8 0000B07F */  sq         $16, 0x0($sp)
/* F2EBC 001F2DBC 20C6070C */  jal        FishingExchangeKey__Fv
/* F2EC0 001F2DC0 00000000 */   nop
/* F2EC4 001F2DC4 28864070 */  paddub     $16, $2, $0
/* F2EC8 001F2DC8 04CB070C */  jal        FishingExchangeDraw__Fv
/* F2ECC 001F2DCC 00000000 */   nop
/* F2ED0 001F2DD0 06000012 */  beqz       $16, .L001F2DEC
/* F2ED4 001F2DD4 00000000 */   nop
/* F2ED8 001F2DD8 4CCB070C */  jal        ExitFishingExchange__Fv
/* F2EDC 001F2DDC 00000000 */   nop
/* F2EE0 001F2DE0 01000224 */  addiu      $2, $0, 0x1
/* F2EE4 001F2DE4 02000010 */  b          .L001F2DF0
/* F2EE8 001F2DE8 00000000 */   nop
.L001F2DEC:
/* F2EEC 001F2DEC 28160070 */  paddub     $2, $0, $0
.L001F2DF0:
/* F2EF0 001F2DF0 1000BF7B */  lq         $31, 0x10($sp)
/* F2EF4 001F2DF4 0000B07B */  lq         $16, 0x0($sp)
/* F2EF8 001F2DF8 2000BD27 */  addiu      $sp, $sp, 0x20
/* F2EFC 001F2DFC 0800E003 */  jr         $31
/* F2F00 001F2E00 00000000 */   nop
/* F2F04 001F2E04 00000000 */  nop
/* F2F08 001F2E08 00000000 */  nop
/* F2F0C 001F2E0C 00000000 */  nop
