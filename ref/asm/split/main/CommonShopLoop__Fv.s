.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommonShopLoop__Fv
/* 0E7120 001E7020 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0E7124 001E7024 0000BF7F */  sq          $31, 0x0($29)
/* 0E7128 001E7028 28160070 */  paddub      $2, $0, $0
/* 0E712C 001E702C D901013C */  lui         $1, %hi(ShopMenu + 0x6)
/* 0E7130 001E7030 D60020A4 */  sh          $0, %lo(ShopMenu + 0x6)($1)
/* 0E7134 001E7034 C4948487 */  lh          $4, -0x6B3C($28)
/* 0E7138 001E7038 01000324 */  addiu       $3, $0, 0x1
/* 0E713C 001E703C 09008310 */  beq         $4, $3, .L001E7064
/* 0E7140 001E7040 00000000 */   nop
/* 0E7144 001E7044 03008010 */  beqz        $4, .L001E7054
/* 0E7148 001E7048 00000000 */   nop
/* 0E714C 001E704C 07000010 */  b           .L001E706C
/* 0E7150 001E7050 00000000 */   nop
.L001E7054:
/* 0E7154 001E7054 30A2070C */  jal         ChargeShopLoop__Fv
/* 0E7158 001E7058 00000000 */   nop
/* 0E715C 001E705C 03000010 */  b           .L001E706C
/* 0E7160 001E7060 00000000 */   nop
.L001E7064:
/* 0E7164 001E7064 48B0070C */  jal         ItemShopLoop2__Fv
/* 0E7168 001E7068 00000000 */   nop
.L001E706C:
/* 0E716C 001E706C 0000BF7B */  lq          $31, 0x0($29)
/* 0E7170 001E7070 1000BD27 */  addiu       $29, $29, 0x10
/* 0E7174 001E7074 0800E003 */  jr          $31
/* 0E7178 001E7078 00000000 */   nop
/* 0E717C 001E707C 00000000 */  nop
