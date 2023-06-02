.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SaveMenuKeyEndSaveEnding__Fv
/* 1224B0 002223B0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1224B4 002223B4 0000BF7F */  sq         $31, 0x0($sp)
/* 1224B8 002223B8 CC01023C */  lui        $2, %hi(GamePad)
/* 1224BC 002223BC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 1224C0 002223C0 40000524 */  addiu      $5, $0, 0x40
/* 1224C4 002223C4 1CAE040C */  jal        Down__8CGamePadFi
/* 1224C8 002223C8 00000000 */   nop
/* 1224CC 002223CC 09004010 */  beqz       $2, .L002223F4
/* 1224D0 002223D0 00000000 */   nop
/* 1224D4 002223D4 03000224 */  addiu      $2, $0, 0x3
/* 1224D8 002223D8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1224DC 002223DC D48A22AC */  sw         $2, -0x752C($at)
/* 1224E0 002223E0 DB01023C */  lui        $2, %hi(McAccess)
/* 1224E4 002223E4 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 1224E8 002223E8 01000524 */  addiu      $5, $0, 0x1
/* 1224EC 002223EC E44E080C */  jal        SetFuncNo__17CMemoryCardAccessFi
/* 1224F0 002223F0 00000000 */   nop
.L002223F4:
/* 1224F4 002223F4 01000224 */  addiu      $2, $0, 0x1
/* 1224F8 002223F8 0000BF7B */  lq         $31, 0x0($sp)
/* 1224FC 002223FC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 122500 00222400 0800E003 */  jr         $31
/* 122504 00222404 00000000 */   nop
/* 122508 00222408 00000000 */  nop
/* 12250C 0022240C 00000000 */  nop
