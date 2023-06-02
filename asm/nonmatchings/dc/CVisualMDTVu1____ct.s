.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__13CVisualMDTVu1Fv
/* 350B0 00134FB0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 350B4 00134FB4 1000BF7F */  sq         $31, 0x10($sp)
/* 350B8 00134FB8 0000B07F */  sq         $16, 0x0($sp)
/* 350BC 00134FBC 28868070 */  paddub     $16, $4, $0
/* 350C0 00134FC0 C0D3040C */  jal        __ct__10CVisualVu1Fv
/* 350C4 00134FC4 00000000 */   nop
/* 350C8 00134FC8 2A00023C */  lui        $2, %hi(__vt__13CVisualMDTVu1)
/* 350CC 00134FCC A0114224 */  addiu      $2, $2, %lo(__vt__13CVisualMDTVu1)
/* 350D0 00134FD0 080002AE */  sw         $2, 0x8($16)
/* 350D4 00134FD4 28260072 */  paddub     $4, $16, $0
/* 350D8 00134FD8 DCD3040C */  jal        Initialize__13CVisualMDTVu1Fv
/* 350DC 00134FDC 00000000 */   nop
/* 350E0 00134FE0 28160072 */  paddub     $2, $16, $0
/* 350E4 00134FE4 1000BF7B */  lq         $31, 0x10($sp)
/* 350E8 00134FE8 0000B07B */  lq         $16, 0x0($sp)
/* 350EC 00134FEC 2000BD27 */  addiu      $sp, $sp, 0x20
/* 350F0 00134FF0 0800E003 */  jr         $31
/* 350F4 00134FF4 00000000 */   nop
/* 350F8 00134FF8 00000000 */  nop
/* 350FC 00134FFC 00000000 */  nop
