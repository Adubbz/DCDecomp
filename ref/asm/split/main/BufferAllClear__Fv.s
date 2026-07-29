.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BufferAllClear__Fv
/* 025CC0 00125BC0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 025CC4 00125BC4 1000BF7F */  sq          $31, 0x10($29)
/* 025CC8 00125BC8 0000B07F */  sq          $16, 0x0($29)
/* 025CCC 00125BCC C701013C */  lui         $1, %hi(GlobalDataBuffer + 0x19C9900)
/* 025CD0 00125BD0 804920AC */  sw          $0, %lo(GlobalDataBuffer + 0x19C9900)($1)
/* 025CD4 00125BD4 C701013C */  lui         $1, %hi(GlobalDataBuffer + 0x19C9900)
/* 025CD8 00125BD8 8049228C */  lw          $2, %lo(GlobalDataBuffer + 0x19C9900)($1)
/* 025CDC 00125BDC 00190200 */  sll         $3, $2, 4
/* 025CE0 00125BE0 2B00023C */  lui         $2, %hi(GlobalDataBuffer)
/* 025CE4 00125BE4 80B04224 */  addiu       $2, $2, %lo(GlobalDataBuffer)
/* 025CE8 00125BE8 21104300 */  addu        $2, $2, $3
/* 025CEC 00125BEC 28260070 */  paddub      $4, $0, $0
/* 025CF0 00125BF0 04000010 */  b           .L00125C04
/* 025CF4 00125BF4 00000000 */   nop
.L00125BF8:
/* 025CF8 00125BF8 0000407C */  sq          $0, 0x0($2)
/* 025CFC 00125BFC 10004224 */  addiu       $2, $2, 0x10
/* 025D00 00125C00 01008424 */  addiu       $4, $4, 0x1
.L00125C04:
/* 025D04 00125C04 1900033C */  lui         $3, (0x19C990 >> 16)
/* 025D08 00125C08 90C96334 */  ori         $3, $3, (0x19C990 & 0xFFFF)
/* 025D0C 00125C0C 2A188300 */  slt         $3, $4, $3
/* 025D10 00125C10 F9FF6014 */  bnez        $3, .L00125BF8
/* 025D14 00125C14 00000000 */   nop
/* 025D18 00125C18 2B00023C */  lui         $2, %hi(GlobalDataBuffer)
/* 025D1C 00125C1C 80B04424 */  addiu       $4, $2, %lo(GlobalDataBuffer)
/* 025D20 00125C20 0900023C */  lui         $2, (0x927C0 >> 16)
/* 025D24 00125C24 C0274534 */  ori         $5, $2, (0x927C0 & 0xFFFF)
/* 025D28 00125C28 809E040C */  jal         Alloc64__21CDataAlloc_1_1690000_Fi
/* 025D2C 00125C2C 00000000 */   nop
/* 025D30 00125C30 2B00013C */  lui         $1, %hi(VisualData)
/* 025D34 00125C34 10B022AC */  sw          $2, %lo(VisualData)($1)
/* 025D38 00125C38 0900023C */  lui         $2, (0x927C0 >> 16)
/* 025D3C 00125C3C C0274234 */  ori         $2, $2, (0x927C0 & 0xFFFF)
/* 025D40 00125C40 2B00013C */  lui         $1, %hi(VisualData + 0xC)
/* 025D44 00125C44 1CB022AC */  sw          $2, %lo(VisualData + 0xC)($1)
/* 025D48 00125C48 2B00013C */  lui         $1, %hi(VisualData + 0x8)
/* 025D4C 00125C4C 18B020AC */  sw          $0, %lo(VisualData + 0x8)($1)
/* 025D50 00125C50 2B00023C */  lui         $2, %hi(GlobalDataBuffer)
/* 025D54 00125C54 80B04424 */  addiu       $4, $2, %lo(GlobalDataBuffer)
/* 025D58 00125C58 0300023C */  lui         $2, (0x30D40 >> 16)
/* 025D5C 00125C5C 400D4534 */  ori         $5, $2, (0x30D40 & 0xFFFF)
/* 025D60 00125C60 809E040C */  jal         Alloc64__21CDataAlloc_1_1690000_Fi
/* 025D64 00125C64 00000000 */   nop
/* 025D68 00125C68 2B00013C */  lui         $1, %hi(MotionData)
/* 025D6C 00125C6C 20B022AC */  sw          $2, %lo(MotionData)($1)
/* 025D70 00125C70 0300023C */  lui         $2, (0x30D40 >> 16)
/* 025D74 00125C74 400D4234 */  ori         $2, $2, (0x30D40 & 0xFFFF)
/* 025D78 00125C78 2B00013C */  lui         $1, %hi(MotionData + 0xC)
/* 025D7C 00125C7C 2CB022AC */  sw          $2, %lo(MotionData + 0xC)($1)
/* 025D80 00125C80 2B00013C */  lui         $1, %hi(MotionData + 0x8)
/* 025D84 00125C84 28B020AC */  sw          $0, %lo(MotionData + 0x8)($1)
/* 025D88 00125C88 2B00023C */  lui         $2, %hi(GlobalDataBuffer)
/* 025D8C 00125C8C 80B04424 */  addiu       $4, $2, %lo(GlobalDataBuffer)
/* 025D90 00125C90 0400023C */  lui         $2, (0x493E0 >> 16)
/* 025D94 00125C94 E0934534 */  ori         $5, $2, (0x493E0 & 0xFFFF)
/* 025D98 00125C98 809E040C */  jal         Alloc64__21CDataAlloc_1_1690000_Fi
/* 025D9C 00125C9C 00000000 */   nop
/* 025DA0 00125CA0 2B00013C */  lui         $1, %hi(TextureData)
/* 025DA4 00125CA4 30B022AC */  sw          $2, %lo(TextureData)($1)
/* 025DA8 00125CA8 0400023C */  lui         $2, (0x493E0 >> 16)
/* 025DAC 00125CAC E0934234 */  ori         $2, $2, (0x493E0 & 0xFFFF)
/* 025DB0 00125CB0 2B00013C */  lui         $1, %hi(TextureData + 0xC)
/* 025DB4 00125CB4 3CB022AC */  sw          $2, %lo(TextureData + 0xC)($1)
/* 025DB8 00125CB8 2B00013C */  lui         $1, %hi(TextureData + 0x8)
/* 025DBC 00125CBC 38B020AC */  sw          $0, %lo(TextureData + 0x8)($1)
/* 025DC0 00125CC0 2B00023C */  lui         $2, %hi(GlobalDataBuffer)
/* 025DC4 00125CC4 80B04424 */  addiu       $4, $2, %lo(GlobalDataBuffer)
/* 025DC8 00125CC8 0100023C */  lui         $2, (0x15F90 >> 16)
/* 025DCC 00125CCC 905F4534 */  ori         $5, $2, (0x15F90 & 0xFFFF)
/* 025DD0 00125CD0 809E040C */  jal         Alloc64__21CDataAlloc_1_1690000_Fi
/* 025DD4 00125CD4 00000000 */   nop
/* 025DD8 00125CD8 2B00013C */  lui         $1, %hi(WaterData)
/* 025DDC 00125CDC 40B022AC */  sw          $2, %lo(WaterData)($1)
/* 025DE0 00125CE0 0100023C */  lui         $2, (0x15F90 >> 16)
/* 025DE4 00125CE4 905F4234 */  ori         $2, $2, (0x15F90 & 0xFFFF)
/* 025DE8 00125CE8 2B00013C */  lui         $1, %hi(WaterData + 0xC)
/* 025DEC 00125CEC 4CB022AC */  sw          $2, %lo(WaterData + 0xC)($1)
/* 025DF0 00125CF0 2B00013C */  lui         $1, %hi(WaterData + 0x8)
/* 025DF4 00125CF4 48B020AC */  sw          $0, %lo(WaterData + 0x8)($1)
/* 025DF8 00125CF8 2B00023C */  lui         $2, %hi(GlobalDataBuffer)
/* 025DFC 00125CFC 80B04424 */  addiu       $4, $2, %lo(GlobalDataBuffer)
/* 025E00 00125D00 A8610524 */  addiu       $5, $0, 0x61A8
/* 025E04 00125D04 809E040C */  jal         Alloc64__21CDataAlloc_1_1690000_Fi
/* 025E08 00125D08 00000000 */   nop
/* 025E0C 00125D0C 2B00013C */  lui         $1, %hi(ActiveData0)
/* 025E10 00125D10 60B022AC */  sw          $2, %lo(ActiveData0)($1)
/* 025E14 00125D14 A8610524 */  addiu       $5, $0, 0x61A8
/* 025E18 00125D18 2B00013C */  lui         $1, %hi(ActiveData0 + 0xC)
/* 025E1C 00125D1C 6CB025AC */  sw          $5, %lo(ActiveData0 + 0xC)($1)
/* 025E20 00125D20 2B00013C */  lui         $1, %hi(ActiveData0 + 0x8)
/* 025E24 00125D24 68B020AC */  sw          $0, %lo(ActiveData0 + 0x8)($1)
/* 025E28 00125D28 2B00023C */  lui         $2, %hi(GlobalDataBuffer)
/* 025E2C 00125D2C 80B04424 */  addiu       $4, $2, %lo(GlobalDataBuffer)
/* 025E30 00125D30 809E040C */  jal         Alloc64__21CDataAlloc_1_1690000_Fi
/* 025E34 00125D34 00000000 */   nop
/* 025E38 00125D38 2B00013C */  lui         $1, %hi(ActiveData1)
/* 025E3C 00125D3C 70B022AC */  sw          $2, %lo(ActiveData1)($1)
/* 025E40 00125D40 A8610224 */  addiu       $2, $0, 0x61A8
/* 025E44 00125D44 2B00013C */  lui         $1, %hi(ActiveData1 + 0xC)
/* 025E48 00125D48 7CB022AC */  sw          $2, %lo(ActiveData1 + 0xC)($1)
/* 025E4C 00125D4C 2B00013C */  lui         $1, %hi(ActiveData1 + 0x8)
/* 025E50 00125D50 78B020AC */  sw          $0, %lo(ActiveData1 + 0x8)($1)
/* 025E54 00125D54 2B00023C */  lui         $2, %hi(GlobalDataBuffer)
/* 025E58 00125D58 80B04424 */  addiu       $4, $2, %lo(GlobalDataBuffer)
/* 025E5C 00125D5C 0100023C */  lui         $2, (0x186A0 >> 16)
/* 025E60 00125D60 A0864534 */  ori         $5, $2, (0x186A0 & 0xFFFF)
/* 025E64 00125D64 809E040C */  jal         Alloc64__21CDataAlloc_1_1690000_Fi
/* 025E68 00125D68 00000000 */   nop
/* 025E6C 00125D6C 948B82AF */  sw          $2, -0x746C($28)
/* 025E70 00125D70 2B00023C */  lui         $2, %hi(GlobalDataBuffer)
/* 025E74 00125D74 80B04424 */  addiu       $4, $2, %lo(GlobalDataBuffer)
/* 025E78 00125D78 00100524 */  addiu       $5, $0, 0x1000
/* 025E7C 00125D7C 809E040C */  jal         Alloc64__21CDataAlloc_1_1690000_Fi
/* 025E80 00125D80 00000000 */   nop
/* 025E84 00125D84 C701013C */  lui         $1, %hi(workbuffer)
/* 025E88 00125D88 904922AC */  sw          $2, %lo(workbuffer)($1)
/* 025E8C 00125D8C 00100224 */  addiu       $2, $0, 0x1000
/* 025E90 00125D90 C701013C */  lui         $1, %hi(workbuffer + 0xC)
/* 025E94 00125D94 9C4922AC */  sw          $2, %lo(workbuffer + 0xC)($1)
/* 025E98 00125D98 C701023C */  lui         $2, %hi(workbuffer)
/* 025E9C 00125D9C 90494224 */  addiu       $2, $2, %lo(workbuffer)
/* 025EA0 00125DA0 988B82AF */  sw          $2, -0x7468($28)
/* 025EA4 00125DA4 988B828F */  lw          $2, -0x7468($28)
/* 025EA8 00125DA8 080040AC */  sw          $0, 0x8($2)
/* 025EAC 00125DAC 2B00023C */  lui         $2, %hi(GlobalDataBuffer)
/* 025EB0 00125DB0 80B04424 */  addiu       $4, $2, %lo(GlobalDataBuffer)
/* 025EB4 00125DB4 50C30534 */  ori         $5, $0, 0xC350
/* 025EB8 00125DB8 809E040C */  jal         Alloc64__21CDataAlloc_1_1690000_Fi
/* 025EBC 00125DBC 00000000 */   nop
/* 025EC0 00125DC0 28864070 */  paddub      $16, $2, $0
/* 025EC4 00125DC4 2B00023C */  lui         $2, %hi(GlobalDataBuffer)
/* 025EC8 00125DC8 80B04424 */  addiu       $4, $2, %lo(GlobalDataBuffer)
/* 025ECC 00125DCC 50C30534 */  ori         $5, $0, 0xC350
/* 025ED0 00125DD0 809E040C */  jal         Alloc64__21CDataAlloc_1_1690000_Fi
/* 025ED4 00125DD4 00000000 */   nop
/* 025ED8 00125DD8 28260072 */  paddub      $4, $16, $0
/* 025EDC 00125DDC 282E4070 */  paddub      $5, $2, $0
/* 025EE0 00125DE0 C8B1040C */  jal         MGInitVif1Packet__FP1P1
/* 025EE4 00125DE4 00000000 */   nop
/* 025EE8 00125DE8 2B00013C */  lui         $1, %hi(WaterData + 0x8)
/* 025EEC 00125DEC 48B020AC */  sw          $0, %lo(WaterData + 0x8)($1)
/* 025EF0 00125DF0 2B00013C */  lui         $1, %hi(ActiveData0 + 0x8)
/* 025EF4 00125DF4 68B020AC */  sw          $0, %lo(ActiveData0 + 0x8)($1)
/* 025EF8 00125DF8 2B00013C */  lui         $1, %hi(ActiveData1 + 0x8)
/* 025EFC 00125DFC 78B020AC */  sw          $0, %lo(ActiveData1 + 0x8)($1)
/* 025F00 00125E00 1000BF7B */  lq          $31, 0x10($29)
/* 025F04 00125E04 0000B07B */  lq          $16, 0x0($29)
/* 025F08 00125E08 2000BD27 */  addiu       $29, $29, 0x20
/* 025F0C 00125E0C 0800E003 */  jr          $31
/* 025F10 00125E10 00000000 */   nop
/* 025F14 00125E14 00000000 */  nop
/* 025F18 00125E18 00000000 */  nop
/* 025F1C 00125E1C 00000000 */  nop
