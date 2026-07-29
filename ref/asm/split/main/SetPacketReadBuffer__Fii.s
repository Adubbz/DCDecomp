.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetPacketReadBuffer__Fii
/* 025BE0 00125AE0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 025BE4 00125AE4 2000BF7F */  sq          $31, 0x20($29)
/* 025BE8 00125AE8 1000B17F */  sq          $17, 0x10($29)
/* 025BEC 00125AEC 0000B07F */  sq          $16, 0x0($29)
/* 025BF0 00125AF0 288E8070 */  paddub      $17, $4, $0
/* 025BF4 00125AF4 2B00023C */  lui         $2, %hi(GlobalDataBuffer)
/* 025BF8 00125AF8 80B04424 */  addiu       $4, $2, %lo(GlobalDataBuffer)
/* 025BFC 00125AFC 809E040C */  jal         Alloc64__21CDataAlloc_1_1690000_Fi
/* 025C00 00125B00 00000000 */   nop
/* 025C04 00125B04 948B82AF */  sw          $2, -0x746C($28)
/* 025C08 00125B08 2B00023C */  lui         $2, %hi(GlobalDataBuffer)
/* 025C0C 00125B0C 80B04424 */  addiu       $4, $2, %lo(GlobalDataBuffer)
/* 025C10 00125B10 282E2072 */  paddub      $5, $17, $0
/* 025C14 00125B14 809E040C */  jal         Alloc64__21CDataAlloc_1_1690000_Fi
/* 025C18 00125B18 00000000 */   nop
/* 025C1C 00125B1C 28864070 */  paddub      $16, $2, $0
/* 025C20 00125B20 2B00023C */  lui         $2, %hi(GlobalDataBuffer)
/* 025C24 00125B24 80B04424 */  addiu       $4, $2, %lo(GlobalDataBuffer)
/* 025C28 00125B28 282E2072 */  paddub      $5, $17, $0
/* 025C2C 00125B2C 809E040C */  jal         Alloc64__21CDataAlloc_1_1690000_Fi
/* 025C30 00125B30 00000000 */   nop
/* 025C34 00125B34 28260072 */  paddub      $4, $16, $0
/* 025C38 00125B38 282E4070 */  paddub      $5, $2, $0
/* 025C3C 00125B3C C8B1040C */  jal         MGInitVif1Packet__FP1P1
/* 025C40 00125B40 00000000 */   nop
/* 025C44 00125B44 2B00023C */  lui         $2, %hi(GlobalDataBuffer)
/* 025C48 00125B48 80B04424 */  addiu       $4, $2, %lo(GlobalDataBuffer)
/* 025C4C 00125B4C 00080524 */  addiu       $5, $0, 0x800
/* 025C50 00125B50 809E040C */  jal         Alloc64__21CDataAlloc_1_1690000_Fi
/* 025C54 00125B54 00000000 */   nop
/* 025C58 00125B58 C701013C */  lui         $1, %hi(workbuffer)
/* 025C5C 00125B5C 904922AC */  sw          $2, %lo(workbuffer)($1)
/* 025C60 00125B60 00080224 */  addiu       $2, $0, 0x800
/* 025C64 00125B64 C701013C */  lui         $1, %hi(workbuffer + 0xC)
/* 025C68 00125B68 9C4922AC */  sw          $2, %lo(workbuffer + 0xC)($1)
/* 025C6C 00125B6C C701023C */  lui         $2, %hi(workbuffer)
/* 025C70 00125B70 90494224 */  addiu       $2, $2, %lo(workbuffer)
/* 025C74 00125B74 988B82AF */  sw          $2, -0x7468($28)
/* 025C78 00125B78 988B828F */  lw          $2, -0x7468($28)
/* 025C7C 00125B7C 080040AC */  sw          $0, 0x8($2)
/* 025C80 00125B80 2A00023C */  lui         $2, %hi(LIT_199)
/* 025C84 00125B84 888D4424 */  addiu       $4, $2, %lo(LIT_199)
/* 025C88 00125B88 C701013C */  lui         $1, %hi(GlobalDataBuffer + 0x19C9900)
/* 025C8C 00125B8C 8049258C */  lw          $5, %lo(GlobalDataBuffer + 0x19C9900)($1)
/* 025C90 00125B90 1900023C */  lui         $2, (0x19C990 >> 16)
/* 025C94 00125B94 90C94634 */  ori         $6, $2, (0x19C990 & 0xFFFF)
/* 025C98 00125B98 A611040C */  jal         printf
/* 025C9C 00125B9C 00000000 */   nop
/* 025CA0 00125BA0 2000BF7B */  lq          $31, 0x20($29)
/* 025CA4 00125BA4 1000B17B */  lq          $17, 0x10($29)
/* 025CA8 00125BA8 0000B07B */  lq          $16, 0x0($29)
/* 025CAC 00125BAC 3000BD27 */  addiu       $29, $29, 0x30
/* 025CB0 00125BB0 0800E003 */  jr          $31
/* 025CB4 00125BB4 00000000 */   nop
/* 025CB8 00125BB8 00000000 */  nop
/* 025CBC 00125BBC 00000000 */  nop
