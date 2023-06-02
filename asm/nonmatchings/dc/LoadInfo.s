.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadInfo__FPci
/* 9FC70 0019FB70 40F7BD27 */  addiu      $sp, $sp, -0x8C0
/* 9FC74 0019FB74 2000BF7F */  sq         $31, 0x20($sp)
/* 9FC78 0019FB78 1000B17F */  sq         $17, 0x10($sp)
/* 9FC7C 0019FB7C 0000B07F */  sq         $16, 0x0($sp)
/* 9FC80 0019FB80 288E8070 */  paddub     $17, $4, $0
/* 9FC84 0019FB84 2886A070 */  paddub     $16, $5, $0
/* 9FC88 0019FB88 3000A427 */  addiu      $4, $sp, 0x30
/* 9FC8C 0019FB8C AC7C050C */  jal        __ct__18CScriptInterpreterFv
/* 9FC90 0019FB90 00000000 */   nop
/* 9FC94 0019FB94 3000A427 */  addiu      $4, $sp, 0x30
/* 9FC98 0019FB98 282E2072 */  paddub     $5, $17, $0
/* 9FC9C 0019FB9C 28360072 */  paddub     $6, $16, $0
/* 9FCA0 0019FBA0 9C7C050C */  jal        SetScript__18CScriptInterpreterFPci
/* 9FCA4 0019FBA4 00000000 */   nop
/* 9FCA8 0019FBA8 3000A427 */  addiu      $4, $sp, 0x30
/* 9FCAC 0019FBAC 2700023C */  lui        $2, %hi(Command_6)
/* 9FCB0 0019FBB0 F0A74524 */  addiu      $5, $2, %lo(Command_6)
/* 9FCB4 0019FBB4 0F000624 */  addiu      $6, $0, 0xF
/* 9FCB8 0019FBB8 947C050C */  jal        SetTAG__18CScriptInterpreterFP9TAG_PARAMi
/* 9FCBC 0019FBBC 00000000 */   nop
/* 9FCC0 0019FBC0 D501013C */  lui        $at, (0x1D54950 >> 16)
/* 9FCC4 0019FBC4 504920A0 */  sb         $0, (0x1D54950 & 0xFFFF)($at)
/* 9FCC8 0019FBC8 149380AF */  sw         $0, -0x6CEC($gp)
/* 9FCCC 0019FBCC 189380AF */  sw         $0, -0x6CE8($gp)
/* 9FCD0 0019FBD0 1C9380AF */  sw         $0, -0x6CE4($gp)
/* 9FCD4 0019FBD4 249380AF */  sw         $0, -0x6CDC($gp)
/* 9FCD8 0019FBD8 289380AF */  sw         $0, -0x6CD8($gp)
/* 9FCDC 0019FBDC 2C9380AF */  sw         $0, -0x6CD4($gp)
/* 9FCE0 0019FBE0 209380AF */  sw         $0, -0x6CE0($gp)
.L0019FBE4:
/* 9FCE4 0019FBE4 3000A427 */  addiu      $4, $sp, 0x30
/* 9FCE8 0019FBE8 407C050C */  jal        GetNextTAG__18CScriptInterpreterFv
/* 9FCEC 0019FBEC 00000000 */   nop
/* 9FCF0 0019FBF0 0B004004 */  bltz       $2, .L0019FC20
/* 9FCF4 0019FBF4 00000000 */   nop
/* 9FCF8 0019FBF8 5404A427 */  addiu      $4, $sp, 0x454
/* 9FCFC 0019FBFC 80180200 */  sll        $3, $2, 2
/* 9FD00 0019FC00 2700023C */  lui        $2, %hi(CommandExe_6)
/* 9FD04 0019FC04 D0AD4224 */  addiu      $2, $2, %lo(CommandExe_6)
/* 9FD08 0019FC08 21104300 */  addu       $2, $2, $3
/* 9FD0C 0019FC0C 0000428C */  lw         $2, 0x0($2)
/* 9FD10 0019FC10 09F84000 */  jalr       $2
/* 9FD14 0019FC14 00000000 */   nop
/* 9FD18 0019FC18 F2FF0010 */  b          .L0019FBE4
/* 9FD1C 0019FC1C 00000000 */   nop
.L0019FC20:
/* 9FD20 0019FC20 1893838F */  lw         $3, -0x6CE8($gp)
/* 9FD24 0019FC24 B49283AF */  sw         $3, -0x6D4C($gp)
/* 9FD28 0019FC28 1C93838F */  lw         $3, -0x6CE4($gp)
/* 9FD2C 0019FC2C B89283AF */  sw         $3, -0x6D48($gp)
/* 9FD30 0019FC30 2000BF7B */  lq         $31, 0x20($sp)
/* 9FD34 0019FC34 1000B17B */  lq         $17, 0x10($sp)
/* 9FD38 0019FC38 0000B07B */  lq         $16, 0x0($sp)
/* 9FD3C 0019FC3C C008BD27 */  addiu      $sp, $sp, 0x8C0
/* 9FD40 0019FC40 0800E003 */  jr         $31
/* 9FD44 0019FC44 00000000 */   nop
/* 9FD48 0019FC48 00000000 */  nop
/* 9FD4C 0019FC4C 00000000 */  nop
