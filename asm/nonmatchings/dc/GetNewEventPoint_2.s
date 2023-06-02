.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetNewEventPoint__FP9CMapPartsP16EPARTS_FUNC_DATAP14ED_EVENT_POINTi
/* 83D40 00183C40 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 83D44 00183C44 3000BF7F */  sq         $31, 0x30($sp)
/* 83D48 00183C48 2000B27F */  sq         $18, 0x20($sp)
/* 83D4C 00183C4C 1000B17F */  sq         $17, 0x10($sp)
/* 83D50 00183C50 0000B07F */  sq         $16, 0x0($sp)
/* 83D54 00183C54 28968070 */  paddub     $18, $4, $0
/* 83D58 00183C58 288EA070 */  paddub     $17, $5, $0
/* 83D5C 00183C5C 2826C070 */  paddub     $4, $6, $0
/* 83D60 00183C60 282EE070 */  paddub     $5, $7, $0
/* 83D64 00183C64 840E060C */  jal        GetNewEventPoint__FP14ED_EVENT_POINTi
/* 83D68 00183C68 00000000 */   nop
/* 83D6C 00183C6C 28864070 */  paddub     $16, $2, $0
/* 83D70 00183C70 08000016 */  bnez       $16, .L00183C94
/* 83D74 00183C74 00000000 */   nop
/* 83D78 00183C78 2A00023C */  lui        $2, %hi(_447_3)
/* 83D7C 00183C7C 40B04424 */  addiu      $4, $2, %lo(_447_3)
/* 83D80 00183C80 A611040C */  jal        printf
/* 83D84 00183C84 00000000 */   nop
/* 83D88 00183C88 28160070 */  paddub     $2, $0, $0
/* 83D8C 00183C8C 29000010 */  b          .L00183D34
/* 83D90 00183C90 00000000 */   nop
.L00183C94:
/* 83D94 00183C94 01000224 */  addiu      $2, $0, 0x1
/* 83D98 00183C98 000002AE */  sw         $2, 0x0($16)
/* 83D9C 00183C9C F000428E */  lw         $2, 0xF0($18)
/* 83DA0 00183CA0 06004004 */  bltz       $2, .L00183CBC
/* 83DA4 00183CA4 00000000 */   nop
/* 83DA8 00183CA8 140000AE */  sw         $0, 0x14($16)
/* 83DAC 00183CAC F000428E */  lw         $2, 0xF0($18)
/* 83DB0 00183CB0 0C0002AE */  sw         $2, 0xC($16)
/* 83DB4 00183CB4 04000010 */  b          .L00183CC8
/* 83DB8 00183CB8 00000000 */   nop
.L00183CBC:
/* 83DBC 00183CBC 140012AE */  sw         $18, 0x14($16)
/* 83DC0 00183CC0 FFFF0224 */  addiu      $2, $0, -0x1
/* 83DC4 00183CC4 0C0002AE */  sw         $2, 0xC($16)
.L00183CC8:
/* 83DC8 00183CC8 50000426 */  addiu      $4, $16, 0x50
/* 83DCC 00183CCC 40002526 */  addiu      $5, $17, 0x40
/* 83DD0 00183CD0 0C86040C */  jal        sceVu0CopyVector
/* 83DD4 00183CD4 00000000 */   nop
/* 83DD8 00183CD8 70000426 */  addiu      $4, $16, 0x70
/* 83DDC 00183CDC 50002526 */  addiu      $5, $17, 0x50
/* 83DE0 00183CE0 0C86040C */  jal        sceVu0CopyVector
/* 83DE4 00183CE4 00000000 */   nop
/* 83DE8 00183CE8 18002CC6 */  lwc1       $f12, 0x18($17)
/* 83DEC 00183CEC 3CD0050C */  jal        ConvertTime__Ff
/* 83DF0 00183CF0 00000000 */   nop
/* 83DF4 00183CF4 400000E6 */  swc1       $f0, 0x40($16)
/* 83DF8 00183CF8 1C002CC6 */  lwc1       $f12, 0x1C($17)
/* 83DFC 00183CFC 3CD0050C */  jal        ConvertTime__Ff
/* 83E00 00183D00 00000000 */   nop
/* 83E04 00183D04 440000E6 */  swc1       $f0, 0x44($16)
/* 83E08 00183D08 2400228E */  lw         $2, 0x24($17)
/* 83E0C 00183D0C 080002AE */  sw         $2, 0x8($16)
/* 83E10 00183D10 B000448E */  lw         $4, 0xB0($18)
/* 83E14 00183D14 180000AE */  sw         $0, 0x18($16)
/* 83E18 00183D18 05008010 */  beqz       $4, .L00183D30
/* 83E1C 00183D1C 00000000 */   nop
/* 83E20 00183D20 30002526 */  addiu      $5, $17, 0x30
/* 83E24 00183D24 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* 83E28 00183D28 00000000 */   nop
/* 83E2C 00183D2C 180002AE */  sw         $2, 0x18($16)
.L00183D30:
/* 83E30 00183D30 28160072 */  paddub     $2, $16, $0
.L00183D34:
/* 83E34 00183D34 3000BF7B */  lq         $31, 0x30($sp)
/* 83E38 00183D38 2000B27B */  lq         $18, 0x20($sp)
/* 83E3C 00183D3C 1000B17B */  lq         $17, 0x10($sp)
/* 83E40 00183D40 0000B07B */  lq         $16, 0x0($sp)
/* 83E44 00183D44 4000BD27 */  addiu      $sp, $sp, 0x40
/* 83E48 00183D48 0800E003 */  jr         $31
/* 83E4C 00183D4C 00000000 */   nop
