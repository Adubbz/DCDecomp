.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetPosition__10CCharacterFPf
/* 0391E0 001390E0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0391E4 001390E4 0000BF7F */  sq          $31, 0x0($29)
/* 0391E8 001390E8 0000ACC4 */  lwc1        $f12, 0x0($5)
/* 0391EC 001390EC 0400ADC4 */  lwc1        $f13, 0x4($5)
/* 0391F0 001390F0 0800AEC4 */  lwc1        $f14, 0x8($5)
/* 0391F4 001390F4 ECE3040C */  jal         SetPosition__10CCharacterFfff
/* 0391F8 001390F8 00000000 */   nop
/* 0391FC 001390FC 0000BF7B */  lq          $31, 0x0($29)
/* 039200 00139100 1000BD27 */  addiu       $29, $29, 0x10
/* 039204 00139104 0800E003 */  jr          $31
/* 039208 00139108 00000000 */   nop
/* 03920C 0013910C 00000000 */  nop
