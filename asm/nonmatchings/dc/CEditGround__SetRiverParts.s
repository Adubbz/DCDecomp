.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRiverParts__11CEditGroundFfffii
/* A0D10 001A0C10 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* A0D14 001A0C14 6000BF7F */  sq         $31, 0x60($sp)
/* A0D18 001A0C18 5000B47F */  sq         $20, 0x50($sp)
/* A0D1C 001A0C1C 4000B37F */  sq         $19, 0x40($sp)
/* A0D20 001A0C20 3000B27F */  sq         $18, 0x30($sp)
/* A0D24 001A0C24 2000B17F */  sq         $17, 0x20($sp)
/* A0D28 001A0C28 1000B07F */  sq         $16, 0x10($sp)
/* A0D2C 001A0C2C 0800B6E7 */  swc1       $f22, 0x8($sp)
/* A0D30 001A0C30 0400B5E7 */  swc1       $f21, 0x4($sp)
/* A0D34 001A0C34 0000B4E7 */  swc1       $f20, 0x0($sp)
/* A0D38 001A0C38 28868070 */  paddub     $16, $4, $0
/* A0D3C 001A0C3C 86650046 */  mov.s      $f22, $f12
/* A0D40 001A0C40 466D0046 */  mov.s      $f21, $f13
/* A0D44 001A0C44 06750046 */  mov.s      $f20, $f14
/* A0D48 001A0C48 289EA070 */  paddub     $19, $5, $0
/* A0D4C 001A0C4C 2896C070 */  paddub     $18, $6, $0
/* A0D50 001A0C50 AC85060C */  jal        GetAreaCode__11CEditGroundFfff
/* A0D54 001A0C54 00000000 */   nop
/* A0D58 001A0C58 04004104 */  bgez       $2, .L001A0C6C
/* A0D5C 001A0C5C 00000000 */   nop
/* A0D60 001A0C60 28160070 */  paddub     $2, $0, $0
/* A0D64 001A0C64 D0000010 */  b          .L001A0FA8
/* A0D68 001A0C68 00000000 */   nop
.L001A0C6C:
/* A0D6C 001A0C6C 80100200 */  sll        $2, $2, 2
/* A0D70 001A0C70 21105000 */  addu       $2, $2, $16
/* A0D74 001A0C74 0400518C */  lw         $17, 0x4($2)
/* A0D78 001A0C78 28262072 */  paddub     $4, $17, $0
/* A0D7C 001A0C7C 7000A527 */  addiu      $5, $sp, 0x70
/* A0D80 001A0C80 06B30046 */  mov.s      $f12, $f22
/* A0D84 001A0C84 46AB0046 */  mov.s      $f13, $f21
/* A0D88 001A0C88 86A30046 */  mov.s      $f14, $f20
/* A0D8C 001A0C8C 20B6050C */  jal        GetPos__9CEditAreaFP11CVector3_i_fff
/* A0D90 001A0C90 00000000 */   nop
/* A0D94 001A0C94 7000A28F */  lw         $2, 0x70($sp)
/* A0D98 001A0C98 21105300 */  addu       $2, $2, $19
/* A0D9C 001A0C9C 7000A2AF */  sw         $2, 0x70($sp)
/* A0DA0 001A0CA0 7800B327 */  addiu      $19, $sp, 0x78
/* A0DA4 001A0CA4 0000628E */  lw         $2, 0x0($19)
/* A0DA8 001A0CA8 21105200 */  addu       $2, $2, $18
/* A0DAC 001A0CAC 000062AE */  sw         $2, 0x0($19)
/* A0DB0 001A0CB0 28262072 */  paddub     $4, $17, $0
/* A0DB4 001A0CB4 7000A58F */  lw         $5, 0x70($sp)
/* A0DB8 001A0CB8 0000668E */  lw         $6, 0x0($19)
/* A0DBC 001A0CBC D4B6050C */  jal        GetPartsID__9CEditAreaFii
/* A0DC0 001A0CC0 00000000 */   nop
/* A0DC4 001A0CC4 04004104 */  bgez       $2, .L001A0CD8
/* A0DC8 001A0CC8 00000000 */   nop
/* A0DCC 001A0CCC 28160070 */  paddub     $2, $0, $0
/* A0DD0 001A0CD0 B5000010 */  b          .L001A0FA8
/* A0DD4 001A0CD4 00000000 */   nop
.L001A0CD8:
/* A0DD8 001A0CD8 C0180200 */  sll        $3, $2, 3
/* A0DDC 001A0CDC 23186200 */  subu       $3, $3, $2
/* A0DE0 001A0CE0 80100300 */  sll        $2, $3, 2
/* A0DE4 001A0CE4 23104300 */  subu       $2, $2, $3
/* A0DE8 001A0CE8 40110200 */  sll        $2, $2, 5
/* A0DEC 001A0CEC 21100202 */  addu       $2, $16, $2
/* A0DF0 001A0CF0 30005224 */  addiu      $18, $2, 0x30
/* A0DF4 001A0CF4 4801438C */  lw         $3, 0x148($2)
/* A0DF8 001A0CF8 02000224 */  addiu      $2, $0, 0x2
/* A0DFC 001A0CFC 07006210 */  beq        $3, $2, .L001A0D1C
/* A0E00 001A0D00 00000000 */   nop
/* A0E04 001A0D04 03000224 */  addiu      $2, $0, 0x3
/* A0E08 001A0D08 04006210 */  beq        $3, $2, .L001A0D1C
/* A0E0C 001A0D0C 00000000 */   nop
/* A0E10 001A0D10 05000224 */  addiu      $2, $0, 0x5
/* A0E14 001A0D14 06006214 */  bne        $3, $2, .L001A0D30
/* A0E18 001A0D18 00000000 */   nop
.L001A0D1C:
/* A0E1C 001A0D1C 0100013C */  lui        $at, (0x15F34 >> 16)
/* A0E20 001A0D20 21080102 */  addu       $at, $16, $at
/* A0E24 001A0D24 345F228C */  lw         $2, (0x15F34 & 0xFFFF)($at)
/* A0E28 001A0D28 04004014 */  bnez       $2, .L001A0D3C
/* A0E2C 001A0D2C 00000000 */   nop
.L001A0D30:
/* A0E30 001A0D30 28160070 */  paddub     $2, $0, $0
/* A0E34 001A0D34 9C000010 */  b          .L001A0FA8
/* A0E38 001A0D38 00000000 */   nop
.L001A0D3C:
/* A0E3C 001A0D3C 03000224 */  addiu      $2, $0, 0x3
/* A0E40 001A0D40 04006210 */  beq        $3, $2, .L001A0D54
/* A0E44 001A0D44 00000000 */   nop
/* A0E48 001A0D48 05000224 */  addiu      $2, $0, 0x5
/* A0E4C 001A0D4C 14006214 */  bne        $3, $2, .L001A0DA0
/* A0E50 001A0D50 00000000 */   nop
.L001A0D54:
/* A0E54 001A0D54 28262072 */  paddub     $4, $17, $0
/* A0E58 001A0D58 8000A527 */  addiu      $5, $sp, 0x80
/* A0E5C 001A0D5C 7000A68F */  lw         $6, 0x70($sp)
/* A0E60 001A0D60 7400A78F */  lw         $7, 0x74($sp)
/* A0E64 001A0D64 0000688E */  lw         $8, 0x0($19)
/* A0E68 001A0D68 48B6050C */  jal        GetPos__9CEditAreaFP11CVector3_f_iii
/* A0E6C 001A0D6C 00000000 */   nop
/* A0E70 001A0D70 803F023C */  lui        $2, (0x3F800000 >> 16)
/* A0E74 001A0D74 00088244 */  mtc1       $2, $f1
/* A0E78 001A0D78 8000A0C7 */  lwc1       $f0, 0x80($sp)
/* A0E7C 001A0D7C 000B0046 */  add.s      $f12, $f1, $f0
/* A0E80 001A0D80 8800A0C7 */  lwc1       $f0, 0x88($sp)
/* A0E84 001A0D84 800B0046 */  add.s      $f14, $f1, $f0
/* A0E88 001A0D88 28260072 */  paddub     $4, $16, $0
/* A0E8C 001A0D8C 9800A527 */  addiu      $5, $sp, 0x98
/* A0E90 001A0D90 9C00A627 */  addiu      $6, $sp, 0x9C
/* A0E94 001A0D94 8400ADC7 */  lwc1       $f13, 0x84($sp)
/* A0E98 001A0D98 A484060C */  jal        DeleteMapParts__11CEditGroundFPiPifff
/* A0E9C 001A0D9C 00000000 */   nop
.L001A0DA0:
/* A0EA0 001A0DA0 28262072 */  paddub     $4, $17, $0
/* A0EA4 001A0DA4 7000A58F */  lw         $5, 0x70($sp)
/* A0EA8 001A0DA8 0000668E */  lw         $6, 0x0($19)
/* A0EAC 001A0DAC 1CB9050C */  jal        SetRiverParts__9CEditAreaFii
/* A0EB0 001A0DB0 00000000 */   nop
/* A0EB4 001A0DB4 04004104 */  bgez       $2, .L001A0DC8
/* A0EB8 001A0DB8 00000000 */   nop
/* A0EBC 001A0DBC 28160070 */  paddub     $2, $0, $0
/* A0EC0 001A0DC0 79000010 */  b          .L001A0FA8
/* A0EC4 001A0DC4 00000000 */   nop
.L001A0DC8:
/* A0EC8 001A0DC8 F00F4330 */  andi       $3, $2, 0xFF0
/* A0ECC 001A0DCC 03890300 */  sra        $17, $3, 4
/* A0ED0 001A0DD0 0F005330 */  andi       $19, $2, 0xF
/* A0ED4 001A0DD4 FFFF2226 */  addiu      $2, $17, -0x1
/* A0ED8 001A0DD8 04004004 */  bltz       $2, .L001A0DEC
/* A0EDC 001A0DDC 00000000 */   nop
/* A0EE0 001A0DE0 10004228 */  slti       $2, $2, 0x10
/* A0EE4 001A0DE4 04004014 */  bnez       $2, .L001A0DF8
/* A0EE8 001A0DE8 00000000 */   nop
.L001A0DEC:
/* A0EEC 001A0DEC 28160070 */  paddub     $2, $0, $0
/* A0EF0 001A0DF0 6D000010 */  b          .L001A0FA8
/* A0EF4 001A0DF4 00000000 */   nop
.L001A0DF8:
/* A0EF8 001A0DF8 0300622A */  slti       $2, $19, 0x3
/* A0EFC 001A0DFC 02004014 */  bnez       $2, .L001A0E08
/* A0F00 001A0E00 00000000 */   nop
/* A0F04 001A0E04 FFFF1324 */  addiu      $19, $0, -0x1
.L001A0E08:
/* A0F08 001A0E08 28A60070 */  paddub     $20, $0, $0
/* A0F0C 001A0E0C 13000010 */  b          .L001A0E5C
/* A0F10 001A0E10 00000000 */   nop
.L001A0E14:
/* A0F14 001A0E14 FFFF2326 */  addiu      $3, $17, -0x1
/* A0F18 001A0E18 C0100300 */  sll        $2, $3, 3
/* A0F1C 001A0E1C 23184300 */  subu       $3, $2, $3
/* A0F20 001A0E20 80100300 */  sll        $2, $3, 2
/* A0F24 001A0E24 23104300 */  subu       $2, $2, $3
/* A0F28 001A0E28 40190200 */  sll        $3, $2, 5
/* A0F2C 001A0E2C 0100013C */  lui        $at, (0x15F34 >> 16)
/* A0F30 001A0E30 21080102 */  addu       $at, $16, $at
/* A0F34 001A0E34 345F228C */  lw         $2, (0x15F34 & 0xFFFF)($at)
/* A0F38 001A0E38 21184300 */  addu       $3, $2, $3
/* A0F3C 001A0E3C 80101400 */  sll        $2, $20, 2
/* A0F40 001A0E40 21104300 */  addu       $2, $2, $3
/* A0F44 001A0E44 B000458C */  lw         $5, 0xB0($2)
/* A0F48 001A0E48 28264072 */  paddub     $4, $18, $0
/* A0F4C 001A0E4C 28368072 */  paddub     $6, $20, $0
/* A0F50 001A0E50 305C050C */  jal        SetFrame__12CObjectFrameFP9CFrameVu1i
/* A0F54 001A0E54 00000000 */   nop
/* A0F58 001A0E58 01009426 */  addiu      $20, $20, 0x1
.L001A0E5C:
/* A0F5C 001A0E5C 0400822A */  slti       $2, $20, 0x4
/* A0F60 001A0E60 ECFF4014 */  bnez       $2, .L001A0E14
/* A0F64 001A0E64 00000000 */   nop
/* A0F68 001A0E68 FFFF2326 */  addiu      $3, $17, -0x1
/* A0F6C 001A0E6C C0100300 */  sll        $2, $3, 3
/* A0F70 001A0E70 23184300 */  subu       $3, $2, $3
/* A0F74 001A0E74 80100300 */  sll        $2, $3, 2
/* A0F78 001A0E78 23104300 */  subu       $2, $2, $3
/* A0F7C 001A0E7C 40890200 */  sll        $17, $2, 5
/* A0F80 001A0E80 0100013C */  lui        $at, (0x15F34 >> 16)
/* A0F84 001A0E84 21080102 */  addu       $at, $16, $at
/* A0F88 001A0E88 345F228C */  lw         $2, (0x15F34 & 0xFFFF)($at)
/* A0F8C 001A0E8C 21205100 */  addu       $4, $2, $17
/* A0F90 001A0E90 3C5D050C */  jal        GetCollisionFrame__10CMapObjectFv
/* A0F94 001A0E94 00000000 */   nop
/* A0F98 001A0E98 D00042AE */  sw         $2, 0xD0($18)
/* A0F9C 001A0E9C 0100013C */  lui        $at, (0x15F34 >> 16)
/* A0FA0 001A0EA0 21080102 */  addu       $at, $16, $at
/* A0FA4 001A0EA4 345F228C */  lw         $2, (0x15F34 & 0xFFFF)($at)
/* A0FA8 001A0EA8 21105100 */  addu       $2, $2, $17
/* A0FAC 001A0EAC D400428C */  lw         $2, 0xD4($2)
/* A0FB0 001A0EB0 D40042AE */  sw         $2, 0xD4($18)
/* A0FB4 001A0EB4 0100013C */  lui        $at, (0x15F34 >> 16)
/* A0FB8 001A0EB8 21080102 */  addu       $at, $16, $at
/* A0FBC 001A0EBC 345F228C */  lw         $2, (0x15F34 & 0xFFFF)($at)
/* A0FC0 001A0EC0 21105100 */  addu       $2, $2, $17
/* A0FC4 001A0EC4 D800428C */  lw         $2, 0xD8($2)
/* A0FC8 001A0EC8 D80042AE */  sw         $2, 0xD8($18)
/* A0FCC 001A0ECC 0100013C */  lui        $at, (0x15F34 >> 16)
/* A0FD0 001A0ED0 21080102 */  addu       $at, $16, $at
/* A0FD4 001A0ED4 345F228C */  lw         $2, (0x15F34 & 0xFFFF)($at)
/* A0FD8 001A0ED8 21A05100 */  addu       $20, $2, $17
/* A0FDC 001A0EDC DC00848E */  lw         $4, 0xDC($20)
/* A0FE0 001A0EE0 04008014 */  bnez       $4, .L001A0EF4
/* A0FE4 001A0EE4 00000000 */   nop
/* A0FE8 001A0EE8 28160070 */  paddub     $2, $0, $0
/* A0FEC 001A0EEC 0E000010 */  b          .L001A0F28
/* A0FF0 001A0EF0 00000000 */   nop
.L001A0EF4:
/* A0FF4 001A0EF4 10008CC6 */  lwc1       $f12, 0x10($20)
/* A0FF8 001A0EF8 14008DC6 */  lwc1       $f13, 0x14($20)
/* A0FFC 001A0EFC 18008EC6 */  lwc1       $f14, 0x18($20)
/* A1000 001A0F00 A09F040C */  jal        SetPosition__6CFrameFfff
/* A1004 001A0F04 00000000 */   nop
/* A1008 001A0F08 DC00848E */  lw         $4, 0xDC($20)
/* A100C 001A0F0C 60008CC6 */  lwc1       $f12, 0x60($20)
/* A1010 001A0F10 64008DC6 */  lwc1       $f13, 0x64($20)
/* A1014 001A0F14 68008EC6 */  lwc1       $f14, 0x68($20)
/* A1018 001A0F18 70A3040C */  jal        SetRotation__6CFrameFfff
/* A101C 001A0F1C 00000000 */   nop
/* A1020 001A0F20 DC00828E */  lw         $2, 0xDC($20)
/* A1024 001A0F24 00000000 */  nop
.L001A0F28:
/* A1028 001A0F28 DC0042AE */  sw         $2, 0xDC($18)
/* A102C 001A0F2C 0100013C */  lui        $at, (0x15F34 >> 16)
/* A1030 001A0F30 21080102 */  addu       $at, $16, $at
/* A1034 001A0F34 345F228C */  lw         $2, (0x15F34 & 0xFFFF)($at)
/* A1038 001A0F38 21105100 */  addu       $2, $2, $17
/* A103C 001A0F3C 0401428C */  lw         $2, 0x104($2)
/* A1040 001A0F40 040142AE */  sw         $2, 0x104($18)
/* A1044 001A0F44 0100013C */  lui        $at, (0x15F34 >> 16)
/* A1048 001A0F48 21080102 */  addu       $at, $16, $at
/* A104C 001A0F4C 345F228C */  lw         $2, (0x15F34 & 0xFFFF)($at)
/* A1050 001A0F50 21102202 */  addu       $2, $17, $2
/* A1054 001A0F54 E800428C */  lw         $2, 0xE8($2)
/* A1058 001A0F58 E80042AE */  sw         $2, 0xE8($18)
/* A105C 001A0F5C 0100013C */  lui        $at, (0x15F34 >> 16)
/* A1060 001A0F60 21080102 */  addu       $at, $16, $at
/* A1064 001A0F64 345F228C */  lw         $2, (0x15F34 & 0xFFFF)($at)
/* A1068 001A0F68 21102202 */  addu       $2, $17, $2
/* A106C 001A0F6C 1801428C */  lw         $2, 0x118($2)
/* A1070 001A0F70 180142AE */  sw         $2, 0x118($18)
/* A1074 001A0F74 0100013C */  lui        $at, (0x15F34 >> 16)
/* A1078 001A0F78 21080102 */  addu       $at, $16, $at
/* A107C 001A0F7C 345F228C */  lw         $2, (0x15F34 & 0xFFFF)($at)
/* A1080 001A0F80 21102202 */  addu       $2, $17, $2
/* A1084 001A0F84 30014378 */  lq         $3, 0x130($2)
/* A1088 001A0F88 40014278 */  lq         $2, 0x140($2)
/* A108C 001A0F8C 3001437E */  sq         $3, 0x130($18)
/* A1090 001A0F90 4001427E */  sq         $2, 0x140($18)
/* A1094 001A0F94 28264072 */  paddub     $4, $18, $0
/* A1098 001A0F98 282E6072 */  paddub     $5, $19, $0
/* A109C 001A0F9C 146A060C */  jal        SetRotY__9CMapPartsFi
/* A10A0 001A0FA0 00000000 */   nop
/* A10A4 001A0FA4 01000224 */  addiu      $2, $0, 0x1
.L001A0FA8:
/* A10A8 001A0FA8 6000BF7B */  lq         $31, 0x60($sp)
/* A10AC 001A0FAC 5000B47B */  lq         $20, 0x50($sp)
/* A10B0 001A0FB0 4000B37B */  lq         $19, 0x40($sp)
/* A10B4 001A0FB4 3000B27B */  lq         $18, 0x30($sp)
/* A10B8 001A0FB8 2000B17B */  lq         $17, 0x20($sp)
/* A10BC 001A0FBC 1000B07B */  lq         $16, 0x10($sp)
/* A10C0 001A0FC0 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* A10C4 001A0FC4 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* A10C8 001A0FC8 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* A10CC 001A0FCC A000BD27 */  addiu      $sp, $sp, 0xA0
/* A10D0 001A0FD0 0800E003 */  jr         $31
/* A10D4 001A0FD4 00000000 */   nop
/* A10D8 001A0FD8 00000000 */  nop
/* A10DC 001A0FDC 00000000 */  nop
