.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel PickUpPoly__12CNPCharacterFPfP6CCPoly
/* 0567D0 001566D0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0567D4 001566D4 0000BF7F */  sq          $31, 0x0($29)
/* 0567D8 001566D8 6C14828C */  lw          $2, 0x146C($4)
/* 0567DC 001566DC 05004010 */  beqz        $2, .L001566F4
/* 0567E0 001566E0 00000000 */   nop
/* 0567E4 001566E4 C459050C */  jal         PickUpPoly__10CCharacterFPfP6CCPoly
/* 0567E8 001566E8 00000000 */   nop
/* 0567EC 001566EC 02000010 */  b           .L001566F8
/* 0567F0 001566F0 00000000 */   nop
.L001566F4:
/* 0567F4 001566F4 28160070 */  paddub      $2, $0, $0
.L001566F8:
/* 0567F8 001566F8 0000BF7B */  lq          $31, 0x0($29)
/* 0567FC 001566FC 1000BD27 */  addiu       $29, $29, 0x10
/* 056800 00156700 0800E003 */  jr          $31
/* 056804 00156704 00000000 */   nop
/* 056808 00156708 00000000 */  nop
/* 05680C 0015670C 00000000 */  nop
