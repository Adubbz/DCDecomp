.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommonShopLoop__Fv
/* E7120 001E7020 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E7124 001E7024 0000BF7F */  sq         $31, 0x0($sp)
/* E7128 001E7028 28160070 */  paddub     $2, $0, $0
/* E712C 001E702C D901013C */  lui        $at, (0x1D900D6 >> 16)
/* E7130 001E7030 D60020A4 */  sh         $0, (0x1D900D6 & 0xFFFF)($at)
/* E7134 001E7034 C4948487 */  lh         $4, -0x6B3C($gp)
/* E7138 001E7038 01000324 */  addiu      $3, $0, 0x1
/* E713C 001E703C 09008310 */  beq        $4, $3, .L001E7064
/* E7140 001E7040 00000000 */   nop
/* E7144 001E7044 03008010 */  beqz       $4, .L001E7054
/* E7148 001E7048 00000000 */   nop
/* E714C 001E704C 07000010 */  b          .L001E706C
/* E7150 001E7050 00000000 */   nop
.L001E7054:
/* E7154 001E7054 30A2070C */  jal        ChargeShopLoop__Fv
/* E7158 001E7058 00000000 */   nop
/* E715C 001E705C 03000010 */  b          .L001E706C
/* E7160 001E7060 00000000 */   nop
.L001E7064:
/* E7164 001E7064 48B0070C */  jal        ItemShopLoop2__Fv
/* E7168 001E7068 00000000 */   nop
.L001E706C:
/* E716C 001E706C 0000BF7B */  lq         $31, 0x0($sp)
/* E7170 001E7070 1000BD27 */  addiu      $sp, $sp, 0x10
/* E7174 001E7074 0800E003 */  jr         $31
/* E7178 001E7078 00000000 */   nop
/* E717C 001E707C 00000000 */  nop
