.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadCFGFile__13CTextureAnimeFPci
/* 67CC0 00167BC0 40F7BD27 */  addiu      $sp, $sp, -0x8C0
/* 67CC4 00167BC4 2000BF7F */  sq         $31, 0x20($sp)
/* 67CC8 00167BC8 1000B17F */  sq         $17, 0x10($sp)
/* 67CCC 00167BCC 0000B07F */  sq         $16, 0x0($sp)
/* 67CD0 00167BD0 288EA070 */  paddub     $17, $5, $0
/* 67CD4 00167BD4 2886C070 */  paddub     $16, $6, $0
/* 67CD8 00167BD8 948E84AF */  sw         $4, -0x716C($gp)
/* 67CDC 00167BDC 988E80AF */  sw         $0, -0x7168($gp)
/* 67CE0 00167BE0 B89E050C */  jal        DisableAll__13CTextureAnimeFv
/* 67CE4 00167BE4 00000000 */   nop
/* 67CE8 00167BE8 3000A427 */  addiu      $4, $sp, 0x30
/* 67CEC 00167BEC AC7C050C */  jal        __ct__18CScriptInterpreterFv
/* 67CF0 00167BF0 00000000 */   nop
/* 67CF4 00167BF4 3000A427 */  addiu      $4, $sp, 0x30
/* 67CF8 00167BF8 282E2072 */  paddub     $5, $17, $0
/* 67CFC 00167BFC 28360072 */  paddub     $6, $16, $0
/* 67D00 00167C00 9C7C050C */  jal        SetScript__18CScriptInterpreterFPci
/* 67D04 00167C04 00000000 */   nop
/* 67D08 00167C08 2600023C */  lui        $2, %hi(Command_4)
/* 67D0C 00167C0C 70694524 */  addiu      $5, $2, %lo(Command_4)
/* 67D10 00167C10 3000A427 */  addiu      $4, $sp, 0x30
/* 67D14 00167C14 05000624 */  addiu      $6, $0, 0x5
/* 67D18 00167C18 947C050C */  jal        SetTAG__18CScriptInterpreterFP9TAG_PARAMi
/* 67D1C 00167C1C 00000000 */   nop
.L00167C20:
/* 67D20 00167C20 3000A427 */  addiu      $4, $sp, 0x30
/* 67D24 00167C24 407C050C */  jal        GetNextTAG__18CScriptInterpreterFv
/* 67D28 00167C28 00000000 */   nop
/* 67D2C 00167C2C 0B004004 */  bltz       $2, .L00167C5C
/* 67D30 00167C30 00000000 */   nop
/* 67D34 00167C34 5404A427 */  addiu      $4, $sp, 0x454
/* 67D38 00167C38 80180200 */  sll        $3, $2, 2
/* 67D3C 00167C3C 2600023C */  lui        $2, %hi(CommandExe_4)
/* 67D40 00167C40 706B4224 */  addiu      $2, $2, %lo(CommandExe_4)
/* 67D44 00167C44 21104300 */  addu       $2, $2, $3
/* 67D48 00167C48 0000428C */  lw         $2, 0x0($2)
/* 67D4C 00167C4C 09F84000 */  jalr       $2
/* 67D50 00167C50 00000000 */   nop
/* 67D54 00167C54 F2FF0010 */  b          .L00167C20
/* 67D58 00167C58 00000000 */   nop
.L00167C5C:
/* 67D5C 00167C5C 2000BF7B */  lq         $31, 0x20($sp)
/* 67D60 00167C60 1000B17B */  lq         $17, 0x10($sp)
/* 67D64 00167C64 0000B07B */  lq         $16, 0x0($sp)
/* 67D68 00167C68 C008BD27 */  addiu      $sp, $sp, 0x8C0
/* 67D6C 00167C6C 0800E003 */  jr         $31
/* 67D70 00167C70 00000000 */   nop
/* 67D74 00167C74 00000000 */  nop
/* 67D78 00167C78 00000000 */  nop
/* 67D7C 00167C7C 00000000 */  nop
