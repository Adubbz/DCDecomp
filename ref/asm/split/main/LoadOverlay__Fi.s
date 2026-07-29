.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadOverlay__Fi
/* 040BA0 00140AA0 50FFBD27 */  addiu       $29, $29, -0xB0
/* 040BA4 00140AA4 2000BF7F */  sq          $31, 0x20($29)
/* 040BA8 00140AA8 1000B17F */  sq          $17, 0x10($29)
/* 040BAC 00140AAC 0000B07F */  sq          $16, 0x0($29)
/* 040BB0 00140AB0 80200400 */  sll         $4, $4, 2
/* 040BB4 00140AB4 2500033C */  lui         $3, %hi(binfile)
/* 040BB8 00140AB8 401A6324 */  addiu       $3, $3, %lo(binfile)
/* 040BBC 00140ABC 21886400 */  addu        $17, $3, $4
/* 040BC0 00140AC0 0000248E */  lw          $4, 0x0($17)
/* 040BC4 00140AC4 00008380 */  lb          $3, 0x0($4)
/* 040BC8 00140AC8 28006010 */  beqz        $3, .L00140B6C
/* 040BCC 00140ACC 00000000 */   nop
/* 040BD0 00140AD0 2500023C */  lui         $2, %hi(now_binfile)
/* 040BD4 00140AD4 801A4524 */  addiu       $5, $2, %lo(now_binfile)
/* 040BD8 00140AD8 0815040C */  jal         strcmp
/* 040BDC 00140ADC 00000000 */   nop
/* 040BE0 00140AE0 22004010 */  beqz        $2, .L00140B6C
/* 040BE4 00140AE4 00000000 */   nop
/* 040BE8 00140AE8 2500023C */  lui         $2, %hi(now_binfile)
/* 040BEC 00140AEC 801A4424 */  addiu       $4, $2, %lo(now_binfile)
/* 040BF0 00140AF0 0000258E */  lw          $5, 0x0($17)
/* 040BF4 00140AF4 5A15040C */  jal         strcpy
/* 040BF8 00140AF8 00000000 */   nop
/* 040BFC 00140AFC 2A00013C */  lui         $1, %hi(RO_002A17B4)
/* 040C00 00140B00 B417308C */  lw          $16, %lo(RO_002A17B4)($1)
/* 040C04 00140B04 2500023C */  lui         $2, %hi(LIT_573)
/* 040C08 00140B08 001B4624 */  addiu       $6, $2, %lo(LIT_573)
/* 040C0C 00140B0C 3000A527 */  addiu       $5, $29, 0x30
/* 040C10 00140B10 04000424 */  addiu       $4, $0, 0x4
.L00140B14:
/* 040C14 00140B14 0000C378 */  lq          $3, 0x0($6)
/* 040C18 00140B18 1000C278 */  lq          $2, 0x10($6)
/* 040C1C 00140B1C 2000C624 */  addiu       $6, $6, 0x20
/* 040C20 00140B20 FFFF8424 */  addiu       $4, $4, -0x1
/* 040C24 00140B24 0000A37C */  sq          $3, 0x0($5)
/* 040C28 00140B28 1000A27C */  sq          $2, 0x10($5)
/* 040C2C 00140B2C 2000A524 */  addiu       $5, $5, 0x20
/* 040C30 00140B30 F8FF801C */  bgtz        $4, .L00140B14
/* 040C34 00140B34 00000000 */   nop
/* 040C38 00140B38 3000A427 */  addiu       $4, $29, 0x30
/* 040C3C 00140B3C 0000258E */  lw          $5, 0x0($17)
/* 040C40 00140B40 BC14040C */  jal         strcat
/* 040C44 00140B44 00000000 */   nop
/* 040C48 00140B48 3000A427 */  addiu       $4, $29, 0x30
/* 040C4C 00140B4C 2A00023C */  lui         $2, %hi(LIT_578)
/* 040C50 00140B50 18924524 */  addiu       $5, $2, %lo(LIT_578)
/* 040C54 00140B54 BC14040C */  jal         strcat
/* 040C58 00140B58 00000000 */   nop
/* 040C5C 00140B5C 3000A427 */  addiu       $4, $29, 0x30
/* 040C60 00140B60 282E0072 */  paddub      $5, $16, $0
/* 040C64 00140B64 D08B040C */  jal         mwLoadOverlay
/* 040C68 00140B68 00000000 */   nop
.L00140B6C:
/* 040C6C 00140B6C 2000BF7B */  lq          $31, 0x20($29)
/* 040C70 00140B70 1000B17B */  lq          $17, 0x10($29)
/* 040C74 00140B74 0000B07B */  lq          $16, 0x0($29)
/* 040C78 00140B78 B000BD27 */  addiu       $29, $29, 0xB0
/* 040C7C 00140B7C 0800E003 */  jr          $31
/* 040C80 00140B80 00000000 */   nop
/* 040C84 00140B84 00000000 */  nop
/* 040C88 00140B88 00000000 */  nop
/* 040C8C 00140B8C 00000000 */  nop
