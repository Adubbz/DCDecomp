.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BattleMenuSelect__Fv
/* 0F6C20 001F6B20 70FFBD27 */  addiu       $29, $29, -0x90
/* 0F6C24 001F6B24 2000BF7F */  sq          $31, 0x20($29)
/* 0F6C28 001F6B28 1000B17F */  sq          $17, 0x10($29)
/* 0F6C2C 001F6B2C 0000B07F */  sq          $16, 0x0($29)
/* 0F6C30 001F6B30 8895828F */  lw          $2, -0x6A78($28)
/* 0F6C34 001F6B34 0C004010 */  beqz        $2, .L001F6B68
/* 0F6C38 001F6B38 00000000 */   nop
/* 0F6C3C 001F6B3C CC01023C */  lui         $2, %hi(GamePad)
/* 0F6C40 001F6B40 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F6C44 001F6B44 60000524 */  addiu       $5, $0, 0x60
/* 0F6C48 001F6B48 1CAE040C */  jal         Down__8CGamePadFi
/* 0F6C4C 001F6B4C 00000000 */   nop
/* 0F6C50 001F6B50 02004010 */  beqz        $2, .L001F6B5C
/* 0F6C54 001F6B54 00000000 */   nop
/* 0F6C58 001F6B58 889580AF */  sw          $0, -0x6A78($28)
.L001F6B5C:
/* 0F6C5C 001F6B5C 01000224 */  addiu       $2, $0, 0x1
/* 0F6C60 001F6B60 F7000010 */  b           .L001F6F40
/* 0F6C64 001F6B64 00000000 */   nop
.L001F6B68:
/* 0F6C68 001F6B68 5C95908F */  lw          $16, -0x6AA4($28)
/* 0F6C6C 001F6B6C 28D0070C */  jal         GetMenuModeMax__Fv
/* 0F6C70 001F6B70 00000000 */   nop
/* 0F6C74 001F6B74 288E4070 */  paddub      $17, $2, $0
/* 0F6C78 001F6B78 CC01023C */  lui         $2, %hi(GamePad)
/* 0F6C7C 001F6B7C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F6C80 001F6B80 00900534 */  ori         $5, $0, 0x9000
/* 0F6C84 001F6B84 1CAE040C */  jal         Down__8CGamePadFi
/* 0F6C88 001F6B88 00000000 */   nop
/* 0F6C8C 001F6B8C 09004010 */  beqz        $2, .L001F6BB4
/* 0F6C90 001F6B90 00000000 */   nop
/* 0F6C94 001F6B94 5C95828F */  lw          $2, -0x6AA4($28)
/* 0F6C98 001F6B98 FFFF4224 */  addiu       $2, $2, -0x1
/* 0F6C9C 001F6B9C 5C9582AF */  sw          $2, -0x6AA4($28)
/* 0F6CA0 001F6BA0 5C95828F */  lw          $2, -0x6AA4($28)
/* 0F6CA4 001F6BA4 03004104 */  bgez        $2, .L001F6BB4
/* 0F6CA8 001F6BA8 00000000 */   nop
/* 0F6CAC 001F6BAC FFFF2226 */  addiu       $2, $17, -0x1
/* 0F6CB0 001F6BB0 5C9582AF */  sw          $2, -0x6AA4($28)
.L001F6BB4:
/* 0F6CB4 001F6BB4 CC01023C */  lui         $2, %hi(GamePad)
/* 0F6CB8 001F6BB8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F6CBC 001F6BBC 00600524 */  addiu       $5, $0, 0x6000
/* 0F6CC0 001F6BC0 1CAE040C */  jal         Down__8CGamePadFi
/* 0F6CC4 001F6BC4 00000000 */   nop
/* 0F6CC8 001F6BC8 0A004010 */  beqz        $2, .L001F6BF4
/* 0F6CCC 001F6BCC 00000000 */   nop
/* 0F6CD0 001F6BD0 5C95828F */  lw          $2, -0x6AA4($28)
/* 0F6CD4 001F6BD4 01004224 */  addiu       $2, $2, 0x1
/* 0F6CD8 001F6BD8 5C9582AF */  sw          $2, -0x6AA4($28)
/* 0F6CDC 001F6BDC 5C95838F */  lw          $3, -0x6AA4($28)
/* 0F6CE0 001F6BE0 FFFF2226 */  addiu       $2, $17, -0x1
/* 0F6CE4 001F6BE4 2A084300 */  slt         $1, $2, $3
/* 0F6CE8 001F6BE8 02002010 */  beqz        $1, .L001F6BF4
/* 0F6CEC 001F6BEC 00000000 */   nop
/* 0F6CF0 001F6BF0 5C9580AF */  sw          $0, -0x6AA4($28)
.L001F6BF4:
/* 0F6CF4 001F6BF4 5C95828F */  lw          $2, -0x6AA4($28)
/* 0F6CF8 001F6BF8 04000212 */  beq         $16, $2, .L001F6C0C
/* 0F6CFC 001F6BFC 00000000 */   nop
/* 0F6D00 001F6C00 28260070 */  paddub      $4, $0, $0
/* 0F6D04 001F6C04 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F6D08 001F6C08 00000000 */   nop
.L001F6C0C:
/* 0F6D0C 001F6C0C CC01023C */  lui         $2, %hi(GamePad)
/* 0F6D10 001F6C10 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F6D14 001F6C14 40000524 */  addiu       $5, $0, 0x40
/* 0F6D18 001F6C18 1CAE040C */  jal         Down__8CGamePadFi
/* 0F6D1C 001F6C1C 00000000 */   nop
/* 0F6D20 001F6C20 BA004010 */  beqz        $2, .L001F6F0C
/* 0F6D24 001F6C24 00000000 */   nop
/* 0F6D28 001F6C28 2900023C */  lui         $2, %hi(LIT_1239__2)
/* 0F6D2C 001F6C2C 602F4524 */  addiu       $5, $2, %lo(LIT_1239__2)
/* 0F6D30 001F6C30 3000A427 */  addiu       $4, $29, 0x30
/* 0F6D34 001F6C34 04000324 */  addiu       $3, $0, 0x4
.L001F6C38:
/* 0F6D38 001F6C38 0000A278 */  lq          $2, 0x0($5)
/* 0F6D3C 001F6C3C 1000A524 */  addiu       $5, $5, 0x10
/* 0F6D40 001F6C40 FFFF6324 */  addiu       $3, $3, -0x1
/* 0F6D44 001F6C44 0000827C */  sq          $2, 0x0($4)
/* 0F6D48 001F6C48 10008424 */  addiu       $4, $4, 0x10
/* 0F6D4C 001F6C4C FAFF601C */  bgtz        $3, .L001F6C38
/* 0F6D50 001F6C50 00000000 */   nop
/* 0F6D54 001F6C54 D894848F */  lw          $4, -0x6B28($28)
/* 0F6D58 001F6C58 40110400 */  sll         $2, $4, 5
/* 0F6D5C 001F6C5C 21185D00 */  addu        $3, $2, $29
/* 0F6D60 001F6C60 5C95828F */  lw          $2, -0x6AA4($28)
/* 0F6D64 001F6C64 80100200 */  sll         $2, $2, 2
/* 0F6D68 001F6C68 21104300 */  addu        $2, $2, $3
/* 0F6D6C 001F6C6C 3000428C */  lw          $2, 0x30($2)
/* 0F6D70 001F6C70 589582AF */  sw          $2, -0x6AA8($28)
/* 0F6D74 001F6C74 DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x98)
/* 0F6D78 001F6C78 280C20AC */  sw          $0, %lo(CommonMenuMes1 + 0x98)($1)
/* 0F6D7C 001F6C7C D494878F */  lw          $7, -0x6B2C($28)
/* 0F6D80 001F6C80 0400E580 */  lb          $5, 0x4($7)
/* 0F6D84 001F6C84 E494908F */  lw          $16, -0x6B1C($28)
/* 0F6D88 001F6C88 5895868F */  lw          $6, -0x6AA8($28)
/* 0F6D8C 001F6C8C 0900C12C */  sltiu       $1, $6, 0x9
/* 0F6D90 001F6C90 94002010 */  beqz        $1, .L001F6EE4$b
/* 0F6D94 001F6C94 00000000 */   nop
/* 0F6D98 001F6C98 2A00023C */  lui         $2, %hi(LIT_1288)
/* 0F6D9C 001F6C9C 20D74324 */  addiu       $3, $2, %lo(LIT_1288)
/* 0F6DA0 001F6CA0 80100600 */  sll         $2, $6, 2
/* 0F6DA4 001F6CA4 21104300 */  addu        $2, $2, $3
/* 0F6DA8 001F6CA8 0000428C */  lw          $2, 0x0($2)
/* 0F6DAC 001F6CAC 08004000 */  jr          $2
/* 0F6DB0 001F6CB0 00000000 */   nop
jlabel .L001F6CB4
.L001F6CB4$b:
/* 0F6DB4 001F6CB4 0F008014 */  bnez        $4, .L001F6CF4
/* 0F6DB8 001F6CB8 00000000 */   nop
/* 0F6DBC 001F6CBC 0100013C */  lui         $1, (0x10000 >> 16)
/* 0F6DC0 001F6CC0 2108E100 */  addu        $1, $7, $1
/* 0F6DC4 001F6CC4 108B228C */  lw          $2, -0x74F0($1)
/* 0F6DC8 001F6CC8 06004128 */  slti        $1, $2, 0x6
/* 0F6DCC 001F6CCC 09002010 */  beqz        $1, .L001F6CF4
/* 0F6DD0 001F6CD0 00000000 */   nop
/* 0F6DD4 001F6CD4 07004004 */  bltz        $2, .L001F6CF4
/* 0F6DD8 001F6CD8 00000000 */   nop
/* 0F6DDC 001F6CDC 02000424 */  addiu       $4, $0, 0x2
/* 0F6DE0 001F6CE0 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F6DE4 001F6CE4 00000000 */   nop
/* 0F6DE8 001F6CE8 01000224 */  addiu       $2, $0, 0x1
/* 0F6DEC 001F6CEC 94000010 */  b           .L001F6F40
/* 0F6DF0 001F6CF0 00000000 */   nop
.L001F6CF4:
/* 0F6DF4 001F6CF4 28260072 */  paddub      $4, $16, $0
/* 0F6DF8 001F6CF8 B8DC070C */  jal         InitMenuChara__FP1
/* 0F6DFC 001F6CFC 00000000 */   nop
/* 0F6E00 001F6D00 78000010 */  b           .L001F6EE4$b
/* 0F6E04 001F6D04 00000000 */   nop
jlabel .L001F6D08
.L001F6D08$b:
/* 0F6E08 001F6D08 28260070 */  paddub      $4, $0, $0
/* 0F6E0C 001F6D0C D4F1070C */  jal         InitWeaponSelect__Fii
/* 0F6E10 001F6D10 00000000 */   nop
/* 0F6E14 001F6D14 73000010 */  b           .L001F6EE4$b
/* 0F6E18 001F6D18 00000000 */   nop
jlabel .L001F6D1C
.L001F6D1C$b:
/* 0F6E1C 001F6D1C 28260070 */  paddub      $4, $0, $0
/* 0F6E20 001F6D20 7809080C */  jal         InitItemMode__Fii
/* 0F6E24 001F6D24 00000000 */   nop
/* 0F6E28 001F6D28 6E000010 */  b           .L001F6EE4$b
/* 0F6E2C 001F6D2C 00000000 */   nop
jlabel .L001F6D30
.L001F6D30$b:
/* 0F6E30 001F6D30 7800A327 */  addiu       $3, $29, 0x78
/* 0F6E34 001F6D34 608882DF */  ld          $2, -0x77A0($28)
/* 0F6E38 001F6D38 000062FC */  sd          $2, 0x0($3)
/* 0F6E3C 001F6D3C E094828F */  lw          $2, -0x6B20($28)
/* 0F6E40 001F6D40 7800A2AF */  sw          $2, 0x78($29)
/* 0F6E44 001F6D44 0095828F */  lw          $2, -0x6B00($28)
/* 0F6E48 001F6D48 7C00A2AF */  sw          $2, 0x7C($29)
/* 0F6E4C 001F6D4C 288E0070 */  paddub      $17, $0, $0
/* 0F6E50 001F6D50 01000224 */  addiu       $2, $0, 0x1
/* 0F6E54 001F6D54 0F008210 */  beq         $4, $2, .L001F6D94
/* 0F6E58 001F6D58 00000000 */   nop
/* 0F6E5C 001F6D5C 03008010 */  beqz        $4, .L001F6D6C
/* 0F6E60 001F6D60 00000000 */   nop
/* 0F6E64 001F6D64 15000010 */  b           .L001F6DBC
/* 0F6E68 001F6D68 00000000 */   nop
.L001F6D6C:
/* 0F6E6C 001F6D6C 0000F180 */  lb          $17, 0x0($7)
/* 0F6E70 001F6D70 02002106 */  bgez        $17, .L001F6D7C
/* 0F6E74 001F6D74 00000000 */   nop
/* 0F6E78 001F6D78 288E0070 */  paddub      $17, $0, $0
.L001F6D7C:
/* 0F6E7C 001F6D7C 0600222A */  slti        $2, $17, 0x6
/* 0F6E80 001F6D80 0E004014 */  bnez        $2, .L001F6DBC
/* 0F6E84 001F6D84 00000000 */   nop
/* 0F6E88 001F6D88 288E0070 */  paddub      $17, $0, $0
/* 0F6E8C 001F6D8C 0B000010 */  b           .L001F6DBC
/* 0F6E90 001F6D90 00000000 */   nop
.L001F6D94:
/* 0F6E94 001F6D94 288D848F */  lw          $4, -0x72D8($28)
/* 0F6E98 001F6D98 44AF080C */  jal         GetNowMapTransAtraMap__Fi
/* 0F6E9C 001F6D9C 00000000 */   nop
/* 0F6EA0 001F6DA0 288E4070 */  paddub      $17, $2, $0
/* 0F6EA4 001F6DA4 04002006 */  bltz        $17, .L001F6DB8
/* 0F6EA8 001F6DA8 00000000 */   nop
/* 0F6EAC 001F6DAC 0600212A */  slti        $1, $17, 0x6
/* 0F6EB0 001F6DB0 02002014 */  bnez        $1, .L001F6DBC
/* 0F6EB4 001F6DB4 00000000 */   nop
.L001F6DB8:
/* 0F6EB8 001F6DB8 288E0070 */  paddub      $17, $0, $0
.L001F6DBC:
/* 0F6EBC 001F6DBC D894848F */  lw          $4, -0x6B28($28)
/* 0F6EC0 001F6DC0 282E2072 */  paddub      $5, $17, $0
/* 0F6EC4 001F6DC4 7800A627 */  addiu       $6, $29, 0x78
/* 0F6EC8 001F6DC8 283E0072 */  paddub      $7, $16, $0
/* 0F6ECC 001F6DCC 4C68080C */  jal         InitMenuAtora1__FiiPiP1
/* 0F6ED0 001F6DD0 00000000 */   nop
/* 0F6ED4 001F6DD4 28262072 */  paddub      $4, $17, $0
/* 0F6ED8 001F6DD8 1069080C */  jal         InitMenuAtoraSelect__Fi
/* 0F6EDC 001F6DDC 00000000 */   nop
/* 0F6EE0 001F6DE0 40000010 */  b           .L001F6EE4$b
/* 0F6EE4 001F6DE4 00000000 */   nop
jlabel .L001F6DE8
.L001F6DE8$b:
/* 0F6EE8 001F6DE8 B02F080C */  jal         NowGetGameFlagForBtlMenu__Fi
/* 0F6EEC 001F6DEC 00000000 */   nop
/* 0F6EF0 001F6DF0 14004010 */  beqz        $2, .L001F6E44
/* 0F6EF4 001F6DF4 00000000 */   nop
/* 0F6EF8 001F6DF8 02000424 */  addiu       $4, $0, 0x2
/* 0F6EFC 001F6DFC 11004410 */  beq         $2, $4, .L001F6E44
/* 0F6F00 001F6E00 00000000 */   nop
/* 0F6F04 001F6E04 0A000324 */  addiu       $3, $0, 0xA
/* 0F6F08 001F6E08 0E004310 */  beq         $2, $3, .L001F6E44
/* 0F6F0C 001F6E0C 00000000 */   nop
/* 0F6F10 001F6E10 01000324 */  addiu       $3, $0, 0x1
/* 0F6F14 001F6E14 0B004310 */  beq         $2, $3, .L001F6E44
/* 0F6F18 001F6E18 00000000 */   nop
/* 0F6F1C 001F6E1C 0B000324 */  addiu       $3, $0, 0xB
/* 0F6F20 001F6E20 03004310 */  beq         $2, $3, .L001F6E30
/* 0F6F24 001F6E24 00000000 */   nop
/* 0F6F28 001F6E28 06000010 */  b           .L001F6E44
/* 0F6F2C 001F6E2C 00000000 */   nop
.L001F6E30:
/* 0F6F30 001F6E30 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F6F34 001F6E34 00000000 */   nop
/* 0F6F38 001F6E38 01000224 */  addiu       $2, $0, 0x1
/* 0F6F3C 001F6E3C 40000010 */  b           .L001F6F40
/* 0F6F40 001F6E40 00000000 */   nop
.L001F6E44:
/* 0F6F44 001F6E44 28264070 */  paddub      $4, $2, $0
/* 0F6F48 001F6E48 0095858F */  lw          $5, -0x6B00($28)
/* 0F6F4C 001F6E4C 28360072 */  paddub      $6, $16, $0
/* 0F6F50 001F6E50 BC1F080C */  jal         InitMenuMove__FiiP1
/* 0F6F54 001F6E54 00000000 */   nop
/* 0F6F58 001F6E58 489580A3 */  sb          $0, -0x6AB8($28)
/* 0F6F5C 001F6E5C 21000010 */  b           .L001F6EE4$b
/* 0F6F60 001F6E60 00000000 */   nop
jlabel .L001F6E64
.L001F6E64$b:
/* 0F6F64 001F6E64 01000424 */  addiu       $4, $0, 0x1
/* 0F6F68 001F6E68 0095858F */  lw          $5, -0x6B00($28)
/* 0F6F6C 001F6E6C 28360072 */  paddub      $6, $16, $0
/* 0F6F70 001F6E70 3479080C */  jal         InitMenuOption__FiiP1
/* 0F6F74 001F6E74 00000000 */   nop
/* 0F6F78 001F6E78 1A000010 */  b           .L001F6EE4$b
/* 0F6F7C 001F6E7C 00000000 */   nop
jlabel .L001F6E80
.L001F6E80$b:
/* 0F6F80 001F6E80 489580A3 */  sb          $0, -0x6AB8($28)
/* 0F6F84 001F6E84 01000424 */  addiu       $4, $0, 0x1
/* 0F6F88 001F6E88 0095858F */  lw          $5, -0x6B00($28)
/* 0F6F8C 001F6E8C 28360072 */  paddub      $6, $16, $0
/* 0F6F90 001F6E90 C47E080C */  jal         InitMenuSave__FiiP1
/* 0F6F94 001F6E94 00000000 */   nop
/* 0F6F98 001F6E98 12000010 */  b           .L001F6EE4$b
/* 0F6F9C 001F6E9C 00000000 */   nop
jlabel .L001F6EA0
.L001F6EA0$b:
/* 0F6FA0 001F6EA0 489580A3 */  sb          $0, -0x6AB8($28)
/* 0F6FA4 001F6EA4 2900023C */  lui         $2, %hi(LIT_1270)
/* 0F6FA8 001F6EA8 A02F4324 */  addiu       $3, $2, %lo(LIT_1270)
/* 0F6FAC 001F6EAC 8000A427 */  addiu       $4, $29, 0x80
/* 0F6FB0 001F6EB0 000062DC */  ld          $2, 0x0($3)
/* 0F6FB4 001F6EB4 080060C4 */  lwc1        $f0, 0x8($3)
/* 0F6FB8 001F6EB8 000082FC */  sd          $2, 0x0($4)
/* 0F6FBC 001F6EBC 080080E4 */  swc1        $f0, 0x8($4)
/* 0F6FC0 001F6EC0 0095828F */  lw          $2, -0x6B00($28)
/* 0F6FC4 001F6EC4 8000A2AF */  sw          $2, 0x80($29)
/* 0F6FC8 001F6EC8 F894828F */  lw          $2, -0x6B08($28)
/* 0F6FCC 001F6ECC 8400A2AF */  sw          $2, 0x84($29)
/* 0F6FD0 001F6ED0 1095828F */  lw          $2, -0x6AF0($28)
/* 0F6FD4 001F6ED4 8800A2AF */  sw          $2, 0x88($29)
/* 0F6FD8 001F6ED8 282E0072 */  paddub      $5, $16, $0
/* 0F6FDC 001F6EDC 1C2C080C */  jal         BattleManualInit__FPiP1
/* 0F6FE0 001F6EE0 00000000 */   nop
jlabel .L001F6EE4
.L001F6EE4$b:
/* 0F6FE4 001F6EE4 5895828F */  lw          $2, -0x6AA8($28)
/* 0F6FE8 001F6EE8 08004224 */  addiu       $2, $2, 0x8
/* 0F6FEC 001F6EEC 208882AF */  sw          $2, -0x77E0($28)
/* 0F6FF0 001F6EF0 01000424 */  addiu       $4, $0, 0x1
/* 0F6FF4 001F6EF4 308884AF */  sw          $4, -0x77D0($28)
/* 0F6FF8 001F6EF8 849580AF */  sw          $0, -0x6A7C($28)
/* 0F6FFC 001F6EFC BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F7000 001F6F00 00000000 */   nop
/* 0F7004 001F6F04 0D000010 */  b           .L001F6F3C
/* 0F7008 001F6F08 00000000 */   nop
.L001F6F0C:
/* 0F700C 001F6F0C CC01023C */  lui         $2, %hi(GamePad)
/* 0F7010 001F6F10 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F7014 001F6F14 20000524 */  addiu       $5, $0, 0x20
/* 0F7018 001F6F18 1CAE040C */  jal         Down__8CGamePadFi
/* 0F701C 001F6F1C 00000000 */   nop
/* 0F7020 001F6F20 06004010 */  beqz        $2, .L001F6F3C
/* 0F7024 001F6F24 00000000 */   nop
/* 0F7028 001F6F28 02000424 */  addiu       $4, $0, 0x2
/* 0F702C 001F6F2C BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F7030 001F6F30 00000000 */   nop
/* 0F7034 001F6F34 1C000224 */  addiu       $2, $0, 0x1C
/* 0F7038 001F6F38 208882AF */  sw          $2, -0x77E0($28)
.L001F6F3C:
/* 0F703C 001F6F3C 01000224 */  addiu       $2, $0, 0x1
.L001F6F40:
/* 0F7040 001F6F40 2000BF7B */  lq          $31, 0x20($29)
/* 0F7044 001F6F44 1000B17B */  lq          $17, 0x10($29)
/* 0F7048 001F6F48 0000B07B */  lq          $16, 0x0($29)
/* 0F704C 001F6F4C 9000BD27 */  addiu       $29, $29, 0x90
/* 0F7050 001F6F50 0800E003 */  jr          $31
/* 0F7054 001F6F54 00000000 */   nop
/* 0F7058 001F6F58 00000000 */  nop
/* 0F705C 001F6F5C 00000000 */  nop
