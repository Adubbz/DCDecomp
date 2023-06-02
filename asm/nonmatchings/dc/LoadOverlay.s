.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadOverlay__Fi
/* 40BA0 00140AA0 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* 40BA4 00140AA4 2000BF7F */  sq         $31, 0x20($sp)
/* 40BA8 00140AA8 1000B17F */  sq         $17, 0x10($sp)
/* 40BAC 00140AAC 0000B07F */  sq         $16, 0x0($sp)
/* 40BB0 00140AB0 80200400 */  sll        $4, $4, 2
/* 40BB4 00140AB4 2500033C */  lui        $3, %hi(binfile)
/* 40BB8 00140AB8 401A6324 */  addiu      $3, $3, %lo(binfile)
/* 40BBC 00140ABC 21886400 */  addu       $17, $3, $4
/* 40BC0 00140AC0 0000248E */  lw         $4, 0x0($17)
/* 40BC4 00140AC4 00008380 */  lb         $3, 0x0($4)
/* 40BC8 00140AC8 28006010 */  beqz       $3, .L00140B6C
/* 40BCC 00140ACC 00000000 */   nop
/* 40BD0 00140AD0 2500023C */  lui        $2, %hi(now_binfile)
/* 40BD4 00140AD4 801A4524 */  addiu      $5, $2, %lo(now_binfile)
/* 40BD8 00140AD8 0815040C */  jal        strcmp
/* 40BDC 00140ADC 00000000 */   nop
/* 40BE0 00140AE0 22004010 */  beqz       $2, .L00140B6C
/* 40BE4 00140AE4 00000000 */   nop
/* 40BE8 00140AE8 2500023C */  lui        $2, %hi(now_binfile)
/* 40BEC 00140AEC 801A4424 */  addiu      $4, $2, %lo(now_binfile)
/* 40BF0 00140AF0 0000258E */  lw         $5, 0x0($17)
/* 40BF4 00140AF4 5A15040C */  jal        strcpy
/* 40BF8 00140AF8 00000000 */   nop
/* 40BFC 00140AFC 2A00013C */  lui        $at, (0x2A17B4 >> 16)
/* 40C00 00140B00 B417308C */  lw         $16, (0x2A17B4 & 0xFFFF)($at)
/* 40C04 00140B04 2500023C */  lui        $2, %hi(_573)
/* 40C08 00140B08 001B4624 */  addiu      $6, $2, %lo(_573)
/* 40C0C 00140B0C 3000A527 */  addiu      $5, $sp, 0x30
/* 40C10 00140B10 04000424 */  addiu      $4, $0, 0x4
.L00140B14:
/* 40C14 00140B14 0000C378 */  lq         $3, 0x0($6)
/* 40C18 00140B18 1000C278 */  lq         $2, 0x10($6)
/* 40C1C 00140B1C 2000C624 */  addiu      $6, $6, 0x20
/* 40C20 00140B20 FFFF8424 */  addiu      $4, $4, -0x1
/* 40C24 00140B24 0000A37C */  sq         $3, 0x0($5)
/* 40C28 00140B28 1000A27C */  sq         $2, 0x10($5)
/* 40C2C 00140B2C 2000A524 */  addiu      $5, $5, 0x20
/* 40C30 00140B30 F8FF801C */  bgtz       $4, .L00140B14
/* 40C34 00140B34 00000000 */   nop
/* 40C38 00140B38 3000A427 */  addiu      $4, $sp, 0x30
/* 40C3C 00140B3C 0000258E */  lw         $5, 0x0($17)
/* 40C40 00140B40 BC14040C */  jal        strcat
/* 40C44 00140B44 00000000 */   nop
/* 40C48 00140B48 3000A427 */  addiu      $4, $sp, 0x30
/* 40C4C 00140B4C 2A00023C */  lui        $2, %hi(_578)
/* 40C50 00140B50 18924524 */  addiu      $5, $2, %lo(_578)
/* 40C54 00140B54 BC14040C */  jal        strcat
/* 40C58 00140B58 00000000 */   nop
/* 40C5C 00140B5C 3000A427 */  addiu      $4, $sp, 0x30
/* 40C60 00140B60 282E0072 */  paddub     $5, $16, $0
/* 40C64 00140B64 D08B040C */  jal        mwLoadOverlay
/* 40C68 00140B68 00000000 */   nop
.L00140B6C:
/* 40C6C 00140B6C 2000BF7B */  lq         $31, 0x20($sp)
/* 40C70 00140B70 1000B17B */  lq         $17, 0x10($sp)
/* 40C74 00140B74 0000B07B */  lq         $16, 0x0($sp)
/* 40C78 00140B78 B000BD27 */  addiu      $sp, $sp, 0xB0
/* 40C7C 00140B7C 0800E003 */  jr         $31
/* 40C80 00140B80 00000000 */   nop
/* 40C84 00140B84 00000000 */  nop
/* 40C88 00140B88 00000000 */  nop
/* 40C8C 00140B8C 00000000 */  nop
