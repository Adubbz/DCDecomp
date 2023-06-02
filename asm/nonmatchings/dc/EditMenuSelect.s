.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel EditMenuSelect__Fv
/* 111AB0 002119B0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 111AB4 002119B4 2000BF7F */  sq         $31, 0x20($sp)
/* 111AB8 002119B8 1000B17F */  sq         $17, 0x10($sp)
/* 111ABC 002119BC 0000B07F */  sq         $16, 0x0($sp)
/* 111AC0 002119C0 B840080C */  jal        GetEditMenuMax__Fv
/* 111AC4 002119C4 00000000 */   nop
/* 111AC8 002119C8 28864070 */  paddub     $16, $2, $0
/* 111ACC 002119CC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 111AD0 002119D0 58EF3180 */  lb         $17, -0x10A8($at)
/* 111AD4 002119D4 CC01023C */  lui        $2, %hi(GamePad)
/* 111AD8 002119D8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 111ADC 002119DC 00900534 */  ori        $5, $0, 0x9000
/* 111AE0 002119E0 1CAE040C */  jal        Down__8CGamePadFi
/* 111AE4 002119E4 00000000 */   nop
/* 111AE8 002119E8 0D004010 */  beqz       $2, .L00211A20
/* 111AEC 002119EC 00000000 */   nop
/* 111AF0 002119F0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 111AF4 002119F4 58EF2280 */  lb         $2, -0x10A8($at)
/* 111AF8 002119F8 FFFF4224 */  addiu      $2, $2, -0x1
/* 111AFC 002119FC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 111B00 00211A00 58EF22A0 */  sb         $2, -0x10A8($at)
/* 111B04 00211A04 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 111B08 00211A08 58EF2280 */  lb         $2, -0x10A8($at)
/* 111B0C 00211A0C 04004104 */  bgez       $2, .L00211A20
/* 111B10 00211A10 00000000 */   nop
/* 111B14 00211A14 FFFF0226 */  addiu      $2, $16, -0x1
/* 111B18 00211A18 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 111B1C 00211A1C 58EF22A0 */  sb         $2, -0x10A8($at)
.L00211A20:
/* 111B20 00211A20 CC01023C */  lui        $2, %hi(GamePad)
/* 111B24 00211A24 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 111B28 00211A28 00600524 */  addiu      $5, $0, 0x6000
/* 111B2C 00211A2C 1CAE040C */  jal        Down__8CGamePadFi
/* 111B30 00211A30 00000000 */   nop
/* 111B34 00211A34 0F004010 */  beqz       $2, .L00211A74
/* 111B38 00211A38 00000000 */   nop
/* 111B3C 00211A3C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 111B40 00211A40 58EF2280 */  lb         $2, -0x10A8($at)
/* 111B44 00211A44 01004224 */  addiu      $2, $2, 0x1
/* 111B48 00211A48 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 111B4C 00211A4C 58EF22A0 */  sb         $2, -0x10A8($at)
/* 111B50 00211A50 FFFF0326 */  addiu      $3, $16, -0x1
/* 111B54 00211A54 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 111B58 00211A58 58EF2280 */  lb         $2, -0x10A8($at)
/* 111B5C 00211A5C FFFF4224 */  addiu      $2, $2, -0x1
/* 111B60 00211A60 2A084300 */  slt        $at, $2, $3
/* 111B64 00211A64 03002014 */  bnez       $at, .L00211A74
/* 111B68 00211A68 00000000 */   nop
/* 111B6C 00211A6C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 111B70 00211A70 58EF20A0 */  sb         $0, -0x10A8($at)
.L00211A74:
/* 111B74 00211A74 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 111B78 00211A78 58EF2280 */  lb         $2, -0x10A8($at)
/* 111B7C 00211A7C 04002212 */  beq        $17, $2, .L00211A90
/* 111B80 00211A80 00000000 */   nop
/* 111B84 00211A84 28260070 */  paddub     $4, $0, $0
/* 111B88 00211A88 BCB3080C */  jal        ComMenuSePlay__Fi
/* 111B8C 00211A8C 00000000 */   nop
.L00211A90:
/* 111B90 00211A90 CC01023C */  lui        $2, %hi(GamePad)
/* 111B94 00211A94 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 111B98 00211A98 20000524 */  addiu      $5, $0, 0x20
/* 111B9C 00211A9C 1CAE040C */  jal        Down__8CGamePadFi
/* 111BA0 00211AA0 00000000 */   nop
/* 111BA4 00211AA4 09004010 */  beqz       $2, .L00211ACC
/* 111BA8 00211AA8 00000000 */   nop
/* 111BAC 00211AAC 02000424 */  addiu      $4, $0, 0x2
/* 111BB0 00211AB0 BCB3080C */  jal        ComMenuSePlay__Fi
/* 111BB4 00211AB4 00000000 */   nop
/* 111BB8 00211AB8 0F000224 */  addiu      $2, $0, 0xF
/* 111BBC 00211ABC 549682AF */  sw         $2, -0x69AC($gp)
/* 111BC0 00211AC0 5C9680AF */  sw         $0, -0x69A4($gp)
/* 111BC4 00211AC4 96000010 */  b          .L00211D20
/* 111BC8 00211AC8 00000000 */   nop
.L00211ACC:
/* 111BCC 00211ACC CC01023C */  lui        $2, %hi(GamePad)
/* 111BD0 00211AD0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 111BD4 00211AD4 40000524 */  addiu      $5, $0, 0x40
/* 111BD8 00211AD8 1CAE040C */  jal        Down__8CGamePadFi
/* 111BDC 00211ADC 00000000 */   nop
/* 111BE0 00211AE0 8F004010 */  beqz       $2, .L00211D20
/* 111BE4 00211AE4 00000000 */   nop
/* 111BE8 00211AE8 2900023C */  lui        $2, %hi(_627_4)
/* 111BEC 00211AEC 203D4224 */  addiu      $2, $2, %lo(_627_4)
/* 111BF0 00211AF0 3000A427 */  addiu      $4, $sp, 0x30
/* 111BF4 00211AF4 00004378 */  lq         $3, 0x0($2)
/* 111BF8 00211AF8 100042DC */  ld         $2, 0x10($2)
/* 111BFC 00211AFC 0000837C */  sq         $3, 0x0($4)
/* 111C00 00211B00 100082FC */  sd         $2, 0x10($4)
/* 111C04 00211B04 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 111C08 00211B08 58EF2280 */  lb         $2, -0x10A8($at)
/* 111C0C 00211B0C 80100200 */  sll        $2, $2, 2
/* 111C10 00211B10 21105D00 */  addu       $2, $2, $sp
/* 111C14 00211B14 3000428C */  lw         $2, 0x30($2)
/* 111C18 00211B18 549682AF */  sw         $2, -0x69AC($gp)
/* 111C1C 00211B1C 01000424 */  addiu      $4, $0, 0x1
/* 111C20 00211B20 BCB3080C */  jal        ComMenuSePlay__Fi
/* 111C24 00211B24 00000000 */   nop
/* 111C28 00211B28 5C9680AF */  sw         $0, -0x69A4($gp)
/* 111C2C 00211B2C FFFF0224 */  addiu      $2, $0, -0x1
/* 111C30 00211B30 DA01013C */  lui        $at, (0x1DA3A0C >> 16)
/* 111C34 00211B34 0C3A22AC */  sw         $2, (0x1DA3A0C & 0xFFFF)($at)
/* 111C38 00211B38 4496908F */  lw         $16, -0x69BC($gp)
/* 111C3C 00211B3C 5496828F */  lw         $2, -0x69AC($gp)
/* 111C40 00211B40 F7FF4420 */  addi       $4, $2, -0x9 # handwritten instruction
/* 111C44 00211B44 0600812C */  sltiu      $at, $4, 0x6
/* 111C48 00211B48 75002010 */  beqz       $at, .L00211D20
/* 111C4C 00211B4C 00000000 */   nop
/* 111C50 00211B50 2A00023C */  lui        $2, %hi(_651_2)
/* 111C54 00211B54 80E44324 */  addiu      $3, $2, %lo(_651_2)
/* 111C58 00211B58 80100400 */  sll        $2, $4, 2
/* 111C5C 00211B5C 21104300 */  addu       $2, $2, $3
/* 111C60 00211B60 0000428C */  lw         $2, 0x0($2)
/* 111C64 00211B64 08004000 */  jr         $2
/* 111C68 00211B68 00000000 */   nop
/* 111C6C 00211B6C 4800A327 */  addiu      $3, $sp, 0x48
/* 111C70 00211B70 488982DF */  ld         $2, -0x76B8($gp)
/* 111C74 00211B74 000062FC */  sd         $2, 0x0($3)
/* 111C78 00211B78 4096828F */  lw         $2, -0x69C0($gp)
/* 111C7C 00211B7C 4800A2AF */  sw         $2, 0x48($sp)
/* 111C80 00211B80 4896828F */  lw         $2, -0x69B8($gp)
/* 111C84 00211B84 4C00A2AF */  sw         $2, 0x4C($sp)
/* 111C88 00211B88 288D848F */  lw         $4, -0x72D8($gp)
/* 111C8C 00211B8C 44AF080C */  jal        GetNowMapTransAtraMap__Fi
/* 111C90 00211B90 00000000 */   nop
/* 111C94 00211B94 04004004 */  bltz       $2, .L00211BA8
/* 111C98 00211B98 00000000 */   nop
/* 111C9C 00211B9C 05004128 */  slti       $at, $2, 0x5
/* 111CA0 00211BA0 02002014 */  bnez       $at, .L00211BAC
/* 111CA4 00211BA4 00000000 */   nop
.L00211BA8:
/* 111CA8 00211BA8 28160070 */  paddub     $2, $0, $0
.L00211BAC:
/* 111CAC 00211BAC 2A00033C */  lui        $3, %hi(_650_5)
/* 111CB0 00211BB0 60E46424 */  addiu      $4, $3, %lo(_650_5)
/* 111CB4 00211BB4 282E4070 */  paddub     $5, $2, $0
/* 111CB8 00211BB8 A611040C */  jal        printf
/* 111CBC 00211BBC 00000000 */   nop
/* 111CC0 00211BC0 02000424 */  addiu      $4, $0, 0x2
/* 111CC4 00211BC4 2090858F */  lw         $5, -0x6FE0($gp)
/* 111CC8 00211BC8 4800A627 */  addiu      $6, $sp, 0x48
/* 111CCC 00211BCC 283E0072 */  paddub     $7, $16, $0
/* 111CD0 00211BD0 4C68080C */  jal        InitMenuAtora1__FiiPiP1
/* 111CD4 00211BD4 00000000 */   nop
/* 111CD8 00211BD8 2090848F */  lw         $4, -0x6FE0($gp)
/* 111CDC 00211BDC 1069080C */  jal        InitMenuAtoraSelect__Fi
/* 111CE0 00211BE0 00000000 */   nop
/* 111CE4 00211BE4 01000224 */  addiu      $2, $0, 0x1
/* 111CE8 00211BE8 789682A7 */  sh         $2, -0x6988($gp)
/* 111CEC 00211BEC 7C9680AF */  sw         $0, -0x6984($gp)
/* 111CF0 00211BF0 6C9682AF */  sw         $2, -0x6994($gp)
/* 111CF4 00211BF4 4A000010 */  b          .L00211D20
/* 111CF8 00211BF8 00000000 */   nop
/* 111CFC 00211BFC 04000224 */  addiu      $2, $0, 0x4
/* 111D00 00211C00 549682AF */  sw         $2, -0x69AC($gp)
/* 111D04 00211C04 46000010 */  b          .L00211D20
/* 111D08 00211C08 00000000 */   nop
/* 111D0C 00211C0C D201023C */  lui        $2, %hi(EditPartsInfo)
/* 111D10 00211C10 F09B4224 */  addiu      $2, $2, %lo(EditPartsInfo)
/* 111D14 00211C14 DC9682AF */  sw         $2, -0x6924($gp)
/* 111D18 00211C18 DC96848F */  lw         $4, -0x6924($gp)
/* 111D1C 00211C1C 06008014 */  bnez       $4, .L00211C38
/* 111D20 00211C20 00000000 */   nop
/* 111D24 00211C24 282E0070 */  paddub     $5, $0, $0
/* 111D28 00211C28 1C8D868F */  lw         $6, -0x72E4($gp)
/* 111D2C 00211C2C 01000724 */  addiu      $7, $0, 0x1
/* 111D30 00211C30 FC68060C */  jal        Load__14CEditPartsInfoFiP9CSaveDatai
/* 111D34 00211C34 00000000 */   nop
.L00211C38:
/* 111D38 00211C38 01000224 */  addiu      $2, $0, 0x1
/* 111D3C 00211C3C 5C9682AF */  sw         $2, -0x69A4($gp)
/* 111D40 00211C40 28260070 */  paddub     $4, $0, $0
/* 111D44 00211C44 07000010 */  b          .L00211C64
/* 111D48 00211C48 00000000 */   nop
.L00211C4C:
/* 111D4C 00211C4C 80180400 */  sll        $3, $4, 2
/* 111D50 00211C50 DA01023C */  lui        $2, %hi(AnalyzeFill)
/* 111D54 00211C54 60EF4224 */  addiu      $2, $2, %lo(AnalyzeFill)
/* 111D58 00211C58 21104300 */  addu       $2, $2, $3
/* 111D5C 00211C5C 000040AC */  sw         $0, 0x0($2)
/* 111D60 00211C60 01008424 */  addiu      $4, $4, 0x1
.L00211C64:
/* 111D64 00211C64 03008228 */  slti       $2, $4, 0x3
/* 111D68 00211C68 F8FF4014 */  bnez       $2, .L00211C4C
/* 111D6C 00211C6C 00000000 */   nop
/* 111D70 00211C70 709680A7 */  sh         $0, -0x6990($gp)
/* 111D74 00211C74 749680A7 */  sh         $0, -0x698C($gp)
/* 111D78 00211C78 649680A7 */  sh         $0, -0x699C($gp)
/* 111D7C 00211C7C 909680A7 */  sh         $0, -0x6970($gp)
/* 111D80 00211C80 27000010 */  b          .L00211D20
/* 111D84 00211C84 00000000 */   nop
/* 111D88 00211C88 909680A7 */  sh         $0, -0x6970($gp)
/* 111D8C 00211C8C 01000424 */  addiu      $4, $0, 0x1
/* 111D90 00211C90 789684A7 */  sh         $4, -0x6988($gp)
/* 111D94 00211C94 6C9684AF */  sw         $4, -0x6994($gp)
/* 111D98 00211C98 4896858F */  lw         $5, -0x69B8($gp)
/* 111D9C 00211C9C 28360072 */  paddub     $6, $16, $0
/* 111DA0 00211CA0 C47E080C */  jal        InitMenuSave__FiiP1
/* 111DA4 00211CA4 00000000 */   nop
/* 111DA8 00211CA8 1D000010 */  b          .L00211D20
/* 111DAC 00211CAC 00000000 */   nop
/* 111DB0 00211CB0 01000424 */  addiu      $4, $0, 0x1
/* 111DB4 00211CB4 6C9684AF */  sw         $4, -0x6994($gp)
/* 111DB8 00211CB8 789684A7 */  sh         $4, -0x6988($gp)
/* 111DBC 00211CBC 4896858F */  lw         $5, -0x69B8($gp)
/* 111DC0 00211CC0 28360072 */  paddub     $6, $16, $0
/* 111DC4 00211CC4 3479080C */  jal        InitMenuOption__FiiP1
/* 111DC8 00211CC8 00000000 */   nop
/* 111DCC 00211CCC 14000010 */  b          .L00211D20
/* 111DD0 00211CD0 00000000 */   nop
/* 111DD4 00211CD4 909680A7 */  sh         $0, -0x6970($gp)
/* 111DD8 00211CD8 01000224 */  addiu      $2, $0, 0x1
/* 111DDC 00211CDC 789682A7 */  sh         $2, -0x6988($gp)
/* 111DE0 00211CE0 2900023C */  lui        $2, %hi(_646_4)
/* 111DE4 00211CE4 383D4324 */  addiu      $3, $2, %lo(_646_4)
/* 111DE8 00211CE8 5000A427 */  addiu      $4, $sp, 0x50
/* 111DEC 00211CEC 000062DC */  ld         $2, 0x0($3)
/* 111DF0 00211CF0 080060C4 */  lwc1       $f0, 0x8($3)
/* 111DF4 00211CF4 000082FC */  sd         $2, 0x0($4)
/* 111DF8 00211CF8 080080E4 */  swc1       $f0, 0x8($4)
/* 111DFC 00211CFC 4C96828F */  lw         $2, -0x69B4($gp)
/* 111E00 00211D00 5000A2AF */  sw         $2, 0x50($sp)
/* 111E04 00211D04 4896828F */  lw         $2, -0x69B8($gp)
/* 111E08 00211D08 5400A2AF */  sw         $2, 0x54($sp)
/* 111E0C 00211D0C 5096828F */  lw         $2, -0x69B0($gp)
/* 111E10 00211D10 5800A2AF */  sw         $2, 0x58($sp)
/* 111E14 00211D14 282E0072 */  paddub     $5, $16, $0
/* 111E18 00211D18 74CF080C */  jal        InitMenuManual__FPiP1
/* 111E1C 00211D1C 00000000 */   nop
.L00211D20:
/* 111E20 00211D20 28160070 */  paddub     $2, $0, $0
/* 111E24 00211D24 2000BF7B */  lq         $31, 0x20($sp)
/* 111E28 00211D28 1000B17B */  lq         $17, 0x10($sp)
/* 111E2C 00211D2C 0000B07B */  lq         $16, 0x0($sp)
/* 111E30 00211D30 6000BD27 */  addiu      $sp, $sp, 0x60
/* 111E34 00211D34 0800E003 */  jr         $31
/* 111E38 00211D38 00000000 */   nop
/* 111E3C 00211D3C 00000000 */  nop