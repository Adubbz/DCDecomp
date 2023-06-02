.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceFsInit
/* 17D30 00117C30 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 17D34 00117C34 2000B1FF */  sd         $17, 0x20($sp)
/* 17D38 00117C38 1000B0FF */  sd         $16, 0x10($sp)
/* 17D3C 00117C3C 3000BFFF */  sd         $31, 0x30($sp)
/* 17D40 00117C40 125B040C */  jal        sceSifInitRpc
/* 17D44 00117C44 2D200000 */   daddu     $4, $0, $0
/* 17D48 00117C48 0A000010 */  b          .L00117C74
/* 17D4C 00117C4C 2B00113C */   lui       $17, %hi(D_002A8110)
.L00117C50:
/* 17D50 00117C50 1000023C */  lui        $2, %hi(D_FFFFF)
/* 17D54 00117C54 FFFF0324 */  addiu      $3, $0, -0x1
.L00117C58:
/* 17D58 00117C58 FFFF4224 */  addiu      $2, $2, %lo(D_FFFFF)
/* 17D5C 00117C5C 00000000 */  nop
/* 17D60 00117C60 00000000 */  nop
/* 17D64 00117C64 00000000 */  nop
/* 17D68 00117C68 00000000 */  nop
/* 17D6C 00117C6C FAFF4314 */  bne        $2, $3, .L00117C58
/* 17D70 00117C70 00000000 */   nop
.L00117C74:
/* 17D74 00117C74 10813026 */  addiu      $16, $17, %lo(D_002A8110)
/* 17D78 00117C78 0080053C */  lui        $5, (0x80000001 >> 16)
/* 17D7C 00117C7C 2D200002 */  daddu      $4, $16, $0
/* 17D80 00117C80 0100A534 */  ori        $5, $5, (0x80000001 & 0xFFFF)
/* 17D84 00117C84 B65C040C */  jal        sceSifBindRpc
/* 17D88 00117C88 2D300000 */   daddu     $6, $0, $0
/* 17D8C 00117C8C 35004004 */  bltz       $2, .L00117D64
/* 17D90 00117C90 FFFF0224 */   addiu     $2, $0, -0x1
/* 17D94 00117C94 2400028E */  lw         $2, 0x24($16)
/* 17D98 00117C98 EDFF4010 */  beqz       $2, .L00117C50
/* 17D9C 00117C9C 2B00023C */   lui       $2, %hi(D_002A8010)
/* 17DA0 00117CA0 10804324 */  addiu      $3, $2, %lo(D_002A8010)
/* 17DA4 00117CA4 00016424 */  addiu      $4, $3, 0x100
/* 17DA8 00117CA8 2B106400 */  sltu       $2, $3, $4
/* 17DAC 00117CAC 0D004010 */  beqz       $2, .L00117CE4
/* 17DB0 00117CB0 2D288000 */   daddu     $5, $4, $0
/* 17DB4 00117CB4 2A00103C */  lui        $16, %hi(D_002A7F40)
/* 17DB8 00117CB8 2A00043C */  lui        $4, %hi(D_002A7F80)
/* 17DBC 00117CBC 00000000 */  nop
.L00117CC0:
/* 17DC0 00117CC0 040060AC */  sw         $0, 0x4($3)
/* 17DC4 00117CC4 10006324 */  addiu      $3, $3, 0x10
/* 17DC8 00117CC8 2B106500 */  sltu       $2, $3, $5
/* 17DCC 00117CCC 00000000 */  nop
/* 17DD0 00117CD0 00000000 */  nop
/* 17DD4 00117CD4 FAFF4014 */  bnez       $2, .L00117CC0
/* 17DD8 00117CD8 00000000 */   nop
/* 17DDC 00117CDC 04000010 */  b          .L00117CF0
/* 17DE0 00117CE0 807F8424 */   addiu     $4, $4, %lo(D_002A7F80)
.L00117CE4:
/* 17DE4 00117CE4 2A00043C */  lui        $4, %hi(D_002A7F80)
/* 17DE8 00117CE8 2A00103C */  lui        $16, %hi(D_002A7F40)
/* 17DEC 00117CEC 807F8424 */  addiu      $4, $4, %lo(D_002A7F80)
.L00117CF0:
/* 17DF0 00117CF0 E65A040C */  jal        sceSifWriteBackDCache
/* 17DF4 00117CF4 40000524 */   addiu     $5, $0, 0x40
/* 17DF8 00117CF8 407F1026 */  addiu      $16, $16, %lo(D_002A7F40)
/* 17DFC 00117CFC 10812426 */  addiu      $4, $17, -0x7EF0
/* 17E00 00117D00 0000A0AF */  sw         $0, 0x0($sp)
/* 17E04 00117D04 FF000524 */  addiu      $5, $0, 0xFF
/* 17E08 00117D08 2D300000 */  daddu      $6, $0, $0
/* 17E0C 00117D0C 2D380000 */  daddu      $7, $0, $0
/* 17E10 00117D10 2D400000 */  daddu      $8, $0, $0
/* 17E14 00117D14 2D480002 */  daddu      $9, $16, $0
/* 17E18 00117D18 04000A24 */  addiu      $10, $0, 0x4
/* 17E1C 00117D1C 2A5D040C */  jal        sceSifCallRpc
/* 17E20 00117D20 2D580000 */   daddu     $11, $0, $0
/* 17E24 00117D24 04004304 */  bgezl      $2, .L00117D38
/* 17E28 00117D28 0020023C */   lui       $2, (0x20000000 >> 16)
/* 17E2C 00117D2C FEFF023C */  lui        $2, (0xFFFEFFFF >> 16)
/* 17E30 00117D30 0C000010 */  b          .L00117D64
/* 17E34 00117D34 FFFF4234 */   ori       $2, $2, (0xFFFEFFFF & 0xFFFF)
.L00117D38:
/* 17E38 00117D38 2B00053C */  lui        $5, %hi(D_002A8138)
/* 17E3C 00117D3C 25100202 */  or         $2, $16, $2
/* 17E40 00117D40 2500043C */  lui        $4, (0x250A08 >> 16)
/* 17E44 00117D44 3881A924 */  addiu      $9, $5, %lo(D_002A8138)
/* 17E48 00117D48 03004688 */  lwl        $6, (0x20000003 & 0xFFFF)($2)
/* 17E4C 00117D4C 00004698 */  lwr        $6, (0x20000000 & 0xFFFF)($2)
/* 17E50 00117D50 030026A9 */  swl        $6, 0x3($9)
/* 17E54 00117D54 000026B9 */  swr        $6, 0x0($9)
/* 17E58 00117D58 01000324 */  addiu      $3, $0, 0x1
/* 17E5C 00117D5C 080A83AC */  sw         $3, (0x250A08 & 0xFFFF)($4)
/* 17E60 00117D60 2D100000 */  daddu      $2, $0, $0
.L00117D64:
/* 17E64 00117D64 3000BFDF */  ld         $31, 0x30($sp)
/* 17E68 00117D68 2000B1DF */  ld         $17, 0x20($sp)
/* 17E6C 00117D6C 1000B0DF */  ld         $16, 0x10($sp)
/* 17E70 00117D70 0800E003 */  jr         $31
/* 17E74 00117D74 4000BD27 */   addiu     $sp, $sp, 0x40