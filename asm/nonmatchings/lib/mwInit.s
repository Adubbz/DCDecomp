.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel mwInit
/* 22EA0 00122DA0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 22EA4 00122DA4 0000BF7F */  sq         $31, 0x0($sp)
/* 22EA8 00122DA8 2A00023C */  lui        $2, %hi(.p__sinit_dataset.cpp)
/* 22EAC 00122DAC 10104424 */  addiu      $4, $2, %lo(.p__sinit_dataset.cpp)
/* 22EB0 00122DB0 2A00023C */  lui        $2, %hi(D_002A1064)
/* 22EB4 00122DB4 64104524 */  addiu      $5, $2, %lo(D_002A1064)
/* 22EB8 00122DB8 2A00023C */  lui        $2, %hi(D_002A17B0)
/* 22EBC 00122DBC B0174624 */  addiu      $6, $2, %lo(D_002A17B0)
/* 22EC0 00122DC0 2A00023C */  lui        $2, %hi(D_002A17B0)
/* 22EC4 00122DC4 B0174724 */  addiu      $7, $2, %lo(D_002A17B0)
/* 22EC8 00122DC8 588A040C */  jal        __initialize_cpp_rts
/* 22ECC 00122DCC 00000000 */   nop
/* 22ED0 00122DD0 0000BF7B */  lq         $31, 0x0($sp)
/* 22ED4 00122DD4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 22ED8 00122DD8 0800E003 */  jr         $31
/* 22EDC 00122DDC 00000000 */   nop
