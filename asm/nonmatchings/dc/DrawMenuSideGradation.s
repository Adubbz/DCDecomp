.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMenuSideGradation__FR8CRect_i_P6spRGBAP6spRGBA
/* 12D550 0022D450 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 12D554 0022D454 3000BF7F */  sq         $31, 0x30($sp)
/* 12D558 0022D458 2000B27F */  sq         $18, 0x20($sp)
/* 12D55C 0022D45C 1000B17F */  sq         $17, 0x10($sp)
/* 12D560 0022D460 0000B07F */  sq         $16, 0x0($sp)
/* 12D564 0022D464 28968070 */  paddub     $18, $4, $0
/* 12D568 0022D468 288EA070 */  paddub     $17, $5, $0
/* 12D56C 0022D46C 2886C070 */  paddub     $16, $6, $0
/* 12D570 0022D470 A0B8040C */  jal        GetVif1Packet__Fv
/* 12D574 0022D474 00000000 */   nop
/* 12D578 0022D478 28264070 */  paddub     $4, $2, $0
/* 12D57C 0022D47C 282E4072 */  paddub     $5, $18, $0
/* 12D580 0022D480 28362072 */  paddub     $6, $17, $0
/* 12D584 0022D484 283E0072 */  paddub     $7, $16, $0
/* 12D588 0022D488 28462072 */  paddub     $8, $17, $0
/* 12D58C 0022D48C 284E0072 */  paddub     $9, $16, $0
/* 12D590 0022D490 4878050C */  jal        set2DSpriteC4__FP13sceVif1PacketRC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
/* 12D594 0022D494 00000000 */   nop
/* 12D598 0022D498 3000BF7B */  lq         $31, 0x30($sp)
/* 12D59C 0022D49C 2000B27B */  lq         $18, 0x20($sp)
/* 12D5A0 0022D4A0 1000B17B */  lq         $17, 0x10($sp)
/* 12D5A4 0022D4A4 0000B07B */  lq         $16, 0x0($sp)
/* 12D5A8 0022D4A8 4000BD27 */  addiu      $sp, $sp, 0x40
/* 12D5AC 0022D4AC 0800E003 */  jr         $31
/* 12D5B0 0022D4B0 00000000 */   nop
/* 12D5B4 0022D4B4 00000000 */  nop
/* 12D5B8 0022D4B8 00000000 */  nop
/* 12D5BC 0022D4BC 00000000 */  nop
