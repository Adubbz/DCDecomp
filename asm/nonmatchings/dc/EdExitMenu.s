.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdExitMenu__Fv
/* 73030 00172F30 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 73034 00172F34 0000BF7F */  sq         $31, 0x0($sp)
/* 73038 00172F38 CC01023C */  lui        $2, %hi(GamePad)
/* 7303C 00172F3C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 73040 00172F40 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* 73044 00172F44 00000000 */   nop
/* 73048 00172F48 CC01023C */  lui        $2, %hi(GamePad)
/* 7304C 00172F4C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 73050 00172F50 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* 73054 00172F54 00000000 */   nop
/* 73058 00172F58 28260070 */  paddub     $4, $0, $0
/* 7305C 00172F5C B4B5040C */  jal        MGFlipWaitVSync__Fi
/* 73060 00172F60 00000000 */   nop
/* 73064 00172F64 0000BF7B */  lq         $31, 0x0($sp)
/* 73068 00172F68 1000BD27 */  addiu      $sp, $sp, 0x10
/* 7306C 00172F6C 0800E003 */  jr         $31
/* 73070 00172F70 00000000 */   nop
/* 73074 00172F74 00000000 */  nop
/* 73078 00172F78 00000000 */  nop
/* 7307C 00172F7C 00000000 */  nop
