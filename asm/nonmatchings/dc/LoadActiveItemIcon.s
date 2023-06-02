.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadActiveItemIcon__Fv
/* D14A0 001D13A0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* D14A4 001D13A4 0000BF7F */  sq         $31, 0x0($sp)
/* D14A8 001D13A8 948B858F */  lw         $5, -0x746C($gp)
/* D14AC 001D13AC 2A00023C */  lui        $2, %hi(_642_2)
/* D14B0 001D13B0 A0C54424 */  addiu      $4, $2, %lo(_642_2)
/* D14B4 001D13B4 D0AE080C */  jal        LoadFileMenuData__FPcPUi
/* D14B8 001D13B8 00000000 */   nop
/* D14BC 001D13BC DC4F050C */  jal        wait_now_loading_vsync__Fv
/* D14C0 001D13C0 00000000 */   nop
/* D14C4 001D13C4 948B858F */  lw         $5, -0x746C($gp)
/* D14C8 001D13C8 28000424 */  addiu      $4, $0, 0x28
/* D14CC 001D13CC FCAF760C */  jal        func_1DABFF0
/* D14D0 001D13D0 00000000 */   nop
/* D14D4 001D13D4 01000324 */  addiu      $3, $0, 0x1
/* D14D8 001D13D8 D89D83AF */  sw         $3, -0x6228($gp)
/* D14DC 001D13DC 0000BF7B */  lq         $31, 0x0($sp)
/* D14E0 001D13E0 1000BD27 */  addiu      $sp, $sp, 0x10
/* D14E4 001D13E4 0800E003 */  jr         $31
/* D14E8 001D13E8 00000000 */   nop
/* D14EC 001D13EC 00000000 */  nop
