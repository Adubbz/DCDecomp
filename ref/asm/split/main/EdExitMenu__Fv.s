.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdExitMenu__Fv
/* 073030 00172F30 F0FFBD27 */  addiu       $29, $29, -0x10
/* 073034 00172F34 0000BF7F */  sq          $31, 0x0($29)
/* 073038 00172F38 CC01023C */  lui         $2, %hi(GamePad)
/* 07303C 00172F3C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 073040 00172F40 3CAE040C */  jal         AutoRepeatOff__8CGamePadFv
/* 073044 00172F44 00000000 */   nop
/* 073048 00172F48 CC01023C */  lui         $2, %hi(GamePad)
/* 07304C 00172F4C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 073050 00172F50 4CAE040C */  jal         MenuModeOff__8CGamePadFv
/* 073054 00172F54 00000000 */   nop
/* 073058 00172F58 28260070 */  paddub      $4, $0, $0
/* 07305C 00172F5C B4B5040C */  jal         MGFlipWaitVSync__Fi
/* 073060 00172F60 00000000 */   nop
/* 073064 00172F64 0000BF7B */  lq          $31, 0x0($29)
/* 073068 00172F68 1000BD27 */  addiu       $29, $29, 0x10
/* 07306C 00172F6C 0800E003 */  jr          $31
/* 073070 00172F70 00000000 */   nop
/* 073074 00172F74 00000000 */  nop
/* 073078 00172F78 00000000 */  nop
/* 07307C 00172F7C 00000000 */  nop
