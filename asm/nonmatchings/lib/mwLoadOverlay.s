.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel mwLoadOverlay
/* 23040 00122F40 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 23044 00122F44 3000BF7F */  sq         $31, 0x30($sp)
/* 23048 00122F48 2000B27F */  sq         $18, 0x20($sp)
/* 2304C 00122F4C 1000B17F */  sq         $17, 0x10($sp)
/* 23050 00122F50 0000B07F */  sq         $16, 0x0($sp)
/* 23054 00122F54 2896A070 */  paddub     $18, $5, $0
/* 23058 00122F58 288E0070 */  paddub     $17, $0, $0
/* 2305C 00122F5C A08B040C */  jal        mwBload
/* 23060 00122F60 00000000 */   nop
/* 23064 00122F64 28864070 */  paddub     $16, $2, $0
/* 23068 00122F68 0900001A */  blez       $16, .L00122F90
/* 2306C 00122F6C 00000000 */   nop
/* 23070 00122F70 28264072 */  paddub     $4, $18, $0
/* 23074 00122F74 9C8B040C */  jal        MWNotifyOverlayLoaded
/* 23078 00122F78 00000000 */   nop
/* 2307C 00122F7C 28264072 */  paddub     $4, $18, $0
/* 23080 00122F80 282E0072 */  paddub     $5, $16, $0
/* 23084 00122F84 788B040C */  jal        mwOverlayInit
/* 23088 00122F88 00000000 */   nop
/* 2308C 00122F8C 01001124 */  addiu      $17, $0, 0x1
.L00122F90:
/* 23090 00122F90 28162072 */  paddub     $2, $17, $0
/* 23094 00122F94 3000BF7B */  lq         $31, 0x30($sp)
/* 23098 00122F98 2000B27B */  lq         $18, 0x20($sp)
/* 2309C 00122F9C 1000B17B */  lq         $17, 0x10($sp)
/* 230A0 00122FA0 0000B07B */  lq         $16, 0x0($sp)
/* 230A4 00122FA4 4000BD27 */  addiu      $sp, $sp, 0x40
/* 230A8 00122FA8 0800E003 */  jr         $31
/* 230AC 00122FAC 00000000 */   nop
