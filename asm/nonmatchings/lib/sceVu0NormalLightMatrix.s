.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0NormalLightMatrix
/* 21D68 00121C68 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 21D6C 00121C6C 5000B4E7 */  swc1       $f20, 0x50($sp)
/* 21D70 00121C70 80BF013C */  lui        $at, (0xBF800000 >> 16)
/* 21D74 00121C74 00A08144 */  mtc1       $at, $f20
/* 21D78 00121C78 1000B0FF */  sd         $16, 0x10($sp)
/* 21D7C 00121C7C 2D808000 */  daddu      $16, $4, $0
/* 21D80 00121C80 3000B2FF */  sd         $18, 0x30($sp)
/* 21D84 00121C84 2000B1FF */  sd         $17, 0x20($sp)
/* 21D88 00121C88 2D90E000 */  daddu      $18, $7, $0
/* 21D8C 00121C8C 2D88C000 */  daddu      $17, $6, $0
/* 21D90 00121C90 06A30046 */  mov.s      $f12, $f20
/* 21D94 00121C94 4000BFFF */  sd         $31, 0x40($sp)
/* 21D98 00121C98 FA85040C */  jal        sceVu0ScaleVector
/* 21D9C 00121C9C 2D20A003 */   daddu     $4, $sp, $0
/* 21DA0 00121CA0 2D200002 */  daddu      $4, $16, $0
/* 21DA4 00121CA4 9285040C */  jal        sceVu0Normalize
/* 21DA8 00121CA8 2D28A003 */   daddu     $5, $sp, $0
/* 21DAC 00121CAC 2D282002 */  daddu      $5, $17, $0
/* 21DB0 00121CB0 06A30046 */  mov.s      $f12, $f20
/* 21DB4 00121CB4 FA85040C */  jal        sceVu0ScaleVector
/* 21DB8 00121CB8 2D20A003 */   daddu     $4, $sp, $0
/* 21DBC 00121CBC 10000426 */  addiu      $4, $16, 0x10
/* 21DC0 00121CC0 9285040C */  jal        sceVu0Normalize
/* 21DC4 00121CC4 2D28A003 */   daddu     $5, $sp, $0
/* 21DC8 00121CC8 2D284002 */  daddu      $5, $18, $0
/* 21DCC 00121CCC 06A30046 */  mov.s      $f12, $f20
/* 21DD0 00121CD0 FA85040C */  jal        sceVu0ScaleVector
/* 21DD4 00121CD4 2D20A003 */   daddu     $4, $sp, $0
/* 21DD8 00121CD8 20000426 */  addiu      $4, $16, 0x20
/* 21DDC 00121CDC 9285040C */  jal        sceVu0Normalize
/* 21DE0 00121CE0 2D28A003 */   daddu     $5, $sp, $0
/* 21DE4 00121CE4 00008044 */  mtc1       $0, $f0
/* 21DE8 00121CE8 2D200002 */  daddu      $4, $16, $0
/* 21DEC 00121CEC 803F013C */  lui        $at, (0x3F800000 >> 16)
/* 21DF0 00121CF0 00088144 */  mtc1       $at, $f1
/* 21DF4 00121CF4 2D288000 */  daddu      $5, $4, $0
/* 21DF8 00121CF8 300000E6 */  swc1       $f0, 0x30($16)
/* 21DFC 00121CFC 3C0001E6 */  swc1       $f1, 0x3C($16)
/* 21E00 00121D00 380000E6 */  swc1       $f0, 0x38($16)
/* 21E04 00121D04 A085040C */  jal        sceVu0TransposeMatrix
/* 21E08 00121D08 340000E6 */   swc1      $f0, 0x34($16)
/* 21E0C 00121D0C 4000BFDF */  ld         $31, 0x40($sp)
/* 21E10 00121D10 3000B2DF */  ld         $18, 0x30($sp)
/* 21E14 00121D14 2000B1DF */  ld         $17, 0x20($sp)
/* 21E18 00121D18 1000B0DF */  ld         $16, 0x10($sp)
/* 21E1C 00121D1C 5000B4C7 */  lwc1       $f20, 0x50($sp)
/* 21E20 00121D20 0800E003 */  jr         $31
/* 21E24 00121D24 6000BD27 */   addiu     $sp, $sp, 0x60
