.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandBGM_NO__FPPv
/* 77160 00177060 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 77164 00177064 0000BF7F */  sq         $31, 0x0($sp)
/* 77168 00177068 0000828C */  lw         $2, 0x0($4)
/* 7716C 0017706C 0000438C */  lw         $3, 0x0($2)
/* 77170 00177070 C08F828F */  lw         $2, -0x7040($gp)
/* 77174 00177074 480043AC */  sw         $3, 0x48($2)
/* 77178 00177078 C08F838F */  lw         $3, -0x7040($gp)
/* 7717C 0017707C 2A00023C */  lui        $2, %hi(_871)
/* 77180 00177080 58A84424 */  addiu      $4, $2, %lo(_871)
/* 77184 00177084 4800658C */  lw         $5, 0x48($3)
/* 77188 00177088 A611040C */  jal        printf
/* 7718C 0017708C 00000000 */   nop
/* 77190 00177090 0000BF7B */  lq         $31, 0x0($sp)
/* 77194 00177094 1000BD27 */  addiu      $sp, $sp, 0x10
/* 77198 00177098 0800E003 */  jr         $31
/* 7719C 0017709C 00000000 */   nop
