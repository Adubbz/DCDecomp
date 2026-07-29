.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadActiveItemIcon__Fv
/* 0D14A0 001D13A0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0D14A4 001D13A4 0000BF7F */  sq          $31, 0x0($29)
/* 0D14A8 001D13A8 948B858F */  lw          $5, -0x746C($28)
/* 0D14AC 001D13AC 2A00023C */  lui         $2, %hi(LIT_642__2)
/* 0D14B0 001D13B0 A0C54424 */  addiu       $4, $2, %lo(LIT_642__2)
/* 0D14B4 001D13B4 D0AE080C */  jal         LoadFileMenuData__FPcPUi
/* 0D14B8 001D13B8 00000000 */   nop
/* 0D14BC 001D13BC DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 0D14C0 001D13C0 00000000 */   nop
/* 0D14C4 001D13C4 948B858F */  lw          $5, -0x746C($28)
/* 0D14C8 001D13C8 28000424 */  addiu       $4, $0, 0x28
/* 0D14CC 001D13CC FCAF760C */  jal         SetTempTexture__FiPc
/* 0D14D0 001D13D0 00000000 */   nop
/* 0D14D4 001D13D4 01000324 */  addiu       $3, $0, 0x1
/* 0D14D8 001D13D8 D89D83AF */  sw          $3, -0x6228($28)
/* 0D14DC 001D13DC 0000BF7B */  lq          $31, 0x0($29)
/* 0D14E0 001D13E0 1000BD27 */  addiu       $29, $29, 0x10
/* 0D14E4 001D13E4 0800E003 */  jr          $31
/* 0D14E8 001D13E8 00000000 */   nop
/* 0D14EC 001D13EC 00000000 */  nop
