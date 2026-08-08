.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtAtraGetShort_Loop__Fii
/* 0D2D70 001D2C70 A0FFBD27 */  addiu       $29, $29, -0x60
/* 0D2D74 001D2C74 4000BF7F */  sq          $31, 0x40($29)
/* 0D2D78 001D2C78 3000B37F */  sq          $19, 0x30($29)
/* 0D2D7C 001D2C7C 2000B27F */  sq          $18, 0x20($29)
/* 0D2D80 001D2C80 1000B17F */  sq          $17, 0x10($29)
/* 0D2D84 001D2C84 0000B07F */  sq          $16, 0x0($29)
/* 0D2D88 001D2C88 289E8070 */  paddub      $19, $4, $0
/* 0D2D8C 001D2C8C 2896A070 */  paddub      $18, $5, $0
/* 0D2D90 001D2C90 FFFF1024 */  addiu       $16, $0, -0x1
/* 0D2D94 001D2C94 2C94848F */  lw          $4, -0x6BD4($28)
/* 0D2D98 001D2C98 0600812C */  sltiu       $1, $4, 0x6
/* 0D2D9C 001D2C9C 72012010 */  beqz        $1, .L001D3268
/* 0D2DA0 001D2CA0 00000000 */   nop
/* 0D2DA4 001D2CA4 2A00023C */  lui         $2, %hi(LIT_904__2)
/* 0D2DA8 001D2CA8 10C74324 */  addiu       $3, $2, %lo(LIT_904__2)
/* 0D2DAC 001D2CAC 80100400 */  sll         $2, $4, 2
/* 0D2DB0 001D2CB0 21104300 */  addu        $2, $2, $3
/* 0D2DB4 001D2CB4 0000428C */  lw          $2, 0x0($2)
/* 0D2DB8 001D2CB8 08004000 */  jr          $2
/* 0D2DBC 001D2CBC 00000000 */   nop
jlabel .L001D2CC0
/* 0D2DC0 001D2CC0 006E050C */  jal         SndSPSeSyncBG__Fv
/* 0D2DC4 001D2CC4 00000000 */   nop
/* 0D2DC8 001D2CC8 BA004014 */  bnez        $2, .L001D2FB4
/* 0D2DCC 001D2CCC 00000000 */   nop
/* 0D2DD0 001D2CD0 8CFB040C */  jal         ReadBGSync__Fv
/* 0D2DD4 001D2CD4 00000000 */   nop
/* 0D2DD8 001D2CD8 B6004014 */  bnez        $2, .L001D2FB4
/* 0D2DDC 001D2CDC 00000000 */   nop
/* 0D2DE0 001D2CE0 549D858F */  lw          $5, -0x62AC($28)
/* 0D2DE4 001D2CE4 EA01023C */  lui         $2, %hi(CharaMain)
/* 0D2DE8 001D2CE8 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 0D2DEC 001D2CEC 2A00023C */  lui         $2, %hi(LIT_747)
/* 0D2DF0 001D2CF0 70C64624 */  addiu       $6, $2, %lo(LIT_747)
/* 0D2DF4 001D2CF4 F001023C */  lui         $2, %hi(BtCashBuffer)
/* 0D2DF8 001D2CF8 50684724 */  addiu       $7, $2, %lo(BtCashBuffer)
/* 0D2DFC 001D2CFC F001023C */  lui         $2, %hi(BtCashBuffer)
/* 0D2E00 001D2D00 50684824 */  addiu       $8, $2, %lo(BtCashBuffer)
/* 0D2E04 001D2D04 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 0D2E08 001D2D08 00000000 */   nop
/* 0D2E0C 001D2D0C DC01013C */  lui         $1, %hi(BtActStatus + 0x54)
/* 0D2E10 001D2D10 D44420AC */  sw          $0, %lo(BtActStatus + 0x54)($1)
/* 0D2E14 001D2D14 409D858F */  lw          $5, -0x62C0($28)
/* 0D2E18 001D2D18 EB01023C */  lui         $2, %hi(shortAtraEffect)
/* 0D2E1C 001D2D1C A04C4424 */  addiu       $4, $2, %lo(shortAtraEffect)
/* 0D2E20 001D2D20 2A00023C */  lui         $2, %hi(LIT_902)
/* 0D2E24 001D2D24 F8C64624 */  addiu       $6, $2, %lo(LIT_902)
/* 0D2E28 001D2D28 F001023C */  lui         $2, %hi(BtCashBuffer)
/* 0D2E2C 001D2D2C 50684724 */  addiu       $7, $2, %lo(BtCashBuffer)
/* 0D2E30 001D2D30 1C000824 */  addiu       $8, $0, 0x1C
/* 0D2E34 001D2D34 F001023C */  lui         $2, %hi(BtCashBuffer)
/* 0D2E38 001D2D38 50684924 */  addiu       $9, $2, %lo(BtCashBuffer)
/* 0D2E3C 001D2D3C 28560070 */  paddub      $10, $0, $0
/* 0D2E40 001D2D40 14E6040C */  jal         LoadPackData2__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_i
/* 0D2E44 001D2D44 00000000 */   nop
/* 0D2E48 001D2D48 28260070 */  paddub      $4, $0, $0
/* 0D2E4C 001D2D4C B004770C */  jal         SetMIniMapStatus__Fi
/* 0D2E50 001D2D50 00000000 */   nop
/* 0D2E54 001D2D54 FFFF0224 */  addiu       $2, $0, -0x1
/* 0D2E58 001D2D58 B49D82AF */  sw          $2, -0x624C($28)
/* 0D2E5C 001D2D5C 01000224 */  addiu       $2, $0, 0x1
/* 0D2E60 001D2D60 349D82AF */  sw          $2, -0x62CC($28)
/* 0D2E64 001D2D64 EC9C82AF */  sw          $2, -0x6314($28)
/* 0D2E68 001D2D68 F09C82AF */  sw          $2, -0x6310($28)
/* 0D2E6C 001D2D6C E49C82AF */  sw          $2, -0x631C($28)
/* 0D2E70 001D2D70 E89C82AF */  sw          $2, -0x6318($28)
/* 0D2E74 001D2D74 EB01023C */  lui         $2, %hi(atraGetPos)
/* 0D2E78 001D2D78 804C4424 */  addiu       $4, $2, %lo(atraGetPos)
/* 0D2E7C 001D2D7C EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 0D2E80 001D2D80 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 0D2E84 001D2D84 0C86040C */  jal         sceVu0CopyVector
/* 0D2E88 001D2D88 00000000 */   nop
/* 0D2E8C 001D2D8C EA01023C */  lui         $2, %hi(CharaMain)
/* 0D2E90 001D2D90 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 0D2E94 001D2D94 EB01023C */  lui         $2, %hi(atraGetRot)
/* 0D2E98 001D2D98 904C4524 */  addiu       $5, $2, %lo(atraGetRot)
/* 0D2E9C 001D2D9C BC5B050C */  jal         GetRotation__7CObjectFPf
/* 0D2EA0 001D2DA0 00000000 */   nop
/* 0D2EA4 001D2DA4 01000224 */  addiu       $2, $0, 0x1
/* 0D2EA8 001D2DA8 7C9D82AF */  sw          $2, -0x6284($28)
/* 0D2EAC 001D2DAC C89C848F */  lw          $4, -0x6338($28)
/* 0D2EB0 001D2DB0 4894838F */  lw          $3, -0x6BB8($28)
/* 0D2EB4 001D2DB4 80100300 */  sll         $2, $3, 2
/* 0D2EB8 001D2DB8 21104300 */  addu        $2, $2, $3
/* 0D2EBC 001D2DBC 00110200 */  sll         $2, $2, 4
/* 0D2EC0 001D2DC0 21104400 */  addu        $2, $2, $4
/* 0D2EC4 001D2DC4 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D2EC8 001D2DC8 21084100 */  addu        $1, $2, $1
/* 0D2ECC 001D2DCC 788D228C */  lw          $2, -0x7288($1)
/* 0D2ED0 001D2DD0 40890200 */  sll         $17, $2, 5
/* 0D2ED4 001D2DD4 21189100 */  addu        $3, $4, $17
/* 0D2ED8 001D2DD8 EB01023C */  lui         $2, %hi(shortAtraEffect)
/* 0D2EDC 001D2DDC A04C4424 */  addiu       $4, $2, %lo(shortAtraEffect)
/* 0D2EE0 001D2DE0 883C6524 */  addiu       $5, $3, 0x3C88
/* 0D2EE4 001D2DE4 F87FA524 */  addiu       $5, $5, 0x7FF8
/* 0D2EE8 001D2DE8 38E4040C */  jal         SetPosition__10CCharacterFPf
/* 0D2EEC 001D2DEC 00000000 */   nop
/* 0D2EF0 001D2DF0 00608044 */  mtc1        $0, $f12
/* 0D2EF4 001D2DF4 00000000 */  nop
/* 0D2EF8 001D2DF8 86630046 */  mov.s       $f14, $f12
/* 0D2EFC 001D2DFC 46630046 */  mov.s       $f13, $f12
/* 0D2F00 001D2E00 EB01023C */  lui         $2, %hi(shortAtraEffect)
/* 0D2F04 001D2E04 A04C4424 */  addiu       $4, $2, %lo(shortAtraEffect)
/* 0D2F08 001D2E08 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 0D2F0C 001D2E0C 00000000 */   nop
/* 0D2F10 001D2E10 EB01013C */  lui         $1, %hi(shortAtraEffect + 0xC68)
/* 0D2F14 001D2E14 085920AC */  sw          $0, %lo(shortAtraEffect + 0xC68)($1)
/* 0D2F18 001D2E18 06000224 */  addiu       $2, $0, 0x6
/* 0D2F1C 001D2E1C EB01013C */  lui         $1, %hi(shortAtraEffect + 0xC64)
/* 0D2F20 001D2E20 045922AC */  sw          $2, %lo(shortAtraEffect + 0xC64)($1)
/* 0D2F24 001D2E24 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 0D2F28 001D2E28 EB01013C */  lui         $1, %hi(shortAtraEffect + 0xC60)
/* 0D2F2C 001D2E2C 005922AC */  sw          $2, %lo(shortAtraEffect + 0xC60)($1)
/* 0D2F30 001D2E30 309D80AF */  sw          $0, -0x62D0($28)
/* 0D2F34 001D2E34 789C848F */  lw          $4, -0x6388($28)
/* 0D2F38 001D2E38 00111300 */  sll         $2, $19, 4
/* 0D2F3C 001D2E3C 23185300 */  subu        $3, $2, $19
/* 0D2F40 001D2E40 80100300 */  sll         $2, $3, 2
/* 0D2F44 001D2E44 21106200 */  addu        $2, $3, $2
/* 0D2F48 001D2E48 00110200 */  sll         $2, $2, 4
/* 0D2F4C 001D2E4C 21204400 */  addu        $4, $2, $4
/* 0D2F50 001D2E50 C89C858F */  lw          $5, -0x6338($28)
/* 0D2F54 001D2E54 21102502 */  addu        $2, $17, $5
/* 0D2F58 001D2E58 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D2F5C 001D2E5C 21084100 */  addu        $1, $2, $1
/* 0D2F60 001D2E60 90BC238C */  lw          $3, -0x4370($1)
/* 0D2F64 001D2E64 40100300 */  sll         $2, $3, 1
/* 0D2F68 001D2E68 21104300 */  addu        $2, $2, $3
/* 0D2F6C 001D2E6C 80100200 */  sll         $2, $2, 2
/* 0D2F70 001D2E70 21104400 */  addu        $2, $2, $4
/* 0D2F74 001D2E74 7820448C */  lw          $4, 0x2078($2)
/* 0D2F78 001D2E78 449484AF */  sw          $4, -0x6BBC($28)
/* 0D2F7C 001D2E7C 4894838F */  lw          $3, -0x6BB8($28)
/* 0D2F80 001D2E80 80100300 */  sll         $2, $3, 2
/* 0D2F84 001D2E84 21104300 */  addu        $2, $2, $3
/* 0D2F88 001D2E88 00110200 */  sll         $2, $2, 4
/* 0D2F8C 001D2E8C 21104500 */  addu        $2, $2, $5
/* 0D2F90 001D2E90 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D2F94 001D2E94 21084100 */  addu        $1, $2, $1
/* 0D2F98 001D2E98 788D228C */  lw          $2, -0x7288($1)
/* 0D2F9C 001D2E9C 40110200 */  sll         $2, $2, 5
/* 0D2FA0 001D2EA0 21104500 */  addu        $2, $2, $5
/* 0D2FA4 001D2EA4 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D2FA8 001D2EA8 21084100 */  addu        $1, $2, $1
/* 0D2FAC 001D2EAC 94BC20AC */  sw          $0, -0x436C($1)
/* 0D2FB0 001D2EB0 FFFF0624 */  addiu       $6, $0, -0x1
/* 0D2FB4 001D2EB4 C89C858F */  lw          $5, -0x6338($28)
/* 0D2FB8 001D2EB8 4894838F */  lw          $3, -0x6BB8($28)
/* 0D2FBC 001D2EBC 80100300 */  sll         $2, $3, 2
/* 0D2FC0 001D2EC0 21104300 */  addu        $2, $2, $3
/* 0D2FC4 001D2EC4 00110200 */  sll         $2, $2, 4
/* 0D2FC8 001D2EC8 21104500 */  addu        $2, $2, $5
/* 0D2FCC 001D2ECC 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D2FD0 001D2ED0 21084100 */  addu        $1, $2, $1
/* 0D2FD4 001D2ED4 588D26AC */  sw          $6, -0x72A8($1)
/* 0D2FD8 001D2ED8 C89C828F */  lw          $2, -0x6338($28)
/* 0D2FDC 001D2EDC 21102202 */  addu        $2, $17, $2
/* 0D2FE0 001D2EE0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D2FE4 001D2EE4 21084100 */  addu        $1, $2, $1
/* 0D2FE8 001D2EE8 90BC258C */  lw          $5, -0x4370($1)
/* 0D2FEC 001D2EEC 1C8D868F */  lw          $6, -0x72E4($28)
/* 0D2FF0 001D2EF0 283E6072 */  paddub      $7, $19, $0
/* 0D2FF4 001D2EF4 28464072 */  paddub      $8, $18, $0
/* 0D2FF8 001D2EF8 1CDD060C */  jal         getAtraToSaveData__FiiP9CSaveDataii
/* 0D2FFC 001D2EFC 00000000 */   nop
/* 0D3000 001D2F00 C89C828F */  lw          $2, -0x6338($28)
/* 0D3004 001D2F04 21105100 */  addu        $2, $2, $17
/* 0D3008 001D2F08 5000A427 */  addiu       $4, $29, 0x50
/* 0D300C 001D2F0C 883C4524 */  addiu       $5, $2, 0x3C88
/* 0D3010 001D2F10 F87FA524 */  addiu       $5, $5, 0x7FF8
/* 0D3014 001D2F14 0C86040C */  jal         sceVu0CopyVector
/* 0D3018 001D2F18 00000000 */   nop
/* 0D301C 001D2F1C EA01023C */  lui         $2, %hi(CharaMain)
/* 0D3020 001D2F20 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 0D3024 001D2F24 5000A527 */  addiu       $5, $29, 0x50
/* 0D3028 001D2F28 38E4040C */  jal         SetPosition__10CCharacterFPf
/* 0D302C 001D2F2C 00000000 */   nop
/* 0D3030 001D2F30 00608044 */  mtc1        $0, $f12
/* 0D3034 001D2F34 00000000 */  nop
/* 0D3038 001D2F38 86630046 */  mov.s       $f14, $f12
/* 0D303C 001D2F3C 46630046 */  mov.s       $f13, $f12
/* 0D3040 001D2F40 EA01023C */  lui         $2, %hi(CharaMain)
/* 0D3044 001D2F44 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 0D3048 001D2F48 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 0D304C 001D2F4C 00000000 */   nop
/* 0D3050 001D2F50 2E000224 */  addiu       $2, $0, 0x2E
/* 0D3054 001D2F54 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0D3058 001D2F58 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 0D305C 001D2F5C 01000224 */  addiu       $2, $0, 0x1
/* 0D3060 001D2F60 7C9D82AF */  sw          $2, -0x6284($28)
/* 0D3064 001D2F64 DC01023C */  lui         $2, %hi(SubCamera)
/* 0D3068 001D2F68 E0484424 */  addiu       $4, $2, %lo(SubCamera)
/* 0D306C 001D2F6C DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0D3070 001D2F70 E0454524 */  addiu       $5, $2, %lo(MainCamera__4)
/* 0D3074 001D2F74 A892040C */  jal         __as__13CCameraFollowFRC13CCameraFollow
/* 0D3078 001D2F78 00000000 */   nop
/* 0D307C 001D2F7C DC01023C */  lui         $2, %hi(SubCamera)
/* 0D3080 001D2F80 E0484224 */  addiu       $2, $2, %lo(SubCamera)
/* 0D3084 001D2F84 A89C82AF */  sw          $2, -0x6358($28)
/* 0D3088 001D2F88 A89C848F */  lw          $4, -0x6358($28)
/* 0D308C 001D2F8C C492040C */  jal         FollowOff__13CCameraFollowFv
/* 0D3090 001D2F90 00000000 */   nop
/* 0D3094 001D2F94 EB01023C */  lui         $2, %hi(shortAtraEffect)
/* 0D3098 001D2F98 A04C4424 */  addiu       $4, $2, %lo(shortAtraEffect)
/* 0D309C 001D2F9C A89C858F */  lw          $5, -0x6358($28)
/* 0D30A0 001D2FA0 DCE0040C */  jal         SetMotionCamera__10CCharacterFP7CCamera
/* 0D30A4 001D2FA4 00000000 */   nop
/* 0D30A8 001D2FA8 2C94828F */  lw          $2, -0x6BD4($28)
/* 0D30AC 001D2FAC 01004224 */  addiu       $2, $2, 0x1
/* 0D30B0 001D2FB0 2C9482AF */  sw          $2, -0x6BD4($28)
.L001D2FB4:
/* 0D30B4 001D2FB4 5CFA760C */  jal         autoCamTrial__Fv
/* 0D30B8 001D2FB8 00000000 */   nop
/* 0D30BC 001D2FBC AA000010 */  b           .L001D3268
/* 0D30C0 001D2FC0 00000000 */   nop
jlabel .L001D2FC4
/* 0D30C4 001D2FC4 309D81C7 */  lwc1        $f1, -0x62D0($28)
/* 0D30C8 001D2FC8 8043023C */  lui         $2, (0x43800000 >> 16)
/* 0D30CC 001D2FCC 00008244 */  mtc1        $2, $f0
/* 0D30D0 001D2FD0 00000000 */  nop
/* 0D30D4 001D2FD4 34080046 */  c.lt.s      $f1, $f0
/* 0D30D8 001D2FD8 00000000 */  nop
/* 0D30DC 001D2FDC 06000045 */  bc1f        .L001D2FF8
/* 0D30E0 001D2FE0 00000000 */   nop
/* 0D30E4 001D2FE4 0040023C */  lui         $2, (0x40000000 >> 16)
/* 0D30E8 001D2FE8 00008244 */  mtc1        $2, $f0
/* 0D30EC 001D2FEC 00000000 */  nop
/* 0D30F0 001D2FF0 00080046 */  add.s       $f0, $f1, $f0
/* 0D30F4 001D2FF4 309D80E7 */  swc1        $f0, -0x62D0($28)
.L001D2FF8:
/* 0D30F8 001D2FF8 EB01013C */  lui         $1, %hi(shortAtraEffect + 0x2F0)
/* 0D30FC 001D2FFC 904F21C4 */  lwc1        $f1, %lo(shortAtraEffect + 0x2F0)($1)
/* 0D3100 001D3000 5442023C */  lui         $2, (0x42540000 >> 16)
/* 0D3104 001D3004 00008244 */  mtc1        $2, $f0
/* 0D3108 001D3008 00000000 */  nop
/* 0D310C 001D300C 34080046 */  c.lt.s      $f1, $f0
/* 0D3110 001D3010 00000000 */  nop
/* 0D3114 001D3014 0C000145 */  bc1t        .L001D3048
/* 0D3118 001D3018 00000000 */   nop
/* 0D311C 001D301C 5842023C */  lui         $2, (0x42580000 >> 16)
/* 0D3120 001D3020 00008244 */  mtc1        $2, $f0
/* 0D3124 001D3024 00000000 */  nop
/* 0D3128 001D3028 34080046 */  c.lt.s      $f1, $f0
/* 0D312C 001D302C 00000000 */  nop
/* 0D3130 001D3030 05000045 */  bc1f        .L001D3048
/* 0D3134 001D3034 00000000 */   nop
/* 0D3138 001D3038 01000424 */  addiu       $4, $0, 0x1
/* 0D313C 001D303C FFFF0524 */  addiu       $5, $0, -0x1
/* 0D3140 001D3040 206E050C */  jal         SndSPSePlay__Fii
/* 0D3144 001D3044 00000000 */   nop
.L001D3048:
/* 0D3148 001D3048 EB01013C */  lui         $1, %hi(shortAtraEffect + 0x2F0)
/* 0D314C 001D304C 904F21C4 */  lwc1        $f1, %lo(shortAtraEffect + 0x2F0)($1)
/* 0D3150 001D3050 708580C7 */  lwc1        $f0, -0x7A90($28)
/* 0D3154 001D3054 34080046 */  c.lt.s      $f1, $f0
/* 0D3158 001D3058 00000000 */  nop
/* 0D315C 001D305C 82000145 */  bc1t        .L001D3268
/* 0D3160 001D3060 00000000 */   nop
/* 0D3164 001D3064 28266072 */  paddub      $4, $19, $0
/* 0D3168 001D3068 4494858F */  lw          $5, -0x6BBC($28)
/* 0D316C 001D306C 28000624 */  addiu       $6, $0, 0x28
/* 0D3170 001D3070 F480050C */  jal         AtraGetMes__Fiii
/* 0D3174 001D3074 00000000 */   nop
/* 0D3178 001D3078 02000224 */  addiu       $2, $0, 0x2
/* 0D317C 001D307C 349D82AF */  sw          $2, -0x62CC($28)
/* 0D3180 001D3080 01000224 */  addiu       $2, $0, 0x1
/* 0D3184 001D3084 389D82AF */  sw          $2, -0x62C8($28)
/* 0D3188 001D3088 3C9D80AF */  sw          $0, -0x62C4($28)
/* 0D318C 001D308C 2F000224 */  addiu       $2, $0, 0x2F
/* 0D3190 001D3090 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0D3194 001D3094 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 0D3198 001D3098 2C94828F */  lw          $2, -0x6BD4($28)
/* 0D319C 001D309C 01004224 */  addiu       $2, $2, 0x1
/* 0D31A0 001D30A0 2C9482AF */  sw          $2, -0x6BD4($28)
/* 0D31A4 001D30A4 70000010 */  b           .L001D3268
/* 0D31A8 001D30A8 00000000 */   nop
jlabel .L001D30AC
/* 0D31AC 001D30AC 3C9D81C7 */  lwc1        $f1, -0x62C4($28)
/* 0D31B0 001D30B0 0043023C */  lui         $2, (0x43000000 >> 16)
/* 0D31B4 001D30B4 00008244 */  mtc1        $2, $f0
/* 0D31B8 001D30B8 00000000 */  nop
/* 0D31BC 001D30BC 34080046 */  c.lt.s      $f1, $f0
/* 0D31C0 001D30C0 00000000 */  nop
/* 0D31C4 001D30C4 08000045 */  bc1f        .L001D30E8
/* 0D31C8 001D30C8 00000000 */   nop
/* 0D31CC 001D30CC 8040023C */  lui         $2, (0x40800000 >> 16)
/* 0D31D0 001D30D0 00008244 */  mtc1        $2, $f0
/* 0D31D4 001D30D4 00000000 */  nop
/* 0D31D8 001D30D8 00080046 */  add.s       $f0, $f1, $f0
/* 0D31DC 001D30DC 3C9D80E7 */  swc1        $f0, -0x62C4($28)
/* 0D31E0 001D30E0 61000010 */  b           .L001D3268
/* 0D31E4 001D30E4 00000000 */   nop
.L001D30E8:
/* 0D31E8 001D30E8 01008224 */  addiu       $2, $4, 0x1
/* 0D31EC 001D30EC 2C9482AF */  sw          $2, -0x6BD4($28)
/* 0D31F0 001D30F0 5D000010 */  b           .L001D3268
/* 0D31F4 001D30F4 00000000 */   nop
jlabel .L001D30F8
/* 0D31F8 001D30F8 CC01023C */  lui         $2, %hi(GamePad)
/* 0D31FC 001D30FC 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0D3200 001D3100 60000524 */  addiu       $5, $0, 0x60
/* 0D3204 001D3104 1CAE040C */  jal         Down__8CGamePadFi
/* 0D3208 001D3108 00000000 */   nop
/* 0D320C 001D310C 56004010 */  beqz        $2, .L001D3268
/* 0D3210 001D3110 00000000 */   nop
/* 0D3214 001D3114 00608044 */  mtc1        $0, $f12
/* 0D3218 001D3118 DC01023C */  lui         $2, %hi(DispFade__3)
/* 0D321C 001D311C D04B4424 */  addiu       $4, $2, %lo(DispFade__3)
/* 0D3220 001D3120 94F9040C */  jal         FadeInit__9CDispCtrlFf
/* 0D3224 001D3124 00000000 */   nop
/* 0D3228 001D3128 0041023C */  lui         $2, (0x41000000 >> 16)
/* 0D322C 001D312C 00608244 */  mtc1        $2, $f12
/* 0D3230 001D3130 DC01023C */  lui         $2, %hi(DispFade__3)
/* 0D3234 001D3134 D04B4424 */  addiu       $4, $2, %lo(DispFade__3)
/* 0D3238 001D3138 84F9040C */  jal         FadeOutStart__9CDispCtrlFf
/* 0D323C 001D313C 00000000 */   nop
/* 0D3240 001D3140 2C94828F */  lw          $2, -0x6BD4($28)
/* 0D3244 001D3144 01004224 */  addiu       $2, $2, 0x1
/* 0D3248 001D3148 2C9482AF */  sw          $2, -0x6BD4($28)
/* 0D324C 001D314C 46000010 */  b           .L001D3268
/* 0D3250 001D3150 00000000 */   nop
jlabel .L001D3154
/* 0D3254 001D3154 DC01023C */  lui         $2, %hi(DispFade__3)
/* 0D3258 001D3158 D04B4424 */  addiu       $4, $2, %lo(DispFade__3)
/* 0D325C 001D315C 9CF9040C */  jal         GetRate__9CDispCtrlFv
/* 0D3260 001D3160 00000000 */   nop
/* 0D3264 001D3164 0043023C */  lui         $2, (0x43000000 >> 16)
/* 0D3268 001D3168 00088244 */  mtc1        $2, $f1
/* 0D326C 001D316C 00000000 */  nop
/* 0D3270 001D3170 32080046 */  c.eq.s      $f1, $f0
/* 0D3274 001D3174 00000000 */  nop
/* 0D3278 001D3178 3B000045 */  bc1f        .L001D3268
/* 0D327C 001D317C 00000000 */   nop
/* 0D3280 001D3180 0041023C */  lui         $2, (0x41000000 >> 16)
/* 0D3284 001D3184 00608244 */  mtc1        $2, $f12
/* 0D3288 001D3188 DC01023C */  lui         $2, %hi(DispFade__3)
/* 0D328C 001D318C D04B4424 */  addiu       $4, $2, %lo(DispFade__3)
/* 0D3290 001D3190 8CF9040C */  jal         FadeInStart__9CDispCtrlFf
/* 0D3294 001D3194 00000000 */   nop
/* 0D3298 001D3198 5CFA760C */  jal         autoCamTrial__Fv
/* 0D329C 001D319C 00000000 */   nop
/* 0D32A0 001D31A0 2C94828F */  lw          $2, -0x6BD4($28)
/* 0D32A4 001D31A4 01004224 */  addiu       $2, $2, 0x1
/* 0D32A8 001D31A8 2C9482AF */  sw          $2, -0x6BD4($28)
/* 0D32AC 001D31AC 2E000010 */  b           .L001D3268
/* 0D32B0 001D31B0 00000000 */   nop
jlabel .L001D31B4
/* 0D32B4 001D31B4 01000224 */  addiu       $2, $0, 0x1
/* 0D32B8 001D31B8 DC01013C */  lui         $1, %hi(BtActStatus + 0x54)
/* 0D32BC 001D31BC D44422AC */  sw          $2, %lo(BtActStatus + 0x54)($1)
/* 0D32C0 001D31C0 3480050C */  jal         ClearSystemMes__Fv
/* 0D32C4 001D31C4 00000000 */   nop
/* 0D32C8 001D31C8 01000424 */  addiu       $4, $0, 0x1
/* 0D32CC 001D31CC B004770C */  jal         SetMIniMapStatus__Fi
/* 0D32D0 001D31D0 00000000 */   nop
/* 0D32D4 001D31D4 01000224 */  addiu       $2, $0, 0x1
/* 0D32D8 001D31D8 EA01013C */  lui         $1, %hi(DngMessMan)
/* 0D32DC 001D31DC 907622AC */  sw          $2, %lo(DngMessMan)($1)
/* 0D32E0 001D31E0 349D80AF */  sw          $0, -0x62CC($28)
/* 0D32E4 001D31E4 DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0D32E8 001D31E8 E0454224 */  addiu       $2, $2, %lo(MainCamera__4)
/* 0D32EC 001D31EC A89C82AF */  sw          $2, -0x6358($28)
/* 0D32F0 001D31F0 00608044 */  mtc1        $0, $f12
/* 0D32F4 001D31F4 00000000 */  nop
/* 0D32F8 001D31F8 86630046 */  mov.s       $f14, $f12
/* 0D32FC 001D31FC EA01023C */  lui         $2, %hi(CharaMain)
/* 0D3300 001D3200 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 0D3304 001D3204 68858DC7 */  lwc1        $f13, -0x7A98($28)
/* 0D3308 001D3208 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 0D330C 001D320C 00000000 */   nop
/* 0D3310 001D3210 EC9C80AF */  sw          $0, -0x6314($28)
/* 0D3314 001D3214 F09C80AF */  sw          $0, -0x6310($28)
/* 0D3318 001D3218 E49C80AF */  sw          $0, -0x631C($28)
/* 0D331C 001D321C E89C80AF */  sw          $0, -0x6318($28)
/* 0D3320 001D3220 389D80AF */  sw          $0, -0x62C8($28)
/* 0D3324 001D3224 C040023C */  lui         $2, (0x40C00000 >> 16)
/* 0D3328 001D3228 00608244 */  mtc1        $2, $f12
/* 0D332C 001D322C A89C848F */  lw          $4, -0x6358($28)
/* 0D3330 001D3230 9491040C */  jal         SetSpeed__7CCameraFf
/* 0D3334 001D3234 00000000 */   nop
/* 0D3338 001D3238 A89C848F */  lw          $4, -0x6358($28)
/* 0D333C 001D323C C092040C */  jal         FollowOn__13CCameraFollowFv
/* 0D3340 001D3240 00000000 */   nop
/* 0D3344 001D3244 789C828F */  lw          $2, -0x6388($28)
/* 0D3348 001D3248 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D334C 001D324C 21084100 */  addu        $1, $2, $1
/* 0D3350 001D3250 0C8B20AC */  sw          $0, -0x74F4($1)
/* 0D3354 001D3254 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0D3358 001D3258 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 0D335C 001D325C DC01013C */  lui         $1, %hi(BtActStatus + 0x9C)
/* 0D3360 001D3260 1C4520AC */  sw          $0, %lo(BtActStatus + 0x9C)($1)
/* 0D3364 001D3264 01001024 */  addiu       $16, $0, 0x1
.L001D3268:
/* 0D3368 001D3268 28160072 */  paddub      $2, $16, $0
/* 0D336C 001D326C 4000BF7B */  lq          $31, 0x40($29)
/* 0D3370 001D3270 3000B37B */  lq          $19, 0x30($29)
/* 0D3374 001D3274 2000B27B */  lq          $18, 0x20($29)
/* 0D3378 001D3278 1000B17B */  lq          $17, 0x10($29)
/* 0D337C 001D327C 0000B07B */  lq          $16, 0x0($29)
/* 0D3380 001D3280 6000BD27 */  addiu       $29, $29, 0x60
/* 0D3384 001D3284 0800E003 */  jr          $31
/* 0D3388 001D3288 00000000 */   nop
/* 0D338C 001D328C 00000000 */  nop
