.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel mwInit
/* 022EA0 00122DA0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 022EA4 00122DA4 0000BF7F */  sq          $31, 0x0($29)
/* 022EA8 00122DA8 2A00023C */  lui         $2, %hi(__static_init)
/* 022EAC 00122DAC 10104424 */  addiu       $4, $2, %lo(__static_init)
/* 022EB0 00122DB0 2A00023C */  lui         $2, %hi(__static_init_end)
/* 022EB4 00122DB4 64104524 */  addiu       $5, $2, %lo(__static_init_end)
/* 022EB8 00122DB8 2A00023C */  lui         $2, %hi(__exception_table_start__)
/* 022EBC 00122DBC B0174624 */  addiu       $6, $2, %lo(__exception_table_start__)
/* 022EC0 00122DC0 2A00023C */  lui         $2, %hi(__exception_table_start__)
/* 022EC4 00122DC4 B0174724 */  addiu       $7, $2, %lo(__exception_table_start__)
/* 022EC8 00122DC8 588A040C */  jal         __initialize_cpp_rts
/* 022ECC 00122DCC 00000000 */   nop
/* 022ED0 00122DD0 0000BF7B */  lq          $31, 0x0($29)
/* 022ED4 00122DD4 1000BD27 */  addiu       $29, $29, 0x10
/* 022ED8 00122DD8 0800E003 */  jr          $31
/* 022EDC 00122DDC 00000000 */   nop
