.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__7CVisualFv
/* 34C60 00134B60 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 34C64 00134B64 1000BF7F */  sq         $31, 0x10($sp)
/* 34C68 00134B68 0000B07F */  sq         $16, 0x0($sp)
/* 34C6C 00134B6C 28868070 */  paddub     $16, $4, $0
/* 34C70 00134B70 2A00023C */  lui        $2, %hi(__vt__7CVisual)
/* 34C74 00134B74 68114224 */  addiu      $2, $2, %lo(__vt__7CVisual)
/* 34C78 00134B78 080082AC */  sw         $2, 0x8($4)
/* 34C7C 00134B7C 0800198E */  lw         $25, 0x8($16)
/* 34C80 00134B80 0800398F */  lw         $25, 0x8($25)
/* 34C84 00134B84 09F82003 */  jalr       $25
/* 34C88 00134B88 00000000 */   nop
/* 34C8C 00134B8C 28160072 */  paddub     $2, $16, $0
/* 34C90 00134B90 1000BF7B */  lq         $31, 0x10($sp)
/* 34C94 00134B94 0000B07B */  lq         $16, 0x0($sp)
/* 34C98 00134B98 2000BD27 */  addiu      $sp, $sp, 0x20
/* 34C9C 00134B9C 0800E003 */  jr         $31
/* 34CA0 00134BA0 00000000 */   nop
/* 34CA4 00134BA4 00000000 */  nop
/* 34CA8 00134BA8 00000000 */  nop
/* 34CAC 00134BAC 00000000 */  nop
