.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DebugInfomationIF__Fv
/* B48C0 001B47C0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* B48C4 001B47C4 1000BF7F */  sq         $31, 0x10($sp)
/* B48C8 001B47C8 0000B07F */  sq         $16, 0x0($sp)
/* B48CC 001B47CC CC01023C */  lui        $2, %hi(GamePad)
/* B48D0 001B47D0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B48D4 001B47D4 00040524 */  addiu      $5, $0, 0x400
/* B48D8 001B47D8 1CAE040C */  jal        Down__8CGamePadFi
/* B48DC 001B47DC 00000000 */   nop
/* B48E0 001B47E0 0E004010 */  beqz       $2, .L001B481C
/* B48E4 001B47E4 00000000 */   nop
/* B48E8 001B47E8 D501013C */  lui        $at, (0x1D56460 >> 16)
/* B48EC 001B47EC 606420AC */  sw         $0, (0x1D56460 & 0xFFFF)($at)
/* B48F0 001B47F0 CC01023C */  lui        $2, %hi(GamePad)
/* B48F4 001B47F4 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B48F8 001B47F8 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* B48FC 001B47FC 00000000 */   nop
/* B4900 001B4800 CC01023C */  lui        $2, %hi(GamePad)
/* B4904 001B4804 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B4908 001B4808 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* B490C 001B480C 00000000 */   nop
/* B4910 001B4810 01000224 */  addiu      $2, $0, 0x1
/* B4914 001B4814 83030010 */  b          .L001B5624
/* B4918 001B4818 00000000 */   nop
.L001B481C:
/* B491C 001B481C CC01023C */  lui        $2, %hi(GamePad)
/* B4920 001B4820 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B4924 001B4824 10000524 */  addiu      $5, $0, 0x10
/* B4928 001B4828 1CAE040C */  jal        Down__8CGamePadFi
/* B492C 001B482C 00000000 */   nop
/* B4930 001B4830 1C004010 */  beqz       $2, .L001B48A4
/* B4934 001B4834 00000000 */   nop
/* B4938 001B4838 E493828F */  lw         $2, -0x6C1C($gp)
/* B493C 001B483C 80180200 */  sll        $3, $2, 2
/* B4940 001B4840 2700023C */  lui        $2, %hi(DebugInfoCode)
/* B4944 001B4844 E0B04224 */  addiu      $2, $2, %lo(DebugInfoCode)
/* B4948 001B4848 21104300 */  addu       $2, $2, $3
/* B494C 001B484C 0000438C */  lw         $3, 0x0($2)
/* B4950 001B4850 5A000224 */  addiu      $2, $0, 0x5A
/* B4954 001B4854 03006210 */  beq        $3, $2, .L001B4864
/* B4958 001B4858 00000000 */   nop
/* B495C 001B485C 11000010 */  b          .L001B48A4
/* B4960 001B4860 00000000 */   nop
.L001B4864:
/* B4964 001B4864 D501013C */  lui        $at, (0x1D56460 >> 16)
/* B4968 001B4868 606420AC */  sw         $0, (0x1D56460 & 0xFFFF)($at)
/* B496C 001B486C 01000224 */  addiu      $2, $0, 0x1
/* B4970 001B4870 D501013C */  lui        $at, (0x1D56490 >> 16)
/* B4974 001B4874 906422AC */  sw         $2, (0x1D56490 & 0xFFFF)($at)
/* B4978 001B4878 CC01023C */  lui        $2, %hi(GamePad)
/* B497C 001B487C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B4980 001B4880 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* B4984 001B4884 00000000 */   nop
/* B4988 001B4888 CC01023C */  lui        $2, %hi(GamePad)
/* B498C 001B488C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B4990 001B4890 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* B4994 001B4894 00000000 */   nop
/* B4998 001B4898 28000224 */  addiu      $2, $0, 0x28
/* B499C 001B489C 61030010 */  b          .L001B5624
/* B49A0 001B48A0 00000000 */   nop
.L001B48A4:
/* B49A4 001B48A4 CC01023C */  lui        $2, %hi(GamePad)
/* B49A8 001B48A8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B49AC 001B48AC 20000524 */  addiu      $5, $0, 0x20
/* B49B0 001B48B0 1CAE040C */  jal        Down__8CGamePadFi
/* B49B4 001B48B4 00000000 */   nop
/* B49B8 001B48B8 EC004010 */  beqz       $2, .L001B4C6C
/* B49BC 001B48BC 00000000 */   nop
/* B49C0 001B48C0 E493828F */  lw         $2, -0x6C1C($gp)
/* B49C4 001B48C4 80180200 */  sll        $3, $2, 2
/* B49C8 001B48C8 2700023C */  lui        $2, %hi(DebugInfoCode)
/* B49CC 001B48CC E0B04224 */  addiu      $2, $2, %lo(DebugInfoCode)
/* B49D0 001B48D0 21104300 */  addu       $2, $2, $3
/* B49D4 001B48D4 0000438C */  lw         $3, 0x0($2)
/* B49D8 001B48D8 8C000224 */  addiu      $2, $0, 0x8C
/* B49DC 001B48DC 70006210 */  beq        $3, $2, .L001B4AA0
/* B49E0 001B48E0 00000000 */   nop
/* B49E4 001B48E4 82000224 */  addiu      $2, $0, 0x82
/* B49E8 001B48E8 65006210 */  beq        $3, $2, .L001B4A80
/* B49EC 001B48EC 00000000 */   nop
/* B49F0 001B48F0 78000224 */  addiu      $2, $0, 0x78
/* B49F4 001B48F4 55006210 */  beq        $3, $2, .L001B4A4C
/* B49F8 001B48F8 00000000 */   nop
/* B49FC 001B48FC 5A000224 */  addiu      $2, $0, 0x5A
/* B4A00 001B4900 43006210 */  beq        $3, $2, .L001B4A10
/* B4A04 001B4904 00000000 */   nop
/* B4A08 001B4908 50000224 */  addiu      $2, $0, 0x50
/* B4A0C 001B490C 33006210 */  beq        $3, $2, .L001B49DC
/* B4A10 001B4910 00000000 */   nop
/* B4A14 001B4914 64000224 */  addiu      $2, $0, 0x64
/* B4A18 001B4918 23006210 */  beq        $3, $2, .L001B49A8
/* B4A1C 001B491C 00000000 */   nop
/* B4A20 001B4920 3C000224 */  addiu      $2, $0, 0x3C
/* B4A24 001B4924 13006210 */  beq        $3, $2, .L001B4974
/* B4A28 001B4928 00000000 */   nop
/* B4A2C 001B492C 28000224 */  addiu      $2, $0, 0x28
/* B4A30 001B4930 03006210 */  beq        $3, $2, .L001B4940
/* B4A34 001B4934 00000000 */   nop
/* B4A38 001B4938 CC000010 */  b          .L001B4C6C
/* B4A3C 001B493C 00000000 */   nop
.L001B4940:
/* B4A40 001B4940 D501013C */  lui        $at, (0x1D56460 >> 16)
/* B4A44 001B4944 606420AC */  sw         $0, (0x1D56460 & 0xFFFF)($at)
/* B4A48 001B4948 CC01023C */  lui        $2, %hi(GamePad)
/* B4A4C 001B494C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B4A50 001B4950 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* B4A54 001B4954 00000000 */   nop
/* B4A58 001B4958 CC01023C */  lui        $2, %hi(GamePad)
/* B4A5C 001B495C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B4A60 001B4960 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* B4A64 001B4964 00000000 */   nop
/* B4A68 001B4968 28000224 */  addiu      $2, $0, 0x28
/* B4A6C 001B496C 2D030010 */  b          .L001B5624
/* B4A70 001B4970 00000000 */   nop
.L001B4974:
/* B4A74 001B4974 D501013C */  lui        $at, (0x1D56460 >> 16)
/* B4A78 001B4978 606420AC */  sw         $0, (0x1D56460 & 0xFFFF)($at)
/* B4A7C 001B497C CC01023C */  lui        $2, %hi(GamePad)
/* B4A80 001B4980 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B4A84 001B4984 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* B4A88 001B4988 00000000 */   nop
/* B4A8C 001B498C CC01023C */  lui        $2, %hi(GamePad)
/* B4A90 001B4990 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B4A94 001B4994 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* B4A98 001B4998 00000000 */   nop
/* B4A9C 001B499C 3C000224 */  addiu      $2, $0, 0x3C
/* B4AA0 001B49A0 20030010 */  b          .L001B5624
/* B4AA4 001B49A4 00000000 */   nop
.L001B49A8:
/* B4AA8 001B49A8 D501013C */  lui        $at, (0x1D56460 >> 16)
/* B4AAC 001B49AC 606420AC */  sw         $0, (0x1D56460 & 0xFFFF)($at)
/* B4AB0 001B49B0 CC01023C */  lui        $2, %hi(GamePad)
/* B4AB4 001B49B4 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B4AB8 001B49B8 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* B4ABC 001B49BC 00000000 */   nop
/* B4AC0 001B49C0 CC01023C */  lui        $2, %hi(GamePad)
/* B4AC4 001B49C4 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B4AC8 001B49C8 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* B4ACC 001B49CC 00000000 */   nop
/* B4AD0 001B49D0 64000224 */  addiu      $2, $0, 0x64
/* B4AD4 001B49D4 13030010 */  b          .L001B5624
/* B4AD8 001B49D8 00000000 */   nop
.L001B49DC:
/* B4ADC 001B49DC D501013C */  lui        $at, (0x1D56460 >> 16)
/* B4AE0 001B49E0 606420AC */  sw         $0, (0x1D56460 & 0xFFFF)($at)
/* B4AE4 001B49E4 CC01023C */  lui        $2, %hi(GamePad)
/* B4AE8 001B49E8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B4AEC 001B49EC 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* B4AF0 001B49F0 00000000 */   nop
/* B4AF4 001B49F4 CC01023C */  lui        $2, %hi(GamePad)
/* B4AF8 001B49F8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B4AFC 001B49FC 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* B4B00 001B4A00 00000000 */   nop
/* B4B04 001B4A04 50000224 */  addiu      $2, $0, 0x50
/* B4B08 001B4A08 06030010 */  b          .L001B5624
/* B4B0C 001B4A0C 00000000 */   nop
.L001B4A10:
/* B4B10 001B4A10 D501013C */  lui        $at, (0x1D56460 >> 16)
/* B4B14 001B4A14 606420AC */  sw         $0, (0x1D56460 & 0xFFFF)($at)
/* B4B18 001B4A18 D501013C */  lui        $at, (0x1D56490 >> 16)
/* B4B1C 001B4A1C 906420AC */  sw         $0, (0x1D56490 & 0xFFFF)($at)
/* B4B20 001B4A20 CC01023C */  lui        $2, %hi(GamePad)
/* B4B24 001B4A24 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B4B28 001B4A28 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* B4B2C 001B4A2C 00000000 */   nop
/* B4B30 001B4A30 CC01023C */  lui        $2, %hi(GamePad)
/* B4B34 001B4A34 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B4B38 001B4A38 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* B4B3C 001B4A3C 00000000 */   nop
/* B4B40 001B4A40 5A000224 */  addiu      $2, $0, 0x5A
/* B4B44 001B4A44 F7020010 */  b          .L001B5624
/* B4B48 001B4A48 00000000 */   nop
.L001B4A4C:
/* B4B4C 001B4A4C D501013C */  lui        $at, (0x1D56460 >> 16)
/* B4B50 001B4A50 606420AC */  sw         $0, (0x1D56460 & 0xFFFF)($at)
/* B4B54 001B4A54 CC01023C */  lui        $2, %hi(GamePad)
/* B4B58 001B4A58 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B4B5C 001B4A5C 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* B4B60 001B4A60 00000000 */   nop
/* B4B64 001B4A64 CC01023C */  lui        $2, %hi(GamePad)
/* B4B68 001B4A68 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B4B6C 001B4A6C 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* B4B70 001B4A70 00000000 */   nop
/* B4B74 001B4A74 78000224 */  addiu      $2, $0, 0x78
/* B4B78 001B4A78 EA020010 */  b          .L001B5624
/* B4B7C 001B4A7C 00000000 */   nop
.L001B4A80:
/* B4B80 001B4A80 D501013C */  lui        $at, (0x1D564A8 >> 16)
/* B4B84 001B4A84 A864248C */  lw         $4, (0x1D564A8 & 0xFFFF)($at)
/* B4B88 001B4A88 FFFF0524 */  addiu      $5, $0, -0x1
/* B4B8C 001B4A8C 28360070 */  paddub     $6, $0, $0
/* B4B90 001B4A90 AC69050C */  jal        SndSePlay__Fiii
/* B4B94 001B4A94 00000000 */   nop
/* B4B98 001B4A98 74000010 */  b          .L001B4C6C
/* B4B9C 001B4A9C 00000000 */   nop
.L001B4AA0:
/* B4BA0 001B4AA0 D501013C */  lui        $at, (0x1D56460 >> 16)
/* B4BA4 001B4AA4 606420AC */  sw         $0, (0x1D56460 & 0xFFFF)($at)
/* B4BA8 001B4AA8 CC01023C */  lui        $2, %hi(GamePad)
/* B4BAC 001B4AAC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B4BB0 001B4AB0 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* B4BB4 001B4AB4 00000000 */   nop
/* B4BB8 001B4AB8 CC01023C */  lui        $2, %hi(GamePad)
/* B4BBC 001B4ABC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B4BC0 001B4AC0 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* B4BC4 001B4AC4 00000000 */   nop
/* B4BC8 001B4AC8 D09C858F */  lw         $5, -0x6330($gp)
/* B4BCC 001B4ACC 28260070 */  paddub     $4, $0, $0
/* B4BD0 001B4AD0 0A000010 */  b          .L001B4AFC
/* B4BD4 001B4AD4 00000000 */   nop
.L001B4AD8:
/* B4BD8 001B4AD8 80110400 */  sll        $2, $4, 6
/* B4BDC 001B4ADC 2118A200 */  addu       $3, $5, $2
/* B4BE0 001B4AE0 001060AC */  sw         $0, 0x1000($3)
/* B4BE4 001B4AE4 341060AC */  sw         $0, 0x1034($3)
/* B4BE8 001B4AE8 381060AC */  sw         $0, 0x1038($3)
/* B4BEC 001B4AEC 301060AC */  sw         $0, 0x1030($3)
/* B4BF0 001B4AF0 FFFF0224 */  addiu      $2, $0, -0x1
/* B4BF4 001B4AF4 3C1062AC */  sw         $2, 0x103C($3)
/* B4BF8 001B4AF8 01008424 */  addiu      $4, $4, 0x1
.L001B4AFC:
/* B4BFC 001B4AFC 60008228 */  slti       $2, $4, 0x60
/* B4C00 001B4B00 F5FF4014 */  bnez       $2, .L001B4AD8
/* B4C04 001B4B04 00000000 */   nop
/* B4C08 001B4B08 C89C848F */  lw         $4, -0x6338($gp)
/* B4C0C 001B4B0C D501013C */  lui        $at, (0x1D564AC >> 16)
/* B4C10 001B4B10 AC64258C */  lw         $5, (0x1D564AC & 0xFFFF)($at)
/* B4C14 001B4B14 8C2C070C */  jal        SetCharaDoor__11CDungeonMapFi
/* B4C18 001B4B18 00000000 */   nop
/* B4C1C 001B4B1C 2A00033C */  lui        $3, %hi(_1825)
/* B4C20 001B4B20 E8BA6424 */  addiu      $4, $3, %lo(_1825)
/* B4C24 001B4B24 282E4070 */  paddub     $5, $2, $0
/* B4C28 001B4B28 A611040C */  jal        printf
/* B4C2C 001B4B2C 00000000 */   nop
/* B4C30 001B4B30 C89C858F */  lw         $5, -0x6338($gp)
/* B4C34 001B4B34 28260070 */  paddub     $4, $0, $0
/* B4C38 001B4B38 0D000010 */  b          .L001B4B70
/* B4C3C 001B4B3C 00000000 */   nop
.L001B4B40:
/* B4C40 001B4B40 FFFF0324 */  addiu      $3, $0, -0x1
/* B4C44 001B4B44 80100400 */  sll        $2, $4, 2
/* B4C48 001B4B48 21104400 */  addu       $2, $2, $4
/* B4C4C 001B4B4C 00110200 */  sll        $2, $2, 4
/* B4C50 001B4B50 21104500 */  addu       $2, $2, $5
/* B4C54 001B4B54 0100013C */  lui        $at, (0x10000 >> 16)
/* B4C58 001B4B58 21084100 */  addu       $at, $2, $at
/* B4C5C 001B4B5C 588D23AC */  sw         $3, -0x72A8($at)
/* B4C60 001B4B60 0100013C */  lui        $at, (0x10000 >> 16)
/* B4C64 001B4B64 21084100 */  addu       $at, $2, $at
/* B4C68 001B4B68 7C8D20AC */  sw         $0, -0x7284($at)
/* B4C6C 001B4B6C 01008424 */  addiu      $4, $4, 0x1
.L001B4B70:
/* B4C70 001B4B70 30008228 */  slti       $2, $4, 0x30
/* B4C74 001B4B74 F2FF4014 */  bnez       $2, .L001B4B40
/* B4C78 001B4B78 00000000 */   nop
/* B4C7C 001B4B7C 28260070 */  paddub     $4, $0, $0
/* B4C80 001B4B80 0D000010 */  b          .L001B4BB8
/* B4C84 001B4B84 00000000 */   nop
.L001B4B88:
/* B4C88 001B4B88 80110400 */  sll        $2, $4, 6
/* B4C8C 001B4B8C 21104500 */  addu       $2, $2, $5
/* B4C90 001B4B90 0100013C */  lui        $at, (0x10000 >> 16)
/* B4C94 001B4B94 21084100 */  addu       $at, $2, $at
/* B4C98 001B4B98 60B620AC */  sw         $0, -0x49A0($at)
/* B4C9C 001B4B9C 0100013C */  lui        $at, (0x10000 >> 16)
/* B4CA0 001B4BA0 21084100 */  addu       $at, $2, $at
/* B4CA4 001B4BA4 8CB620AC */  sw         $0, -0x4974($at)
/* B4CA8 001B4BA8 0100013C */  lui        $at, (0x10000 >> 16)
/* B4CAC 001B4BAC 21084100 */  addu       $at, $2, $at
/* B4CB0 001B4BB0 90B620AC */  sw         $0, -0x4970($at)
/* B4CB4 001B4BB4 01008424 */  addiu      $4, $4, 0x1
.L001B4BB8:
/* B4CB8 001B4BB8 18008228 */  slti       $2, $4, 0x18
/* B4CBC 001B4BBC F2FF4014 */  bnez       $2, .L001B4B88
/* B4CC0 001B4BC0 00000000 */   nop
/* B4CC4 001B4BC4 0100013C */  lui        $at, (0x10000 >> 16)
/* B4CC8 001B4BC8 2108A100 */  addu       $at, $5, $at
/* B4CCC 001B4BCC 60BC20AC */  sw         $0, -0x43A0($at)
/* B4CD0 001B4BD0 28260070 */  paddub     $4, $0, $0
/* B4CD4 001B4BD4 07000010 */  b          .L001B4BF4
/* B4CD8 001B4BD8 00000000 */   nop
.L001B4BDC:
/* B4CDC 001B4BDC 40110400 */  sll        $2, $4, 5
/* B4CE0 001B4BE0 21104500 */  addu       $2, $2, $5
/* B4CE4 001B4BE4 0100013C */  lui        $at, (0x10000 >> 16)
/* B4CE8 001B4BE8 21084100 */  addu       $at, $2, $at
/* B4CEC 001B4BEC 94BC20AC */  sw         $0, -0x436C($at)
/* B4CF0 001B4BF0 01008424 */  addiu      $4, $4, 0x1
.L001B4BF4:
/* B4CF4 001B4BF4 08008228 */  slti       $2, $4, 0x8
/* B4CF8 001B4BF8 F8FF4014 */  bnez       $2, .L001B4BDC
/* B4CFC 001B4BFC 00000000 */   nop
/* B4D00 001B4C00 0100013C */  lui        $at, (0x10000 >> 16)
/* B4D04 001B4C04 2108A100 */  addu       $at, $5, $at
/* B4D08 001B4C08 80BD20AC */  sw         $0, -0x4280($at)
/* B4D0C 001B4C0C 28260070 */  paddub     $4, $0, $0
/* B4D10 001B4C10 09000010 */  b          .L001B4C38
/* B4D14 001B4C14 00000000 */   nop
.L001B4C18:
/* B4D18 001B4C18 40100400 */  sll        $2, $4, 1
/* B4D1C 001B4C1C 21104400 */  addu       $2, $2, $4
/* B4D20 001B4C20 C0100200 */  sll        $2, $2, 3
/* B4D24 001B4C24 21104500 */  addu       $2, $2, $5
/* B4D28 001B4C28 0100013C */  lui        $at, (0x10000 >> 16)
/* B4D2C 001B4C2C 21084100 */  addu       $at, $2, $at
/* B4D30 001B4C30 9CBD20AC */  sw         $0, -0x4264($at)
/* B4D34 001B4C34 01008424 */  addiu      $4, $4, 0x1
.L001B4C38:
/* B4D38 001B4C38 04008228 */  slti       $2, $4, 0x4
/* B4D3C 001B4C3C F6FF4014 */  bnez       $2, .L001B4C18
/* B4D40 001B4C40 00000000 */   nop
/* B4D44 001B4C44 C89C858F */  lw         $5, -0x6338($gp)
/* B4D48 001B4C48 0100013C */  lui        $at, (0x10000 >> 16)
/* B4D4C 001B4C4C 2108A100 */  addu       $at, $5, $at
/* B4D50 001B4C50 ECBD268C */  lw         $6, -0x4214($at)
/* B4D54 001B4C54 D09C848F */  lw         $4, -0x6330($gp)
/* B4D58 001B4C58 D033070C */  jal        SetupEvent__16CDungeonEventManFP11CDungeonMapi
/* B4D5C 001B4C5C 00000000 */   nop
/* B4D60 001B4C60 8C000224 */  addiu      $2, $0, 0x8C
/* B4D64 001B4C64 6F020010 */  b          .L001B5624
/* B4D68 001B4C68 00000000 */   nop
.L001B4C6C:
/* B4D6C 001B4C6C 28860070 */  paddub     $16, $0, $0
/* B4D70 001B4C70 02000010 */  b          .L001B4C7C
/* B4D74 001B4C74 00000000 */   nop
.L001B4C78:
/* B4D78 001B4C78 01001026 */  addiu      $16, $16, 0x1
.L001B4C7C:
/* B4D7C 001B4C7C 80181000 */  sll        $3, $16, 2
/* B4D80 001B4C80 2700023C */  lui        $2, %hi(DebugInfoCode)
/* B4D84 001B4C84 E0B04224 */  addiu      $2, $2, %lo(DebugInfoCode)
/* B4D88 001B4C88 21104300 */  addu       $2, $2, $3
/* B4D8C 001B4C8C 0000438C */  lw         $3, 0x0($2)
/* B4D90 001B4C90 FFFF0224 */  addiu      $2, $0, -0x1
/* B4D94 001B4C94 F8FF6214 */  bne        $3, $2, .L001B4C78
/* B4D98 001B4C98 00000000 */   nop
/* B4D9C 001B4C9C D501013C */  lui        $at, (0x1D56468 >> 16)
/* B4DA0 001B4CA0 6864228C */  lw         $2, (0x1D56468 & 0xFFFF)($at)
/* B4DA4 001B4CA4 03004010 */  beqz       $2, .L001B4CB4
/* B4DA8 001B4CA8 00000000 */   nop
/* B4DAC 001B4CAC 5C020010 */  b          .L001B5620
/* B4DB0 001B4CB0 00000000 */   nop
.L001B4CB4:
/* B4DB4 001B4CB4 CC01023C */  lui        $2, %hi(GamePad)
/* B4DB8 001B4CB8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B4DBC 001B4CBC 00400524 */  addiu      $5, $0, 0x4000
/* B4DC0 001B4CC0 1CAE040C */  jal        Down__8CGamePadFi
/* B4DC4 001B4CC4 00000000 */   nop
/* B4DC8 001B4CC8 0A004010 */  beqz       $2, .L001B4CF4
/* B4DCC 001B4CCC 00000000 */   nop
/* B4DD0 001B4CD0 E493838F */  lw         $3, -0x6C1C($gp)
/* B4DD4 001B4CD4 FFFF0226 */  addiu      $2, $16, -0x1
/* B4DD8 001B4CD8 04006214 */  bne        $3, $2, .L001B4CEC
/* B4DDC 001B4CDC 00000000 */   nop
/* B4DE0 001B4CE0 E49380AF */  sw         $0, -0x6C1C($gp)
/* B4DE4 001B4CE4 03000010 */  b          .L001B4CF4
/* B4DE8 001B4CE8 00000000 */   nop
.L001B4CEC:
/* B4DEC 001B4CEC 01006224 */  addiu      $2, $3, 0x1
/* B4DF0 001B4CF0 E49382AF */  sw         $2, -0x6C1C($gp)
.L001B4CF4:
/* B4DF4 001B4CF4 CC01023C */  lui        $2, %hi(GamePad)
/* B4DF8 001B4CF8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B4DFC 001B4CFC 00100524 */  addiu      $5, $0, 0x1000
/* B4E00 001B4D00 1CAE040C */  jal        Down__8CGamePadFi
/* B4E04 001B4D04 00000000 */   nop
/* B4E08 001B4D08 0A004010 */  beqz       $2, .L001B4D34
/* B4E0C 001B4D0C 00000000 */   nop
/* B4E10 001B4D10 E493828F */  lw         $2, -0x6C1C($gp)
/* B4E14 001B4D14 05004014 */  bnez       $2, .L001B4D2C
/* B4E18 001B4D18 00000000 */   nop
/* B4E1C 001B4D1C FFFF0226 */  addiu      $2, $16, -0x1
/* B4E20 001B4D20 E49382AF */  sw         $2, -0x6C1C($gp)
/* B4E24 001B4D24 03000010 */  b          .L001B4D34
/* B4E28 001B4D28 00000000 */   nop
.L001B4D2C:
/* B4E2C 001B4D2C FFFF4224 */  addiu      $2, $2, -0x1
/* B4E30 001B4D30 E49382AF */  sw         $2, -0x6C1C($gp)
.L001B4D34:
/* B4E34 001B4D34 CC01023C */  lui        $2, %hi(GamePad)
/* B4E38 001B4D38 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B4E3C 001B4D3C 00200524 */  addiu      $5, $0, 0x2000
/* B4E40 001B4D40 1CAE040C */  jal        Down__8CGamePadFi
/* B4E44 001B4D44 00000000 */   nop
/* B4E48 001B4D48 DB004010 */  beqz       $2, .L001B50B8
/* B4E4C 001B4D4C 00000000 */   nop
/* B4E50 001B4D50 E493828F */  lw         $2, -0x6C1C($gp)
/* B4E54 001B4D54 80180200 */  sll        $3, $2, 2
/* B4E58 001B4D58 2700023C */  lui        $2, %hi(DebugInfoCode)
/* B4E5C 001B4D5C E0B04224 */  addiu      $2, $2, %lo(DebugInfoCode)
/* B4E60 001B4D60 21104300 */  addu       $2, $2, $3
/* B4E64 001B4D64 0000438C */  lw         $3, 0x0($2)
/* B4E68 001B4D68 8C000224 */  addiu      $2, $0, 0x8C
/* B4E6C 001B4D6C C6006210 */  beq        $3, $2, .L001B5088
/* B4E70 001B4D70 00000000 */   nop
/* B4E74 001B4D74 82000224 */  addiu      $2, $0, 0x82
/* B4E78 001B4D78 BC006210 */  beq        $3, $2, .L001B506C
/* B4E7C 001B4D7C 00000000 */   nop
/* B4E80 001B4D80 78000224 */  addiu      $2, $0, 0x78
/* B4E84 001B4D84 AB006210 */  beq        $3, $2, .L001B5034
/* B4E88 001B4D88 00000000 */   nop
/* B4E8C 001B4D8C 6E000224 */  addiu      $2, $0, 0x6E
/* B4E90 001B4D90 9B006210 */  beq        $3, $2, .L001B5000
/* B4E94 001B4D94 00000000 */   nop
/* B4E98 001B4D98 5A000224 */  addiu      $2, $0, 0x5A
/* B4E9C 001B4D9C 91006210 */  beq        $3, $2, .L001B4FE4
/* B4EA0 001B4DA0 00000000 */   nop
/* B4EA4 001B4DA4 29000224 */  addiu      $2, $0, 0x29
/* B4EA8 001B4DA8 75006210 */  beq        $3, $2, .L001B4F80
/* B4EAC 001B4DAC 00000000 */   nop
/* B4EB0 001B4DB0 64000224 */  addiu      $2, $0, 0x64
/* B4EB4 001B4DB4 64006210 */  beq        $3, $2, .L001B4F48
/* B4EB8 001B4DB8 00000000 */   nop
/* B4EBC 001B4DBC 96000224 */  addiu      $2, $0, 0x96
/* B4EC0 001B4DC0 53006210 */  beq        $3, $2, .L001B4F10
/* B4EC4 001B4DC4 00000000 */   nop
/* B4EC8 001B4DC8 46000224 */  addiu      $2, $0, 0x46
/* B4ECC 001B4DCC 43006210 */  beq        $3, $2, .L001B4EDC
/* B4ED0 001B4DD0 00000000 */   nop
/* B4ED4 001B4DD4 32000224 */  addiu      $2, $0, 0x32
/* B4ED8 001B4DD8 33006210 */  beq        $3, $2, .L001B4EA8
/* B4EDC 001B4DDC 00000000 */   nop
/* B4EE0 001B4DE0 1E000224 */  addiu      $2, $0, 0x1E
/* B4EE4 001B4DE4 23006210 */  beq        $3, $2, .L001B4E74
/* B4EE8 001B4DE8 00000000 */   nop
/* B4EEC 001B4DEC 14000224 */  addiu      $2, $0, 0x14
/* B4EF0 001B4DF0 13006210 */  beq        $3, $2, .L001B4E40
/* B4EF4 001B4DF4 00000000 */   nop
/* B4EF8 001B4DF8 0A000224 */  addiu      $2, $0, 0xA
/* B4EFC 001B4DFC 03006210 */  beq        $3, $2, .L001B4E0C
/* B4F00 001B4E00 00000000 */   nop
/* B4F04 001B4E04 AC000010 */  b          .L001B50B8
/* B4F08 001B4E08 00000000 */   nop
.L001B4E0C:
/* B4F0C 001B4E0C D501013C */  lui        $at, (0x1D5646C >> 16)
/* B4F10 001B4E10 6C64228C */  lw         $2, (0x1D5646C & 0xFFFF)($at)
/* B4F14 001B4E14 06004014 */  bnez       $2, .L001B4E30
/* B4F18 001B4E18 00000000 */   nop
/* B4F1C 001B4E1C 01000224 */  addiu      $2, $0, 0x1
/* B4F20 001B4E20 D501013C */  lui        $at, (0x1D5646C >> 16)
/* B4F24 001B4E24 6C6422AC */  sw         $2, (0x1D5646C & 0xFFFF)($at)
/* B4F28 001B4E28 A3000010 */  b          .L001B50B8
/* B4F2C 001B4E2C 00000000 */   nop
.L001B4E30:
/* B4F30 001B4E30 D501013C */  lui        $at, (0x1D5646C >> 16)
/* B4F34 001B4E34 6C6420AC */  sw         $0, (0x1D5646C & 0xFFFF)($at)
/* B4F38 001B4E38 9F000010 */  b          .L001B50B8
/* B4F3C 001B4E3C 00000000 */   nop
.L001B4E40:
/* B4F40 001B4E40 D501013C */  lui        $at, (0x1D56474 >> 16)
/* B4F44 001B4E44 7464228C */  lw         $2, (0x1D56474 & 0xFFFF)($at)
/* B4F48 001B4E48 06004014 */  bnez       $2, .L001B4E64
/* B4F4C 001B4E4C 00000000 */   nop
/* B4F50 001B4E50 01000224 */  addiu      $2, $0, 0x1
/* B4F54 001B4E54 D501013C */  lui        $at, (0x1D56474 >> 16)
/* B4F58 001B4E58 746422AC */  sw         $2, (0x1D56474 & 0xFFFF)($at)
/* B4F5C 001B4E5C 96000010 */  b          .L001B50B8
/* B4F60 001B4E60 00000000 */   nop
.L001B4E64:
/* B4F64 001B4E64 D501013C */  lui        $at, (0x1D56474 >> 16)
/* B4F68 001B4E68 746420AC */  sw         $0, (0x1D56474 & 0xFFFF)($at)
/* B4F6C 001B4E6C 92000010 */  b          .L001B50B8
/* B4F70 001B4E70 00000000 */   nop
.L001B4E74:
/* B4F74 001B4E74 D501013C */  lui        $at, (0x1D56478 >> 16)
/* B4F78 001B4E78 7864228C */  lw         $2, (0x1D56478 & 0xFFFF)($at)
/* B4F7C 001B4E7C 06004014 */  bnez       $2, .L001B4E98
/* B4F80 001B4E80 00000000 */   nop
/* B4F84 001B4E84 01000224 */  addiu      $2, $0, 0x1
/* B4F88 001B4E88 D501013C */  lui        $at, (0x1D56478 >> 16)
/* B4F8C 001B4E8C 786422AC */  sw         $2, (0x1D56478 & 0xFFFF)($at)
/* B4F90 001B4E90 89000010 */  b          .L001B50B8
/* B4F94 001B4E94 00000000 */   nop
.L001B4E98:
/* B4F98 001B4E98 D501013C */  lui        $at, (0x1D56478 >> 16)
/* B4F9C 001B4E9C 786420AC */  sw         $0, (0x1D56478 & 0xFFFF)($at)
/* B4FA0 001B4EA0 85000010 */  b          .L001B50B8
/* B4FA4 001B4EA4 00000000 */   nop
.L001B4EA8:
/* B4FA8 001B4EA8 D501013C */  lui        $at, (0x1D56470 >> 16)
/* B4FAC 001B4EAC 7064228C */  lw         $2, (0x1D56470 & 0xFFFF)($at)
/* B4FB0 001B4EB0 06004014 */  bnez       $2, .L001B4ECC
/* B4FB4 001B4EB4 00000000 */   nop
/* B4FB8 001B4EB8 01000224 */  addiu      $2, $0, 0x1
/* B4FBC 001B4EBC D501013C */  lui        $at, (0x1D56470 >> 16)
/* B4FC0 001B4EC0 706422AC */  sw         $2, (0x1D56470 & 0xFFFF)($at)
/* B4FC4 001B4EC4 7C000010 */  b          .L001B50B8
/* B4FC8 001B4EC8 00000000 */   nop
.L001B4ECC:
/* B4FCC 001B4ECC D501013C */  lui        $at, (0x1D56470 >> 16)
/* B4FD0 001B4ED0 706420AC */  sw         $0, (0x1D56470 & 0xFFFF)($at)
/* B4FD4 001B4ED4 78000010 */  b          .L001B50B8
/* B4FD8 001B4ED8 00000000 */   nop
.L001B4EDC:
/* B4FDC 001B4EDC D501013C */  lui        $at, (0x1D56488 >> 16)
/* B4FE0 001B4EE0 8864228C */  lw         $2, (0x1D56488 & 0xFFFF)($at)
/* B4FE4 001B4EE4 06004014 */  bnez       $2, .L001B4F00
/* B4FE8 001B4EE8 00000000 */   nop
/* B4FEC 001B4EEC 01000224 */  addiu      $2, $0, 0x1
/* B4FF0 001B4EF0 D501013C */  lui        $at, (0x1D56488 >> 16)
/* B4FF4 001B4EF4 886422AC */  sw         $2, (0x1D56488 & 0xFFFF)($at)
/* B4FF8 001B4EF8 6F000010 */  b          .L001B50B8
/* B4FFC 001B4EFC 00000000 */   nop
.L001B4F00:
/* B5000 001B4F00 D501013C */  lui        $at, (0x1D56488 >> 16)
/* B5004 001B4F04 886420AC */  sw         $0, (0x1D56488 & 0xFFFF)($at)
/* B5008 001B4F08 6B000010 */  b          .L001B50B8
/* B500C 001B4F0C 00000000 */   nop
.L001B4F10:
/* B5010 001B4F10 D501013C */  lui        $at, (0x1D564B0 >> 16)
/* B5014 001B4F14 B064238C */  lw         $3, (0x1D564B0 & 0xFFFF)($at)
/* B5018 001B4F18 02000224 */  addiu      $2, $0, 0x2
/* B501C 001B4F1C 05006214 */  bne        $3, $2, .L001B4F34
/* B5020 001B4F20 00000000 */   nop
/* B5024 001B4F24 D501013C */  lui        $at, (0x1D564B0 >> 16)
/* B5028 001B4F28 B06420AC */  sw         $0, (0x1D564B0 & 0xFFFF)($at)
/* B502C 001B4F2C 62000010 */  b          .L001B50B8
/* B5030 001B4F30 00000000 */   nop
.L001B4F34:
/* B5034 001B4F34 01006224 */  addiu      $2, $3, 0x1
/* B5038 001B4F38 D501013C */  lui        $at, (0x1D564B0 >> 16)
/* B503C 001B4F3C B06422AC */  sw         $2, (0x1D564B0 & 0xFFFF)($at)
/* B5040 001B4F40 5D000010 */  b          .L001B50B8
/* B5044 001B4F44 00000000 */   nop
.L001B4F48:
/* B5048 001B4F48 D501013C */  lui        $at, (0x1D56498 >> 16)
/* B504C 001B4F4C 9864228C */  lw         $2, (0x1D56498 & 0xFFFF)($at)
/* B5050 001B4F50 04004128 */  slti       $at, $2, 0x4
/* B5054 001B4F54 06002010 */  beqz       $at, .L001B4F70
/* B5058 001B4F58 00000000 */   nop
/* B505C 001B4F5C 01004224 */  addiu      $2, $2, 0x1
/* B5060 001B4F60 D501013C */  lui        $at, (0x1D56498 >> 16)
/* B5064 001B4F64 986422AC */  sw         $2, (0x1D56498 & 0xFFFF)($at)
/* B5068 001B4F68 53000010 */  b          .L001B50B8
/* B506C 001B4F6C 00000000 */   nop
.L001B4F70:
/* B5070 001B4F70 D501013C */  lui        $at, (0x1D56498 >> 16)
/* B5074 001B4F74 986420AC */  sw         $0, (0x1D56498 & 0xFFFF)($at)
/* B5078 001B4F78 4F000010 */  b          .L001B50B8
/* B507C 001B4F7C 00000000 */   nop
.L001B4F80:
/* B5080 001B4F80 D501013C */  lui        $at, (0x1D56484 >> 16)
/* B5084 001B4F84 8464228C */  lw         $2, (0x1D56484 & 0xFFFF)($at)
/* B5088 001B4F88 01004224 */  addiu      $2, $2, 0x1
/* B508C 001B4F8C D501013C */  lui        $at, (0x1D56484 >> 16)
/* B5090 001B4F90 846422AC */  sw         $2, (0x1D56484 & 0xFFFF)($at)
/* B5094 001B4F94 D501013C */  lui        $at, (0x1D56484 >> 16)
/* B5098 001B4F98 8464238C */  lw         $3, (0x1D56484 & 0xFFFF)($at)
/* B509C 001B4F9C FFFF0224 */  addiu      $2, $0, -0x1
/* B50A0 001B4FA0 0C006210 */  beq        $3, $2, .L001B4FD4
/* B50A4 001B4FA4 00000000 */   nop
/* B50A8 001B4FA8 80100300 */  sll        $2, $3, 2
/* B50AC 001B4FAC 21104300 */  addu       $2, $2, $3
/* B50B0 001B4FB0 40100200 */  sll        $2, $2, 1
/* B50B4 001B4FB4 64004424 */  addiu      $4, $2, 0x64
/* B50B8 001B4FB8 5866050C */  jal        SndBgmLoad__Fi
/* B50BC 001B4FBC 00000000 */   nop
/* B50C0 001B4FC0 28260070 */  paddub     $4, $0, $0
/* B50C4 001B4FC4 CC66050C */  jal        SndBgmPlay__Fi
/* B50C8 001B4FC8 00000000 */   nop
/* B50CC 001B4FCC 3A000010 */  b          .L001B50B8
/* B50D0 001B4FD0 00000000 */   nop
.L001B4FD4:
/* B50D4 001B4FD4 E866050C */  jal        SndBgmStop__Fv
/* B50D8 001B4FD8 00000000 */   nop
/* B50DC 001B4FDC 36000010 */  b          .L001B50B8
/* B50E0 001B4FE0 00000000 */   nop
.L001B4FE4:
/* B50E4 001B4FE4 D501013C */  lui        $at, (0x1D5648C >> 16)
/* B50E8 001B4FE8 8C64228C */  lw         $2, (0x1D5648C & 0xFFFF)($at)
/* B50EC 001B4FEC 01004224 */  addiu      $2, $2, 0x1
/* B50F0 001B4FF0 D501013C */  lui        $at, (0x1D5648C >> 16)
/* B50F4 001B4FF4 8C6422AC */  sw         $2, (0x1D5648C & 0xFFFF)($at)
/* B50F8 001B4FF8 2F000010 */  b          .L001B50B8
/* B50FC 001B4FFC 00000000 */   nop
.L001B5000:
/* B5100 001B5000 D501013C */  lui        $at, (0x1D564A0 >> 16)
/* B5104 001B5004 A064228C */  lw         $2, (0x1D564A0 & 0xFFFF)($at)
/* B5108 001B5008 06004014 */  bnez       $2, .L001B5024
/* B510C 001B500C 00000000 */   nop
/* B5110 001B5010 01000224 */  addiu      $2, $0, 0x1
/* B5114 001B5014 D501013C */  lui        $at, (0x1D564A0 >> 16)
/* B5118 001B5018 A06422AC */  sw         $2, (0x1D564A0 & 0xFFFF)($at)
/* B511C 001B501C 26000010 */  b          .L001B50B8
/* B5120 001B5020 00000000 */   nop
.L001B5024:
/* B5124 001B5024 D501013C */  lui        $at, (0x1D564A0 >> 16)
/* B5128 001B5028 A06420AC */  sw         $0, (0x1D564A0 & 0xFFFF)($at)
/* B512C 001B502C 22000010 */  b          .L001B50B8
/* B5130 001B5030 00000000 */   nop
.L001B5034:
/* B5134 001B5034 D501013C */  lui        $at, (0x1D564A4 >> 16)
/* B5138 001B5038 A464238C */  lw         $3, (0x1D564A4 & 0xFFFF)($at)
/* B513C 001B503C 05000224 */  addiu      $2, $0, 0x5
/* B5140 001B5040 05006214 */  bne        $3, $2, .L001B5058
/* B5144 001B5044 00000000 */   nop
/* B5148 001B5048 D501013C */  lui        $at, (0x1D564A4 >> 16)
/* B514C 001B504C A46420AC */  sw         $0, (0x1D564A4 & 0xFFFF)($at)
/* B5150 001B5050 19000010 */  b          .L001B50B8
/* B5154 001B5054 00000000 */   nop
.L001B5058:
/* B5158 001B5058 01006224 */  addiu      $2, $3, 0x1
/* B515C 001B505C D501013C */  lui        $at, (0x1D564A4 >> 16)
/* B5160 001B5060 A46422AC */  sw         $2, (0x1D564A4 & 0xFFFF)($at)
/* B5164 001B5064 14000010 */  b          .L001B50B8
/* B5168 001B5068 00000000 */   nop
.L001B506C:
/* B516C 001B506C D501013C */  lui        $at, (0x1D564A8 >> 16)
/* B5170 001B5070 A864228C */  lw         $2, (0x1D564A8 & 0xFFFF)($at)
/* B5174 001B5074 01004224 */  addiu      $2, $2, 0x1
/* B5178 001B5078 D501013C */  lui        $at, (0x1D564A8 >> 16)
/* B517C 001B507C A86422AC */  sw         $2, (0x1D564A8 & 0xFFFF)($at)
/* B5180 001B5080 0D000010 */  b          .L001B50B8
/* B5184 001B5084 00000000 */   nop
.L001B5088:
/* B5188 001B5088 D501013C */  lui        $at, (0x1D564AC >> 16)
/* B518C 001B508C AC64238C */  lw         $3, (0x1D564AC & 0xFFFF)($at)
/* B5190 001B5090 05006228 */  slti       $2, $3, 0x5
/* B5194 001B5094 05004014 */  bnez       $2, .L001B50AC
/* B5198 001B5098 00000000 */   nop
/* B519C 001B509C D501013C */  lui        $at, (0x1D564AC >> 16)
/* B51A0 001B50A0 AC6420AC */  sw         $0, (0x1D564AC & 0xFFFF)($at)
/* B51A4 001B50A4 04000010 */  b          .L001B50B8
/* B51A8 001B50A8 00000000 */   nop
.L001B50AC:
/* B51AC 001B50AC 01006224 */  addiu      $2, $3, 0x1
/* B51B0 001B50B0 D501013C */  lui        $at, (0x1D564AC >> 16)
/* B51B4 001B50B4 AC6422AC */  sw         $2, (0x1D564AC & 0xFFFF)($at)
.L001B50B8:
/* B51B8 001B50B8 CC01023C */  lui        $2, %hi(GamePad)
/* B51BC 001B50BC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B51C0 001B50C0 00800534 */  ori        $5, $0, 0x8000
/* B51C4 001B50C4 1CAE040C */  jal        Down__8CGamePadFi
/* B51C8 001B50C8 00000000 */   nop
/* B51CC 001B50CC E0004010 */  beqz       $2, .L001B5450
/* B51D0 001B50D0 00000000 */   nop
/* B51D4 001B50D4 E493828F */  lw         $2, -0x6C1C($gp)
/* B51D8 001B50D8 80180200 */  sll        $3, $2, 2
/* B51DC 001B50DC 2700023C */  lui        $2, %hi(DebugInfoCode)
/* B51E0 001B50E0 E0B04224 */  addiu      $2, $2, %lo(DebugInfoCode)
/* B51E4 001B50E4 21104300 */  addu       $2, $2, $3
/* B51E8 001B50E8 0000438C */  lw         $3, 0x0($2)
/* B51EC 001B50EC 8C000224 */  addiu      $2, $0, 0x8C
/* B51F0 001B50F0 CB006210 */  beq        $3, $2, .L001B5420
/* B51F4 001B50F4 00000000 */   nop
/* B51F8 001B50F8 82000224 */  addiu      $2, $0, 0x82
/* B51FC 001B50FC C1006210 */  beq        $3, $2, .L001B5404
/* B5200 001B5100 00000000 */   nop
/* B5204 001B5104 78000224 */  addiu      $2, $0, 0x78
/* B5208 001B5108 B0006210 */  beq        $3, $2, .L001B53CC
/* B520C 001B510C 00000000 */   nop
/* B5210 001B5110 6E000224 */  addiu      $2, $0, 0x6E
/* B5214 001B5114 A0006210 */  beq        $3, $2, .L001B5398
/* B5218 001B5118 00000000 */   nop
/* B521C 001B511C 5A000224 */  addiu      $2, $0, 0x5A
/* B5220 001B5120 94006210 */  beq        $3, $2, .L001B5374
/* B5224 001B5124 00000000 */   nop
/* B5228 001B5128 29000224 */  addiu      $2, $0, 0x29
/* B522C 001B512C 75006210 */  beq        $3, $2, .L001B5304
/* B5230 001B5130 00000000 */   nop
/* B5234 001B5134 64000224 */  addiu      $2, $0, 0x64
/* B5238 001B5138 64006210 */  beq        $3, $2, .L001B52CC
/* B523C 001B513C 00000000 */   nop
/* B5240 001B5140 96000224 */  addiu      $2, $0, 0x96
/* B5244 001B5144 53006210 */  beq        $3, $2, .L001B5294
/* B5248 001B5148 00000000 */   nop
/* B524C 001B514C 46000224 */  addiu      $2, $0, 0x46
/* B5250 001B5150 43006210 */  beq        $3, $2, .L001B5260
/* B5254 001B5154 00000000 */   nop
/* B5258 001B5158 32000224 */  addiu      $2, $0, 0x32
/* B525C 001B515C 33006210 */  beq        $3, $2, .L001B522C
/* B5260 001B5160 00000000 */   nop
/* B5264 001B5164 1E000224 */  addiu      $2, $0, 0x1E
/* B5268 001B5168 23006210 */  beq        $3, $2, .L001B51F8
/* B526C 001B516C 00000000 */   nop
/* B5270 001B5170 14000224 */  addiu      $2, $0, 0x14
/* B5274 001B5174 13006210 */  beq        $3, $2, .L001B51C4
/* B5278 001B5178 00000000 */   nop
/* B527C 001B517C 0A000224 */  addiu      $2, $0, 0xA
/* B5280 001B5180 03006210 */  beq        $3, $2, .L001B5190
/* B5284 001B5184 00000000 */   nop
/* B5288 001B5188 B1000010 */  b          .L001B5450
/* B528C 001B518C 00000000 */   nop
.L001B5190:
/* B5290 001B5190 D501013C */  lui        $at, (0x1D5646C >> 16)
/* B5294 001B5194 6C64228C */  lw         $2, (0x1D5646C & 0xFFFF)($at)
/* B5298 001B5198 06004014 */  bnez       $2, .L001B51B4
/* B529C 001B519C 00000000 */   nop
/* B52A0 001B51A0 01000224 */  addiu      $2, $0, 0x1
/* B52A4 001B51A4 D501013C */  lui        $at, (0x1D5646C >> 16)
/* B52A8 001B51A8 6C6422AC */  sw         $2, (0x1D5646C & 0xFFFF)($at)
/* B52AC 001B51AC A8000010 */  b          .L001B5450
/* B52B0 001B51B0 00000000 */   nop
.L001B51B4:
/* B52B4 001B51B4 D501013C */  lui        $at, (0x1D5646C >> 16)
/* B52B8 001B51B8 6C6420AC */  sw         $0, (0x1D5646C & 0xFFFF)($at)
/* B52BC 001B51BC A4000010 */  b          .L001B5450
/* B52C0 001B51C0 00000000 */   nop
.L001B51C4:
/* B52C4 001B51C4 D501013C */  lui        $at, (0x1D56474 >> 16)
/* B52C8 001B51C8 7464228C */  lw         $2, (0x1D56474 & 0xFFFF)($at)
/* B52CC 001B51CC 06004014 */  bnez       $2, .L001B51E8
/* B52D0 001B51D0 00000000 */   nop
/* B52D4 001B51D4 01000224 */  addiu      $2, $0, 0x1
/* B52D8 001B51D8 D501013C */  lui        $at, (0x1D56474 >> 16)
/* B52DC 001B51DC 746422AC */  sw         $2, (0x1D56474 & 0xFFFF)($at)
/* B52E0 001B51E0 9B000010 */  b          .L001B5450
/* B52E4 001B51E4 00000000 */   nop
.L001B51E8:
/* B52E8 001B51E8 D501013C */  lui        $at, (0x1D56474 >> 16)
/* B52EC 001B51EC 746420AC */  sw         $0, (0x1D56474 & 0xFFFF)($at)
/* B52F0 001B51F0 97000010 */  b          .L001B5450
/* B52F4 001B51F4 00000000 */   nop
.L001B51F8:
/* B52F8 001B51F8 D501013C */  lui        $at, (0x1D56478 >> 16)
/* B52FC 001B51FC 7864228C */  lw         $2, (0x1D56478 & 0xFFFF)($at)
/* B5300 001B5200 06004014 */  bnez       $2, .L001B521C
/* B5304 001B5204 00000000 */   nop
/* B5308 001B5208 01000224 */  addiu      $2, $0, 0x1
/* B530C 001B520C D501013C */  lui        $at, (0x1D56478 >> 16)
/* B5310 001B5210 786422AC */  sw         $2, (0x1D56478 & 0xFFFF)($at)
/* B5314 001B5214 8E000010 */  b          .L001B5450
/* B5318 001B5218 00000000 */   nop
.L001B521C:
/* B531C 001B521C D501013C */  lui        $at, (0x1D56478 >> 16)
/* B5320 001B5220 786420AC */  sw         $0, (0x1D56478 & 0xFFFF)($at)
/* B5324 001B5224 8A000010 */  b          .L001B5450
/* B5328 001B5228 00000000 */   nop
.L001B522C:
/* B532C 001B522C D501013C */  lui        $at, (0x1D56470 >> 16)
/* B5330 001B5230 7064228C */  lw         $2, (0x1D56470 & 0xFFFF)($at)
/* B5334 001B5234 06004014 */  bnez       $2, .L001B5250
/* B5338 001B5238 00000000 */   nop
/* B533C 001B523C 01000224 */  addiu      $2, $0, 0x1
/* B5340 001B5240 D501013C */  lui        $at, (0x1D56470 >> 16)
/* B5344 001B5244 706422AC */  sw         $2, (0x1D56470 & 0xFFFF)($at)
/* B5348 001B5248 81000010 */  b          .L001B5450
/* B534C 001B524C 00000000 */   nop
.L001B5250:
/* B5350 001B5250 D501013C */  lui        $at, (0x1D56470 >> 16)
/* B5354 001B5254 706420AC */  sw         $0, (0x1D56470 & 0xFFFF)($at)
/* B5358 001B5258 7D000010 */  b          .L001B5450
/* B535C 001B525C 00000000 */   nop
.L001B5260:
/* B5360 001B5260 D501013C */  lui        $at, (0x1D56488 >> 16)
/* B5364 001B5264 8864228C */  lw         $2, (0x1D56488 & 0xFFFF)($at)
/* B5368 001B5268 06004014 */  bnez       $2, .L001B5284
/* B536C 001B526C 00000000 */   nop
/* B5370 001B5270 01000224 */  addiu      $2, $0, 0x1
/* B5374 001B5274 D501013C */  lui        $at, (0x1D56488 >> 16)
/* B5378 001B5278 886422AC */  sw         $2, (0x1D56488 & 0xFFFF)($at)
/* B537C 001B527C 74000010 */  b          .L001B5450
/* B5380 001B5280 00000000 */   nop
.L001B5284:
/* B5384 001B5284 D501013C */  lui        $at, (0x1D56488 >> 16)
/* B5388 001B5288 886420AC */  sw         $0, (0x1D56488 & 0xFFFF)($at)
/* B538C 001B528C 70000010 */  b          .L001B5450
/* B5390 001B5290 00000000 */   nop
.L001B5294:
/* B5394 001B5294 D501013C */  lui        $at, (0x1D564B0 >> 16)
/* B5398 001B5298 B064228C */  lw         $2, (0x1D564B0 & 0xFFFF)($at)
/* B539C 001B529C 06004014 */  bnez       $2, .L001B52B8
/* B53A0 001B52A0 00000000 */   nop
/* B53A4 001B52A4 02000224 */  addiu      $2, $0, 0x2
/* B53A8 001B52A8 D501013C */  lui        $at, (0x1D564B0 >> 16)
/* B53AC 001B52AC B06422AC */  sw         $2, (0x1D564B0 & 0xFFFF)($at)
/* B53B0 001B52B0 67000010 */  b          .L001B5450
/* B53B4 001B52B4 00000000 */   nop
.L001B52B8:
/* B53B8 001B52B8 FFFF4224 */  addiu      $2, $2, -0x1
/* B53BC 001B52BC D501013C */  lui        $at, (0x1D564B0 >> 16)
/* B53C0 001B52C0 B06422AC */  sw         $2, (0x1D564B0 & 0xFFFF)($at)
/* B53C4 001B52C4 62000010 */  b          .L001B5450
/* B53C8 001B52C8 00000000 */   nop
.L001B52CC:
/* B53CC 001B52CC D501013C */  lui        $at, (0x1D56498 >> 16)
/* B53D0 001B52D0 9864228C */  lw         $2, (0x1D56498 & 0xFFFF)($at)
/* B53D4 001B52D4 06004018 */  blez       $2, .L001B52F0
/* B53D8 001B52D8 00000000 */   nop
/* B53DC 001B52DC FFFF4224 */  addiu      $2, $2, -0x1
/* B53E0 001B52E0 D501013C */  lui        $at, (0x1D56498 >> 16)
/* B53E4 001B52E4 986422AC */  sw         $2, (0x1D56498 & 0xFFFF)($at)
/* B53E8 001B52E8 59000010 */  b          .L001B5450
/* B53EC 001B52EC 00000000 */   nop
.L001B52F0:
/* B53F0 001B52F0 04000224 */  addiu      $2, $0, 0x4
/* B53F4 001B52F4 D501013C */  lui        $at, (0x1D56498 >> 16)
/* B53F8 001B52F8 986422AC */  sw         $2, (0x1D56498 & 0xFFFF)($at)
/* B53FC 001B52FC 54000010 */  b          .L001B5450
/* B5400 001B5300 00000000 */   nop
.L001B5304:
/* B5404 001B5304 D501013C */  lui        $at, (0x1D56484 >> 16)
/* B5408 001B5308 8464228C */  lw         $2, (0x1D56484 & 0xFFFF)($at)
/* B540C 001B530C 00004128 */  slti       $at, $2, 0x0
/* B5410 001B5310 04002014 */  bnez       $at, .L001B5324
/* B5414 001B5314 00000000 */   nop
/* B5418 001B5318 FFFF4224 */  addiu      $2, $2, -0x1
/* B541C 001B531C D501013C */  lui        $at, (0x1D56484 >> 16)
/* B5420 001B5320 846422AC */  sw         $2, (0x1D56484 & 0xFFFF)($at)
.L001B5324:
/* B5424 001B5324 D501013C */  lui        $at, (0x1D56484 >> 16)
/* B5428 001B5328 8464238C */  lw         $3, (0x1D56484 & 0xFFFF)($at)
/* B542C 001B532C FFFF0224 */  addiu      $2, $0, -0x1
/* B5430 001B5330 0C006210 */  beq        $3, $2, .L001B5364
/* B5434 001B5334 00000000 */   nop
/* B5438 001B5338 80100300 */  sll        $2, $3, 2
/* B543C 001B533C 21104300 */  addu       $2, $2, $3
/* B5440 001B5340 40100200 */  sll        $2, $2, 1
/* B5444 001B5344 64004424 */  addiu      $4, $2, 0x64
/* B5448 001B5348 5866050C */  jal        SndBgmLoad__Fi
/* B544C 001B534C 00000000 */   nop
/* B5450 001B5350 28260070 */  paddub     $4, $0, $0
/* B5454 001B5354 CC66050C */  jal        SndBgmPlay__Fi
/* B5458 001B5358 00000000 */   nop
/* B545C 001B535C 3C000010 */  b          .L001B5450
/* B5460 001B5360 00000000 */   nop
.L001B5364:
/* B5464 001B5364 E866050C */  jal        SndBgmStop__Fv
/* B5468 001B5368 00000000 */   nop
/* B546C 001B536C 38000010 */  b          .L001B5450
/* B5470 001B5370 00000000 */   nop
.L001B5374:
/* B5474 001B5374 D501013C */  lui        $at, (0x1D5648C >> 16)
/* B5478 001B5378 8C64228C */  lw         $2, (0x1D5648C & 0xFFFF)($at)
/* B547C 001B537C 34004018 */  blez       $2, .L001B5450
/* B5480 001B5380 00000000 */   nop
/* B5484 001B5384 FFFF4224 */  addiu      $2, $2, -0x1
/* B5488 001B5388 D501013C */  lui        $at, (0x1D5648C >> 16)
/* B548C 001B538C 8C6422AC */  sw         $2, (0x1D5648C & 0xFFFF)($at)
/* B5490 001B5390 2F000010 */  b          .L001B5450
/* B5494 001B5394 00000000 */   nop
.L001B5398:
/* B5498 001B5398 D501013C */  lui        $at, (0x1D564A0 >> 16)
/* B549C 001B539C A064228C */  lw         $2, (0x1D564A0 & 0xFFFF)($at)
/* B54A0 001B53A0 06004014 */  bnez       $2, .L001B53BC
/* B54A4 001B53A4 00000000 */   nop
/* B54A8 001B53A8 01000224 */  addiu      $2, $0, 0x1
/* B54AC 001B53AC D501013C */  lui        $at, (0x1D564A0 >> 16)
/* B54B0 001B53B0 A06422AC */  sw         $2, (0x1D564A0 & 0xFFFF)($at)
/* B54B4 001B53B4 26000010 */  b          .L001B5450
/* B54B8 001B53B8 00000000 */   nop
.L001B53BC:
/* B54BC 001B53BC D501013C */  lui        $at, (0x1D564A0 >> 16)
/* B54C0 001B53C0 A06420AC */  sw         $0, (0x1D564A0 & 0xFFFF)($at)
/* B54C4 001B53C4 22000010 */  b          .L001B5450
/* B54C8 001B53C8 00000000 */   nop
.L001B53CC:
/* B54CC 001B53CC D501013C */  lui        $at, (0x1D564A4 >> 16)
/* B54D0 001B53D0 A464228C */  lw         $2, (0x1D564A4 & 0xFFFF)($at)
/* B54D4 001B53D4 06004014 */  bnez       $2, .L001B53F0
/* B54D8 001B53D8 00000000 */   nop
/* B54DC 001B53DC 05000224 */  addiu      $2, $0, 0x5
/* B54E0 001B53E0 D501013C */  lui        $at, (0x1D564A4 >> 16)
/* B54E4 001B53E4 A46422AC */  sw         $2, (0x1D564A4 & 0xFFFF)($at)
/* B54E8 001B53E8 19000010 */  b          .L001B5450
/* B54EC 001B53EC 00000000 */   nop
.L001B53F0:
/* B54F0 001B53F0 FFFF4224 */  addiu      $2, $2, -0x1
/* B54F4 001B53F4 D501013C */  lui        $at, (0x1D564A4 >> 16)
/* B54F8 001B53F8 A46422AC */  sw         $2, (0x1D564A4 & 0xFFFF)($at)
/* B54FC 001B53FC 14000010 */  b          .L001B5450
/* B5500 001B5400 00000000 */   nop
.L001B5404:
/* B5504 001B5404 D501013C */  lui        $at, (0x1D564A8 >> 16)
/* B5508 001B5408 A864228C */  lw         $2, (0x1D564A8 & 0xFFFF)($at)
/* B550C 001B540C FFFF4224 */  addiu      $2, $2, -0x1
/* B5510 001B5410 D501013C */  lui        $at, (0x1D564A8 >> 16)
/* B5514 001B5414 A86422AC */  sw         $2, (0x1D564A8 & 0xFFFF)($at)
/* B5518 001B5418 0D000010 */  b          .L001B5450
/* B551C 001B541C 00000000 */   nop
.L001B5420:
/* B5520 001B5420 D501013C */  lui        $at, (0x1D564AC >> 16)
/* B5524 001B5424 AC64228C */  lw         $2, (0x1D564AC & 0xFFFF)($at)
/* B5528 001B5428 0600401C */  bgtz       $2, .L001B5444
/* B552C 001B542C 00000000 */   nop
/* B5530 001B5430 05000224 */  addiu      $2, $0, 0x5
/* B5534 001B5434 D501013C */  lui        $at, (0x1D564AC >> 16)
/* B5538 001B5438 AC6422AC */  sw         $2, (0x1D564AC & 0xFFFF)($at)
/* B553C 001B543C 04000010 */  b          .L001B5450
/* B5540 001B5440 00000000 */   nop
.L001B5444:
/* B5544 001B5444 FFFF4224 */  addiu      $2, $2, -0x1
/* B5548 001B5448 D501013C */  lui        $at, (0x1D564AC >> 16)
/* B554C 001B544C AC6422AC */  sw         $2, (0x1D564AC & 0xFFFF)($at)
.L001B5450:
/* B5550 001B5450 CC01023C */  lui        $2, %hi(GamePad)
/* B5554 001B5454 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B5558 001B5458 04000524 */  addiu      $5, $0, 0x4
/* B555C 001B545C 1CAE040C */  jal        Down__8CGamePadFi
/* B5560 001B5460 00000000 */   nop
/* B5564 001B5464 3C004010 */  beqz       $2, .L001B5558
/* B5568 001B5468 00000000 */   nop
/* B556C 001B546C E493828F */  lw         $2, -0x6C1C($gp)
/* B5570 001B5470 80180200 */  sll        $3, $2, 2
/* B5574 001B5474 2700023C */  lui        $2, %hi(DebugInfoCode)
/* B5578 001B5478 E0B04224 */  addiu      $2, $2, %lo(DebugInfoCode)
/* B557C 001B547C 21104300 */  addu       $2, $2, $3
/* B5580 001B5480 0000438C */  lw         $3, 0x0($2)
/* B5584 001B5484 82000224 */  addiu      $2, $0, 0x82
/* B5588 001B5488 26006210 */  beq        $3, $2, .L001B5524
/* B558C 001B548C 00000000 */   nop
/* B5590 001B5490 64000224 */  addiu      $2, $0, 0x64
/* B5594 001B5494 15006210 */  beq        $3, $2, .L001B54EC
/* B5598 001B5498 00000000 */   nop
/* B559C 001B549C 5A000224 */  addiu      $2, $0, 0x5A
/* B55A0 001B54A0 03006210 */  beq        $3, $2, .L001B54B0
/* B55A4 001B54A4 00000000 */   nop
/* B55A8 001B54A8 2B000010 */  b          .L001B5558
/* B55AC 001B54AC 00000000 */   nop
.L001B54B0:
/* B55B0 001B54B0 D501013C */  lui        $at, (0x1D5648C >> 16)
/* B55B4 001B54B4 8C64228C */  lw         $2, (0x1D5648C & 0xFFFF)($at)
/* B55B8 001B54B8 04004018 */  blez       $2, .L001B54CC
/* B55BC 001B54BC 00000000 */   nop
/* B55C0 001B54C0 F6FF4224 */  addiu      $2, $2, -0xA
/* B55C4 001B54C4 D501013C */  lui        $at, (0x1D5648C >> 16)
/* B55C8 001B54C8 8C6422AC */  sw         $2, (0x1D5648C & 0xFFFF)($at)
.L001B54CC:
/* B55CC 001B54CC D501013C */  lui        $at, (0x1D5648C >> 16)
/* B55D0 001B54D0 8C64228C */  lw         $2, (0x1D5648C & 0xFFFF)($at)
/* B55D4 001B54D4 20004104 */  bgez       $2, .L001B5558
/* B55D8 001B54D8 00000000 */   nop
/* B55DC 001B54DC D501013C */  lui        $at, (0x1D5648C >> 16)
/* B55E0 001B54E0 8C6420AC */  sw         $0, (0x1D5648C & 0xFFFF)($at)
/* B55E4 001B54E4 1C000010 */  b          .L001B5558
/* B55E8 001B54E8 00000000 */   nop
.L001B54EC:
/* B55EC 001B54EC D501013C */  lui        $at, (0x1D5649C >> 16)
/* B55F0 001B54F0 9C64228C */  lw         $2, (0x1D5649C & 0xFFFF)($at)
/* B55F4 001B54F4 06004018 */  blez       $2, .L001B5510
/* B55F8 001B54F8 00000000 */   nop
/* B55FC 001B54FC FFFF4224 */  addiu      $2, $2, -0x1
/* B5600 001B5500 D501013C */  lui        $at, (0x1D5649C >> 16)
/* B5604 001B5504 9C6422AC */  sw         $2, (0x1D5649C & 0xFFFF)($at)
/* B5608 001B5508 13000010 */  b          .L001B5558
/* B560C 001B550C 00000000 */   nop
.L001B5510:
/* B5610 001B5510 10000224 */  addiu      $2, $0, 0x10
/* B5614 001B5514 D501013C */  lui        $at, (0x1D5649C >> 16)
/* B5618 001B5518 9C6422AC */  sw         $2, (0x1D5649C & 0xFFFF)($at)
/* B561C 001B551C 0E000010 */  b          .L001B5558
/* B5620 001B5520 00000000 */   nop
.L001B5524:
/* B5624 001B5524 D501013C */  lui        $at, (0x1D564A8 >> 16)
/* B5628 001B5528 A864228C */  lw         $2, (0x1D564A8 & 0xFFFF)($at)
/* B562C 001B552C 04004018 */  blez       $2, .L001B5540
/* B5630 001B5530 00000000 */   nop
/* B5634 001B5534 F6FF4224 */  addiu      $2, $2, -0xA
/* B5638 001B5538 D501013C */  lui        $at, (0x1D564A8 >> 16)
/* B563C 001B553C A86422AC */  sw         $2, (0x1D564A8 & 0xFFFF)($at)
.L001B5540:
/* B5640 001B5540 D501013C */  lui        $at, (0x1D564A8 >> 16)
/* B5644 001B5544 A864228C */  lw         $2, (0x1D564A8 & 0xFFFF)($at)
/* B5648 001B5548 03004104 */  bgez       $2, .L001B5558
/* B564C 001B554C 00000000 */   nop
/* B5650 001B5550 D501013C */  lui        $at, (0x1D564A8 >> 16)
/* B5654 001B5554 A86420AC */  sw         $0, (0x1D564A8 & 0xFFFF)($at)
.L001B5558:
/* B5658 001B5558 CC01023C */  lui        $2, %hi(GamePad)
/* B565C 001B555C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* B5660 001B5560 08000524 */  addiu      $5, $0, 0x8
/* B5664 001B5564 1CAE040C */  jal        Down__8CGamePadFi
/* B5668 001B5568 00000000 */   nop
/* B566C 001B556C 2C004010 */  beqz       $2, .L001B5620
/* B5670 001B5570 00000000 */   nop
/* B5674 001B5574 E493828F */  lw         $2, -0x6C1C($gp)
/* B5678 001B5578 80180200 */  sll        $3, $2, 2
/* B567C 001B557C 2700023C */  lui        $2, %hi(DebugInfoCode)
/* B5680 001B5580 E0B04224 */  addiu      $2, $2, %lo(DebugInfoCode)
/* B5684 001B5584 21104300 */  addu       $2, $2, $3
/* B5688 001B5588 0000438C */  lw         $3, 0x0($2)
/* B568C 001B558C 82000224 */  addiu      $2, $0, 0x82
/* B5690 001B5590 1E006210 */  beq        $3, $2, .L001B560C
/* B5694 001B5594 00000000 */   nop
/* B5698 001B5598 64000224 */  addiu      $2, $0, 0x64
/* B569C 001B559C 0D006210 */  beq        $3, $2, .L001B55D4
/* B56A0 001B55A0 00000000 */   nop
/* B56A4 001B55A4 5A000224 */  addiu      $2, $0, 0x5A
/* B56A8 001B55A8 03006210 */  beq        $3, $2, .L001B55B8
/* B56AC 001B55AC 00000000 */   nop
/* B56B0 001B55B0 1B000010 */  b          .L001B5620
/* B56B4 001B55B4 00000000 */   nop
.L001B55B8:
/* B56B8 001B55B8 D501013C */  lui        $at, (0x1D5648C >> 16)
/* B56BC 001B55BC 8C64228C */  lw         $2, (0x1D5648C & 0xFFFF)($at)
/* B56C0 001B55C0 0A004224 */  addiu      $2, $2, 0xA
/* B56C4 001B55C4 D501013C */  lui        $at, (0x1D5648C >> 16)
/* B56C8 001B55C8 8C6422AC */  sw         $2, (0x1D5648C & 0xFFFF)($at)
/* B56CC 001B55CC 14000010 */  b          .L001B5620
/* B56D0 001B55D0 00000000 */   nop
.L001B55D4:
/* B56D4 001B55D4 D501013C */  lui        $at, (0x1D5649C >> 16)
/* B56D8 001B55D8 9C64228C */  lw         $2, (0x1D5649C & 0xFFFF)($at)
/* B56DC 001B55DC 10004128 */  slti       $at, $2, 0x10
/* B56E0 001B55E0 06002010 */  beqz       $at, .L001B55FC
/* B56E4 001B55E4 00000000 */   nop
/* B56E8 001B55E8 01004224 */  addiu      $2, $2, 0x1
/* B56EC 001B55EC D501013C */  lui        $at, (0x1D5649C >> 16)
/* B56F0 001B55F0 9C6422AC */  sw         $2, (0x1D5649C & 0xFFFF)($at)
/* B56F4 001B55F4 0A000010 */  b          .L001B5620
/* B56F8 001B55F8 00000000 */   nop
.L001B55FC:
/* B56FC 001B55FC D501013C */  lui        $at, (0x1D5649C >> 16)
/* B5700 001B5600 9C6420AC */  sw         $0, (0x1D5649C & 0xFFFF)($at)
/* B5704 001B5604 06000010 */  b          .L001B5620
/* B5708 001B5608 00000000 */   nop
.L001B560C:
/* B570C 001B560C D501013C */  lui        $at, (0x1D564A8 >> 16)
/* B5710 001B5610 A864228C */  lw         $2, (0x1D564A8 & 0xFFFF)($at)
/* B5714 001B5614 0A004224 */  addiu      $2, $2, 0xA
/* B5718 001B5618 D501013C */  lui        $at, (0x1D564A8 >> 16)
/* B571C 001B561C A86422AC */  sw         $2, (0x1D564A8 & 0xFFFF)($at)
.L001B5620:
/* B5720 001B5620 28160070 */  paddub     $2, $0, $0
.L001B5624:
/* B5724 001B5624 1000BF7B */  lq         $31, 0x10($sp)
/* B5728 001B5628 0000B07B */  lq         $16, 0x0($sp)
/* B572C 001B562C 2000BD27 */  addiu      $sp, $sp, 0x20
/* B5730 001B5630 0800E003 */  jr         $31
/* B5734 001B5634 00000000 */   nop
/* B5738 001B5638 00000000 */  nop
/* B573C 001B563C 00000000 */  nop
