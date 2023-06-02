.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel mwOverlayInit
/* 22EE0 00122DE0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 22EE4 00122DE4 4000BF7F */  sq         $31, 0x40($sp)
/* 22EE8 00122DE8 3000B37F */  sq         $19, 0x30($sp)
/* 22EEC 00122DEC 2000B27F */  sq         $18, 0x20($sp)
/* 22EF0 00122DF0 1000B17F */  sq         $17, 0x10($sp)
/* 22EF4 00122DF4 0000B07F */  sq         $16, 0x0($sp)
/* 22EF8 00122DF8 289EA070 */  paddub     $19, $5, $0
/* 22EFC 00122DFC 28868070 */  paddub     $16, $4, $0
/* 22F00 00122E00 288E8070 */  paddub     $17, $4, $0
/* 22F04 00122E04 1400928C */  lw         $18, 0x14($4)
/* 22F08 00122E08 02000424 */  addiu      $4, $0, 0x2
/* 22F0C 00122E0C 6851040C */  jal        FlushCache
/* 22F10 00122E10 00000000 */   nop
/* 22F14 00122E14 07004012 */  beqz       $18, .L00122E34
/* 22F18 00122E18 00000000 */   nop
/* 22F1C 00122E1C 21801302 */  addu       $16, $16, $19
/* 22F20 00122E20 28260072 */  paddub     $4, $16, $0
/* 22F24 00122E24 282E0070 */  paddub     $5, $0, $0
/* 22F28 00122E28 28364072 */  paddub     $6, $18, $0
/* 22F2C 00122E2C 5A0D040C */  jal        memset
/* 22F30 00122E30 00000000 */   nop
.L00122E34:
/* 22F34 00122E34 1800248E */  lw         $4, 0x18($17)
/* 22F38 00122E38 1C00258E */  lw         $5, 0x1C($17)
/* 22F3C 00122E3C 28360070 */  paddub     $6, $0, $0
/* 22F40 00122E40 283E0070 */  paddub     $7, $0, $0
/* 22F44 00122E44 588A040C */  jal        __initialize_cpp_rts
/* 22F48 00122E48 00000000 */   nop
/* 22F4C 00122E4C 4000BF7B */  lq         $31, 0x40($sp)
/* 22F50 00122E50 3000B37B */  lq         $19, 0x30($sp)
/* 22F54 00122E54 2000B27B */  lq         $18, 0x20($sp)
/* 22F58 00122E58 1000B17B */  lq         $17, 0x10($sp)
/* 22F5C 00122E5C 0000B07B */  lq         $16, 0x0($sp)
/* 22F60 00122E60 5000BD27 */  addiu      $sp, $sp, 0x50
/* 22F64 00122E64 0800E003 */  jr         $31
/* 22F68 00122E68 00000000 */   nop
/* 22F6C 00122E6C 00000000 */  nop
