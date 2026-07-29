.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceSifAllocIopHeap
/* 018A10 00118910 2500033C */  lui         $3, %hi(_bind)
/* 018A14 00118914 D0FFBD27 */  addiu       $29, $29, -0x30
/* 018A18 00118918 180A628C */  lw          $2, %lo(_bind)($3)
/* 018A1C 0011891C 2D288000 */  daddu       $5, $4, $0
/* 018A20 00118920 2000BFFF */  sd          $31, 0x20($29)
/* 018A24 00118924 11004004 */  bltz        $2, .L0011896C
/* 018A28 00118928 1000B0FF */   sd         $16, 0x10($29)
/* 018A2C 0011892C 2B00073C */  lui         $7, %hi(_aih_data)
/* 018A30 00118930 2B00043C */  lui         $4, %hi(cd)
/* 018A34 00118934 0082E5AC */  sw          $5, %lo(_aih_data)($7)
/* 018A38 00118938 2B00103C */  lui         $16, %hi(rdata)
/* 018A3C 0011893C 80818424 */  addiu       $4, $4, %lo(cd)
/* 018A40 00118940 0082E724 */  addiu       $7, $7, %lo(_aih_data)
/* 018A44 00118944 0000A0AF */  sw          $0, 0x0($29)
/* 018A48 00118948 01000524 */  addiu       $5, $0, 0x1
/* 018A4C 0011894C 2D300000 */  daddu       $6, $0, $0
/* 018A50 00118950 04000824 */  addiu       $8, $0, 0x4
/* 018A54 00118954 C0810926 */  addiu       $9, $16, %lo(rdata)
/* 018A58 00118958 04000A24 */  addiu       $10, $0, 0x4
/* 018A5C 0011895C 2A5D040C */  jal         sceSifCallRpc
/* 018A60 00118960 2D580000 */   daddu      $11, $0, $0
/* 018A64 00118964 02004104 */  bgez        $2, .L00118970
/* 018A68 00118968 C081028E */   lw         $2, %lo(rdata)($16)
.L0011896C:
/* 018A6C 0011896C 2D100000 */  daddu       $2, $0, $0
.L00118970:
/* 018A70 00118970 2000BFDF */  ld          $31, 0x20($29)
/* 018A74 00118974 1000B0DF */  ld          $16, 0x10($29)
/* 018A78 00118978 0800E003 */  jr          $31
/* 018A7C 0011897C 3000BD27 */   addiu      $29, $29, 0x30
