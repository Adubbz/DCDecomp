.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GOTO_CHANGE_ESA__FP12RS_STACKDATAi
/* 8C2C0 0018C1C0 70FFBD27 */  addiu      $sp, $sp, -0x90
/* 8C2C4 0018C1C4 0000BF7F */  sq         $31, 0x0($sp)
/* 8C2C8 0018C1C8 0000838C */  lw         $3, 0x0($4)
/* 8C2CC 0018C1CC 03000224 */  addiu      $2, $0, 0x3
/* 8C2D0 0018C1D0 04006210 */  beq        $3, $2, .L0018C1E4
/* 8C2D4 0018C1D4 00000000 */   nop
/* 8C2D8 0018C1D8 28160070 */  paddub     $2, $0, $0
/* 8C2DC 0018C1DC 18000010 */  b          .L0018C240
/* 8C2E0 0018C1E0 00000000 */   nop
.L0018C1E4:
/* 8C2E4 0018C1E4 0400828C */  lw         $2, 0x4($4)
/* 8C2E8 0018C1E8 309282AF */  sw         $2, -0x6DD0($gp)
/* 8C2EC 0018C1EC 2700023C */  lui        $2, %hi(_820)
/* 8C2F0 0018C1F0 E09A4624 */  addiu      $6, $2, %lo(_820)
/* 8C2F4 0018C1F4 1000A527 */  addiu      $5, $sp, 0x10
/* 8C2F8 0018C1F8 04000424 */  addiu      $4, $0, 0x4
.L0018C1FC:
/* 8C2FC 0018C1FC 0000C378 */  lq         $3, 0x0($6)
/* 8C300 0018C200 1000C278 */  lq         $2, 0x10($6)
/* 8C304 0018C204 2000C624 */  addiu      $6, $6, 0x20
/* 8C308 0018C208 FFFF8424 */  addiu      $4, $4, -0x1
/* 8C30C 0018C20C 0000A37C */  sq         $3, 0x0($5)
/* 8C310 0018C210 1000A27C */  sq         $2, 0x10($5)
/* 8C314 0018C214 2000A524 */  addiu      $5, $5, 0x20
/* 8C318 0018C218 F8FF801C */  bgtz       $4, .L0018C1FC
/* 8C31C 0018C21C 00000000 */   nop
/* 8C320 0018C220 F4CA050C */  jal        EdUseItemInit__Fv
/* 8C324 0018C224 00000000 */   nop
/* 8C328 0018C228 1000A427 */  addiu      $4, $sp, 0x10
/* 8C32C 0018C22C 00CB050C */  jal        EdSetUseItem__FPi
/* 8C330 0018C230 00000000 */   nop
/* 8C334 0018C234 09000224 */  addiu      $2, $0, 0x9
/* 8C338 0018C238 289282AF */  sw         $2, -0x6DD8($gp)
/* 8C33C 0018C23C 01000224 */  addiu      $2, $0, 0x1
.L0018C240:
/* 8C340 0018C240 0000BF7B */  lq         $31, 0x0($sp)
/* 8C344 0018C244 9000BD27 */  addiu      $sp, $sp, 0x90
/* 8C348 0018C248 0800E003 */  jr         $31
/* 8C34C 0018C24C 00000000 */   nop
