.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel sceSifInitRpc
/* 016D48 00116C48 C0FFBD27 */  addiu       $29, $29, -0x40
/* 016D4C 00116C4C 2500043C */  lui         $4, %hi(_sceSifInitCheck)
/* 016D50 00116C50 3000BFFF */  sd          $31, 0x30($29)
/* 016D54 00116C54 2000B2FF */  sd          $18, 0x20($29)
/* 016D58 00116C58 1000B1FF */  sd          $17, 0x10($29)
/* 016D5C 00116C5C 0000B0FF */  sd          $16, 0x0($29)
.L00116C60:
/* 016D60 00116C60 39000042 */  di /* handwritten instruction */
/* 016D64 00116C64 0F040000 */  sync.p
/* 016D68 00116C68 00600240 */  mfc0        $2, $12 /* handwritten instruction */
/* 016D6C 00116C6C 0100033C */  lui         $3, (0x10000 >> 16)
/* 016D70 00116C70 24104300 */  and         $2, $2, $3
/* 016D74 00116C74 FAFF4014 */  bnez        $2, .L00116C60
/* 016D78 00116C78 00000000 */   nop
/* 016D7C 00116C7C 000A828C */  lw          $2, %lo(_sceSifInitCheck)($4)
/* 016D80 00116C80 04004010 */  beqz        $2, .L00116C94
/* 016D84 00116C84 01000224 */   addiu      $2, $0, 0x1
/* 016D88 00116C88 38000042 */  ei /* handwritten instruction */
/* 016D8C 00116C8C 58000010 */  b           .L00116DF0
/* 016D90 00116C90 3000BFDF */   ld         $31, 0x30($29)
.L00116C94:
/* 016D94 00116C94 000A82AC */  sw          $2, %lo(_sceSifInitCheck)($4)
/* 016D98 00116C98 5859040C */  jal         sceSifInitCmd
/* 016D9C 00116C9C 38000042 */   ei /* handwritten instruction */
/* 016DA0 00116CA0 2A00083C */  lui         $8, %hi(_data_table__2)
/* 016DA4 00116CA4 0100033C */  lui         $3, (0x10000 >> 16)
.L00116CA8:
/* 016DA8 00116CA8 39000042 */  di /* handwritten instruction */
/* 016DAC 00116CAC 0F040000 */  sync.p
/* 016DB0 00116CB0 00600240 */  mfc0        $2, $12 /* handwritten instruction */
/* 016DB4 00116CB4 24104300 */  and         $2, $2, $3
/* 016DB8 00116CB8 00000000 */  nop
/* 016DBC 00116CBC FAFF4014 */  bnez        $2, .L00116CA8
/* 016DC0 00116CC0 00000000 */   nop
/* 016DC4 00116CC4 2A00023C */  lui         $2, %hi(_packet_buffer)
/* 016DC8 00116CC8 2A00033C */  lui         $3, %hi(_free_buffer)
/* 016DCC 00116CCC C05A5224 */  addiu       $18, $2, %lo(_packet_buffer)
/* 016DD0 00116CD0 2A00063C */  lui         $6, %hi(_free_buffer2)
/* 016DD4 00116CD4 C0721025 */  addiu       $16, $8, %lo(_data_table__2)
/* 016DD8 00116CD8 20000724 */  addiu       $7, $0, 0x20
/* 016DDC 00116CDC 0020023C */  lui         $2, (0x20000000 >> 16)
/* 016DE0 00116CE0 C0626324 */  addiu       $3, $3, %lo(_free_buffer)
/* 016DE4 00116CE4 C06AC624 */  addiu       $6, $6, %lo(_free_buffer2)
/* 016DE8 00116CE8 25186200 */  or          $3, $3, $2
/* 016DEC 00116CEC 2530C200 */  or          $6, $6, $2
/* 016DF0 00116CF0 200007AE */  sw          $7, 0x20($16)
/* 016DF4 00116CF4 01001124 */  addiu       $17, $0, 0x1
/* 016DF8 00116CF8 25104202 */  or          $2, $18, $2
/* 016DFC 00116CFC C07211AD */  sw          $17, %lo(_data_table__2)($8)
/* 016E00 00116D00 0080043C */  lui         $4, (0x80000008 >> 16)
/* 016E04 00116D04 1C0006AE */  sw          $6, 0x1C($16)
/* 016E08 00116D08 1100053C */  lui         $5, %hi(_request_end)
/* 016E0C 00116D0C 040002AE */  sw          $2, 0x4($16)
/* 016E10 00116D10 686FA524 */  addiu       $5, $5, %lo(_request_end)
/* 016E14 00116D14 140003AE */  sw          $3, 0x14($16)
/* 016E18 00116D18 2D300002 */  daddu       $6, $16, $0
/* 016E1C 00116D1C 080007AE */  sw          $7, 0x8($16)
/* 016E20 00116D20 08008434 */  ori         $4, $4, (0x80000008 & 0xFFFF)
/* 016E24 00116D24 0C0000AE */  sw          $0, 0xC($16)
/* 016E28 00116D28 100000AE */  sw          $0, 0x10($16)
/* 016E2C 00116D2C 180007AE */  sw          $7, 0x18($16)
/* 016E30 00116D30 1A5A040C */  jal         sceSifAddCmdHandler
/* 016E34 00116D34 240000AE */   sw         $0, 0x24($16)
/* 016E38 00116D38 0080043C */  lui         $4, (0x80000009 >> 16)
/* 016E3C 00116D3C 1100053C */  lui         $5, %hi(_request_bind)
/* 016E40 00116D40 2872A524 */  addiu       $5, $5, %lo(_request_bind)
/* 016E44 00116D44 2D300002 */  daddu       $6, $16, $0
/* 016E48 00116D48 1A5A040C */  jal         sceSifAddCmdHandler
/* 016E4C 00116D4C 09008434 */   ori        $4, $4, (0x80000009 & 0xFFFF)
/* 016E50 00116D50 0080043C */  lui         $4, (0x8000000A >> 16)
/* 016E54 00116D54 1100053C */  lui         $5, %hi(_request_call)
/* 016E58 00116D58 1874A524 */  addiu       $5, $5, %lo(_request_call)
/* 016E5C 00116D5C 2D300002 */  daddu       $6, $16, $0
/* 016E60 00116D60 1A5A040C */  jal         sceSifAddCmdHandler
/* 016E64 00116D64 0A008434 */   ori        $4, $4, (0x8000000A & 0xFFFF)
/* 016E68 00116D68 0080043C */  lui         $4, (0x8000000C >> 16)
/* 016E6C 00116D6C 1100053C */  lui         $5, %hi(_request_rdata)
/* 016E70 00116D70 2070A524 */  addiu       $5, $5, %lo(_request_rdata)
/* 016E74 00116D74 2D300002 */  daddu       $6, $16, $0
/* 016E78 00116D78 1A5A040C */  jal         sceSifAddCmdHandler
/* 016E7C 00116D7C 0C008434 */   ori        $4, $4, (0x8000000C & 0xFFFF)
/* 016E80 00116D80 38000042 */  ei /* handwritten instruction */
/* 016E84 00116D84 0080043C */  lui         $4, (0x80000002 >> 16)
/* 016E88 00116D88 CC51040C */  jal         sceSifGetReg
/* 016E8C 00116D8C 02008434 */   ori        $4, $4, (0x80000002 & 0xFFFF)
/* 016E90 00116D90 17004014 */  bnez        $2, .L00116DF0
/* 016E94 00116D94 3000BFDF */   ld         $31, 0x30($29)
/* 016E98 00116D98 40004526 */  addiu       $5, $18, 0x40
/* 016E9C 00116D9C 0080043C */  lui         $4, (0x80000002 >> 16)
/* 016EA0 00116DA0 0C00B1AC */  sw          $17, 0xC($5)
/* 016EA4 00116DA4 02008434 */  ori         $4, $4, (0x80000002 & 0xFFFF)
/* 016EA8 00116DA8 10000624 */  addiu       $6, $0, 0x10
/* 016EAC 00116DAC 2D380000 */  daddu       $7, $0, $0
/* 016EB0 00116DB0 2D400000 */  daddu       $8, $0, $0
/* 016EB4 00116DB4 7E5A040C */  jal         sceSifSendCmd
/* 016EB8 00116DB8 2D480000 */   daddu      $9, $0, $0
/* 016EBC 00116DBC 00000000 */  nop
.L00116DC0:
/* 016EC0 00116DC0 4659040C */  jal         sceSifGetSreg
/* 016EC4 00116DC4 2D200000 */   daddu      $4, $0, $0
/* 016EC8 00116DC8 FDFF4010 */  beqz        $2, .L00116DC0
/* 016ECC 00116DCC 3000BFDF */   ld         $31, 0x30($29)
/* 016ED0 00116DD0 0080043C */  lui         $4, (0x80000002 >> 16)
/* 016ED4 00116DD4 2000B2DF */  ld          $18, 0x20($29)
/* 016ED8 00116DD8 01000524 */  addiu       $5, $0, 0x1
/* 016EDC 00116DDC 1000B1DF */  ld          $17, 0x10($29)
/* 016EE0 00116DE0 02008434 */  ori         $4, $4, (0x80000002 & 0xFFFF)
/* 016EE4 00116DE4 0000B0DF */  ld          $16, 0x0($29)
/* 016EE8 00116DE8 C8510408 */  j           sceSifSetReg
/* 016EEC 00116DEC 4000BD27 */   addiu      $29, $29, 0x40
.L00116DF0:
/* 016EF0 00116DF0 2000B2DF */  ld          $18, 0x20($29)
/* 016EF4 00116DF4 1000B1DF */  ld          $17, 0x10($29)
/* 016EF8 00116DF8 0000B0DF */  ld          $16, 0x0($29)
/* 016EFC 00116DFC 0800E003 */  jr          $31
/* 016F00 00116E00 4000BD27 */   addiu      $29, $29, 0x40
/* 016F04 00116E04 00000000 */  nop
