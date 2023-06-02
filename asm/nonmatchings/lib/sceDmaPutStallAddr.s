.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDmaPutStallAddr
/* C7D0 0010C6D0 0010023C */  lui        $2, (0x1000E060 >> 16)
/* C7D4 0010C6D4 FFFF033C */  lui        $3, (0xFFFFFFFF >> 16)
/* C7D8 0010C6D8 60E04234 */  ori        $2, $2, (0x1000E060 & 0xFFFF)
/* C7DC 0010C6DC FFFF6334 */  ori        $3, $3, (0xFFFFFFFF & 0xFFFF)
/* C7E0 0010C6E0 03008310 */  beq        $4, $3, .L0010C6F0
/* C7E4 0010C6E4 0000428C */   lw        $2, 0x0($2)
/* C7E8 0010C6E8 0110013C */  lui        $at, (0x10010000 >> 16)
/* C7EC 0010C6EC 60E024AC */  sw         $4, -0x1FA0($at)
.L0010C6F0:
/* C7F0 0010C6F0 0800E003 */  jr         $31
/* C7F4 0010C6F4 00000000 */   nop
