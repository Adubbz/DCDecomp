.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GOTO_CHANGE_ESA__FP12RS_STACKDATAi
/* 08C2C0 0018C1C0 70FFBD27 */  addiu       $29, $29, -0x90
/* 08C2C4 0018C1C4 0000BF7F */  sq          $31, 0x0($29)
/* 08C2C8 0018C1C8 0000838C */  lw          $3, 0x0($4)
/* 08C2CC 0018C1CC 03000224 */  addiu       $2, $0, 0x3
/* 08C2D0 0018C1D0 04006210 */  beq         $3, $2, .L0018C1E4
/* 08C2D4 0018C1D4 00000000 */   nop
/* 08C2D8 0018C1D8 28160070 */  paddub      $2, $0, $0
/* 08C2DC 0018C1DC 18000010 */  b           .L0018C240
/* 08C2E0 0018C1E0 00000000 */   nop
.L0018C1E4:
/* 08C2E4 0018C1E4 0400828C */  lw          $2, 0x4($4)
/* 08C2E8 0018C1E8 309282AF */  sw          $2, -0x6DD0($28)
/* 08C2EC 0018C1EC 2700023C */  lui         $2, %hi(LIT_820)
/* 08C2F0 0018C1F0 E09A4624 */  addiu       $6, $2, %lo(LIT_820)
/* 08C2F4 0018C1F4 1000A527 */  addiu       $5, $29, 0x10
/* 08C2F8 0018C1F8 04000424 */  addiu       $4, $0, 0x4
.L0018C1FC:
/* 08C2FC 0018C1FC 0000C378 */  lq          $3, 0x0($6)
/* 08C300 0018C200 1000C278 */  lq          $2, 0x10($6)
/* 08C304 0018C204 2000C624 */  addiu       $6, $6, 0x20
/* 08C308 0018C208 FFFF8424 */  addiu       $4, $4, -0x1
/* 08C30C 0018C20C 0000A37C */  sq          $3, 0x0($5)
/* 08C310 0018C210 1000A27C */  sq          $2, 0x10($5)
/* 08C314 0018C214 2000A524 */  addiu       $5, $5, 0x20
/* 08C318 0018C218 F8FF801C */  bgtz        $4, .L0018C1FC
/* 08C31C 0018C21C 00000000 */   nop
/* 08C320 0018C220 F4CA050C */  jal         EdUseItemInit__Fv
/* 08C324 0018C224 00000000 */   nop
/* 08C328 0018C228 1000A427 */  addiu       $4, $29, 0x10
/* 08C32C 0018C22C 00CB050C */  jal         EdSetUseItem__FPi
/* 08C330 0018C230 00000000 */   nop
/* 08C334 0018C234 09000224 */  addiu       $2, $0, 0x9
/* 08C338 0018C238 289282AF */  sw          $2, -0x6DD8($28)
/* 08C33C 0018C23C 01000224 */  addiu       $2, $0, 0x1
.L0018C240:
/* 08C340 0018C240 0000BF7B */  lq          $31, 0x0($29)
/* 08C344 0018C244 9000BD27 */  addiu       $29, $29, 0x90
/* 08C348 0018C248 0800E003 */  jr          $31
/* 08C34C 0018C24C 00000000 */   nop
