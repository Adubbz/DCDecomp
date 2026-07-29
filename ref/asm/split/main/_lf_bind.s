.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _lf_bind
/* 018BE8 00118AE8 B0FFBD27 */  addiu       $29, $29, -0x50
/* 018BEC 00118AEC 3000B2FF */  sd          $18, 0x30($29)
/* 018BF0 00118AF0 2500123C */  lui         $18, %hi(_bind_check)
/* 018BF4 00118AF4 4000BFFF */  sd          $31, 0x40($29)
/* 018BF8 00118AF8 200A428E */  lw          $2, %lo(_bind_check)($18)
/* 018BFC 00118AFC 2000B1FF */  sd          $17, 0x20($29)
/* 018C00 00118B00 32004104 */  bgez        $2, .L00118BCC
/* 018C04 00118B04 1000B0FF */   sd         $16, 0x10($29)
/* 018C08 00118B08 2B00113C */  lui         $17, %hi(cd__2)
/* 018C0C 00118B0C 80853026 */  addiu       $16, $17, %lo(cd__2)
.L00118B10:
/* 018C10 00118B10 0080053C */  lui         $5, (0x80000006 >> 16)
/* 018C14 00118B14 2D200002 */  daddu       $4, $16, $0
/* 018C18 00118B18 0600A534 */  ori         $5, $5, (0x80000006 & 0xFFFF)
/* 018C1C 00118B1C B65C040C */  jal         sceSifBindRpc
/* 018C20 00118B20 2D300000 */   daddu      $6, $0, $0
/* 018C24 00118B24 03004304 */  bgezl       $2, .L00118B34
/* 018C28 00118B28 2400028E */   lw         $2, 0x24($16)
/* 018C2C 00118B2C 28000010 */  b           .L00118BD0
/* 018C30 00118B30 FFFF0224 */   addiu      $2, $0, -0x1
.L00118B34:
/* 018C34 00118B34 19004010 */  beqz        $2, .L00118B9C
/* 018C38 00118B38 2D200002 */   daddu      $4, $16, $0
/* 018C3C 00118B3C 2B00113C */  lui         $17, %hi(_senddata)
/* 018C40 00118B40 200A40AE */  sw          $0, %lo(_bind_check)($18)
/* 018C44 00118B44 0000A0AF */  sw          $0, 0x0($29)
/* 018C48 00118B48 FF000524 */  addiu       $5, $0, 0xFF
/* 018C4C 00118B4C 2D300000 */  daddu       $6, $0, $0
/* 018C50 00118B50 2D380000 */  daddu       $7, $0, $0
/* 018C54 00118B54 2D400000 */  daddu       $8, $0, $0
/* 018C58 00118B58 80832926 */  addiu       $9, $17, %lo(_senddata)
/* 018C5C 00118B5C 04000A24 */  addiu       $10, $0, 0x4
/* 018C60 00118B60 2A5D040C */  jal         sceSifCallRpc
/* 018C64 00118B64 2D580000 */   daddu      $11, $0, $0
/* 018C68 00118B68 04004104 */  bgez        $2, .L00118B7C
/* 018C6C 00118B6C 2B00033C */   lui        $3, %hi(_lfversion)
/* 018C70 00118B70 FEFF023C */  lui         $2, (0xFFFEFFFF >> 16)
/* 018C74 00118B74 16000010 */  b           .L00118BD0
/* 018C78 00118B78 FFFF4234 */   ori        $2, $2, (0xFFFEFFFF & 0xFFFF)
.L00118B7C:
/* 018C7C 00118B7C 80832726 */  addiu       $7, $17, %lo(_senddata)
/* 018C80 00118B80 A8856624 */  addiu       $6, $3, %lo(_lfversion)
/* 018C84 00118B84 0300E488 */  lwl         $4, 0x3($7)
/* 018C88 00118B88 0000E498 */  lwr         $4, 0x0($7)
/* 018C8C 00118B8C 0300C4A8 */  swl         $4, 0x3($6)
/* 018C90 00118B90 0000C4B8 */  swr         $4, 0x0($6)
/* 018C94 00118B94 0E000010 */  b           .L00118BD0
/* 018C98 00118B98 2D100000 */   daddu      $2, $0, $0
.L00118B9C:
/* 018C9C 00118B9C 1000023C */  lui         $2, 0x10
/* 018CA0 00118BA0 FFFF0324 */  addiu       $3, $0, -0x1
/* 018CA4 00118BA4 00000000 */  nop
.L00118BA8:
/* 018CA8 00118BA8 FFFF4224 */  addiu       $2, $2, -0x1
/* 018CAC 00118BAC 00000000 */  nop
/* 018CB0 00118BB0 00000000 */  nop
/* 018CB4 00118BB4 00000000 */  nop
/* 018CB8 00118BB8 00000000 */  nop
/* 018CBC 00118BBC FAFF4314 */  bne         $2, $3, .L00118BA8
/* 018CC0 00118BC0 00000000 */   nop
/* 018CC4 00118BC4 D2FF0010 */  b           .L00118B10
/* 018CC8 00118BC8 80853026 */   addiu      $16, $17, %lo(cd__2)
.L00118BCC:
/* 018CCC 00118BCC 2D100000 */  daddu       $2, $0, $0
.L00118BD0:
/* 018CD0 00118BD0 4000BFDF */  ld          $31, 0x40($29)
/* 018CD4 00118BD4 3000B2DF */  ld          $18, 0x30($29)
/* 018CD8 00118BD8 2000B1DF */  ld          $17, 0x20($29)
/* 018CDC 00118BDC 1000B0DF */  ld          $16, 0x10($29)
/* 018CE0 00118BE0 0800E003 */  jr          $31
/* 018CE4 00118BE4 5000BD27 */   addiu      $29, $29, 0x50
