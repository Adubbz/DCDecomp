.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel sceSifInitRpc
/* 16D48 00116C48 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 16D4C 00116C4C 2500043C */  lui        $4, (0x250A00 >> 16)
/* 16D50 00116C50 3000BFFF */  sd         $31, 0x30($sp)
/* 16D54 00116C54 2000B2FF */  sd         $18, 0x20($sp)
/* 16D58 00116C58 1000B1FF */  sd         $17, 0x10($sp)
/* 16D5C 00116C5C 0000B0FF */  sd         $16, 0x0($sp)
.L00116C60:
/* 16D60 00116C60 39000042 */  di # handwritten instruction
/* 16D64 00116C64 0F040000 */  sync.p
/* 16D68 00116C68 00600240 */  mfc0       $2, $12 # handwritten instruction
/* 16D6C 00116C6C 0100033C */  lui        $3, (0x10000 >> 16)
/* 16D70 00116C70 24104300 */  and        $2, $2, $3
/* 16D74 00116C74 FAFF4014 */  bnez       $2, .L00116C60
/* 16D78 00116C78 00000000 */   nop
/* 16D7C 00116C7C 000A828C */  lw         $2, (0x250A00 & 0xFFFF)($4)
/* 16D80 00116C80 04004010 */  beqz       $2, .L00116C94
/* 16D84 00116C84 01000224 */   addiu     $2, $0, 0x1
/* 16D88 00116C88 38000042 */  ei # handwritten instruction
/* 16D8C 00116C8C 58000010 */  b          .L00116DF0
/* 16D90 00116C90 3000BFDF */   ld        $31, 0x30($sp)
.L00116C94:
/* 16D94 00116C94 000A82AC */  sw         $2, (0x250A00 & 0xFFFF)($4)
/* 16D98 00116C98 5859040C */  jal        sceSifInitCmd
/* 16D9C 00116C9C 38000042 */   ei # handwritten instruction
/* 16DA0 00116CA0 2A00083C */  lui        $8, (0x2A72C0 >> 16)
/* 16DA4 00116CA4 0100033C */  lui        $3, (0x10000 >> 16)
.L00116CA8:
/* 16DA8 00116CA8 39000042 */  di # handwritten instruction
/* 16DAC 00116CAC 0F040000 */  sync.p
/* 16DB0 00116CB0 00600240 */  mfc0       $2, $12 # handwritten instruction
/* 16DB4 00116CB4 24104300 */  and        $2, $2, $3
/* 16DB8 00116CB8 00000000 */  nop
/* 16DBC 00116CBC FAFF4014 */  bnez       $2, .L00116CA8
/* 16DC0 00116CC0 00000000 */   nop
/* 16DC4 00116CC4 2A00023C */  lui        $2, %hi(D_002A5AC0)
/* 16DC8 00116CC8 2A00033C */  lui        $3, %hi(D_002A62C0)
/* 16DCC 00116CCC C05A5224 */  addiu      $18, $2, %lo(D_002A5AC0)
/* 16DD0 00116CD0 2A00063C */  lui        $6, %hi(D_002A6AC0)
/* 16DD4 00116CD4 C0721025 */  addiu      $16, $8, %lo(D_002A72C0)
/* 16DD8 00116CD8 20000724 */  addiu      $7, $0, 0x20
/* 16DDC 00116CDC 0020023C */  lui        $2, (0x20000000 >> 16)
/* 16DE0 00116CE0 C0626324 */  addiu      $3, $3, %lo(D_002A62C0)
/* 16DE4 00116CE4 C06AC624 */  addiu      $6, $6, %lo(D_002A6AC0)
/* 16DE8 00116CE8 25186200 */  or         $3, $3, $2
/* 16DEC 00116CEC 2530C200 */  or         $6, $6, $2
/* 16DF0 00116CF0 200007AE */  sw         $7, 0x20($16)
/* 16DF4 00116CF4 01001124 */  addiu      $17, $0, 0x1
/* 16DF8 00116CF8 25104202 */  or         $2, $18, $2
/* 16DFC 00116CFC C07211AD */  sw         $17, (0x2A72C0 & 0xFFFF)($8)
/* 16E00 00116D00 0080043C */  lui        $4, (0x80000008 >> 16)
/* 16E04 00116D04 1C0006AE */  sw         $6, 0x1C($16)
/* 16E08 00116D08 1100053C */  lui        $5, %hi(_request_end)
/* 16E0C 00116D0C 040002AE */  sw         $2, 0x4($16)
/* 16E10 00116D10 686FA524 */  addiu      $5, $5, %lo(_request_end)
/* 16E14 00116D14 140003AE */  sw         $3, 0x14($16)
/* 16E18 00116D18 2D300002 */  daddu      $6, $16, $0
/* 16E1C 00116D1C 080007AE */  sw         $7, 0x8($16)
/* 16E20 00116D20 08008434 */  ori        $4, $4, (0x80000008 & 0xFFFF)
/* 16E24 00116D24 0C0000AE */  sw         $0, 0xC($16)
/* 16E28 00116D28 100000AE */  sw         $0, 0x10($16)
/* 16E2C 00116D2C 180007AE */  sw         $7, 0x18($16)
/* 16E30 00116D30 1A5A040C */  jal        sceSifAddCmdHandler
/* 16E34 00116D34 240000AE */   sw        $0, 0x24($16)
/* 16E38 00116D38 0080043C */  lui        $4, (0x80000009 >> 16)
/* 16E3C 00116D3C 1100053C */  lui        $5, %hi(_request_bind)
/* 16E40 00116D40 2872A524 */  addiu      $5, $5, %lo(_request_bind)
/* 16E44 00116D44 2D300002 */  daddu      $6, $16, $0
/* 16E48 00116D48 1A5A040C */  jal        sceSifAddCmdHandler
/* 16E4C 00116D4C 09008434 */   ori       $4, $4, (0x80000009 & 0xFFFF)
/* 16E50 00116D50 0080043C */  lui        $4, (0x8000000A >> 16)
/* 16E54 00116D54 1100053C */  lui        $5, %hi(_request_call)
/* 16E58 00116D58 1874A524 */  addiu      $5, $5, %lo(_request_call)
/* 16E5C 00116D5C 2D300002 */  daddu      $6, $16, $0
/* 16E60 00116D60 1A5A040C */  jal        sceSifAddCmdHandler
/* 16E64 00116D64 0A008434 */   ori       $4, $4, (0x8000000A & 0xFFFF)
/* 16E68 00116D68 0080043C */  lui        $4, (0x8000000C >> 16)
/* 16E6C 00116D6C 1100053C */  lui        $5, %hi(_request_rdata)
/* 16E70 00116D70 2070A524 */  addiu      $5, $5, %lo(_request_rdata)
/* 16E74 00116D74 2D300002 */  daddu      $6, $16, $0
/* 16E78 00116D78 1A5A040C */  jal        sceSifAddCmdHandler
/* 16E7C 00116D7C 0C008434 */   ori       $4, $4, (0x8000000C & 0xFFFF)
/* 16E80 00116D80 38000042 */  ei # handwritten instruction
/* 16E84 00116D84 0080043C */  lui        $4, (0x80000002 >> 16)
/* 16E88 00116D88 CC51040C */  jal        sceSifGetReg
/* 16E8C 00116D8C 02008434 */   ori       $4, $4, (0x80000002 & 0xFFFF)
/* 16E90 00116D90 17004014 */  bnez       $2, .L00116DF0
/* 16E94 00116D94 3000BFDF */   ld        $31, 0x30($sp)
/* 16E98 00116D98 40004526 */  addiu      $5, $18, 0x40
/* 16E9C 00116D9C 0080043C */  lui        $4, (0x80000002 >> 16)
/* 16EA0 00116DA0 0C00B1AC */  sw         $17, 0xC($5)
/* 16EA4 00116DA4 02008434 */  ori        $4, $4, (0x80000002 & 0xFFFF)
/* 16EA8 00116DA8 10000624 */  addiu      $6, $0, 0x10
/* 16EAC 00116DAC 2D380000 */  daddu      $7, $0, $0
/* 16EB0 00116DB0 2D400000 */  daddu      $8, $0, $0
/* 16EB4 00116DB4 7E5A040C */  jal        sceSifSendCmd
/* 16EB8 00116DB8 2D480000 */   daddu     $9, $0, $0
/* 16EBC 00116DBC 00000000 */  nop
.L00116DC0:
/* 16EC0 00116DC0 4659040C */  jal        sceSifGetSreg
/* 16EC4 00116DC4 2D200000 */   daddu     $4, $0, $0
/* 16EC8 00116DC8 FDFF4010 */  beqz       $2, .L00116DC0
/* 16ECC 00116DCC 3000BFDF */   ld        $31, 0x30($sp)
/* 16ED0 00116DD0 0080043C */  lui        $4, (0x80000002 >> 16)
/* 16ED4 00116DD4 2000B2DF */  ld         $18, 0x20($sp)
/* 16ED8 00116DD8 01000524 */  addiu      $5, $0, 0x1
/* 16EDC 00116DDC 1000B1DF */  ld         $17, 0x10($sp)
/* 16EE0 00116DE0 02008434 */  ori        $4, $4, (0x80000002 & 0xFFFF)
/* 16EE4 00116DE4 0000B0DF */  ld         $16, 0x0($sp)
/* 16EE8 00116DE8 C8510408 */  j          sceSifSetReg
/* 16EEC 00116DEC 4000BD27 */   addiu     $sp, $sp, 0x40
.L00116DF0:
/* 16EF0 00116DF0 2000B2DF */  ld         $18, 0x20($sp)
/* 16EF4 00116DF4 1000B1DF */  ld         $17, 0x10($sp)
/* 16EF8 00116DF8 0000B0DF */  ld         $16, 0x0($sp)
/* 16EFC 00116DFC 0800E003 */  jr         $31
/* 16F00 00116E00 4000BD27 */   addiu     $sp, $sp, 0x40
/* 16F04 00116E04 00000000 */  nop
