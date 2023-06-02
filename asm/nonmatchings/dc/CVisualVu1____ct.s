.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__10CVisualVu1Fv
/* 35000 00134F00 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 35004 00134F04 1000BF7F */  sq         $31, 0x10($sp)
/* 35008 00134F08 0000B07F */  sq         $16, 0x0($sp)
/* 3500C 00134F0C 28868070 */  paddub     $16, $4, $0
/* 35010 00134F10 D8D2040C */  jal        __ct__7CVisualFv
/* 35014 00134F14 00000000 */   nop
/* 35018 00134F18 2A00023C */  lui        $2, %hi(__vt__10CVisualVu1)
/* 3501C 00134F1C C0114224 */  addiu      $2, $2, %lo(__vt__10CVisualVu1)
/* 35020 00134F20 080002AE */  sw         $2, 0x8($16)
/* 35024 00134F24 28260072 */  paddub     $4, $16, $0
/* 35028 00134F28 0800198E */  lw         $25, 0x8($16)
/* 3502C 00134F2C 0800398F */  lw         $25, 0x8($25)
/* 35030 00134F30 09F82003 */  jalr       $25
/* 35034 00134F34 00000000 */   nop
/* 35038 00134F38 28160072 */  paddub     $2, $16, $0
/* 3503C 00134F3C 1000BF7B */  lq         $31, 0x10($sp)
/* 35040 00134F40 0000B07B */  lq         $16, 0x0($sp)
/* 35044 00134F44 2000BD27 */  addiu      $sp, $sp, 0x20
/* 35048 00134F48 0800E003 */  jr         $31
/* 3504C 00134F4C 00000000 */   nop
