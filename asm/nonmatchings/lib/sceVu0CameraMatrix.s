.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0CameraMatrix
/* 21CB8 00121BB8 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* 21CBC 00121BBC 9000B4FF */  sd         $20, 0x90($sp)
/* 21CC0 00121BC0 2DA08000 */  daddu      $20, $4, $0
/* 21CC4 00121BC4 8000B3FF */  sd         $19, 0x80($sp)
/* 21CC8 00121BC8 7000B2FF */  sd         $18, 0x70($sp)
/* 21CCC 00121BCC 2D98A000 */  daddu      $19, $5, $0
/* 21CD0 00121BD0 6000B1FF */  sd         $17, 0x60($sp)
/* 21CD4 00121BD4 2D90C000 */  daddu      $18, $6, $0
/* 21CD8 00121BD8 2D88E000 */  daddu      $17, $7, $0
/* 21CDC 00121BDC 5000B0FF */  sd         $16, 0x50($sp)
/* 21CE0 00121BE0 A000BFFF */  sd         $31, 0xA0($sp)
/* 21CE4 00121BE4 2A86040C */  jal        sceVu0UnitMatrix
/* 21CE8 00121BE8 2D20A003 */   daddu     $4, $sp, $0
/* 21CEC 00121BEC 4000B027 */  addiu      $16, $sp, 0x40
/* 21CF0 00121BF0 2D282002 */  daddu      $5, $17, $0
/* 21CF4 00121BF4 2D200002 */  daddu      $4, $16, $0
/* 21CF8 00121BF8 8085040C */  jal        sceVu0OuterProduct
/* 21CFC 00121BFC 2D304002 */   daddu     $6, $18, $0
/* 21D00 00121C00 2D280002 */  daddu      $5, $16, $0
/* 21D04 00121C04 9285040C */  jal        sceVu0Normalize
/* 21D08 00121C08 2D20A003 */   daddu     $4, $sp, $0
/* 21D0C 00121C0C 2000B027 */  addiu      $16, $sp, 0x20
/* 21D10 00121C10 2D284002 */  daddu      $5, $18, $0
/* 21D14 00121C14 9285040C */  jal        sceVu0Normalize
/* 21D18 00121C18 2D200002 */   daddu     $4, $16, $0
/* 21D1C 00121C1C 2D280002 */  daddu      $5, $16, $0
/* 21D20 00121C20 1000A427 */  addiu      $4, $sp, 0x10
/* 21D24 00121C24 8085040C */  jal        sceVu0OuterProduct
/* 21D28 00121C28 2D30A003 */   daddu     $6, $sp, $0
/* 21D2C 00121C2C 2D306002 */  daddu      $6, $19, $0
/* 21D30 00121C30 2D20A003 */  daddu      $4, $sp, $0
/* 21D34 00121C34 0086040C */  jal        sceVu0TransMatrix
/* 21D38 00121C38 2D28A003 */   daddu     $5, $sp, $0
/* 21D3C 00121C3C 2D208002 */  daddu      $4, $20, $0
/* 21D40 00121C40 B285040C */  jal        sceVu0InversMatrix
/* 21D44 00121C44 2D28A003 */   daddu     $5, $sp, $0
/* 21D48 00121C48 A000BFDF */  ld         $31, 0xA0($sp)
/* 21D4C 00121C4C 9000B4DF */  ld         $20, 0x90($sp)
/* 21D50 00121C50 8000B3DF */  ld         $19, 0x80($sp)
/* 21D54 00121C54 7000B2DF */  ld         $18, 0x70($sp)
/* 21D58 00121C58 6000B1DF */  ld         $17, 0x60($sp)
/* 21D5C 00121C5C 5000B0DF */  ld         $16, 0x50($sp)
/* 21D60 00121C60 0800E003 */  jr         $31
/* 21D64 00121C64 B000BD27 */   addiu     $sp, $sp, 0xB0
