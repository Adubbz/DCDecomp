.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMenuColorGradation__FR8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
/* 12D4D0 0022D3D0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 12D4D4 0022D3D4 5000BF7F */  sq         $31, 0x50($sp)
/* 12D4D8 0022D3D8 4000B47F */  sq         $20, 0x40($sp)
/* 12D4DC 0022D3DC 3000B37F */  sq         $19, 0x30($sp)
/* 12D4E0 0022D3E0 2000B27F */  sq         $18, 0x20($sp)
/* 12D4E4 0022D3E4 1000B17F */  sq         $17, 0x10($sp)
/* 12D4E8 0022D3E8 0000B07F */  sq         $16, 0x0($sp)
/* 12D4EC 0022D3EC 28A68070 */  paddub     $20, $4, $0
/* 12D4F0 0022D3F0 289EA070 */  paddub     $19, $5, $0
/* 12D4F4 0022D3F4 2896C070 */  paddub     $18, $6, $0
/* 12D4F8 0022D3F8 288EE070 */  paddub     $17, $7, $0
/* 12D4FC 0022D3FC 28860071 */  paddub     $16, $8, $0
/* 12D500 0022D400 A0B8040C */  jal        GetVif1Packet__Fv
/* 12D504 0022D404 00000000 */   nop
/* 12D508 0022D408 28264070 */  paddub     $4, $2, $0
/* 12D50C 0022D40C 282E8072 */  paddub     $5, $20, $0
/* 12D510 0022D410 28366072 */  paddub     $6, $19, $0
/* 12D514 0022D414 283E4072 */  paddub     $7, $18, $0
/* 12D518 0022D418 28462072 */  paddub     $8, $17, $0
/* 12D51C 0022D41C 284E0072 */  paddub     $9, $16, $0
/* 12D520 0022D420 4878050C */  jal        set2DSpriteC4__FP13sceVif1PacketRC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
/* 12D524 0022D424 00000000 */   nop
/* 12D528 0022D428 5000BF7B */  lq         $31, 0x50($sp)
/* 12D52C 0022D42C 4000B47B */  lq         $20, 0x40($sp)
/* 12D530 0022D430 3000B37B */  lq         $19, 0x30($sp)
/* 12D534 0022D434 2000B27B */  lq         $18, 0x20($sp)
/* 12D538 0022D438 1000B17B */  lq         $17, 0x10($sp)
/* 12D53C 0022D43C 0000B07B */  lq         $16, 0x0($sp)
/* 12D540 0022D440 6000BD27 */  addiu      $sp, $sp, 0x60
/* 12D544 0022D444 0800E003 */  jr         $31
/* 12D548 0022D448 00000000 */   nop
/* 12D54C 0022D44C 00000000 */  nop
