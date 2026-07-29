.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadInfo__FPci
/* 09FC70 0019FB70 40F7BD27 */  addiu       $29, $29, -0x8C0
/* 09FC74 0019FB74 2000BF7F */  sq          $31, 0x20($29)
/* 09FC78 0019FB78 1000B17F */  sq          $17, 0x10($29)
/* 09FC7C 0019FB7C 0000B07F */  sq          $16, 0x0($29)
/* 09FC80 0019FB80 288E8070 */  paddub      $17, $4, $0
/* 09FC84 0019FB84 2886A070 */  paddub      $16, $5, $0
/* 09FC88 0019FB88 3000A427 */  addiu       $4, $29, 0x30
/* 09FC8C 0019FB8C AC7C050C */  jal         __ct__18CScriptInterpreterFv
/* 09FC90 0019FB90 00000000 */   nop
/* 09FC94 0019FB94 3000A427 */  addiu       $4, $29, 0x30
/* 09FC98 0019FB98 282E2072 */  paddub      $5, $17, $0
/* 09FC9C 0019FB9C 28360072 */  paddub      $6, $16, $0
/* 09FCA0 0019FBA0 9C7C050C */  jal         SetScript__18CScriptInterpreterFPci
/* 09FCA4 0019FBA4 00000000 */   nop
/* 09FCA8 0019FBA8 3000A427 */  addiu       $4, $29, 0x30
/* 09FCAC 0019FBAC 2700023C */  lui         $2, %hi(Command__6)
/* 09FCB0 0019FBB0 F0A74524 */  addiu       $5, $2, %lo(Command__6)
/* 09FCB4 0019FBB4 0F000624 */  addiu       $6, $0, 0xF
/* 09FCB8 0019FBB8 947C050C */  jal         SetTAG__18CScriptInterpreterFP9TAG_PARAMi
/* 09FCBC 0019FBBC 00000000 */   nop
/* 09FCC0 0019FBC0 D501013C */  lui         $1, %hi(CurrentDir__5)
/* 09FCC4 0019FBC4 504920A0 */  sb          $0, %lo(CurrentDir__5)($1)
/* 09FCC8 0019FBC8 149380AF */  sw          $0, -0x6CEC($28)
/* 09FCCC 0019FBCC 189380AF */  sw          $0, -0x6CE8($28)
/* 09FCD0 0019FBD0 1C9380AF */  sw          $0, -0x6CE4($28)
/* 09FCD4 0019FBD4 249380AF */  sw          $0, -0x6CDC($28)
/* 09FCD8 0019FBD8 289380AF */  sw          $0, -0x6CD8($28)
/* 09FCDC 0019FBDC 2C9380AF */  sw          $0, -0x6CD4($28)
/* 09FCE0 0019FBE0 209380AF */  sw          $0, -0x6CE0($28)
.L0019FBE4:
/* 09FCE4 0019FBE4 3000A427 */  addiu       $4, $29, 0x30
/* 09FCE8 0019FBE8 407C050C */  jal         GetNextTAG__18CScriptInterpreterFv
/* 09FCEC 0019FBEC 00000000 */   nop
/* 09FCF0 0019FBF0 0B004004 */  bltz        $2, .L0019FC20
/* 09FCF4 0019FBF4 00000000 */   nop
/* 09FCF8 0019FBF8 5404A427 */  addiu       $4, $29, 0x454
/* 09FCFC 0019FBFC 80180200 */  sll         $3, $2, 2
/* 09FD00 0019FC00 2700023C */  lui         $2, %hi(CommandExe__6)
/* 09FD04 0019FC04 D0AD4224 */  addiu       $2, $2, %lo(CommandExe__6)
/* 09FD08 0019FC08 21104300 */  addu        $2, $2, $3
/* 09FD0C 0019FC0C 0000428C */  lw          $2, 0x0($2)
/* 09FD10 0019FC10 09F84000 */  jalr        $2
/* 09FD14 0019FC14 00000000 */   nop
/* 09FD18 0019FC18 F2FF0010 */  b           .L0019FBE4
/* 09FD1C 0019FC1C 00000000 */   nop
.L0019FC20:
/* 09FD20 0019FC20 1893838F */  lw          $3, -0x6CE8($28)
/* 09FD24 0019FC24 B49283AF */  sw          $3, -0x6D4C($28)
/* 09FD28 0019FC28 1C93838F */  lw          $3, -0x6CE4($28)
/* 09FD2C 0019FC2C B89283AF */  sw          $3, -0x6D48($28)
/* 09FD30 0019FC30 2000BF7B */  lq          $31, 0x20($29)
/* 09FD34 0019FC34 1000B17B */  lq          $17, 0x10($29)
/* 09FD38 0019FC38 0000B07B */  lq          $16, 0x0($29)
/* 09FD3C 0019FC3C C008BD27 */  addiu       $29, $29, 0x8C0
/* 09FD40 0019FC40 0800E003 */  jr          $31
/* 09FD44 0019FC44 00000000 */   nop
/* 09FD48 0019FC48 00000000 */  nop
/* 09FD4C 0019FC4C 00000000 */  nop
