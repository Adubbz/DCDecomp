.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawLOD__10CMapObjectFPfiiPi
/* 57800 00157700 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 57804 00157704 1000BF7F */  sq         $31, 0x10($sp)
/* 57808 00157708 0000B07F */  sq         $16, 0x0($sp)
/* 5780C 0015770C 28860071 */  paddub     $16, $8, $0
/* 57810 00157710 C400838C */  lw         $3, 0xC4($4)
/* 57814 00157714 0B006010 */  beqz       $3, .L00157744
/* 57818 00157718 00000000 */   nop
/* 5781C 0015771C E800838C */  lw         $3, 0xE8($4)
/* 57820 00157720 08006004 */  bltz       $3, .L00157744
/* 57824 00157724 00000000 */   nop
/* 57828 00157728 2C00A827 */  addiu      $8, $sp, 0x2C
/* 5782C 0015772C 885C050C */  jal        DrawLOD__12CObjectFrameFPfiiPi
/* 57830 00157730 00000000 */   nop
/* 57834 00157734 03000012 */  beqz       $16, .L00157744
/* 57838 00157738 00000000 */   nop
/* 5783C 0015773C 2C00A38F */  lw         $3, 0x2C($sp)
/* 57840 00157740 000003AE */  sw         $3, 0x0($16)
.L00157744:
/* 57844 00157744 1000BF7B */  lq         $31, 0x10($sp)
/* 57848 00157748 0000B07B */  lq         $16, 0x0($sp)
/* 5784C 0015774C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 57850 00157750 0800E003 */  jr         $31
/* 57854 00157754 00000000 */   nop
/* 57858 00157758 00000000 */  nop
/* 5785C 0015775C 00000000 */  nop