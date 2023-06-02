.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BufferAllClear__Fv
/* 25CC0 00125BC0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 25CC4 00125BC4 1000BF7F */  sq         $31, 0x10($sp)
/* 25CC8 00125BC8 0000B07F */  sq         $16, 0x0($sp)
/* 25CCC 00125BCC C701013C */  lui        $at, (0x1C74980 >> 16)
/* 25CD0 00125BD0 804920AC */  sw         $0, (0x1C74980 & 0xFFFF)($at)
/* 25CD4 00125BD4 C701013C */  lui        $at, (0x1C74980 >> 16)
/* 25CD8 00125BD8 8049228C */  lw         $2, (0x1C74980 & 0xFFFF)($at)
/* 25CDC 00125BDC 00190200 */  sll        $3, $2, 4
/* 25CE0 00125BE0 2B00023C */  lui        $2, %hi(GlobalDataBuffer)
/* 25CE4 00125BE4 80B04224 */  addiu      $2, $2, %lo(GlobalDataBuffer)
/* 25CE8 00125BE8 21104300 */  addu       $2, $2, $3
/* 25CEC 00125BEC 28260070 */  paddub     $4, $0, $0
/* 25CF0 00125BF0 04000010 */  b          .L00125C04
/* 25CF4 00125BF4 00000000 */   nop
.L00125BF8:
/* 25CF8 00125BF8 0000407C */  sq         $0, 0x0($2)
/* 25CFC 00125BFC 10004224 */  addiu      $2, $2, 0x10
/* 25D00 00125C00 01008424 */  addiu      $4, $4, 0x1
.L00125C04:
/* 25D04 00125C04 1900033C */  lui        $3, (0x19C990 >> 16)
/* 25D08 00125C08 90C96334 */  ori        $3, $3, (0x19C990 & 0xFFFF)
/* 25D0C 00125C0C 2A188300 */  slt        $3, $4, $3
/* 25D10 00125C10 F9FF6014 */  bnez       $3, .L00125BF8
/* 25D14 00125C14 00000000 */   nop
/* 25D18 00125C18 2B00023C */  lui        $2, %hi(GlobalDataBuffer)
/* 25D1C 00125C1C 80B04424 */  addiu      $4, $2, %lo(GlobalDataBuffer)
/* 25D20 00125C20 0900023C */  lui        $2, (0x927C0 >> 16)
/* 25D24 00125C24 C0274534 */  ori        $5, $2, (0x927C0 & 0xFFFF)
/* 25D28 00125C28 809E040C */  jal        Alloc64__21CDataAlloc_1_1690000_Fi
/* 25D2C 00125C2C 00000000 */   nop
/* 25D30 00125C30 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25D34 00125C34 10B022AC */  sw         $2, -0x4FF0($at)
/* 25D38 00125C38 0900023C */  lui        $2, (0x927C0 >> 16)
/* 25D3C 00125C3C C0274234 */  ori        $2, $2, (0x927C0 & 0xFFFF)
/* 25D40 00125C40 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25D44 00125C44 1CB022AC */  sw         $2, -0x4FE4($at)
/* 25D48 00125C48 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25D4C 00125C4C 18B020AC */  sw         $0, -0x4FE8($at)
/* 25D50 00125C50 2B00023C */  lui        $2, %hi(GlobalDataBuffer)
/* 25D54 00125C54 80B04424 */  addiu      $4, $2, %lo(GlobalDataBuffer)
/* 25D58 00125C58 0300023C */  lui        $2, (0x30D40 >> 16)
/* 25D5C 00125C5C 400D4534 */  ori        $5, $2, (0x30D40 & 0xFFFF)
/* 25D60 00125C60 809E040C */  jal        Alloc64__21CDataAlloc_1_1690000_Fi
/* 25D64 00125C64 00000000 */   nop
/* 25D68 00125C68 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25D6C 00125C6C 20B022AC */  sw         $2, -0x4FE0($at)
/* 25D70 00125C70 0300023C */  lui        $2, (0x30D40 >> 16)
/* 25D74 00125C74 400D4234 */  ori        $2, $2, (0x30D40 & 0xFFFF)
/* 25D78 00125C78 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25D7C 00125C7C 2CB022AC */  sw         $2, -0x4FD4($at)
/* 25D80 00125C80 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25D84 00125C84 28B020AC */  sw         $0, -0x4FD8($at)
/* 25D88 00125C88 2B00023C */  lui        $2, %hi(GlobalDataBuffer)
/* 25D8C 00125C8C 80B04424 */  addiu      $4, $2, %lo(GlobalDataBuffer)
/* 25D90 00125C90 0400023C */  lui        $2, (0x493E0 >> 16)
/* 25D94 00125C94 E0934534 */  ori        $5, $2, (0x493E0 & 0xFFFF)
/* 25D98 00125C98 809E040C */  jal        Alloc64__21CDataAlloc_1_1690000_Fi
/* 25D9C 00125C9C 00000000 */   nop
/* 25DA0 00125CA0 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25DA4 00125CA4 30B022AC */  sw         $2, -0x4FD0($at)
/* 25DA8 00125CA8 0400023C */  lui        $2, (0x493E0 >> 16)
/* 25DAC 00125CAC E0934234 */  ori        $2, $2, (0x493E0 & 0xFFFF)
/* 25DB0 00125CB0 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25DB4 00125CB4 3CB022AC */  sw         $2, -0x4FC4($at)
/* 25DB8 00125CB8 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25DBC 00125CBC 38B020AC */  sw         $0, -0x4FC8($at)
/* 25DC0 00125CC0 2B00023C */  lui        $2, %hi(GlobalDataBuffer)
/* 25DC4 00125CC4 80B04424 */  addiu      $4, $2, %lo(GlobalDataBuffer)
/* 25DC8 00125CC8 0100023C */  lui        $2, (0x15F90 >> 16)
/* 25DCC 00125CCC 905F4534 */  ori        $5, $2, (0x15F90 & 0xFFFF)
/* 25DD0 00125CD0 809E040C */  jal        Alloc64__21CDataAlloc_1_1690000_Fi
/* 25DD4 00125CD4 00000000 */   nop
/* 25DD8 00125CD8 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25DDC 00125CDC 40B022AC */  sw         $2, -0x4FC0($at)
/* 25DE0 00125CE0 0100023C */  lui        $2, (0x15F90 >> 16)
/* 25DE4 00125CE4 905F4234 */  ori        $2, $2, (0x15F90 & 0xFFFF)
/* 25DE8 00125CE8 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25DEC 00125CEC 4CB022AC */  sw         $2, -0x4FB4($at)
/* 25DF0 00125CF0 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25DF4 00125CF4 48B020AC */  sw         $0, -0x4FB8($at)
/* 25DF8 00125CF8 2B00023C */  lui        $2, %hi(GlobalDataBuffer)
/* 25DFC 00125CFC 80B04424 */  addiu      $4, $2, %lo(GlobalDataBuffer)
/* 25E00 00125D00 A8610524 */  addiu      $5, $0, 0x61A8
/* 25E04 00125D04 809E040C */  jal        Alloc64__21CDataAlloc_1_1690000_Fi
/* 25E08 00125D08 00000000 */   nop
/* 25E0C 00125D0C 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25E10 00125D10 60B022AC */  sw         $2, -0x4FA0($at)
/* 25E14 00125D14 A8610524 */  addiu      $5, $0, 0x61A8
/* 25E18 00125D18 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25E1C 00125D1C 6CB025AC */  sw         $5, -0x4F94($at)
/* 25E20 00125D20 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25E24 00125D24 68B020AC */  sw         $0, -0x4F98($at)
/* 25E28 00125D28 2B00023C */  lui        $2, %hi(GlobalDataBuffer)
/* 25E2C 00125D2C 80B04424 */  addiu      $4, $2, %lo(GlobalDataBuffer)
/* 25E30 00125D30 809E040C */  jal        Alloc64__21CDataAlloc_1_1690000_Fi
/* 25E34 00125D34 00000000 */   nop
/* 25E38 00125D38 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25E3C 00125D3C 70B022AC */  sw         $2, -0x4F90($at)
/* 25E40 00125D40 A8610224 */  addiu      $2, $0, 0x61A8
/* 25E44 00125D44 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25E48 00125D48 7CB022AC */  sw         $2, -0x4F84($at)
/* 25E4C 00125D4C 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25E50 00125D50 78B020AC */  sw         $0, -0x4F88($at)
/* 25E54 00125D54 2B00023C */  lui        $2, %hi(GlobalDataBuffer)
/* 25E58 00125D58 80B04424 */  addiu      $4, $2, %lo(GlobalDataBuffer)
/* 25E5C 00125D5C 0100023C */  lui        $2, (0x186A0 >> 16)
/* 25E60 00125D60 A0864534 */  ori        $5, $2, (0x186A0 & 0xFFFF)
/* 25E64 00125D64 809E040C */  jal        Alloc64__21CDataAlloc_1_1690000_Fi
/* 25E68 00125D68 00000000 */   nop
/* 25E6C 00125D6C 948B82AF */  sw         $2, -0x746C($gp)
/* 25E70 00125D70 2B00023C */  lui        $2, %hi(GlobalDataBuffer)
/* 25E74 00125D74 80B04424 */  addiu      $4, $2, %lo(GlobalDataBuffer)
/* 25E78 00125D78 00100524 */  addiu      $5, $0, 0x1000
/* 25E7C 00125D7C 809E040C */  jal        Alloc64__21CDataAlloc_1_1690000_Fi
/* 25E80 00125D80 00000000 */   nop
/* 25E84 00125D84 C701013C */  lui        $at, (0x1C74990 >> 16)
/* 25E88 00125D88 904922AC */  sw         $2, (0x1C74990 & 0xFFFF)($at)
/* 25E8C 00125D8C 00100224 */  addiu      $2, $0, 0x1000
/* 25E90 00125D90 C701013C */  lui        $at, (0x1C7499C >> 16)
/* 25E94 00125D94 9C4922AC */  sw         $2, (0x1C7499C & 0xFFFF)($at)
/* 25E98 00125D98 C701023C */  lui        $2, %hi(workbuffer)
/* 25E9C 00125D9C 90494224 */  addiu      $2, $2, %lo(workbuffer)
/* 25EA0 00125DA0 988B82AF */  sw         $2, -0x7468($gp)
/* 25EA4 00125DA4 988B828F */  lw         $2, -0x7468($gp)
/* 25EA8 00125DA8 080040AC */  sw         $0, 0x8($2)
/* 25EAC 00125DAC 2B00023C */  lui        $2, %hi(GlobalDataBuffer)
/* 25EB0 00125DB0 80B04424 */  addiu      $4, $2, %lo(GlobalDataBuffer)
/* 25EB4 00125DB4 50C30534 */  ori        $5, $0, 0xC350
/* 25EB8 00125DB8 809E040C */  jal        Alloc64__21CDataAlloc_1_1690000_Fi
/* 25EBC 00125DBC 00000000 */   nop
/* 25EC0 00125DC0 28864070 */  paddub     $16, $2, $0
/* 25EC4 00125DC4 2B00023C */  lui        $2, %hi(GlobalDataBuffer)
/* 25EC8 00125DC8 80B04424 */  addiu      $4, $2, %lo(GlobalDataBuffer)
/* 25ECC 00125DCC 50C30534 */  ori        $5, $0, 0xC350
/* 25ED0 00125DD0 809E040C */  jal        Alloc64__21CDataAlloc_1_1690000_Fi
/* 25ED4 00125DD4 00000000 */   nop
/* 25ED8 00125DD8 28260072 */  paddub     $4, $16, $0
/* 25EDC 00125DDC 282E4070 */  paddub     $5, $2, $0
/* 25EE0 00125DE0 C8B1040C */  jal        MGInitVif1Packet__FP1P1
/* 25EE4 00125DE4 00000000 */   nop
/* 25EE8 00125DE8 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25EEC 00125DEC 48B020AC */  sw         $0, -0x4FB8($at)
/* 25EF0 00125DF0 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25EF4 00125DF4 68B020AC */  sw         $0, -0x4F98($at)
/* 25EF8 00125DF8 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25EFC 00125DFC 78B020AC */  sw         $0, -0x4F88($at)
/* 25F00 00125E00 1000BF7B */  lq         $31, 0x10($sp)
/* 25F04 00125E04 0000B07B */  lq         $16, 0x0($sp)
/* 25F08 00125E08 2000BD27 */  addiu      $sp, $sp, 0x20
/* 25F0C 00125E0C 0800E003 */  jr         $31
/* 25F10 00125E10 00000000 */   nop
/* 25F14 00125E14 00000000 */  nop
/* 25F18 00125E18 00000000 */  nop
/* 25F1C 00125E1C 00000000 */  nop
