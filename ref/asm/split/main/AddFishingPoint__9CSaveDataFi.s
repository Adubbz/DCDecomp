.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel AddFishingPoint__9CSaveDataFi
/* 057E40 00157D40 DC01838C */  lw          $3, 0x1DC($4)
/* 057E44 00157D44 21186500 */  addu        $3, $3, $5
/* 057E48 00157D48 DC0183AC */  sw          $3, 0x1DC($4)
/* 057E4C 00157D4C DC01838C */  lw          $3, 0x1DC($4)
/* 057E50 00157D50 10276128 */  slti        $1, $3, 0x2710
/* 057E54 00157D54 03002014 */  bnez        $1, .L00157D64
/* 057E58 00157D58 00000000 */   nop
/* 057E5C 00157D5C 0F270324 */  addiu       $3, $0, 0x270F
/* 057E60 00157D60 DC0183AC */  sw          $3, 0x1DC($4)
.L00157D64:
/* 057E64 00157D64 DC01838C */  lw          $3, 0x1DC($4)
/* 057E68 00157D68 02006104 */  bgez        $3, .L00157D74
/* 057E6C 00157D6C 00000000 */   nop
/* 057E70 00157D70 DC0180AC */  sw          $0, 0x1DC($4)
.L00157D74:
/* 057E74 00157D74 0800E003 */  jr          $31
/* 057E78 00157D78 00000000 */   nop
/* 057E7C 00157D7C 00000000 */  nop
