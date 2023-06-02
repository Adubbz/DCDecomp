.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __dt__Q23std13bad_exceptionFv
/* 22E00 00122D00 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 22E04 00122D04 2000BF7F */  sq         $31, 0x20($sp)
/* 22E08 00122D08 1000BE7F */  sq         $fp, 0x10($sp)
/* 22E0C 00122D0C 0000B07F */  sq         $16, 0x0($sp)
/* 22E10 00122D10 28868070 */  paddub     $16, $4, $0
/* 22E14 00122D14 0E000012 */  beqz       $16, .L00122D50
/* 22E18 00122D18 21F0A003 */   addu      $fp, $sp, $0
/* 22E1C 00122D1C 2A00023C */  lui        $2, %hi(__vt__Q23std13bad_exception)
/* 22E20 00122D20 80104224 */  addiu      $2, $2, %lo(__vt__Q23std13bad_exception)
/* 22E24 00122D24 04000012 */  beqz       $16, .L00122D38
/* 22E28 00122D28 000002AE */   sw        $2, 0x0($16)
/* 22E2C 00122D2C 2A00023C */  lui        $2, %hi(__vt__Q23std9exception)
/* 22E30 00122D30 70104224 */  addiu      $2, $2, %lo(__vt__Q23std9exception)
/* 22E34 00122D34 000002AE */  sw         $2, 0x0($16)
.L00122D38:
/* 22E38 00122D38 3C140500 */  dsll32     $2, $5, 16
/* 22E3C 00122D3C 3F140200 */  dsra32     $2, $2, 16
/* 22E40 00122D40 04004018 */  blez       $2, .L00122D54
/* 22E44 00122D44 28160072 */   paddub    $2, $16, $0
/* 22E48 00122D48 5489040C */  jal        __dl__FPv
/* 22E4C 00122D4C 28260072 */   paddub    $4, $16, $0
.L00122D50:
/* 22E50 00122D50 28160072 */  paddub     $2, $16, $0
.L00122D54:
/* 22E54 00122D54 06000010 */  b          .L00122D70
/* 22E58 00122D58 21E8C003 */   addu      $sp, $fp, $0
/* 22E5C 00122D5C D08A040C */  jal        __unexpected
/* 22E60 00122D60 3000C427 */   addiu     $4, $fp, 0x30
.L00122D64:
/* 22E64 00122D64 FFFF0010 */  b          .L00122D64
/* 22E68 00122D68 00000000 */   nop
/* 22E6C 00122D6C 21E8C003 */  addu       $sp, $fp, $0
.L00122D70:
/* 22E70 00122D70 2000BF7B */  lq         $31, 0x20($sp)
/* 22E74 00122D74 1000BE7B */  lq         $fp, 0x10($sp)
/* 22E78 00122D78 0000B07B */  lq         $16, 0x0($sp)
/* 22E7C 00122D7C 0800E003 */  jr         $31
/* 22E80 00122D80 5000BD27 */   addiu     $sp, $sp, 0x50
/* 22E84 00122D84 00000000 */  nop
/* 22E88 00122D88 00000000 */  nop
/* 22E8C 00122D8C 00000000 */  nop
