.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadCFGFile__13CTextureAnimeFPci
/* 067CC0 00167BC0 40F7BD27 */  addiu       $29, $29, -0x8C0
/* 067CC4 00167BC4 2000BF7F */  sq          $31, 0x20($29)
/* 067CC8 00167BC8 1000B17F */  sq          $17, 0x10($29)
/* 067CCC 00167BCC 0000B07F */  sq          $16, 0x0($29)
/* 067CD0 00167BD0 288EA070 */  paddub      $17, $5, $0
/* 067CD4 00167BD4 2886C070 */  paddub      $16, $6, $0
/* 067CD8 00167BD8 948E84AF */  sw          $4, -0x716C($28)
/* 067CDC 00167BDC 988E80AF */  sw          $0, -0x7168($28)
/* 067CE0 00167BE0 B89E050C */  jal         DisableAll__13CTextureAnimeFv
/* 067CE4 00167BE4 00000000 */   nop
/* 067CE8 00167BE8 3000A427 */  addiu       $4, $29, 0x30
/* 067CEC 00167BEC AC7C050C */  jal         __ct__18CScriptInterpreterFv
/* 067CF0 00167BF0 00000000 */   nop
/* 067CF4 00167BF4 3000A427 */  addiu       $4, $29, 0x30
/* 067CF8 00167BF8 282E2072 */  paddub      $5, $17, $0
/* 067CFC 00167BFC 28360072 */  paddub      $6, $16, $0
/* 067D00 00167C00 9C7C050C */  jal         SetScript__18CScriptInterpreterFPci
/* 067D04 00167C04 00000000 */   nop
/* 067D08 00167C08 2600023C */  lui         $2, %hi(Command__4)
/* 067D0C 00167C0C 70694524 */  addiu       $5, $2, %lo(Command__4)
/* 067D10 00167C10 3000A427 */  addiu       $4, $29, 0x30
/* 067D14 00167C14 05000624 */  addiu       $6, $0, 0x5
/* 067D18 00167C18 947C050C */  jal         SetTAG__18CScriptInterpreterFP9TAG_PARAMi
/* 067D1C 00167C1C 00000000 */   nop
.L00167C20:
/* 067D20 00167C20 3000A427 */  addiu       $4, $29, 0x30
/* 067D24 00167C24 407C050C */  jal         GetNextTAG__18CScriptInterpreterFv
/* 067D28 00167C28 00000000 */   nop
/* 067D2C 00167C2C 0B004004 */  bltz        $2, .L00167C5C
/* 067D30 00167C30 00000000 */   nop
/* 067D34 00167C34 5404A427 */  addiu       $4, $29, 0x454
/* 067D38 00167C38 80180200 */  sll         $3, $2, 2
/* 067D3C 00167C3C 2600023C */  lui         $2, %hi(CommandExe__4)
/* 067D40 00167C40 706B4224 */  addiu       $2, $2, %lo(CommandExe__4)
/* 067D44 00167C44 21104300 */  addu        $2, $2, $3
/* 067D48 00167C48 0000428C */  lw          $2, 0x0($2)
/* 067D4C 00167C4C 09F84000 */  jalr        $2
/* 067D50 00167C50 00000000 */   nop
/* 067D54 00167C54 F2FF0010 */  b           .L00167C20
/* 067D58 00167C58 00000000 */   nop
.L00167C5C:
/* 067D5C 00167C5C 2000BF7B */  lq          $31, 0x20($29)
/* 067D60 00167C60 1000B17B */  lq          $17, 0x10($29)
/* 067D64 00167C64 0000B07B */  lq          $16, 0x0($29)
/* 067D68 00167C68 C008BD27 */  addiu       $29, $29, 0x8C0
/* 067D6C 00167C6C 0800E003 */  jr          $31
/* 067D70 00167C70 00000000 */   nop
/* 067D74 00167C74 00000000 */  nop
/* 067D78 00167C78 00000000 */  nop
/* 067D7C 00167C7C 00000000 */  nop
