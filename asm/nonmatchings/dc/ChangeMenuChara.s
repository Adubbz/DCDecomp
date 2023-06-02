.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ChangeMenuChara__Fv
/* 102E50 00202D50 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 102E54 00202D54 2000BF7F */  sq         $31, 0x20($sp)
/* 102E58 00202D58 1000B17F */  sq         $17, 0x10($sp)
/* 102E5C 00202D5C 0000B07F */  sq         $16, 0x0($sp)
/* 102E60 00202D60 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 102E64 00202D64 E2BB2484 */  lh         $4, -0x441E($at)
/* 102E68 00202D68 04008328 */  slti       $3, $4, 0x4
/* 102E6C 00202D6C 04006014 */  bnez       $3, .L00202D80
/* 102E70 00202D70 00000000 */   nop
/* 102E74 00202D74 0E008128 */  slti       $at, $4, 0xE
/* 102E78 00202D78 5F002014 */  bnez       $at, .L00202EF8
/* 102E7C 00202D7C 00000000 */   nop
.L00202D80:
/* 102E80 00202D80 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 102E84 00202D84 F2EB3084 */  lh         $16, -0x140E($at)
/* 102E88 00202D88 D494828F */  lw         $2, -0x6B2C($gp)
/* 102E8C 00202D8C 05005180 */  lb         $17, 0x5($2)
/* 102E90 00202D90 CC01023C */  lui        $2, %hi(GamePad)
/* 102E94 00202D94 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 102E98 00202D98 05000524 */  addiu      $5, $0, 0x5
/* 102E9C 00202D9C 1CAE040C */  jal        Down__8CGamePadFi
/* 102EA0 00202DA0 00000000 */   nop
/* 102EA4 00202DA4 0D004010 */  beqz       $2, .L00202DDC
/* 102EA8 00202DA8 00000000 */   nop
/* 102EAC 00202DAC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 102EB0 00202DB0 F2EB2284 */  lh         $2, -0x140E($at)
/* 102EB4 00202DB4 FFFF4224 */  addiu      $2, $2, -0x1
/* 102EB8 00202DB8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 102EBC 00202DBC F2EB22A4 */  sh         $2, -0x140E($at)
/* 102EC0 00202DC0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 102EC4 00202DC4 F2EB2284 */  lh         $2, -0x140E($at)
/* 102EC8 00202DC8 04004104 */  bgez       $2, .L00202DDC
/* 102ECC 00202DCC 00000000 */   nop
/* 102ED0 00202DD0 FFFF2226 */  addiu      $2, $17, -0x1
/* 102ED4 00202DD4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 102ED8 00202DD8 F2EB22A4 */  sh         $2, -0x140E($at)
.L00202DDC:
/* 102EDC 00202DDC CC01023C */  lui        $2, %hi(GamePad)
/* 102EE0 00202DE0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 102EE4 00202DE4 0A000524 */  addiu      $5, $0, 0xA
/* 102EE8 00202DE8 1CAE040C */  jal        Down__8CGamePadFi
/* 102EEC 00202DEC 00000000 */   nop
/* 102EF0 00202DF0 0E004010 */  beqz       $2, .L00202E2C
/* 102EF4 00202DF4 00000000 */   nop
/* 102EF8 00202DF8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 102EFC 00202DFC F2EB2384 */  lh         $3, -0x140E($at)
/* 102F00 00202E00 01006324 */  addiu      $3, $3, 0x1
/* 102F04 00202E04 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 102F08 00202E08 F2EB23A4 */  sh         $3, -0x140E($at)
/* 102F0C 00202E0C FFFF2426 */  addiu      $4, $17, -0x1
/* 102F10 00202E10 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 102F14 00202E14 F2EB2384 */  lh         $3, -0x140E($at)
/* 102F18 00202E18 2A088300 */  slt        $at, $4, $3
/* 102F1C 00202E1C 03002010 */  beqz       $at, .L00202E2C
/* 102F20 00202E20 00000000 */   nop
/* 102F24 00202E24 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 102F28 00202E28 F2EB20A4 */  sh         $0, -0x140E($at)
.L00202E2C:
/* 102F2C 00202E2C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 102F30 00202E30 F2EB2484 */  lh         $4, -0x140E($at)
/* 102F34 00202E34 30000412 */  beq        $16, $4, .L00202EF8
/* 102F38 00202E38 00000000 */   nop
/* 102F3C 00202E3C D494838F */  lw         $3, -0x6B2C($gp)
/* 102F40 00202E40 05006380 */  lb         $3, 0x5($3)
/* 102F44 00202E44 2A086400 */  slt        $at, $3, $4
/* 102F48 00202E48 29002014 */  bnez       $at, .L00202EF0
/* 102F4C 00202E4C 00000000 */   nop
/* 102F50 00202E50 8CFB040C */  jal        ReadBGSync__Fv
/* 102F54 00202E54 00000000 */   nop
/* 102F58 00202E58 03004010 */  beqz       $2, .L00202E68
/* 102F5C 00202E5C 00000000 */   nop
/* 102F60 00202E60 B0FB040C */  jal        BreakReadBG__Fv
/* 102F64 00202E64 00000000 */   nop
.L00202E68:
/* 102F68 00202E68 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 102F6C 00202E6C F2EB2584 */  lh         $5, -0x140E($at)
/* 102F70 00202E70 0895848F */  lw         $4, -0x6AF8($gp)
/* 102F74 00202E74 28360070 */  paddub     $6, $0, $0
/* 102F78 00202E78 6838080C */  jal        StartLoadCharaMDS__FP1ii
/* 102F7C 00202E7C 00000000 */   nop
/* 102F80 00202E80 049582AF */  sw         $2, -0x6AFC($gp)
/* 102F84 00202E84 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 102F88 00202E88 F2EB2484 */  lh         $4, -0x140E($at)
/* 102F8C 00202E8C D494858F */  lw         $5, -0x6B2C($gp)
/* 102F90 00202E90 21108500 */  addu       $2, $4, $5
/* 102F94 00202E94 40434380 */  lb         $3, 0x4340($2)
/* 102F98 00202E98 A80A0224 */  addiu      $2, $0, 0xAA8
/* 102F9C 00202E9C 18108200 */  mult       $2, $4, $2
/* 102FA0 00202EA0 2110A200 */  addu       $2, $5, $2
/* 102FA4 00202EA4 0C454424 */  addiu      $4, $2, 0x450C
/* 102FA8 00202EA8 40110300 */  sll        $2, $3, 5
/* 102FAC 00202EAC 23104300 */  subu       $2, $2, $3
/* 102FB0 00202EB0 C0100200 */  sll        $2, $2, 3
/* 102FB4 00202EB4 21108200 */  addu       $2, $4, $2
/* 102FB8 00202EB8 07004010 */  beqz       $2, .L00202ED8
/* 102FBC 00202EBC 00000000 */   nop
/* 102FC0 00202EC0 00004484 */  lh         $4, 0x0($2)
/* 102FC4 00202EC4 02004584 */  lh         $5, 0x2($2)
/* 102FC8 00202EC8 94CF070C */  jal        SetNowEquipWeaponDataForMsg__Fii
/* 102FCC 00202ECC 00000000 */   nop
/* 102FD0 00202ED0 09000010 */  b          .L00202EF8
/* 102FD4 00202ED4 00000000 */   nop
.L00202ED8:
/* 102FD8 00202ED8 28260070 */  paddub     $4, $0, $0
/* 102FDC 00202EDC 282E0070 */  paddub     $5, $0, $0
/* 102FE0 00202EE0 94CF070C */  jal        SetNowEquipWeaponDataForMsg__Fii
/* 102FE4 00202EE4 00000000 */   nop
/* 102FE8 00202EE8 03000010 */  b          .L00202EF8
/* 102FEC 00202EEC 00000000 */   nop
.L00202EF0:
/* 102FF0 00202EF0 01000324 */  addiu      $3, $0, 0x1
/* 102FF4 00202EF4 049583AF */  sw         $3, -0x6AFC($gp)
.L00202EF8:
/* 102FF8 00202EF8 2000BF7B */  lq         $31, 0x20($sp)
/* 102FFC 00202EFC 1000B17B */  lq         $17, 0x10($sp)
/* 103000 00202F00 0000B07B */  lq         $16, 0x0($sp)
/* 103004 00202F04 3000BD27 */  addiu      $sp, $sp, 0x30
/* 103008 00202F08 0800E003 */  jr         $31
/* 10300C 00202F0C 00000000 */   nop
