.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DelActiveItem__Fi
/* 013CD0 01DBF9D0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 013CD4 01DBF9D4 1000BF7F */  sq          $31, 0x10($29)
/* 013CD8 01DBF9D8 0000B07F */  sq          $16, 0x0($29)
/* 013CDC 01DBF9DC 789C838F */  lw          $3, -0x6388($28)
/* 013CE0 01DBF9E0 60436324 */  addiu       $3, $3, 0x4360
/* 013CE4 01DBF9E4 40280400 */  sll         $5, $4, 1
/* 013CE8 01DBF9E8 2138A300 */  addu        $7, $5, $3
/* 013CEC 01DBF9EC 0600E824 */  addiu       $8, $7, 0x6
/* 013CF0 01DBF9F0 0600E584 */  lh          $5, 0x6($7)
/* 013CF4 01DBF9F4 01000324 */  addiu       $3, $0, 0x1
/* 013CF8 01DBF9F8 1300A314 */  bne         $5, $3, .L01DBFA48_2FB048
/* 013CFC 01DBF9FC 00000000 */   nop
/* 013D00 01DBFA00 FFFF0624 */  addiu       $6, $0, -0x1
/* 013D04 01DBFA04 0000E6A4 */  sh          $6, 0x0($7)
/* 013D08 01DBFA08 000000A5 */  sh          $0, 0x0($8)
/* 013D0C 01DBFA0C 80200400 */  sll         $4, $4, 2
/* 013D10 01DBFA10 EC01033C */  lui         $3, %hi(activeItem + 0x14)
/* 013D14 01DBFA14 84786324 */  addiu       $3, $3, %lo(activeItem + 0x14)
/* 013D18 01DBFA18 21806400 */  addu        $16, $3, $4
/* 013D1C 01DBFA1C 0000058E */  lw          $5, 0x0($16)
/* 013D20 01DBFA20 0C00A610 */  beq         $5, $6, .L01DBFA54_2FB054
/* 013D24 01DBFA24 00000000 */   nop
/* 013D28 01DBFA28 EC01013C */  lui         $1, %hi(activeItem + 0x38)
/* 013D2C 01DBFA2C A878248C */  lw          $4, %lo(activeItem + 0x38)($1)
/* 013D30 01DBFA30 DC51070C */  jal         DeleteModel__14CMainItemModelFi
/* 013D34 01DBFA34 00000000 */   nop
/* 013D38 01DBFA38 FFFF0324 */  addiu       $3, $0, -0x1
/* 013D3C 01DBFA3C 000003AE */  sw          $3, 0x0($16)
/* 013D40 01DBFA40 04000010 */  b           .L01DBFA54_2FB054
/* 013D44 01DBFA44 00000000 */   nop
.L01DBFA48_2FB048:
/* 013D48 01DBFA48 00000385 */  lh          $3, 0x0($8)
/* 013D4C 01DBFA4C FFFF6324 */  addiu       $3, $3, -0x1
/* 013D50 01DBFA50 000003A5 */  sh          $3, 0x0($8)
.L01DBFA54_2FB054:
/* 013D54 01DBFA54 1000BF7B */  lq          $31, 0x10($29)
/* 013D58 01DBFA58 0000B07B */  lq          $16, 0x0($29)
/* 013D5C 01DBFA5C 2000BD27 */  addiu       $29, $29, 0x20
/* 013D60 01DBFA60 0800E003 */  jr          $31
/* 013D64 01DBFA64 00000000 */   nop
/* 013D68 01DBFA68 00000000 */  nop
/* 013D6C 01DBFA6C 00000000 */  nop
