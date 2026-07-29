.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0CameraMatrix
/* 021CB8 00121BB8 50FFBD27 */  addiu       $29, $29, -0xB0
/* 021CBC 00121BBC 9000B4FF */  sd          $20, 0x90($29)
/* 021CC0 00121BC0 2DA08000 */  daddu       $20, $4, $0
/* 021CC4 00121BC4 8000B3FF */  sd          $19, 0x80($29)
/* 021CC8 00121BC8 7000B2FF */  sd          $18, 0x70($29)
/* 021CCC 00121BCC 2D98A000 */  daddu       $19, $5, $0
/* 021CD0 00121BD0 6000B1FF */  sd          $17, 0x60($29)
/* 021CD4 00121BD4 2D90C000 */  daddu       $18, $6, $0
/* 021CD8 00121BD8 2D88E000 */  daddu       $17, $7, $0
/* 021CDC 00121BDC 5000B0FF */  sd          $16, 0x50($29)
/* 021CE0 00121BE0 A000BFFF */  sd          $31, 0xA0($29)
/* 021CE4 00121BE4 2A86040C */  jal         sceVu0UnitMatrix
/* 021CE8 00121BE8 2D20A003 */   daddu      $4, $29, $0
/* 021CEC 00121BEC 4000B027 */  addiu       $16, $29, 0x40
/* 021CF0 00121BF0 2D282002 */  daddu       $5, $17, $0
/* 021CF4 00121BF4 2D200002 */  daddu       $4, $16, $0
/* 021CF8 00121BF8 8085040C */  jal         sceVu0OuterProduct
/* 021CFC 00121BFC 2D304002 */   daddu      $6, $18, $0
/* 021D00 00121C00 2D280002 */  daddu       $5, $16, $0
/* 021D04 00121C04 9285040C */  jal         sceVu0Normalize
/* 021D08 00121C08 2D20A003 */   daddu      $4, $29, $0
/* 021D0C 00121C0C 2000B027 */  addiu       $16, $29, 0x20
/* 021D10 00121C10 2D284002 */  daddu       $5, $18, $0
/* 021D14 00121C14 9285040C */  jal         sceVu0Normalize
/* 021D18 00121C18 2D200002 */   daddu      $4, $16, $0
/* 021D1C 00121C1C 2D280002 */  daddu       $5, $16, $0
/* 021D20 00121C20 1000A427 */  addiu       $4, $29, 0x10
/* 021D24 00121C24 8085040C */  jal         sceVu0OuterProduct
/* 021D28 00121C28 2D30A003 */   daddu      $6, $29, $0
/* 021D2C 00121C2C 2D306002 */  daddu       $6, $19, $0
/* 021D30 00121C30 2D20A003 */  daddu       $4, $29, $0
/* 021D34 00121C34 0086040C */  jal         sceVu0TransMatrix
/* 021D38 00121C38 2D28A003 */   daddu      $5, $29, $0
/* 021D3C 00121C3C 2D208002 */  daddu       $4, $20, $0
/* 021D40 00121C40 B285040C */  jal         sceVu0InversMatrix
/* 021D44 00121C44 2D28A003 */   daddu      $5, $29, $0
/* 021D48 00121C48 A000BFDF */  ld          $31, 0xA0($29)
/* 021D4C 00121C4C 9000B4DF */  ld          $20, 0x90($29)
/* 021D50 00121C50 8000B3DF */  ld          $19, 0x80($29)
/* 021D54 00121C54 7000B2DF */  ld          $18, 0x70($29)
/* 021D58 00121C58 6000B1DF */  ld          $17, 0x60($29)
/* 021D5C 00121C5C 5000B0DF */  ld          $16, 0x50($29)
/* 021D60 00121C60 0800E003 */  jr          $31
/* 021D64 00121C64 B000BD27 */   addiu      $29, $29, 0xB0
