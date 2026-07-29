.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceMcGetInfo
/* 01E940 0011E840 A0FFBD27 */  addiu       $29, $29, -0x60
/* 01E944 0011E844 2D48C000 */  daddu       $9, $6, $0
/* 01E948 0011E848 4000B3FF */  sd          $19, 0x40($29)
/* 01E94C 0011E84C 2500133C */  lui         $19, %hi(mcRunCmdNo)
/* 01E950 0011E850 5000BFFF */  sd          $31, 0x50($29)
/* 01E954 0011E854 380A628E */  lw          $2, %lo(mcRunCmdNo)($19)
/* 01E958 0011E858 3000B2FF */  sd          $18, 0x30($29)
/* 01E95C 0011E85C 2000B1FF */  sd          $17, 0x20($29)
/* 01E960 0011E860 3D004014 */  bnez        $2, .L0011E958
/* 01E964 0011E864 1000B0FF */   sd         $16, 0x10($29)
/* 01E968 0011E868 2B00123C */  lui         $18, %hi(mcClientID)
/* 01E96C 0011E86C 40864226 */  addiu       $2, $18, %lo(mcClientID)
/* 01E970 0011E870 2400438C */  lw          $3, 0x24($2)
/* 01E974 0011E874 03006014 */  bnez        $3, .L0011E884
/* 01E978 0011E878 2B00113C */   lui        $17, %hi(sifParamOrd)
/* 01E97C 0011E87C 36000010 */  b           .L0011E958
/* 01E980 0011E880 9CFF0224 */   addiu      $2, $0, -0x64
.L0011E884:
/* 01E984 0011E884 2B00103C */  lui         $16, %hi(sifParamNext)
/* 01E988 0011E888 C0862326 */  addiu       $3, $17, %lo(sifParamOrd)
/* 01E98C 0011E88C 408B0226 */  addiu       $2, $16, %lo(sifParamNext)
/* 01E990 0011E890 040064AC */  sw          $4, 0x4($3)
/* 01E994 0011E894 080065AC */  sw          $5, 0x8($3)
/* 01E998 0011E898 04002011 */  beqz        $9, .L0011E8AC
/* 01E99C 0011E89C 1C0062AC */   sw         $2, 0x1C($3)
/* 01E9A0 0011E8A0 01000224 */  addiu       $2, $0, 0x1
/* 01E9A4 0011E8A4 02000010 */  b           .L0011E8B0
/* 01E9A8 0011E8A8 140062AC */   sw         $2, 0x14($3)
.L0011E8AC:
/* 01E9AC 0011E8AC 140060AC */  sw          $0, 0x14($3)
.L0011E8B0:
/* 01E9B0 0011E8B0 0400E010 */  beqz        $7, .L0011E8C4
/* 01E9B4 0011E8B4 C0862326 */   addiu      $3, $17, %lo(sifParamOrd)
/* 01E9B8 0011E8B8 01000224 */  addiu       $2, $0, 0x1
/* 01E9BC 0011E8BC 03000010 */  b           .L0011E8CC
/* 01E9C0 0011E8C0 100062AC */   sw         $2, 0x10($3)
.L0011E8C4:
/* 01E9C4 0011E8C4 C0862226 */  addiu       $2, $17, %lo(sifParamOrd)
/* 01E9C8 0011E8C8 100040AC */  sw          $0, 0x10($2)
.L0011E8CC:
/* 01E9CC 0011E8CC 04000011 */  beqz        $8, .L0011E8E0
/* 01E9D0 0011E8D0 C0862326 */   addiu      $3, $17, %lo(sifParamOrd)
/* 01E9D4 0011E8D4 01000224 */  addiu       $2, $0, 0x1
/* 01E9D8 0011E8D8 03000010 */  b           .L0011E8E8
/* 01E9DC 0011E8DC 0C0062AC */   sw         $2, 0xC($3)
.L0011E8E0:
/* 01E9E0 0011E8E0 C0862226 */  addiu       $2, $17, %lo(sifParamOrd)
/* 01E9E4 0011E8E4 0C0040AC */  sw          $0, 0xC($2)
.L0011E8E8:
/* 01E9E8 0011E8E8 408B1026 */  addiu       $16, $16, %lo(sifParamNext)
/* 01E9EC 0011E8EC 2B00023C */  lui         $2, %hi(typeAddr)
/* 01E9F0 0011E8F0 2B00033C */  lui         $3, %hi(freeAddr)
/* 01E9F4 0011E8F4 2B00063C */  lui         $6, %hi(formAddr)
/* 01E9F8 0011E8F8 688649AC */  sw          $9, %lo(typeAddr)($2)
/* 01E9FC 0011E8FC 2D200002 */  daddu       $4, $16, $0
/* 01EA00 0011E900 6C8667AC */  sw          $7, %lo(freeAddr)($3)
/* 01EA04 0011E904 C0000524 */  addiu       $5, $0, 0xC0
/* 01EA08 0011E908 E65A040C */  jal         sceSifWriteBackDCache
/* 01EA0C 0011E90C 7086C8AC */   sw         $8, %lo(formAddr)($6)
/* 01EA10 0011E910 2B00093C */  lui         $9, %hi(retval)
/* 01EA14 0011E914 12000B3C */  lui         $11, %hi(mceGetInfoApdx)
/* 01EA18 0011E918 0000B0AF */  sw          $16, 0x0($29)
/* 01EA1C 0011E91C 40864426 */  addiu       $4, $18, %lo(mcClientID)
/* 01EA20 0011E920 C0862726 */  addiu       $7, $17, %lo(sifParamOrd)
/* 01EA24 0011E924 009C2925 */  addiu       $9, $9, %lo(retval)
/* 01EA28 0011E928 E8E76B25 */  addiu       $11, $11, %lo(mceGetInfoApdx)
/* 01EA2C 0011E92C 01000524 */  addiu       $5, $0, 0x1
/* 01EA30 0011E930 01000624 */  addiu       $6, $0, 0x1
/* 01EA34 0011E934 30000824 */  addiu       $8, $0, 0x30
/* 01EA38 0011E938 2A5D040C */  jal         sceSifCallRpc
/* 01EA3C 0011E93C 04000A24 */   addiu      $10, $0, 0x4
/* 01EA40 0011E940 2D184000 */  daddu       $3, $2, $0
/* 01EA44 0011E944 04006014 */  bnez        $3, .L0011E958
/* 01EA48 0011E948 2D106000 */   daddu      $2, $3, $0
/* 01EA4C 0011E94C 01000224 */  addiu       $2, $0, 0x1
/* 01EA50 0011E950 380A62AE */  sw          $2, %lo(mcRunCmdNo)($19)
/* 01EA54 0011E954 2D106000 */  daddu       $2, $3, $0
.L0011E958:
/* 01EA58 0011E958 5000BFDF */  ld          $31, 0x50($29)
/* 01EA5C 0011E95C 4000B3DF */  ld          $19, 0x40($29)
/* 01EA60 0011E960 3000B2DF */  ld          $18, 0x30($29)
/* 01EA64 0011E964 2000B1DF */  ld          $17, 0x20($29)
/* 01EA68 0011E968 1000B0DF */  ld          $16, 0x10($29)
/* 01EA6C 0011E96C 0800E003 */  jr          $31
/* 01EA70 0011E970 6000BD27 */   addiu      $29, $29, 0x60
/* 01EA74 0011E974 00000000 */  nop
