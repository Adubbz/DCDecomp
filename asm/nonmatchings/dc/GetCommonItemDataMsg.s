.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetCommonItemDataMsg__Fi
/* D10C0 001D0FC0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* D10C4 001D0FC4 1000BF7F */  sq         $31, 0x10($sp)
/* D10C8 001D0FC8 0000B07F */  sq         $16, 0x0($sp)
/* D10CC 001D0FCC 28860070 */  paddub     $16, $0, $0
/* D10D0 001D0FD0 7443070C */  jal        GetCommonItemInfo__Fi
/* D10D4 001D0FD4 00000000 */   nop
/* D10D8 001D0FD8 03004010 */  beqz       $2, .L001D0FE8
/* D10DC 001D0FDC 00000000 */   nop
/* D10E0 001D0FE0 06005084 */  lh         $16, 0x6($2)
/* D10E4 001D0FE4 00000000 */  nop
.L001D0FE8:
/* D10E8 001D0FE8 28160072 */  paddub     $2, $16, $0
/* D10EC 001D0FEC 1000BF7B */  lq         $31, 0x10($sp)
/* D10F0 001D0FF0 0000B07B */  lq         $16, 0x0($sp)
/* D10F4 001D0FF4 2000BD27 */  addiu      $sp, $sp, 0x20
/* D10F8 001D0FF8 0800E003 */  jr         $31
/* D10FC 001D0FFC 00000000 */   nop
