.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel execute_cfa_insn
/* 11B80 00111A80 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 11B84 00111A84 3000B2FF */  sd         $18, 0x30($sp)
/* 11B88 00111A88 2000B1FF */  sd         $17, 0x20($sp)
/* 11B8C 00111A8C 2D90C000 */  daddu      $18, $6, $0
/* 11B90 00111A90 1000B0FF */  sd         $16, 0x10($sp)
/* 11B94 00111A94 2D88A000 */  daddu      $17, $5, $0
/* 11B98 00111A98 4000BFFF */  sd         $31, 0x40($sp)
/* 11B9C 00111A9C 2D808000 */  daddu      $16, $4, $0
/* 11BA0 00111AA0 00000392 */  lbu        $3, 0x0($16)
/* 11BA4 00111AA4 40006230 */  andi       $2, $3, 0x40
/* 11BA8 00111AA8 06004010 */  beqz       $2, .L00111AC4
/* 11BAC 00111AAC 01001026 */   addiu     $16, $16, 0x1
/* 11BB0 00111AB0 0800448E */  lw         $4, 0x8($18)
/* 11BB4 00111AB4 3F006230 */  andi       $2, $3, 0x3F
/* 11BB8 00111AB8 0000E38C */  lw         $3, 0x0($7)
/* 11BBC 00111ABC 27000010 */  b          .L00111B5C
/* 11BC0 00111AC0 18104400 */   mult      $2, $2, $4
.L00111AC4:
/* 11BC4 00111AC4 80006230 */  andi       $2, $3, 0x80
/* 11BC8 00111AC8 04004010 */  beqz       $2, .L00111ADC
/* 11BCC 00111ACC 3F006230 */   andi      $2, $3, 0x3F
/* 11BD0 00111AD0 2D200002 */  daddu      $4, $16, $0
/* 11BD4 00111AD4 2F000010 */  b          .L00111B94
/* 11BD8 00111AD8 0400A2AF */   sw        $2, 0x4($sp)
.L00111ADC:
/* 11BDC 00111ADC C0006230 */  andi       $2, $3, 0xC0
/* 11BE0 00111AE0 05004010 */  beqz       $2, .L00111AF8
/* 11BE4 00111AE4 3F006230 */   andi      $2, $3, 0x3F
/* 11BE8 00111AE8 21182202 */  addu       $3, $17, $2
/* 11BEC 00111AEC 0400A2AF */  sw         $2, 0x4($sp)
/* 11BF0 00111AF0 C2000010 */  b          .L00111DFC
/* 11BF4 00111AF4 9C0260A0 */   sb        $0, 0x29C($3)
.L00111AF8:
/* 11BF8 00111AF8 2F00622C */  sltiu      $2, $3, 0x2F
/* 11BFC 00111AFC BD004010 */  beqz       $2, .L00111DF4
/* 11C00 00111B00 2900023C */   lui       $2, %hi(jtbl_00297880)
/* 11C04 00111B04 80180300 */  sll        $3, $3, 2
/* 11C08 00111B08 80784224 */  addiu      $2, $2, %lo(jtbl_00297880)
/* 11C0C 00111B0C 21186200 */  addu       $3, $3, $2
/* 11C10 00111B10 0000648C */  lw         $4, 0x0($3)
/* 11C14 00111B14 08008000 */  jr         $4
/* 11C18 00111B18 00000000 */   nop
glabel .L00111B1C
/* 11C1C 00111B1C 0300028A */  lwl        $2, 0x3($16)
/* 11C20 00111B20 0000029A */  lwr        $2, 0x0($16)
/* 11C24 00111B24 04001026 */  addiu      $16, $16, 0x4
/* 11C28 00111B28 B4000010 */  b          .L00111DFC
/* 11C2C 00111B2C 0000E2AC */   sw        $2, 0x0($7)
glabel .L00111B30
/* 11C30 00111B30 00000392 */  lbu        $3, 0x0($16)
/* 11C34 00111B34 0000E28C */  lw         $2, 0x0($7)
/* 11C38 00111B38 0F000010 */  b          .L00111B78
/* 11C3C 00111B3C 01001026 */   addiu     $16, $16, 0x1
glabel .L00111B40
/* 11C40 00111B40 01000292 */  lbu        $2, 0x1($16)
/* 11C44 00111B44 00000492 */  lbu        $4, 0x0($16)
/* 11C48 00111B48 38120200 */  dsll       $2, $2, 8
/* 11C4C 00111B4C 0000E38C */  lw         $3, 0x0($7)
/* 11C50 00111B50 25104400 */  or         $2, $2, $4
/* 11C54 00111B54 02001026 */  addiu      $16, $16, 0x2
/* 11C58 00111B58 FFFF4230 */  andi       $2, $2, 0xFFFF
.L00111B5C:
/* 11C5C 00111B5C 21186200 */  addu       $3, $3, $2
/* 11C60 00111B60 A6000010 */  b          .L00111DFC
/* 11C64 00111B64 0000E3AC */   sw        $3, 0x0($7)
glabel .L00111B68
/* 11C68 00111B68 0300038A */  lwl        $3, 0x3($16)
/* 11C6C 00111B6C 0000039A */  lwr        $3, 0x0($16)
/* 11C70 00111B70 0000E28C */  lw         $2, 0x0($7)
/* 11C74 00111B74 04001026 */  addiu      $16, $16, 0x4
.L00111B78:
/* 11C78 00111B78 21104300 */  addu       $2, $2, $3
/* 11C7C 00111B7C 9F000010 */  b          .L00111DFC
/* 11C80 00111B80 0000E2AC */   sw        $2, 0x0($7)
glabel .L00111B84
/* 11C84 00111B84 2D200002 */  daddu      $4, $16, $0
/* 11C88 00111B88 A044040C */  jal        decode_uleb128
/* 11C8C 00111B8C 0400A537 */   ori       $5, $sp, 0x4
/* 11C90 00111B90 2D204000 */  daddu      $4, $2, $0
.L00111B94:
/* 11C94 00111B94 A044040C */  jal        decode_uleb128
/* 11C98 00111B98 2D28A003 */   daddu     $5, $sp, $0
/* 11C9C 00111B9C 0000A48F */  lw         $4, 0x0($sp)
/* 11CA0 00111BA0 2D804000 */  daddu      $16, $2, $0
/* 11CA4 00111BA4 0C00458E */  lw         $5, 0xC($18)
/* 11CA8 00111BA8 01000624 */  addiu      $6, $0, 0x1
/* 11CAC 00111BAC 0400A28F */  lw         $2, 0x4($sp)
/* 11CB0 00111BB0 18208500 */  mult       $4, $4, $5
/* 11CB4 00111BB4 C0180200 */  sll        $3, $2, 3
/* 11CB8 00111BB8 21102202 */  addu       $2, $17, $2
/* 11CBC 00111BBC 21182302 */  addu       $3, $17, $3
/* 11CC0 00111BC0 9C0246A0 */  sb         $6, 0x29C($2)
/* 11CC4 00111BC4 0000A4AF */  sw         $4, 0x0($sp)
/* 11CC8 00111BC8 2D108000 */  daddu      $2, $4, $0
/* 11CCC 00111BCC 8B000010 */  b          .L00111DFC
/* 11CD0 00111BD0 180062FC */   sd        $2, 0x18($3)
glabel .L00111BD4
/* 11CD4 00111BD4 2D200002 */  daddu      $4, $16, $0
/* 11CD8 00111BD8 A044040C */  jal        decode_uleb128
/* 11CDC 00111BDC 0400A537 */   ori       $5, $sp, 0x4
/* 11CE0 00111BE0 0400A38F */  lw         $3, 0x4($sp)
/* 11CE4 00111BE4 2D804000 */  daddu      $16, $2, $0
/* 11CE8 00111BE8 21182302 */  addu       $3, $17, $3
/* 11CEC 00111BEC 83000010 */  b          .L00111DFC
/* 11CF0 00111BF0 9C0260A0 */   sb        $0, 0x29C($3)
glabel .L00111BF4
/* 11CF4 00111BF4 2D200002 */  daddu      $4, $16, $0
/* 11CF8 00111BF8 A044040C */  jal        decode_uleb128
/* 11CFC 00111BFC 0400A537 */   ori       $5, $sp, 0x4
/* 11D00 00111C00 2D204000 */  daddu      $4, $2, $0
/* 11D04 00111C04 A044040C */  jal        decode_uleb128
/* 11D08 00111C08 0800A537 */   ori       $5, $sp, 0x8
/* 11D0C 00111C0C 0400A48F */  lw         $4, 0x4($sp)
/* 11D10 00111C10 2D804000 */  daddu      $16, $2, $0
/* 11D14 00111C14 0800A38F */  lw         $3, 0x8($sp)
/* 11D18 00111C18 02000524 */  addiu      $5, $0, 0x2
/* 11D1C 00111C1C C0100400 */  sll        $2, $4, 3
/* 11D20 00111C20 21202402 */  addu       $4, $17, $4
/* 11D24 00111C24 3C180300 */  dsll32     $3, $3, 0
/* 11D28 00111C28 9C0285A0 */  sb         $5, 0x29C($4)
/* 11D2C 00111C2C 21102202 */  addu       $2, $17, $2
/* 11D30 00111C30 3E180300 */  dsrl32     $3, $3, 0
/* 11D34 00111C34 71000010 */  b          .L00111DFC
/* 11D38 00111C38 180043FC */   sd        $3, 0x18($2)
glabel .L00111C3C
/* 11D3C 00111C3C 2D200002 */  daddu      $4, $16, $0
/* 11D40 00111C40 A044040C */  jal        decode_uleb128
/* 11D44 00111C44 0400A537 */   ori       $5, $sp, 0x4
/* 11D48 00111C48 2D204000 */  daddu      $4, $2, $0
/* 11D4C 00111C4C A044040C */  jal        decode_uleb128
/* 11D50 00111C50 2D28A003 */   daddu     $5, $sp, $0
/* 11D54 00111C54 2D804000 */  daddu      $16, $2, $0
/* 11D58 00111C58 0400A397 */  lhu        $3, 0x4($sp)
/* 11D5C 00111C5C 0000A28F */  lw         $2, 0x0($sp)
/* 11D60 00111C60 980223A6 */  sh         $3, 0x298($17)
/* 11D64 00111C64 65000010 */  b          .L00111DFC
/* 11D68 00111C68 080022FE */   sd        $2, 0x8($17)
glabel .L00111C6C
/* 11D6C 00111C6C 2D200002 */  daddu      $4, $16, $0
/* 11D70 00111C70 A044040C */  jal        decode_uleb128
/* 11D74 00111C74 0400A537 */   ori       $5, $sp, 0x4
/* 11D78 00111C78 0400A397 */  lhu        $3, 0x4($sp)
/* 11D7C 00111C7C 2D804000 */  daddu      $16, $2, $0
/* 11D80 00111C80 5E000010 */  b          .L00111DFC
/* 11D84 00111C84 980223A6 */   sh        $3, 0x298($17)
glabel .L00111C88
/* 11D88 00111C88 2D200002 */  daddu      $4, $16, $0
/* 11D8C 00111C8C A044040C */  jal        decode_uleb128
/* 11D90 00111C90 2D28A003 */   daddu     $5, $sp, $0
/* 11D94 00111C94 0000A38F */  lw         $3, 0x0($sp)
/* 11D98 00111C98 2D804000 */  daddu      $16, $2, $0
/* 11D9C 00111C9C 57000010 */  b          .L00111DFC
/* 11DA0 00111CA0 080023FE */   sd        $3, 0x8($17)
glabel .L00111CA4
/* 11DA4 00111CA4 FC09040C */  jal        malloc
/* 11DA8 00111CA8 F8020424 */   addiu     $4, $0, 0x2F8
/* 11DAC 00111CAC E0022526 */  addiu      $5, $17, 0x2E0
/* 11DB0 00111CB0 2D204000 */  daddu      $4, $2, $0
/* 11DB4 00111CB4 2D182002 */  daddu      $3, $17, $0
.L00111CB8:
/* 11DB8 00111CB8 000066DC */  ld         $6, 0x0($3)
/* 11DBC 00111CBC 080067DC */  ld         $7, 0x8($3)
/* 11DC0 00111CC0 100068DC */  ld         $8, 0x10($3)
/* 11DC4 00111CC4 180069DC */  ld         $9, 0x18($3)
/* 11DC8 00111CC8 000086FC */  sd         $6, 0x0($4)
/* 11DCC 00111CCC 080087FC */  sd         $7, 0x8($4)
/* 11DD0 00111CD0 100088FC */  sd         $8, 0x10($4)
/* 11DD4 00111CD4 180089FC */  sd         $9, 0x18($4)
/* 11DD8 00111CD8 20006324 */  addiu      $3, $3, 0x20
/* 11DDC 00111CDC 20008424 */  addiu      $4, $4, 0x20
/* 11DE0 00111CE0 00000000 */  nop
/* 11DE4 00111CE4 F4FF6514 */  bne        $3, $5, .L00111CB8
/* 11DE8 00111CE8 00000000 */   nop
/* 11DEC 00111CEC 000065DC */  ld         $5, 0x0($3)
/* 11DF0 00111CF0 080066DC */  ld         $6, 0x8($3)
/* 11DF4 00111CF4 100067DC */  ld         $7, 0x10($3)
/* 11DF8 00111CF8 000085FC */  sd         $5, 0x0($4)
/* 11DFC 00111CFC 080086FC */  sd         $6, 0x8($4)
/* 11E00 00111D00 100087FC */  sd         $7, 0x10($4)
/* 11E04 00111D04 3D000010 */  b          .L00111DFC
/* 11E08 00111D08 F00222AE */   sw        $2, 0x2F0($17)
glabel .L00111D0C
/* 11E0C 00111D0C F002248E */  lw         $4, 0x2F0($17)
/* 11E10 00111D10 2D282002 */  daddu      $5, $17, $0
/* 11E14 00111D14 E0028224 */  addiu      $2, $4, 0x2E0
/* 11E18 00111D18 2D308000 */  daddu      $6, $4, $0
.L00111D1C:
/* 11E1C 00111D1C 0000C9DC */  ld         $9, 0x0($6)
/* 11E20 00111D20 0800C3DC */  ld         $3, 0x8($6)
/* 11E24 00111D24 1000C7DC */  ld         $7, 0x10($6)
/* 11E28 00111D28 1800C8DC */  ld         $8, 0x18($6)
/* 11E2C 00111D2C 0000A9FC */  sd         $9, 0x0($5)
/* 11E30 00111D30 0800A3FC */  sd         $3, 0x8($5)
/* 11E34 00111D34 1000A7FC */  sd         $7, 0x10($5)
/* 11E38 00111D38 1800A8FC */  sd         $8, 0x18($5)
/* 11E3C 00111D3C 2000C624 */  addiu      $6, $6, 0x20
/* 11E40 00111D40 2000A524 */  addiu      $5, $5, 0x20
/* 11E44 00111D44 00000000 */  nop
/* 11E48 00111D48 F4FFC214 */  bne        $6, $2, .L00111D1C
/* 11E4C 00111D4C 00000000 */   nop
/* 11E50 00111D50 0000C9DC */  ld         $9, 0x0($6)
/* 11E54 00111D54 0800C2DC */  ld         $2, 0x8($6)
/* 11E58 00111D58 1000C3DC */  ld         $3, 0x10($6)
/* 11E5C 00111D5C 0000A9FC */  sd         $9, 0x0($5)
/* 11E60 00111D60 0800A2FC */  sd         $2, 0x8($5)
/* 11E64 00111D64 060A040C */  jal        free
/* 11E68 00111D68 1000A3FC */   sd        $3, 0x10($5)
/* 11E6C 00111D6C 24000010 */  b          .L00111E00
/* 11E70 00111D70 2D100002 */   daddu     $2, $16, $0
glabel .L00111D74
/* 11E74 00111D74 10000224 */  addiu      $2, $0, 0x10
/* 11E78 00111D78 10000424 */  addiu      $4, $0, 0x10
/* 11E7C 00111D7C 0400A2AF */  sw         $2, 0x4($sp)
/* 11E80 00111D80 10000724 */  addiu      $7, $0, 0x10
/* 11E84 00111D84 9C022926 */  addiu      $9, $17, 0x29C
/* 11E88 00111D88 18002826 */  addiu      $8, $17, 0x18
/* 11E8C 00111D8C 00000000 */  nop
.L00111D90:
/* 11E90 00111D90 F0FF8224 */  addiu      $2, $4, -0x10
/* 11E94 00111D94 01008624 */  addiu      $6, $4, 0x1
/* 11E98 00111D98 21282701 */  addu       $5, $9, $7
/* 11E9C 00111D9C 80100200 */  sll        $2, $2, 2
/* 11EA0 00111DA0 01000324 */  addiu      $3, $0, 0x1
/* 11EA4 00111DA4 C0200400 */  sll        $4, $4, 3
/* 11EA8 00111DA8 0000A3A0 */  sb         $3, 0x0($5)
/* 11EAC 00111DAC 3C100200 */  dsll32     $2, $2, 0
/* 11EB0 00111DB0 21200401 */  addu       $4, $8, $4
/* 11EB4 00111DB4 3E100200 */  dsrl32     $2, $2, 0
/* 11EB8 00111DB8 0400A6AF */  sw         $6, 0x4($sp)
/* 11EBC 00111DBC 2D38C000 */  daddu      $7, $6, $0
/* 11EC0 00111DC0 000082FC */  sd         $2, 0x0($4)
/* 11EC4 00111DC4 2000E22C */  sltiu      $2, $7, 0x20
/* 11EC8 00111DC8 F1FF4014 */  bnez       $2, .L00111D90
/* 11ECC 00111DCC 2D20E000 */   daddu     $4, $7, $0
/* 11ED0 00111DD0 0B000010 */  b          .L00111E00
/* 11ED4 00111DD4 2D100002 */   daddu     $2, $16, $0
glabel .L00111DD8
/* 11ED8 00111DD8 2D200002 */  daddu      $4, $16, $0
/* 11EDC 00111DDC A044040C */  jal        decode_uleb128
/* 11EE0 00111DE0 2D28A003 */   daddu     $5, $sp, $0
/* 11EE4 00111DE4 0000A38F */  lw         $3, 0x0($sp)
/* 11EE8 00111DE8 2D804000 */  daddu      $16, $2, $0
/* 11EEC 00111DEC 03000010 */  b          .L00111DFC
/* 11EF0 00111DF0 100023FE */   sd        $3, 0x10($17)
glabel .L00111DF4
/* 11EF4 00111DF4 6A00040C */  jal        abort
/* 11EF8 00111DF8 00000000 */   nop
glabel .L00111DFC
/* 11EFC 00111DFC 2D100002 */  daddu      $2, $16, $0
.L00111E00:
/* 11F00 00111E00 4000BFDF */  ld         $31, 0x40($sp)
/* 11F04 00111E04 3000B2DF */  ld         $18, 0x30($sp)
/* 11F08 00111E08 2000B1DF */  ld         $17, 0x20($sp)
/* 11F0C 00111E0C 1000B0DF */  ld         $16, 0x10($sp)
/* 11F10 00111E10 0800E003 */  jr         $31
/* 11F14 00111E14 5000BD27 */   addiu     $sp, $sp, 0x50
