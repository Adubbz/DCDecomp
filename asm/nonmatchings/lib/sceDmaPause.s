.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDmaPause
/* CF28 0010CE28 0000828C */  lw         $2, 0x0($4)
/* CF2C 0010CE2C FFFE0324 */  addiu      $3, $0, -0x101
/* CF30 0010CE30 24184300 */  and        $3, $2, $3
/* CF34 0010CE34 02120200 */  srl        $2, $2, 8
/* CF38 0010CE38 000083AC */  sw         $3, 0x0($4)
/* CF3C 0010CE3C 0800E003 */  jr         $31
/* CF40 0010CE40 01004230 */   andi      $2, $2, 0x1
/* CF44 0010CE44 00000000 */  nop
