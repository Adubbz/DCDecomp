.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel TitleDraw__Fv
/* 026F10 01DD2C10 60FBBD27 */  addiu       $29, $29, -0x4A0
/* 026F14 01DD2C14 2000BF7F */  sq          $31, 0x20($29)
/* 026F18 01DD2C18 1000B17F */  sq          $17, 0x10($29)
/* 026F1C 01DD2C1C 0000B07F */  sq          $16, 0x0($29)
/* 026F20 01DD2C20 DE01023C */  lui         $2, %hi(LIT_527__4)
/* 026F24 01DD2C24 00BC4224 */  addiu       $2, $2, %lo(LIT_527__4)
/* 026F28 01DD2C28 3000A327 */  addiu       $3, $29, 0x30
/* 026F2C 01DD2C2C 00004278 */  lq          $2, 0x0($2)
/* 026F30 01DD2C30 0000627C */  sq          $2, 0x0($3)
/* 026F34 01DD2C34 DE01023C */  lui         $2, %hi(LIT_528__4)
/* 026F38 01DD2C38 10BC4224 */  addiu       $2, $2, %lo(LIT_528__4)
/* 026F3C 01DD2C3C 4000A327 */  addiu       $3, $29, 0x40
/* 026F40 01DD2C40 00004278 */  lq          $2, 0x0($2)
/* 026F44 01DD2C44 0000627C */  sq          $2, 0x0($3)
/* 026F48 01DD2C48 DE01023C */  lui         $2, %hi(LIT_529__4)
/* 026F4C 01DD2C4C 20BC4224 */  addiu       $2, $2, %lo(LIT_529__4)
/* 026F50 01DD2C50 5000A327 */  addiu       $3, $29, 0x50
/* 026F54 01DD2C54 00004278 */  lq          $2, 0x0($2)
/* 026F58 01DD2C58 0000627C */  sq          $2, 0x0($3)
/* 026F5C 01DD2C5C DE01023C */  lui         $2, %hi(LIT_530__5)
/* 026F60 01DD2C60 30BC4524 */  addiu       $5, $2, %lo(LIT_530__5)
/* 026F64 01DD2C64 A000A427 */  addiu       $4, $29, 0xA0
/* 026F68 01DD2C68 04000324 */  addiu       $3, $0, 0x4
.L01DD2C6C_2D846C:
/* 026F6C 01DD2C6C 0000A278 */  lq          $2, 0x0($5)
/* 026F70 01DD2C70 1000A524 */  addiu       $5, $5, 0x10
/* 026F74 01DD2C74 FFFF6324 */  addiu       $3, $3, -0x1
/* 026F78 01DD2C78 0000827C */  sq          $2, 0x0($4)
/* 026F7C 01DD2C7C 10008424 */  addiu       $4, $4, 0x10
/* 026F80 01DD2C80 FAFF601C */  bgtz        $3, .L01DD2C6C_2D846C
/* 026F84 01DD2C84 00000000 */   nop
/* 026F88 01DD2C88 DE01023C */  lui         $2, %hi(LIT_531__6)
/* 026F8C 01DD2C8C 70BC4224 */  addiu       $2, $2, %lo(LIT_531__6)
/* 026F90 01DD2C90 E000A327 */  addiu       $3, $29, 0xE0
/* 026F94 01DD2C94 00004278 */  lq          $2, 0x0($2)
/* 026F98 01DD2C98 0000627C */  sq          $2, 0x0($3)
/* 026F9C 01DD2C9C DE01023C */  lui         $2, %hi(LIT_532__6)
/* 026FA0 01DD2CA0 80BC4224 */  addiu       $2, $2, %lo(LIT_532__6)
/* 026FA4 01DD2CA4 F000A327 */  addiu       $3, $29, 0xF0
/* 026FA8 01DD2CA8 00004278 */  lq          $2, 0x0($2)
/* 026FAC 01DD2CAC 0000627C */  sq          $2, 0x0($3)
/* 026FB0 01DD2CB0 DE01023C */  lui         $2, %hi(LIT_533__4)
/* 026FB4 01DD2CB4 90BC4224 */  addiu       $2, $2, %lo(LIT_533__4)
/* 026FB8 01DD2CB8 0001A327 */  addiu       $3, $29, 0x100
/* 026FBC 01DD2CBC 00004278 */  lq          $2, 0x0($2)
/* 026FC0 01DD2CC0 0000627C */  sq          $2, 0x0($3)
/* 026FC4 01DD2CC4 DE01023C */  lui         $2, %hi(LIT_534__5)
/* 026FC8 01DD2CC8 A0BC4524 */  addiu       $5, $2, %lo(LIT_534__5)
/* 026FCC 01DD2CCC 5001A427 */  addiu       $4, $29, 0x150
/* 026FD0 01DD2CD0 04000324 */  addiu       $3, $0, 0x4
.L01DD2CD4_2D84D4:
/* 026FD4 01DD2CD4 0000A278 */  lq          $2, 0x0($5)
/* 026FD8 01DD2CD8 1000A524 */  addiu       $5, $5, 0x10
/* 026FDC 01DD2CDC FFFF6324 */  addiu       $3, $3, -0x1
/* 026FE0 01DD2CE0 0000827C */  sq          $2, 0x0($4)
/* 026FE4 01DD2CE4 10008424 */  addiu       $4, $4, 0x10
/* 026FE8 01DD2CE8 FAFF601C */  bgtz        $3, .L01DD2CD4_2D84D4
/* 026FEC 01DD2CEC 00000000 */   nop
/* 026FF0 01DD2CF0 DE01023C */  lui         $2, %hi(LIT_535__3)
/* 026FF4 01DD2CF4 E0BC4224 */  addiu       $2, $2, %lo(LIT_535__3)
/* 026FF8 01DD2CF8 9001A327 */  addiu       $3, $29, 0x190
/* 026FFC 01DD2CFC 00004278 */  lq          $2, 0x0($2)
/* 027000 01DD2D00 0000627C */  sq          $2, 0x0($3)
/* 027004 01DD2D04 309C838F */  lw          $3, -0x63D0($28)
/* 027008 01DD2D08 0E006010 */  beqz        $3, .L01DD2D44_2D8544
/* 02700C 01DD2D0C 00000000 */   nop
/* 027010 01DD2D10 06000224 */  addiu       $2, $0, 0x6
/* 027014 01DD2D14 07006214 */  bne         $3, $2, .L01DD2D34_2D8534
/* 027018 01DD2D18 00000000 */   nop
/* 02701C 01DD2D1C E601023C */  lui         $2, %hi(CCursol)
/* 027020 01DD2D20 40DF4424 */  addiu       $4, $2, %lo(CCursol)
/* 027024 01DD2D24 3054770C */  jal         GetSelect__7CCursolFv
/* 027028 01DD2D28 00000000 */   nop
/* 02702C 01DD2D2C 05004010 */  beqz        $2, .L01DD2D44_2D8544
/* 027030 01DD2D30 00000000 */   nop
.L01DD2D34_2D8534:
/* 027034 01DD2D34 309C838F */  lw          $3, -0x63D0($28)
/* 027038 01DD2D38 07000224 */  addiu       $2, $0, 0x7
/* 02703C 01DD2D3C 0B006214 */  bne         $3, $2, .L01DD2D6C_2D856C
/* 027040 01DD2D40 00000000 */   nop
.L01DD2D44_2D8544:
/* 027044 01DD2D44 389C8427 */  addiu       $4, $28, -0x63C8
/* 027048 01DD2D48 80000524 */  addiu       $5, $0, 0x80
/* 02704C 01DD2D4C 7C54770C */  jal         Get__8CScFaderFi
/* 027050 01DD2D50 00000000 */   nop
/* 027054 01DD2D54 00008244 */  mtc1        $2, $f0
/* 027058 01DD2D58 00000000 */  nop
/* 02705C 01DD2D5C 20008046 */  cvt.s.w     $f0, $f0
/* 027060 01DD2D60 9C01A0E7 */  swc1        $f0, 0x19C($29)
/* 027064 01DD2D64 03000010 */  b           .L01DD2D74_2D8574
/* 027068 01DD2D68 00000000 */   nop
.L01DD2D6C_2D856C:
/* 02706C 01DD2D6C 0043023C */  lui         $2, (0x43000000 >> 16)
/* 027070 01DD2D70 9C01A2AF */  sw          $2, 0x19C($29)
.L01DD2D74_2D8574:
/* 027074 01DD2D74 9001A427 */  addiu       $4, $29, 0x190
/* 027078 01DD2D78 40B7040C */  jal         MGSetAmbient__FPf
/* 02707C 01DD2D7C 00000000 */   nop
/* 027080 01DD2D80 3000A427 */  addiu       $4, $29, 0x30
/* 027084 01DD2D84 282E8070 */  paddub      $5, $4, $0
/* 027088 01DD2D88 9285040C */  jal         sceVu0Normalize
/* 02708C 01DD2D8C 00000000 */   nop
/* 027090 01DD2D90 4000A427 */  addiu       $4, $29, 0x40
/* 027094 01DD2D94 282E8070 */  paddub      $5, $4, $0
/* 027098 01DD2D98 9285040C */  jal         sceVu0Normalize
/* 02709C 01DD2D9C 00000000 */   nop
/* 0270A0 01DD2DA0 5000A427 */  addiu       $4, $29, 0x50
/* 0270A4 01DD2DA4 282E8070 */  paddub      $5, $4, $0
/* 0270A8 01DD2DA8 9285040C */  jal         sceVu0Normalize
/* 0270AC 01DD2DAC 00000000 */   nop
/* 0270B0 01DD2DB0 6000A427 */  addiu       $4, $29, 0x60
/* 0270B4 01DD2DB4 3000A527 */  addiu       $5, $29, 0x30
/* 0270B8 01DD2DB8 4000A627 */  addiu       $6, $29, 0x40
/* 0270BC 01DD2DBC 5000A727 */  addiu       $7, $29, 0x50
/* 0270C0 01DD2DC0 1A87040C */  jal         sceVu0NormalLightMatrix
/* 0270C4 01DD2DC4 00000000 */   nop
/* 0270C8 01DD2DC8 6000A427 */  addiu       $4, $29, 0x60
/* 0270CC 01DD2DCC A000A527 */  addiu       $5, $29, 0xA0
/* 0270D0 01DD2DD0 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 0270D4 01DD2DD4 00000000 */   nop
/* 0270D8 01DD2DD8 309C838F */  lw          $3, -0x63D0($28)
/* 0270DC 01DD2DDC 09000224 */  addiu       $2, $0, 0x9
/* 0270E0 01DD2DE0 29006210 */  beq         $3, $2, .L01DD2E88_2D8688
/* 0270E4 01DD2DE4 00000000 */   nop
/* 0270E8 01DD2DE8 0E000224 */  addiu       $2, $0, 0xE
/* 0270EC 01DD2DEC 26006210 */  beq         $3, $2, .L01DD2E88_2D8688
/* 0270F0 01DD2DF0 00000000 */   nop
/* 0270F4 01DD2DF4 A0B8040C */  jal         GetVif1Packet__Fv
/* 0270F8 01DD2DF8 00000000 */   nop
/* 0270FC 01DD2DFC C701033C */  lui         $3, %hi(TexManager)
/* 027100 01DD2E00 70586424 */  addiu       $4, $3, %lo(TexManager)
/* 027104 01DD2E04 282E4070 */  paddub      $5, $2, $0
/* 027108 01DD2E08 28360070 */  paddub      $6, $0, $0
/* 02710C 01DD2E0C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 027110 01DD2E10 00000000 */   nop
/* 027114 01DD2E14 DE01013C */  lui         $1, %hi(rot$545 + 0x4)
/* 027118 01DD2E18 F4BC21C4 */  lwc1        $f1, %lo(rot$545 + 0x4)($1)
/* 02711C 01DD2E1C A48080C7 */  lwc1        $f0, -0x7F5C($28)
/* 027120 01DD2E20 40080046 */  add.s       $f1, $f1, $f0
/* 027124 01DD2E24 DE01013C */  lui         $1, %hi(rot$545 + 0x4)
/* 027128 01DD2E28 F4BC21E4 */  swc1        $f1, %lo(rot$545 + 0x4)($1)
/* 02712C 01DD2E2C AC8180C7 */  lwc1        $f0, -0x7E54($28)
/* 027130 01DD2E30 36080046 */  c.le.s      $f1, $f0
/* 027134 01DD2E34 00000000 */  nop
/* 027138 01DD2E38 07000145 */  bc1t        .L01DD2E58_2D8658
/* 02713C 01DD2E3C 00000000 */   nop
/* 027140 01DD2E40 DE01013C */  lui         $1, %hi(rot$545 + 0x4)
/* 027144 01DD2E44 F4BC21C4 */  lwc1        $f1, %lo(rot$545 + 0x4)($1)
/* 027148 01DD2E48 B08180C7 */  lwc1        $f0, -0x7E50($28)
/* 02714C 01DD2E4C 01080046 */  sub.s       $f0, $f1, $f0
/* 027150 01DD2E50 DE01013C */  lui         $1, %hi(rot$545 + 0x4)
/* 027154 01DD2E54 F4BC20E4 */  swc1        $f0, %lo(rot$545 + 0x4)($1)
.L01DD2E58_2D8658:
/* 027158 01DD2E58 2C9C848F */  lw          $4, -0x63D4($28)
/* 02715C 01DD2E5C DE01013C */  lui         $1, %hi(rot$545)
/* 027160 01DD2E60 F0BC2CC4 */  lwc1        $f12, %lo(rot$545)($1)
/* 027164 01DD2E64 DE01013C */  lui         $1, %hi(rot$545 + 0x4)
/* 027168 01DD2E68 F4BC2DC4 */  lwc1        $f13, %lo(rot$545 + 0x4)($1)
/* 02716C 01DD2E6C DE01013C */  lui         $1, %hi(rot$545 + 0x8)
/* 027170 01DD2E70 F8BC2EC4 */  lwc1        $f14, %lo(rot$545 + 0x8)($1)
/* 027174 01DD2E74 70A3040C */  jal         SetRotation__6CFrameFfff
/* 027178 01DD2E78 00000000 */   nop
/* 02717C 01DD2E7C 2C9C848F */  lw          $4, -0x63D4($28)
/* 027180 01DD2E80 60BB040C */  jal         MGDraw__FP6CFrame
/* 027184 01DD2E84 00000000 */   nop
.L01DD2E88_2D8688:
/* 027188 01DD2E88 309C838F */  lw          $3, -0x63D0($28)
/* 02718C 01DD2E8C 09000224 */  addiu       $2, $0, 0x9
/* 027190 01DD2E90 2F006210 */  beq         $3, $2, .L01DD2F50_2D8750
/* 027194 01DD2E94 00000000 */   nop
/* 027198 01DD2E98 0E000224 */  addiu       $2, $0, 0xE
/* 02719C 01DD2E9C 2C006210 */  beq         $3, $2, .L01DD2F50_2D8750
/* 0271A0 01DD2EA0 00000000 */   nop
/* 0271A4 01DD2EA4 A0B8040C */  jal         GetVif1Packet__Fv
/* 0271A8 01DD2EA8 00000000 */   nop
/* 0271AC 01DD2EAC C701033C */  lui         $3, %hi(TexManager)
/* 0271B0 01DD2EB0 70586424 */  addiu       $4, $3, %lo(TexManager)
/* 0271B4 01DD2EB4 282E4070 */  paddub      $5, $2, $0
/* 0271B8 01DD2EB8 01000624 */  addiu       $6, $0, 0x1
/* 0271BC 01DD2EBC 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0271C0 01DD2EC0 00000000 */   nop
/* 0271C4 01DD2EC4 309C838F */  lw          $3, -0x63D0($28)
/* 0271C8 01DD2EC8 0E006010 */  beqz        $3, .L01DD2F04_2D8704
/* 0271CC 01DD2ECC 00000000 */   nop
/* 0271D0 01DD2ED0 06000224 */  addiu       $2, $0, 0x6
/* 0271D4 01DD2ED4 07006214 */  bne         $3, $2, .L01DD2EF4_2D86F4
/* 0271D8 01DD2ED8 00000000 */   nop
/* 0271DC 01DD2EDC E601023C */  lui         $2, %hi(CCursol)
/* 0271E0 01DD2EE0 40DF4424 */  addiu       $4, $2, %lo(CCursol)
/* 0271E4 01DD2EE4 3054770C */  jal         GetSelect__7CCursolFv
/* 0271E8 01DD2EE8 00000000 */   nop
/* 0271EC 01DD2EEC 05004010 */  beqz        $2, .L01DD2F04_2D8704
/* 0271F0 01DD2EF0 00000000 */   nop
.L01DD2EF4_2D86F4:
/* 0271F4 01DD2EF4 309C838F */  lw          $3, -0x63D0($28)
/* 0271F8 01DD2EF8 07000224 */  addiu       $2, $0, 0x7
/* 0271FC 01DD2EFC 0B006214 */  bne         $3, $2, .L01DD2F2C_2D872C
/* 027200 01DD2F00 00000000 */   nop
.L01DD2F04_2D8704:
/* 027204 01DD2F04 389C8427 */  addiu       $4, $28, -0x63C8
/* 027208 01DD2F08 64000524 */  addiu       $5, $0, 0x64
/* 02720C 01DD2F0C 7C54770C */  jal         Get__8CScFaderFi
/* 027210 01DD2F10 00000000 */   nop
/* 027214 01DD2F14 00008244 */  mtc1        $2, $f0
/* 027218 01DD2F18 00000000 */  nop
/* 02721C 01DD2F1C 20008046 */  cvt.s.w     $f0, $f0
/* 027220 01DD2F20 9C01A0E7 */  swc1        $f0, 0x19C($29)
/* 027224 01DD2F24 03000010 */  b           .L01DD2F34_2D8734
/* 027228 01DD2F28 00000000 */   nop
.L01DD2F2C_2D872C:
/* 02722C 01DD2F2C C842023C */  lui         $2, (0x42C80000 >> 16)
/* 027230 01DD2F30 9C01A2AF */  sw          $2, 0x19C($29)
.L01DD2F34_2D8734:
/* 027234 01DD2F34 9001A427 */  addiu       $4, $29, 0x190
/* 027238 01DD2F38 40B7040C */  jal         MGSetAmbient__FPf
/* 02723C 01DD2F3C 00000000 */   nop
/* 027240 01DD2F40 E501023C */  lui         $2, %hi(Cloud__2)
/* 027244 01DD2F44 E01B4424 */  addiu       $4, $2, %lo(Cloud__2)
/* 027248 01DD2F48 C4E4040C */  jal         Draw__10CCharacterFv
/* 02724C 01DD2F4C 00000000 */   nop
.L01DD2F50_2D8750:
/* 027250 01DD2F50 309C828F */  lw          $2, -0x63D0($28)
/* 027254 01DD2F54 08004014 */  bnez        $2, .L01DD2F78_2D8778
/* 027258 01DD2F58 00000000 */   nop
/* 02725C 01DD2F5C 389C8427 */  addiu       $4, $28, -0x63C8
/* 027260 01DD2F60 80000524 */  addiu       $5, $0, 0x80
/* 027264 01DD2F64 7C54770C */  jal         Get__8CScFaderFi
/* 027268 01DD2F68 00000000 */   nop
/* 02726C 01DD2F6C 04004228 */  slti        $2, $2, 0x4
/* 027270 01DD2F70 A3004014 */  bnez        $2, .L01DD3200_2D8A00
/* 027274 01DD2F74 00000000 */   nop
.L01DD2F78_2D8778:
/* 027278 01DD2F78 8004A427 */  addiu       $4, $29, 0x480
/* 02727C 01DD2F7C 7CBB040C */  jal         MGSetGsTEST__FP9sceGsTest
/* 027280 01DD2F80 00000000 */   nop
/* 027284 01DD2F84 8104A593 */  lbu         $5, 0x481($29)
/* 027288 01DD2F88 01000430 */  andi        $4, $0, 0x1
/* 02728C 01DD2F8C 80190400 */  sll         $3, $4, 6
/* 027290 01DD2F90 BFFF0224 */  addiu       $2, $0, -0x41
/* 027294 01DD2F94 2410A200 */  and         $2, $5, $2
/* 027298 01DD2F98 25104300 */  or          $2, $2, $3
/* 02729C 01DD2F9C 8104A2A3 */  sb          $2, 0x481($29)
/* 0272A0 01DD2FA0 8004A393 */  lbu         $3, 0x480($29)
/* 0272A4 01DD2FA4 FEFF0224 */  addiu       $2, $0, -0x2
/* 0272A8 01DD2FA8 24106200 */  and         $2, $3, $2
/* 0272AC 01DD2FAC 25104400 */  or          $2, $2, $4
/* 0272B0 01DD2FB0 8004A2A3 */  sb          $2, 0x480($29)
/* 0272B4 01DD2FB4 8004A427 */  addiu       $4, $29, 0x480
/* 0272B8 01DD2FB8 7CBB040C */  jal         MGSetGsTEST__FP9sceGsTest
/* 0272BC 01DD2FBC 00000000 */   nop
/* 0272C0 01DD2FC0 01000424 */  addiu       $4, $0, 0x1
/* 0272C4 01DD2FC4 046F050C */  jal         setbilinear__Fi
/* 0272C8 01DD2FC8 00000000 */   nop
/* 0272CC 01DD2FCC 01000224 */  addiu       $2, $0, 0x1
/* 0272D0 01DD2FD0 1002A2AF */  sw          $2, 0x210($29)
/* 0272D4 01DD2FD4 1402A0AF */  sw          $0, 0x214($29)
/* 0272D8 01DD2FD8 7F020224 */  addiu       $2, $0, 0x27F
/* 0272DC 01DD2FDC 1802A2AF */  sw          $2, 0x218($29)
/* 0272E0 01DD2FE0 2D000224 */  addiu       $2, $0, 0x2D
/* 0272E4 01DD2FE4 1C02A2AF */  sw          $2, 0x21C($29)
/* 0272E8 01DD2FE8 0002A0AF */  sw          $0, 0x200($29)
/* 0272EC 01DD2FEC 0402A0AF */  sw          $0, 0x204($29)
/* 0272F0 01DD2FF0 80020224 */  addiu       $2, $0, 0x280
/* 0272F4 01DD2FF4 0802A2AF */  sw          $2, 0x208($29)
/* 0272F8 01DD2FF8 55000224 */  addiu       $2, $0, 0x55
/* 0272FC 01DD2FFC 0C02A2AF */  sw          $2, 0x20C($29)
/* 027300 01DD3000 A0B8040C */  jal         GetVif1Packet__Fv
/* 027304 01DD3004 00000000 */   nop
/* 027308 01DD3008 28864070 */  paddub      $16, $2, $0
/* 02730C 01DD300C C701023C */  lui         $2, %hi(TexManager)
/* 027310 01DD3010 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 027314 01DD3014 DE01023C */  lui         $2, %hi(LIT_761__4)
/* 027318 01DD3018 900E4524 */  addiu       $5, $2, %lo(LIT_761__4)
/* 02731C 01DD301C FFFF0624 */  addiu       $6, $0, -0x1
/* 027320 01DD3020 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 027324 01DD3024 00000000 */   nop
/* 027328 01DD3028 28260072 */  paddub      $4, $16, $0
/* 02732C 01DD302C 282E4070 */  paddub      $5, $2, $0
/* 027330 01DD3030 0002A627 */  addiu       $6, $29, 0x200
/* 027334 01DD3034 1002A727 */  addiu       $7, $29, 0x210
/* 027338 01DD3038 70000824 */  addiu       $8, $0, 0x70
/* 02733C 01DD303C C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 027340 01DD3040 00000000 */   nop
/* 027344 01DD3044 01001024 */  addiu       $16, $0, 0x1
/* 027348 01DD3048 27000010 */  b           .L01DD30E8_2D88E8
/* 02734C 01DD304C 00000000 */   nop
.L01DD3050_2D8850:
/* 027350 01DD3050 01000224 */  addiu       $2, $0, 0x1
/* 027354 01DD3054 3002A2AF */  sw          $2, 0x230($29)
/* 027358 01DD3058 C0101000 */  sll         $2, $16, 3
/* 02735C 01DD305C 23185000 */  subu        $3, $2, $16
/* 027360 01DD3060 80100300 */  sll         $2, $3, 2
/* 027364 01DD3064 23184300 */  subu        $3, $2, $3
/* 027368 01DD3068 40100300 */  sll         $2, $3, 1
/* 02736C 01DD306C 3402A2AF */  sw          $2, 0x234($29)
/* 027370 01DD3070 7F020224 */  addiu       $2, $0, 0x27F
/* 027374 01DD3074 3802A2AF */  sw          $2, 0x238($29)
/* 027378 01DD3078 2D000224 */  addiu       $2, $0, 0x2D
/* 02737C 01DD307C 3C02A2AF */  sw          $2, 0x23C($29)
/* 027380 01DD3080 2002A0AF */  sw          $0, 0x220($29)
/* 027384 01DD3084 80100300 */  sll         $2, $3, 2
/* 027388 01DD3088 01004224 */  addiu       $2, $2, 0x1
/* 02738C 01DD308C 2402A2AF */  sw          $2, 0x224($29)
/* 027390 01DD3090 80020224 */  addiu       $2, $0, 0x280
/* 027394 01DD3094 2802A2AF */  sw          $2, 0x228($29)
/* 027398 01DD3098 54000224 */  addiu       $2, $0, 0x54
/* 02739C 01DD309C 2C02A2AF */  sw          $2, 0x22C($29)
/* 0273A0 01DD30A0 A0B8040C */  jal         GetVif1Packet__Fv
/* 0273A4 01DD30A4 00000000 */   nop
/* 0273A8 01DD30A8 288E4070 */  paddub      $17, $2, $0
/* 0273AC 01DD30AC C701023C */  lui         $2, %hi(TexManager)
/* 0273B0 01DD30B0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0273B4 01DD30B4 DE01023C */  lui         $2, %hi(LIT_761__4)
/* 0273B8 01DD30B8 900E4524 */  addiu       $5, $2, %lo(LIT_761__4)
/* 0273BC 01DD30BC FFFF0624 */  addiu       $6, $0, -0x1
/* 0273C0 01DD30C0 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0273C4 01DD30C4 00000000 */   nop
/* 0273C8 01DD30C8 28262072 */  paddub      $4, $17, $0
/* 0273CC 01DD30CC 282E4070 */  paddub      $5, $2, $0
/* 0273D0 01DD30D0 2002A627 */  addiu       $6, $29, 0x220
/* 0273D4 01DD30D4 3002A727 */  addiu       $7, $29, 0x230
/* 0273D8 01DD30D8 72000824 */  addiu       $8, $0, 0x72
/* 0273DC 01DD30DC C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0273E0 01DD30E0 00000000 */   nop
/* 0273E4 01DD30E4 01001026 */  addiu       $16, $16, 0x1
.L01DD30E8_2D88E8:
/* 0273E8 01DD30E8 0400022A */  slti        $2, $16, 0x4
/* 0273EC 01DD30EC D8FF4014 */  bnez        $2, .L01DD3050_2D8850
/* 0273F0 01DD30F0 00000000 */   nop
/* 0273F4 01DD30F4 01000224 */  addiu       $2, $0, 0x1
/* 0273F8 01DD30F8 5002A2AF */  sw          $2, 0x250($29)
/* 0273FC 01DD30FC A7000224 */  addiu       $2, $0, 0xA7
/* 027400 01DD3100 5402A2AF */  sw          $2, 0x254($29)
/* 027404 01DD3104 7F020224 */  addiu       $2, $0, 0x27F
/* 027408 01DD3108 5802A2AF */  sw          $2, 0x258($29)
/* 02740C 01DD310C 39000224 */  addiu       $2, $0, 0x39
/* 027410 01DD3110 5C02A2AF */  sw          $2, 0x25C($29)
/* 027414 01DD3114 4002A0AF */  sw          $0, 0x240($29)
/* 027418 01DD3118 50010224 */  addiu       $2, $0, 0x150
/* 02741C 01DD311C 4402A2AF */  sw          $2, 0x244($29)
/* 027420 01DD3120 80020224 */  addiu       $2, $0, 0x280
/* 027424 01DD3124 4802A2AF */  sw          $2, 0x248($29)
/* 027428 01DD3128 69000224 */  addiu       $2, $0, 0x69
/* 02742C 01DD312C 4C02A2AF */  sw          $2, 0x24C($29)
/* 027430 01DD3130 A0B8040C */  jal         GetVif1Packet__Fv
/* 027434 01DD3134 00000000 */   nop
/* 027438 01DD3138 28864070 */  paddub      $16, $2, $0
/* 02743C 01DD313C C701023C */  lui         $2, %hi(TexManager)
/* 027440 01DD3140 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 027444 01DD3144 DE01023C */  lui         $2, %hi(LIT_761__4)
/* 027448 01DD3148 900E4524 */  addiu       $5, $2, %lo(LIT_761__4)
/* 02744C 01DD314C FFFF0624 */  addiu       $6, $0, -0x1
/* 027450 01DD3150 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 027454 01DD3154 00000000 */   nop
/* 027458 01DD3158 28260072 */  paddub      $4, $16, $0
/* 02745C 01DD315C 282E4070 */  paddub      $5, $2, $0
/* 027460 01DD3160 4002A627 */  addiu       $6, $29, 0x240
/* 027464 01DD3164 5002A727 */  addiu       $7, $29, 0x250
/* 027468 01DD3168 72000824 */  addiu       $8, $0, 0x72
/* 02746C 01DD316C C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 027470 01DD3170 00000000 */   nop
/* 027474 01DD3174 01000224 */  addiu       $2, $0, 0x1
/* 027478 01DD3178 7002A2AF */  sw          $2, 0x270($29)
/* 02747C 01DD317C DC000224 */  addiu       $2, $0, 0xDC
/* 027480 01DD3180 7402A2AF */  sw          $2, 0x274($29)
/* 027484 01DD3184 7F020224 */  addiu       $2, $0, 0x27F
/* 027488 01DD3188 7802A2AF */  sw          $2, 0x278($29)
/* 02748C 01DD318C 03000224 */  addiu       $2, $0, 0x3
/* 027490 01DD3190 7C02A2AF */  sw          $2, 0x27C($29)
/* 027494 01DD3194 6002A0AF */  sw          $0, 0x260($29)
/* 027498 01DD3198 B8010224 */  addiu       $2, $0, 0x1B8
/* 02749C 01DD319C 6402A2AF */  sw          $2, 0x264($29)
/* 0274A0 01DD31A0 80020224 */  addiu       $2, $0, 0x280
/* 0274A4 01DD31A4 6802A2AF */  sw          $2, 0x268($29)
/* 0274A8 01DD31A8 08000224 */  addiu       $2, $0, 0x8
/* 0274AC 01DD31AC 6C02A2AF */  sw          $2, 0x26C($29)
/* 0274B0 01DD31B0 A0B8040C */  jal         GetVif1Packet__Fv
/* 0274B4 01DD31B4 00000000 */   nop
/* 0274B8 01DD31B8 28864070 */  paddub      $16, $2, $0
/* 0274BC 01DD31BC C701023C */  lui         $2, %hi(TexManager)
/* 0274C0 01DD31C0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0274C4 01DD31C4 DE01023C */  lui         $2, %hi(LIT_761__4)
/* 0274C8 01DD31C8 900E4524 */  addiu       $5, $2, %lo(LIT_761__4)
/* 0274CC 01DD31CC FFFF0624 */  addiu       $6, $0, -0x1
/* 0274D0 01DD31D0 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0274D4 01DD31D4 00000000 */   nop
/* 0274D8 01DD31D8 28260072 */  paddub      $4, $16, $0
/* 0274DC 01DD31DC 282E4070 */  paddub      $5, $2, $0
/* 0274E0 01DD31E0 6002A627 */  addiu       $6, $29, 0x260
/* 0274E4 01DD31E4 7002A727 */  addiu       $7, $29, 0x270
/* 0274E8 01DD31E8 72000824 */  addiu       $8, $0, 0x72
/* 0274EC 01DD31EC C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0274F0 01DD31F0 00000000 */   nop
/* 0274F4 01DD31F4 28260070 */  paddub      $4, $0, $0
/* 0274F8 01DD31F8 7CBB040C */  jal         MGSetGsTEST__FP9sceGsTest
/* 0274FC 01DD31FC 00000000 */   nop
.L01DD3200_2D8A00:
/* 027500 01DD3200 8804A427 */  addiu       $4, $29, 0x488
/* 027504 01DD3204 4CBC040C */  jal         MGGetFBuffTex__FP9sceGsTex0
/* 027508 01DD3208 00000000 */   nop
/* 02750C 01DD320C C701023C */  lui         $2, %hi(TexManager)
/* 027510 01DD3210 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 027514 01DD3214 DE01023C */  lui         $2, %hi(LIT_761__4)
/* 027518 01DD3218 900E4524 */  addiu       $5, $2, %lo(LIT_761__4)
/* 02751C 01DD321C FFFF0624 */  addiu       $6, $0, -0x1
/* 027520 01DD3220 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 027524 01DD3224 00000000 */   nop
/* 027528 01DD3228 9004A627 */  addiu       $6, $29, 0x490
/* 02752C 01DD322C 280042DC */  ld          $2, 0x28($2)
/* 027530 01DD3230 0000C2FC */  sd          $2, 0x0($6)
/* 027534 01DD3234 8A04A497 */  lhu         $4, 0x48A($29)
/* 027538 01DD3238 10000364 */  daddiu      $3, $0, 0x10
/* 02753C 01DD323C 0FFC0224 */  addiu       $2, $0, -0x3F1
/* 027540 01DD3240 24108200 */  and         $2, $4, $2
/* 027544 01DD3244 25104300 */  or          $2, $2, $3
/* 027548 01DD3248 8A04A2A7 */  sh          $2, 0x48A($29)
/* 02754C 01DD324C 9002A0AF */  sw          $0, 0x290($29)
/* 027550 01DD3250 9402A0AF */  sw          $0, 0x294($29)
/* 027554 01DD3254 00280324 */  addiu       $3, $0, 0x2800
/* 027558 01DD3258 9802A3AF */  sw          $3, 0x298($29)
/* 02755C 01DD325C 000E0224 */  addiu       $2, $0, 0xE00
/* 027560 01DD3260 9C02A2AF */  sw          $2, 0x29C($29)
/* 027564 01DD3264 8002A0AF */  sw          $0, 0x280($29)
/* 027568 01DD3268 8402A0AF */  sw          $0, 0x284($29)
/* 02756C 01DD326C 8802A3AF */  sw          $3, 0x288($29)
/* 027570 01DD3270 8C02A2AF */  sw          $2, 0x28C($29)
/* 027574 01DD3274 8804A427 */  addiu       $4, $29, 0x488
/* 027578 01DD3278 8002A527 */  addiu       $5, $29, 0x280
/* 02757C 01DD327C 9002A727 */  addiu       $7, $29, 0x290
/* 027580 01DD3280 0CBD040C */  jal         MGStretchMoveImage__FP9sceGsTex0RC8CRect_i_P9sceGsTex0RC8CRect_i_
/* 027584 01DD3284 00000000 */   nop
/* 027588 01DD3288 28260070 */  paddub      $4, $0, $0
/* 02758C 01DD328C 4CBF040C */  jal         MGClearZBuffer__Fi
/* 027590 01DD3290 00000000 */   nop
/* 027594 01DD3294 309C838F */  lw          $3, -0x63D0($28)
/* 027598 01DD3298 0D000224 */  addiu       $2, $0, 0xD
/* 02759C 01DD329C A9026210 */  beq         $3, $2, .L01DD3D44_2D9544
/* 0275A0 01DD32A0 00000000 */   nop
/* 0275A4 01DD32A4 0B000224 */  addiu       $2, $0, 0xB
/* 0275A8 01DD32A8 99026210 */  beq         $3, $2, .L01DD3D10_2D9510
/* 0275AC 01DD32AC 00000000 */   nop
/* 0275B0 01DD32B0 09000224 */  addiu       $2, $0, 0x9
/* 0275B4 01DD32B4 8A026210 */  beq         $3, $2, .L01DD3CE0_2D94E0
/* 0275B8 01DD32B8 00000000 */   nop
/* 0275BC 01DD32BC 07000224 */  addiu       $2, $0, 0x7
/* 0275C0 01DD32C0 12006210 */  beq         $3, $2, .L01DD330C_2D8B0C
/* 0275C4 01DD32C4 00000000 */   nop
/* 0275C8 01DD32C8 06000224 */  addiu       $2, $0, 0x6
/* 0275CC 01DD32CC 0F006210 */  beq         $3, $2, .L01DD330C_2D8B0C
/* 0275D0 01DD32D0 00000000 */   nop
/* 0275D4 01DD32D4 05000224 */  addiu       $2, $0, 0x5
/* 0275D8 01DD32D8 0C006210 */  beq         $3, $2, .L01DD330C_2D8B0C
/* 0275DC 01DD32DC 00000000 */   nop
/* 0275E0 01DD32E0 04000224 */  addiu       $2, $0, 0x4
/* 0275E4 01DD32E4 09006210 */  beq         $3, $2, .L01DD330C_2D8B0C
/* 0275E8 01DD32E8 00000000 */   nop
/* 0275EC 01DD32EC 01000224 */  addiu       $2, $0, 0x1
/* 0275F0 01DD32F0 06006210 */  beq         $3, $2, .L01DD330C_2D8B0C
/* 0275F4 01DD32F4 00000000 */   nop
/* 0275F8 01DD32F8 03000224 */  addiu       $2, $0, 0x3
/* 0275FC 01DD32FC 03006210 */  beq         $3, $2, .L01DD330C_2D8B0C
/* 027600 01DD3300 00000000 */   nop
/* 027604 01DD3304 99020010 */  b           .L01DD3D6C_2D956C
/* 027608 01DD3308 00000000 */   nop
.L01DD330C_2D8B0C:
/* 02760C 01DD330C E000A427 */  addiu       $4, $29, 0xE0
/* 027610 01DD3310 282E8070 */  paddub      $5, $4, $0
/* 027614 01DD3314 9285040C */  jal         sceVu0Normalize
/* 027618 01DD3318 00000000 */   nop
/* 02761C 01DD331C F000A427 */  addiu       $4, $29, 0xF0
/* 027620 01DD3320 282E8070 */  paddub      $5, $4, $0
/* 027624 01DD3324 9285040C */  jal         sceVu0Normalize
/* 027628 01DD3328 00000000 */   nop
/* 02762C 01DD332C 0001A427 */  addiu       $4, $29, 0x100
/* 027630 01DD3330 282E8070 */  paddub      $5, $4, $0
/* 027634 01DD3334 9285040C */  jal         sceVu0Normalize
/* 027638 01DD3338 00000000 */   nop
/* 02763C 01DD333C 1001A427 */  addiu       $4, $29, 0x110
/* 027640 01DD3340 E000A527 */  addiu       $5, $29, 0xE0
/* 027644 01DD3344 F000A627 */  addiu       $6, $29, 0xF0
/* 027648 01DD3348 0001A727 */  addiu       $7, $29, 0x100
/* 02764C 01DD334C 1A87040C */  jal         sceVu0NormalLightMatrix
/* 027650 01DD3350 00000000 */   nop
/* 027654 01DD3354 1001A427 */  addiu       $4, $29, 0x110
/* 027658 01DD3358 5001A527 */  addiu       $5, $29, 0x150
/* 02765C 01DD335C 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 027660 01DD3360 00000000 */   nop
/* 027664 01DD3364 E601023C */  lui         $2, %hi(CLogo)
/* 027668 01DD3368 E0DE4424 */  addiu       $4, $2, %lo(CLogo)
/* 02766C 01DD336C E501013C */  lui         $1, %hi(Logo + 0x2F0)
/* 027670 01DD3370 80302CC4 */  lwc1        $f12, %lo(Logo + 0x2F0)($1)
/* 027674 01DD3374 F04F770C */  jal         Sparkdraw__5CLogoFf
/* 027678 01DD3378 00000000 */   nop
/* 02767C 01DD337C E601023C */  lui         $2, %hi(CLogo)
/* 027680 01DD3380 E0DE4424 */  addiu       $4, $2, %lo(CLogo)
/* 027684 01DD3384 A450770C */  jal         Draw__5CLogoFv
/* 027688 01DD3388 00000000 */   nop
/* 02768C 01DD338C B002A0AF */  sw          $0, 0x2B0($29)
/* 027690 01DD3390 B402A0AF */  sw          $0, 0x2B4($29)
/* 027694 01DD3394 20010424 */  addiu       $4, $0, 0x120
/* 027698 01DD3398 B802A4AF */  sw          $4, 0x2B8($29)
/* 02769C 01DD339C AA000324 */  addiu       $3, $0, 0xAA
/* 0276A0 01DD33A0 BC02A3AF */  sw          $3, 0x2BC($29)
/* 0276A4 01DD33A4 A002A0AF */  sw          $0, 0x2A0($29)
/* 0276A8 01DD33A8 3E000224 */  addiu       $2, $0, 0x3E
/* 0276AC 01DD33AC A402A2AF */  sw          $2, 0x2A4($29)
/* 0276B0 01DD33B0 A802A4AF */  sw          $4, 0x2A8($29)
/* 0276B4 01DD33B4 AC02A3AF */  sw          $3, 0x2AC($29)
/* 0276B8 01DD33B8 A0B8040C */  jal         GetVif1Packet__Fv
/* 0276BC 01DD33BC 00000000 */   nop
/* 0276C0 01DD33C0 288E4070 */  paddub      $17, $2, $0
/* 0276C4 01DD33C4 C701023C */  lui         $2, %hi(TexManager)
/* 0276C8 01DD33C8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0276CC 01DD33CC DE01023C */  lui         $2, %hi(LIT_762__5)
/* 0276D0 01DD33D0 A00E4524 */  addiu       $5, $2, %lo(LIT_762__5)
/* 0276D4 01DD33D4 FFFF0624 */  addiu       $6, $0, -0x1
/* 0276D8 01DD33D8 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0276DC 01DD33DC 00000000 */   nop
/* 0276E0 01DD33E0 28864070 */  paddub      $16, $2, $0
/* 0276E4 01DD33E4 389C8427 */  addiu       $4, $28, -0x63C8
/* 0276E8 01DD33E8 489C858F */  lw          $5, -0x63B8($28)
/* 0276EC 01DD33EC 7C54770C */  jal         Get__8CScFaderFi
/* 0276F0 01DD33F0 00000000 */   nop
/* 0276F4 01DD33F4 FF004830 */  andi        $8, $2, 0xFF
/* 0276F8 01DD33F8 28262072 */  paddub      $4, $17, $0
/* 0276FC 01DD33FC 282E0072 */  paddub      $5, $16, $0
/* 027700 01DD3400 A002A627 */  addiu       $6, $29, 0x2A0
/* 027704 01DD3404 B002A727 */  addiu       $7, $29, 0x2B0
/* 027708 01DD3408 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 02770C 01DD340C 00000000 */   nop
/* 027710 01DD3410 20010524 */  addiu       $5, $0, 0x120
/* 027714 01DD3414 D002A5AF */  sw          $5, 0x2D0($29)
/* 027718 01DD3418 32000224 */  addiu       $2, $0, 0x32
/* 02771C 01DD341C D402A2AF */  sw          $2, 0x2D4($29)
/* 027720 01DD3420 48000424 */  addiu       $4, $0, 0x48
/* 027724 01DD3424 D802A4AF */  sw          $4, 0x2D8($29)
/* 027728 01DD3428 BE000324 */  addiu       $3, $0, 0xBE
/* 02772C 01DD342C DC02A3AF */  sw          $3, 0x2DC($29)
/* 027730 01DD3430 C002A5AF */  sw          $5, 0x2C0($29)
/* 027734 01DD3434 70000224 */  addiu       $2, $0, 0x70
/* 027738 01DD3438 C402A2AF */  sw          $2, 0x2C4($29)
/* 02773C 01DD343C C802A4AF */  sw          $4, 0x2C8($29)
/* 027740 01DD3440 CC02A3AF */  sw          $3, 0x2CC($29)
/* 027744 01DD3444 A0B8040C */  jal         GetVif1Packet__Fv
/* 027748 01DD3448 00000000 */   nop
/* 02774C 01DD344C 288E4070 */  paddub      $17, $2, $0
/* 027750 01DD3450 C701023C */  lui         $2, %hi(TexManager)
/* 027754 01DD3454 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 027758 01DD3458 DE01023C */  lui         $2, %hi(LIT_762__5)
/* 02775C 01DD345C A00E4524 */  addiu       $5, $2, %lo(LIT_762__5)
/* 027760 01DD3460 FFFF0624 */  addiu       $6, $0, -0x1
/* 027764 01DD3464 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 027768 01DD3468 00000000 */   nop
/* 02776C 01DD346C 28864070 */  paddub      $16, $2, $0
/* 027770 01DD3470 389C8427 */  addiu       $4, $28, -0x63C8
/* 027774 01DD3474 489C858F */  lw          $5, -0x63B8($28)
/* 027778 01DD3478 7C54770C */  jal         Get__8CScFaderFi
/* 02777C 01DD347C 00000000 */   nop
/* 027780 01DD3480 FF004830 */  andi        $8, $2, 0xFF
/* 027784 01DD3484 28262072 */  paddub      $4, $17, $0
/* 027788 01DD3488 282E0072 */  paddub      $5, $16, $0
/* 02778C 01DD348C C002A627 */  addiu       $6, $29, 0x2C0
/* 027790 01DD3490 D002A727 */  addiu       $7, $29, 0x2D0
/* 027794 01DD3494 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 027798 01DD3498 00000000 */   nop
/* 02779C 01DD349C 68010524 */  addiu       $5, $0, 0x168
/* 0277A0 01DD34A0 F002A5AF */  sw          $5, 0x2F0($29)
/* 0277A4 01DD34A4 50000224 */  addiu       $2, $0, 0x50
/* 0277A8 01DD34A8 F402A2AF */  sw          $2, 0x2F4($29)
/* 0277AC 01DD34AC 9C010424 */  addiu       $4, $0, 0x19C
/* 0277B0 01DD34B0 F802A4AF */  sw          $4, 0x2F8($29)
/* 0277B4 01DD34B4 A0000324 */  addiu       $3, $0, 0xA0
/* 0277B8 01DD34B8 FC02A3AF */  sw          $3, 0x2FC($29)
/* 0277BC 01DD34BC E002A5AF */  sw          $5, 0x2E0($29)
/* 0277C0 01DD34C0 8E000224 */  addiu       $2, $0, 0x8E
/* 0277C4 01DD34C4 E402A2AF */  sw          $2, 0x2E4($29)
/* 0277C8 01DD34C8 E802A4AF */  sw          $4, 0x2E8($29)
/* 0277CC 01DD34CC EC02A3AF */  sw          $3, 0x2EC($29)
/* 0277D0 01DD34D0 A0B8040C */  jal         GetVif1Packet__Fv
/* 0277D4 01DD34D4 00000000 */   nop
/* 0277D8 01DD34D8 288E4070 */  paddub      $17, $2, $0
/* 0277DC 01DD34DC C701023C */  lui         $2, %hi(TexManager)
/* 0277E0 01DD34E0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0277E4 01DD34E4 DE01023C */  lui         $2, %hi(LIT_762__5)
/* 0277E8 01DD34E8 A00E4524 */  addiu       $5, $2, %lo(LIT_762__5)
/* 0277EC 01DD34EC FFFF0624 */  addiu       $6, $0, -0x1
/* 0277F0 01DD34F0 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0277F4 01DD34F4 00000000 */   nop
/* 0277F8 01DD34F8 28864070 */  paddub      $16, $2, $0
/* 0277FC 01DD34FC 389C8427 */  addiu       $4, $28, -0x63C8
/* 027800 01DD3500 489C858F */  lw          $5, -0x63B8($28)
/* 027804 01DD3504 7C54770C */  jal         Get__8CScFaderFi
/* 027808 01DD3508 00000000 */   nop
/* 02780C 01DD350C FF004830 */  andi        $8, $2, 0xFF
/* 027810 01DD3510 28262072 */  paddub      $4, $17, $0
/* 027814 01DD3514 282E0072 */  paddub      $5, $16, $0
/* 027818 01DD3518 E002A627 */  addiu       $6, $29, 0x2E0
/* 02781C 01DD351C F002A727 */  addiu       $7, $29, 0x2F0
/* 027820 01DD3520 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 027824 01DD3524 00000000 */   nop
/* 027828 01DD3528 389C8427 */  addiu       $4, $28, -0x63C8
/* 02782C 01DD352C 80000524 */  addiu       $5, $0, 0x80
/* 027830 01DD3530 7C54770C */  jal         Get__8CScFaderFi
/* 027834 01DD3534 00000000 */   nop
/* 027838 01DD3538 00008244 */  mtc1        $2, $f0
/* 02783C 01DD353C 00000000 */  nop
/* 027840 01DD3540 20008046 */  cvt.s.w     $f0, $f0
/* 027844 01DD3544 9C01A0E7 */  swc1        $f0, 0x19C($29)
/* 027848 01DD3548 9001A427 */  addiu       $4, $29, 0x190
/* 02784C 01DD354C 40B7040C */  jal         MGSetAmbient__FPf
/* 027850 01DD3550 00000000 */   nop
/* 027854 01DD3554 389C8427 */  addiu       $4, $28, -0x63C8
/* 027858 01DD3558 80000524 */  addiu       $5, $0, 0x80
/* 02785C 01DD355C 7C54770C */  jal         Get__8CScFaderFi
/* 027860 01DD3560 00000000 */   nop
/* 027864 01DD3564 80000324 */  addiu       $3, $0, 0x80
/* 027868 01DD3568 05004314 */  bne         $2, $3, .L01DD3580_2D8D80
/* 02786C 01DD356C 00000000 */   nop
/* 027870 01DD3570 E601023C */  lui         $2, %hi(CSprite)
/* 027874 01DD3574 70DE4424 */  addiu       $4, $2, %lo(CSprite)
/* 027878 01DD3578 D851770C */  jal         Draw__7CSpriteFv
/* 02787C 01DD357C 00000000 */   nop
.L01DD3580_2D8D80:
/* 027880 01DD3580 1003A0AF */  sw          $0, 0x310($29)
/* 027884 01DD3584 40000424 */  addiu       $4, $0, 0x40
/* 027888 01DD3588 1403A4AF */  sw          $4, 0x314($29)
/* 02788C 01DD358C 00020324 */  addiu       $3, $0, 0x200
/* 027890 01DD3590 1803A3AF */  sw          $3, 0x318($29)
/* 027894 01DD3594 1C03A4AF */  sw          $4, 0x31C($29)
/* 027898 01DD3598 0003A4AF */  sw          $4, 0x300($29)
/* 02789C 01DD359C 6A010224 */  addiu       $2, $0, 0x16A
/* 0278A0 01DD35A0 0403A2AF */  sw          $2, 0x304($29)
/* 0278A4 01DD35A4 0803A3AF */  sw          $3, 0x308($29)
/* 0278A8 01DD35A8 0C03A4AF */  sw          $4, 0x30C($29)
/* 0278AC 01DD35AC A0B8040C */  jal         GetVif1Packet__Fv
/* 0278B0 01DD35B0 00000000 */   nop
/* 0278B4 01DD35B4 288E4070 */  paddub      $17, $2, $0
/* 0278B8 01DD35B8 C701023C */  lui         $2, %hi(TexManager)
/* 0278BC 01DD35BC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0278C0 01DD35C0 DE01023C */  lui         $2, %hi(LIT_763__5)
/* 0278C4 01DD35C4 A80E4524 */  addiu       $5, $2, %lo(LIT_763__5)
/* 0278C8 01DD35C8 FFFF0624 */  addiu       $6, $0, -0x1
/* 0278CC 01DD35CC B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0278D0 01DD35D0 00000000 */   nop
/* 0278D4 01DD35D4 28864070 */  paddub      $16, $2, $0
/* 0278D8 01DD35D8 389C8427 */  addiu       $4, $28, -0x63C8
/* 0278DC 01DD35DC 3C9C858F */  lw          $5, -0x63C4($28)
/* 0278E0 01DD35E0 7C54770C */  jal         Get__8CScFaderFi
/* 0278E4 01DD35E4 00000000 */   nop
/* 0278E8 01DD35E8 FF004830 */  andi        $8, $2, 0xFF
/* 0278EC 01DD35EC 28262072 */  paddub      $4, $17, $0
/* 0278F0 01DD35F0 282E0072 */  paddub      $5, $16, $0
/* 0278F4 01DD35F4 0003A627 */  addiu       $6, $29, 0x300
/* 0278F8 01DD35F8 1003A727 */  addiu       $7, $29, 0x310
/* 0278FC 01DD35FC C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 027900 01DD3600 00000000 */   nop
/* 027904 01DD3604 309C838F */  lw          $3, -0x63D0($28)
/* 027908 01DD3608 03000224 */  addiu       $2, $0, 0x3
/* 02790C 01DD360C 24006214 */  bne         $3, $2, .L01DD36A0_2D8EA0
/* 027910 01DD3610 00000000 */   nop
/* 027914 01DD3614 3003A0AF */  sw          $0, 0x330($29)
/* 027918 01DD3618 3403A0AF */  sw          $0, 0x334($29)
/* 02791C 01DD361C 00020424 */  addiu       $4, $0, 0x200
/* 027920 01DD3620 3803A4AF */  sw          $4, 0x338($29)
/* 027924 01DD3624 40000324 */  addiu       $3, $0, 0x40
/* 027928 01DD3628 3C03A3AF */  sw          $3, 0x33C($29)
/* 02792C 01DD362C 2003A3AF */  sw          $3, 0x320($29)
/* 027930 01DD3630 28010224 */  addiu       $2, $0, 0x128
/* 027934 01DD3634 2403A2AF */  sw          $2, 0x324($29)
/* 027938 01DD3638 2803A4AF */  sw          $4, 0x328($29)
/* 02793C 01DD363C 2C03A3AF */  sw          $3, 0x32C($29)
/* 027940 01DD3640 A0B8040C */  jal         GetVif1Packet__Fv
/* 027944 01DD3644 00000000 */   nop
/* 027948 01DD3648 288E4070 */  paddub      $17, $2, $0
/* 02794C 01DD364C C701023C */  lui         $2, %hi(TexManager)
/* 027950 01DD3650 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 027954 01DD3654 DE01023C */  lui         $2, %hi(LIT_763__5)
/* 027958 01DD3658 A80E4524 */  addiu       $5, $2, %lo(LIT_763__5)
/* 02795C 01DD365C FFFF0624 */  addiu       $6, $0, -0x1
/* 027960 01DD3660 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 027964 01DD3664 00000000 */   nop
/* 027968 01DD3668 28864070 */  paddub      $16, $2, $0
/* 02796C 01DD366C 389C8427 */  addiu       $4, $28, -0x63C8
/* 027970 01DD3670 409C858F */  lw          $5, -0x63C0($28)
/* 027974 01DD3674 7C54770C */  jal         Get__8CScFaderFi
/* 027978 01DD3678 00000000 */   nop
/* 02797C 01DD367C FF004830 */  andi        $8, $2, 0xFF
/* 027980 01DD3680 28262072 */  paddub      $4, $17, $0
/* 027984 01DD3684 282E0072 */  paddub      $5, $16, $0
/* 027988 01DD3688 2003A627 */  addiu       $6, $29, 0x320
/* 02798C 01DD368C 3003A727 */  addiu       $7, $29, 0x330
/* 027990 01DD3690 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 027994 01DD3694 00000000 */   nop
/* 027998 01DD3698 B4010010 */  b           .L01DD3D6C_2D956C
/* 02799C 01DD369C 00000000 */   nop
.L01DD36A0_2D8EA0:
/* 0279A0 01DD36A0 689C8283 */  lb          $2, -0x6398($28)
/* 0279A4 01DD36A4 05004014 */  bnez        $2, .L01DD36BC_2D8EBC
/* 0279A8 01DD36A8 00000000 */   nop
/* 0279AC 01DD36AC 80000224 */  addiu       $2, $0, 0x80
/* 0279B0 01DD36B0 649C82AF */  sw          $2, -0x639C($28)
/* 0279B4 01DD36B4 01000224 */  addiu       $2, $0, 0x1
/* 0279B8 01DD36B8 689C82A3 */  sb          $2, -0x6398($28)
.L01DD36BC_2D8EBC:
/* 0279BC 01DD36BC 589C8293 */  lbu         $2, -0x63A8($28)
/* 0279C0 01DD36C0 11004010 */  beqz        $2, .L01DD3708_2D8F08
/* 0279C4 01DD36C4 00000000 */   nop
/* 0279C8 01DD36C8 5C9C838F */  lw          $3, -0x63A4($28)
/* 0279CC 01DD36CC 03000224 */  addiu       $2, $0, 0x3
/* 0279D0 01DD36D0 1A006200 */  div         $0, $3, $2
/* 0279D4 01DD36D4 00000000 */  nop
/* 0279D8 01DD36D8 00000000 */  nop
/* 0279DC 01DD36DC 10100000 */  mfhi        $2
/* 0279E0 01DD36E0 05004014 */  bnez        $2, .L01DD36F8_2D8EF8
/* 0279E4 01DD36E4 00000000 */   nop
/* 0279E8 01DD36E8 20000224 */  addiu       $2, $0, 0x20
/* 0279EC 01DD36EC 649C82AF */  sw          $2, -0x639C($28)
/* 0279F0 01DD36F0 07000010 */  b           .L01DD3710_2D8F10
/* 0279F4 01DD36F4 00000000 */   nop
.L01DD36F8_2D8EF8:
/* 0279F8 01DD36F8 80000224 */  addiu       $2, $0, 0x80
/* 0279FC 01DD36FC 649C82AF */  sw          $2, -0x639C($28)
/* 027A00 01DD3700 03000010 */  b           .L01DD3710_2D8F10
/* 027A04 01DD3704 00000000 */   nop
.L01DD3708_2D8F08:
/* 027A08 01DD3708 80000224 */  addiu       $2, $0, 0x80
/* 027A0C 01DD370C 649C82AF */  sw          $2, -0x639C($28)
.L01DD3710_2D8F10:
/* 027A10 01DD3710 E601023C */  lui         $2, %hi(CCursol)
/* 027A14 01DD3714 40DF4424 */  addiu       $4, $2, %lo(CCursol)
/* 027A18 01DD3718 3054770C */  jal         GetSelect__7CCursolFv
/* 027A1C 01DD371C 00000000 */   nop
/* 027A20 01DD3720 02000324 */  addiu       $3, $0, 0x2
/* 027A24 01DD3724 DA004310 */  beq         $2, $3, .L01DD3A90_2D9290
/* 027A28 01DD3728 00000000 */   nop
/* 027A2C 01DD372C 01000324 */  addiu       $3, $0, 0x1
/* 027A30 01DD3730 6E004310 */  beq         $2, $3, .L01DD38EC_2D90EC
/* 027A34 01DD3734 00000000 */   nop
/* 027A38 01DD3738 03004010 */  beqz        $2, .L01DD3748_2D8F48
/* 027A3C 01DD373C 00000000 */   nop
/* 027A40 01DD3740 3A010010 */  b           .L01DD3C2C_2D942C
/* 027A44 01DD3744 00000000 */   nop
.L01DD3748_2D8F48:
/* 027A48 01DD3748 5003A0AF */  sw          $0, 0x350($29)
/* 027A4C 01DD374C 5403A0AF */  sw          $0, 0x354($29)
/* 027A50 01DD3750 00010424 */  addiu       $4, $0, 0x100
/* 027A54 01DD3754 5803A4AF */  sw          $4, 0x358($29)
/* 027A58 01DD3758 20000324 */  addiu       $3, $0, 0x20
/* 027A5C 01DD375C 5C03A3AF */  sw          $3, 0x35C($29)
/* 027A60 01DD3760 C1000224 */  addiu       $2, $0, 0xC1
/* 027A64 01DD3764 4003A2AF */  sw          $2, 0x340($29)
/* 027A68 01DD3768 18010224 */  addiu       $2, $0, 0x118
/* 027A6C 01DD376C 4403A2AF */  sw          $2, 0x344($29)
/* 027A70 01DD3770 4803A4AF */  sw          $4, 0x348($29)
/* 027A74 01DD3774 4C03A3AF */  sw          $3, 0x34C($29)
/* 027A78 01DD3778 A0B8040C */  jal         GetVif1Packet__Fv
/* 027A7C 01DD377C 00000000 */   nop
/* 027A80 01DD3780 288E4070 */  paddub      $17, $2, $0
/* 027A84 01DD3784 C701023C */  lui         $2, %hi(TexManager)
/* 027A88 01DD3788 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 027A8C 01DD378C DE01023C */  lui         $2, %hi(LIT_764__5)
/* 027A90 01DD3790 B00E4524 */  addiu       $5, $2, %lo(LIT_764__5)
/* 027A94 01DD3794 FFFF0624 */  addiu       $6, $0, -0x1
/* 027A98 01DD3798 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 027A9C 01DD379C 00000000 */   nop
/* 027AA0 01DD37A0 28864070 */  paddub      $16, $2, $0
/* 027AA4 01DD37A4 389C8427 */  addiu       $4, $28, -0x63C8
/* 027AA8 01DD37A8 649C858F */  lw          $5, -0x639C($28)
/* 027AAC 01DD37AC 7C54770C */  jal         Get__8CScFaderFi
/* 027AB0 01DD37B0 00000000 */   nop
/* 027AB4 01DD37B4 FF004830 */  andi        $8, $2, 0xFF
/* 027AB8 01DD37B8 28262072 */  paddub      $4, $17, $0
/* 027ABC 01DD37BC 282E0072 */  paddub      $5, $16, $0
/* 027AC0 01DD37C0 4003A627 */  addiu       $6, $29, 0x340
/* 027AC4 01DD37C4 5003A727 */  addiu       $7, $29, 0x350
/* 027AC8 01DD37C8 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 027ACC 01DD37CC 00000000 */   nop
/* 027AD0 01DD37D0 7003A0AF */  sw          $0, 0x370($29)
/* 027AD4 01DD37D4 20000424 */  addiu       $4, $0, 0x20
/* 027AD8 01DD37D8 7403A4AF */  sw          $4, 0x374($29)
/* 027ADC 01DD37DC 00010324 */  addiu       $3, $0, 0x100
/* 027AE0 01DD37E0 7803A3AF */  sw          $3, 0x378($29)
/* 027AE4 01DD37E4 7C03A4AF */  sw          $4, 0x37C($29)
/* 027AE8 01DD37E8 C1000224 */  addiu       $2, $0, 0xC1
/* 027AEC 01DD37EC 6003A2AF */  sw          $2, 0x360($29)
/* 027AF0 01DD37F0 38010224 */  addiu       $2, $0, 0x138
/* 027AF4 01DD37F4 6403A2AF */  sw          $2, 0x364($29)
/* 027AF8 01DD37F8 6803A3AF */  sw          $3, 0x368($29)
/* 027AFC 01DD37FC 6C03A4AF */  sw          $4, 0x36C($29)
/* 027B00 01DD3800 A0B8040C */  jal         GetVif1Packet__Fv
/* 027B04 01DD3804 00000000 */   nop
/* 027B08 01DD3808 288E4070 */  paddub      $17, $2, $0
/* 027B0C 01DD380C C701023C */  lui         $2, %hi(TexManager)
/* 027B10 01DD3810 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 027B14 01DD3814 DE01023C */  lui         $2, %hi(LIT_764__5)
/* 027B18 01DD3818 B00E4524 */  addiu       $5, $2, %lo(LIT_764__5)
/* 027B1C 01DD381C FFFF0624 */  addiu       $6, $0, -0x1
/* 027B20 01DD3820 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 027B24 01DD3824 00000000 */   nop
/* 027B28 01DD3828 28864070 */  paddub      $16, $2, $0
/* 027B2C 01DD382C 389C8427 */  addiu       $4, $28, -0x63C8
/* 027B30 01DD3830 20000524 */  addiu       $5, $0, 0x20
/* 027B34 01DD3834 7C54770C */  jal         Get__8CScFaderFi
/* 027B38 01DD3838 00000000 */   nop
/* 027B3C 01DD383C FF004830 */  andi        $8, $2, 0xFF
/* 027B40 01DD3840 28262072 */  paddub      $4, $17, $0
/* 027B44 01DD3844 282E0072 */  paddub      $5, $16, $0
/* 027B48 01DD3848 6003A627 */  addiu       $6, $29, 0x360
/* 027B4C 01DD384C 7003A727 */  addiu       $7, $29, 0x370
/* 027B50 01DD3850 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 027B54 01DD3854 00000000 */   nop
/* 027B58 01DD3858 9003A0AF */  sw          $0, 0x390($29)
/* 027B5C 01DD385C 40000224 */  addiu       $2, $0, 0x40
/* 027B60 01DD3860 9403A2AF */  sw          $2, 0x394($29)
/* 027B64 01DD3864 00010424 */  addiu       $4, $0, 0x100
/* 027B68 01DD3868 9803A4AF */  sw          $4, 0x398($29)
/* 027B6C 01DD386C 20000324 */  addiu       $3, $0, 0x20
/* 027B70 01DD3870 9C03A3AF */  sw          $3, 0x39C($29)
/* 027B74 01DD3874 C1000224 */  addiu       $2, $0, 0xC1
/* 027B78 01DD3878 8003A2AF */  sw          $2, 0x380($29)
/* 027B7C 01DD387C 58010224 */  addiu       $2, $0, 0x158
/* 027B80 01DD3880 8403A2AF */  sw          $2, 0x384($29)
/* 027B84 01DD3884 8803A4AF */  sw          $4, 0x388($29)
/* 027B88 01DD3888 8C03A3AF */  sw          $3, 0x38C($29)
/* 027B8C 01DD388C A0B8040C */  jal         GetVif1Packet__Fv
/* 027B90 01DD3890 00000000 */   nop
/* 027B94 01DD3894 288E4070 */  paddub      $17, $2, $0
/* 027B98 01DD3898 C701023C */  lui         $2, %hi(TexManager)
/* 027B9C 01DD389C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 027BA0 01DD38A0 DE01023C */  lui         $2, %hi(LIT_764__5)
/* 027BA4 01DD38A4 B00E4524 */  addiu       $5, $2, %lo(LIT_764__5)
/* 027BA8 01DD38A8 FFFF0624 */  addiu       $6, $0, -0x1
/* 027BAC 01DD38AC B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 027BB0 01DD38B0 00000000 */   nop
/* 027BB4 01DD38B4 28864070 */  paddub      $16, $2, $0
/* 027BB8 01DD38B8 389C8427 */  addiu       $4, $28, -0x63C8
/* 027BBC 01DD38BC 20000524 */  addiu       $5, $0, 0x20
/* 027BC0 01DD38C0 7C54770C */  jal         Get__8CScFaderFi
/* 027BC4 01DD38C4 00000000 */   nop
/* 027BC8 01DD38C8 FF004830 */  andi        $8, $2, 0xFF
/* 027BCC 01DD38CC 28262072 */  paddub      $4, $17, $0
/* 027BD0 01DD38D0 282E0072 */  paddub      $5, $16, $0
/* 027BD4 01DD38D4 8003A627 */  addiu       $6, $29, 0x380
/* 027BD8 01DD38D8 9003A727 */  addiu       $7, $29, 0x390
/* 027BDC 01DD38DC C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 027BE0 01DD38E0 00000000 */   nop
/* 027BE4 01DD38E4 D1000010 */  b           .L01DD3C2C_2D942C
/* 027BE8 01DD38E8 00000000 */   nop
.L01DD38EC_2D90EC:
/* 027BEC 01DD38EC B003A0AF */  sw          $0, 0x3B0($29)
/* 027BF0 01DD38F0 B403A0AF */  sw          $0, 0x3B4($29)
/* 027BF4 01DD38F4 00010424 */  addiu       $4, $0, 0x100
/* 027BF8 01DD38F8 B803A4AF */  sw          $4, 0x3B8($29)
/* 027BFC 01DD38FC 20000324 */  addiu       $3, $0, 0x20
/* 027C00 01DD3900 BC03A3AF */  sw          $3, 0x3BC($29)
/* 027C04 01DD3904 C1000224 */  addiu       $2, $0, 0xC1
/* 027C08 01DD3908 A003A2AF */  sw          $2, 0x3A0($29)
/* 027C0C 01DD390C 18010224 */  addiu       $2, $0, 0x118
/* 027C10 01DD3910 A403A2AF */  sw          $2, 0x3A4($29)
/* 027C14 01DD3914 A803A4AF */  sw          $4, 0x3A8($29)
/* 027C18 01DD3918 AC03A3AF */  sw          $3, 0x3AC($29)
/* 027C1C 01DD391C A0B8040C */  jal         GetVif1Packet__Fv
/* 027C20 01DD3920 00000000 */   nop
/* 027C24 01DD3924 288E4070 */  paddub      $17, $2, $0
/* 027C28 01DD3928 C701023C */  lui         $2, %hi(TexManager)
/* 027C2C 01DD392C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 027C30 01DD3930 DE01023C */  lui         $2, %hi(LIT_764__5)
/* 027C34 01DD3934 B00E4524 */  addiu       $5, $2, %lo(LIT_764__5)
/* 027C38 01DD3938 FFFF0624 */  addiu       $6, $0, -0x1
/* 027C3C 01DD393C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 027C40 01DD3940 00000000 */   nop
/* 027C44 01DD3944 28864070 */  paddub      $16, $2, $0
/* 027C48 01DD3948 389C8427 */  addiu       $4, $28, -0x63C8
/* 027C4C 01DD394C 20000524 */  addiu       $5, $0, 0x20
/* 027C50 01DD3950 7C54770C */  jal         Get__8CScFaderFi
/* 027C54 01DD3954 00000000 */   nop
/* 027C58 01DD3958 FF004830 */  andi        $8, $2, 0xFF
/* 027C5C 01DD395C 28262072 */  paddub      $4, $17, $0
/* 027C60 01DD3960 282E0072 */  paddub      $5, $16, $0
/* 027C64 01DD3964 A003A627 */  addiu       $6, $29, 0x3A0
/* 027C68 01DD3968 B003A727 */  addiu       $7, $29, 0x3B0
/* 027C6C 01DD396C C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 027C70 01DD3970 00000000 */   nop
/* 027C74 01DD3974 D003A0AF */  sw          $0, 0x3D0($29)
/* 027C78 01DD3978 20000424 */  addiu       $4, $0, 0x20
/* 027C7C 01DD397C D403A4AF */  sw          $4, 0x3D4($29)
/* 027C80 01DD3980 00010324 */  addiu       $3, $0, 0x100
/* 027C84 01DD3984 D803A3AF */  sw          $3, 0x3D8($29)
/* 027C88 01DD3988 DC03A4AF */  sw          $4, 0x3DC($29)
/* 027C8C 01DD398C C1000224 */  addiu       $2, $0, 0xC1
/* 027C90 01DD3990 C003A2AF */  sw          $2, 0x3C0($29)
/* 027C94 01DD3994 38010224 */  addiu       $2, $0, 0x138
/* 027C98 01DD3998 C403A2AF */  sw          $2, 0x3C4($29)
/* 027C9C 01DD399C C803A3AF */  sw          $3, 0x3C8($29)
/* 027CA0 01DD39A0 CC03A4AF */  sw          $4, 0x3CC($29)
/* 027CA4 01DD39A4 A0B8040C */  jal         GetVif1Packet__Fv
/* 027CA8 01DD39A8 00000000 */   nop
/* 027CAC 01DD39AC 288E4070 */  paddub      $17, $2, $0
/* 027CB0 01DD39B0 C701023C */  lui         $2, %hi(TexManager)
/* 027CB4 01DD39B4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 027CB8 01DD39B8 DE01023C */  lui         $2, %hi(LIT_764__5)
/* 027CBC 01DD39BC B00E4524 */  addiu       $5, $2, %lo(LIT_764__5)
/* 027CC0 01DD39C0 FFFF0624 */  addiu       $6, $0, -0x1
/* 027CC4 01DD39C4 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 027CC8 01DD39C8 00000000 */   nop
/* 027CCC 01DD39CC 28864070 */  paddub      $16, $2, $0
/* 027CD0 01DD39D0 389C8427 */  addiu       $4, $28, -0x63C8
/* 027CD4 01DD39D4 649C858F */  lw          $5, -0x639C($28)
/* 027CD8 01DD39D8 7C54770C */  jal         Get__8CScFaderFi
/* 027CDC 01DD39DC 00000000 */   nop
/* 027CE0 01DD39E0 FF004830 */  andi        $8, $2, 0xFF
/* 027CE4 01DD39E4 28262072 */  paddub      $4, $17, $0
/* 027CE8 01DD39E8 282E0072 */  paddub      $5, $16, $0
/* 027CEC 01DD39EC C003A627 */  addiu       $6, $29, 0x3C0
/* 027CF0 01DD39F0 D003A727 */  addiu       $7, $29, 0x3D0
/* 027CF4 01DD39F4 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 027CF8 01DD39F8 00000000 */   nop
/* 027CFC 01DD39FC F003A0AF */  sw          $0, 0x3F0($29)
/* 027D00 01DD3A00 40000224 */  addiu       $2, $0, 0x40
/* 027D04 01DD3A04 F403A2AF */  sw          $2, 0x3F4($29)
/* 027D08 01DD3A08 00010424 */  addiu       $4, $0, 0x100
/* 027D0C 01DD3A0C F803A4AF */  sw          $4, 0x3F8($29)
/* 027D10 01DD3A10 20000324 */  addiu       $3, $0, 0x20
/* 027D14 01DD3A14 FC03A3AF */  sw          $3, 0x3FC($29)
/* 027D18 01DD3A18 C1000224 */  addiu       $2, $0, 0xC1
/* 027D1C 01DD3A1C E003A2AF */  sw          $2, 0x3E0($29)
/* 027D20 01DD3A20 58010224 */  addiu       $2, $0, 0x158
/* 027D24 01DD3A24 E403A2AF */  sw          $2, 0x3E4($29)
/* 027D28 01DD3A28 E803A4AF */  sw          $4, 0x3E8($29)
/* 027D2C 01DD3A2C EC03A3AF */  sw          $3, 0x3EC($29)
/* 027D30 01DD3A30 A0B8040C */  jal         GetVif1Packet__Fv
/* 027D34 01DD3A34 00000000 */   nop
/* 027D38 01DD3A38 288E4070 */  paddub      $17, $2, $0
/* 027D3C 01DD3A3C C701023C */  lui         $2, %hi(TexManager)
/* 027D40 01DD3A40 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 027D44 01DD3A44 DE01023C */  lui         $2, %hi(LIT_764__5)
/* 027D48 01DD3A48 B00E4524 */  addiu       $5, $2, %lo(LIT_764__5)
/* 027D4C 01DD3A4C FFFF0624 */  addiu       $6, $0, -0x1
/* 027D50 01DD3A50 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 027D54 01DD3A54 00000000 */   nop
/* 027D58 01DD3A58 28864070 */  paddub      $16, $2, $0
/* 027D5C 01DD3A5C 389C8427 */  addiu       $4, $28, -0x63C8
/* 027D60 01DD3A60 20000524 */  addiu       $5, $0, 0x20
/* 027D64 01DD3A64 7C54770C */  jal         Get__8CScFaderFi
/* 027D68 01DD3A68 00000000 */   nop
/* 027D6C 01DD3A6C FF004830 */  andi        $8, $2, 0xFF
/* 027D70 01DD3A70 28262072 */  paddub      $4, $17, $0
/* 027D74 01DD3A74 282E0072 */  paddub      $5, $16, $0
/* 027D78 01DD3A78 E003A627 */  addiu       $6, $29, 0x3E0
/* 027D7C 01DD3A7C F003A727 */  addiu       $7, $29, 0x3F0
/* 027D80 01DD3A80 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 027D84 01DD3A84 00000000 */   nop
/* 027D88 01DD3A88 68000010 */  b           .L01DD3C2C_2D942C
/* 027D8C 01DD3A8C 00000000 */   nop
.L01DD3A90_2D9290:
/* 027D90 01DD3A90 1004A0AF */  sw          $0, 0x410($29)
/* 027D94 01DD3A94 1404A0AF */  sw          $0, 0x414($29)
/* 027D98 01DD3A98 00010424 */  addiu       $4, $0, 0x100
/* 027D9C 01DD3A9C 1804A4AF */  sw          $4, 0x418($29)
/* 027DA0 01DD3AA0 20000324 */  addiu       $3, $0, 0x20
/* 027DA4 01DD3AA4 1C04A3AF */  sw          $3, 0x41C($29)
/* 027DA8 01DD3AA8 C1000224 */  addiu       $2, $0, 0xC1
/* 027DAC 01DD3AAC 0004A2AF */  sw          $2, 0x400($29)
/* 027DB0 01DD3AB0 18010224 */  addiu       $2, $0, 0x118
/* 027DB4 01DD3AB4 0404A2AF */  sw          $2, 0x404($29)
/* 027DB8 01DD3AB8 0804A4AF */  sw          $4, 0x408($29)
/* 027DBC 01DD3ABC 0C04A3AF */  sw          $3, 0x40C($29)
/* 027DC0 01DD3AC0 A0B8040C */  jal         GetVif1Packet__Fv
/* 027DC4 01DD3AC4 00000000 */   nop
/* 027DC8 01DD3AC8 288E4070 */  paddub      $17, $2, $0
/* 027DCC 01DD3ACC C701023C */  lui         $2, %hi(TexManager)
/* 027DD0 01DD3AD0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 027DD4 01DD3AD4 DE01023C */  lui         $2, %hi(LIT_764__5)
/* 027DD8 01DD3AD8 B00E4524 */  addiu       $5, $2, %lo(LIT_764__5)
/* 027DDC 01DD3ADC FFFF0624 */  addiu       $6, $0, -0x1
/* 027DE0 01DD3AE0 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 027DE4 01DD3AE4 00000000 */   nop
/* 027DE8 01DD3AE8 28864070 */  paddub      $16, $2, $0
/* 027DEC 01DD3AEC 389C8427 */  addiu       $4, $28, -0x63C8
/* 027DF0 01DD3AF0 20000524 */  addiu       $5, $0, 0x20
/* 027DF4 01DD3AF4 7C54770C */  jal         Get__8CScFaderFi
/* 027DF8 01DD3AF8 00000000 */   nop
/* 027DFC 01DD3AFC FF004830 */  andi        $8, $2, 0xFF
/* 027E00 01DD3B00 28262072 */  paddub      $4, $17, $0
/* 027E04 01DD3B04 282E0072 */  paddub      $5, $16, $0
/* 027E08 01DD3B08 0004A627 */  addiu       $6, $29, 0x400
/* 027E0C 01DD3B0C 1004A727 */  addiu       $7, $29, 0x410
/* 027E10 01DD3B10 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 027E14 01DD3B14 00000000 */   nop
/* 027E18 01DD3B18 3004A0AF */  sw          $0, 0x430($29)
/* 027E1C 01DD3B1C 20000424 */  addiu       $4, $0, 0x20
/* 027E20 01DD3B20 3404A4AF */  sw          $4, 0x434($29)
/* 027E24 01DD3B24 00010324 */  addiu       $3, $0, 0x100
/* 027E28 01DD3B28 3804A3AF */  sw          $3, 0x438($29)
/* 027E2C 01DD3B2C 3C04A4AF */  sw          $4, 0x43C($29)
/* 027E30 01DD3B30 C1000224 */  addiu       $2, $0, 0xC1
/* 027E34 01DD3B34 2004A2AF */  sw          $2, 0x420($29)
/* 027E38 01DD3B38 38010224 */  addiu       $2, $0, 0x138
/* 027E3C 01DD3B3C 2404A2AF */  sw          $2, 0x424($29)
/* 027E40 01DD3B40 2804A3AF */  sw          $3, 0x428($29)
/* 027E44 01DD3B44 2C04A4AF */  sw          $4, 0x42C($29)
/* 027E48 01DD3B48 A0B8040C */  jal         GetVif1Packet__Fv
/* 027E4C 01DD3B4C 00000000 */   nop
/* 027E50 01DD3B50 288E4070 */  paddub      $17, $2, $0
/* 027E54 01DD3B54 C701023C */  lui         $2, %hi(TexManager)
/* 027E58 01DD3B58 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 027E5C 01DD3B5C DE01023C */  lui         $2, %hi(LIT_764__5)
/* 027E60 01DD3B60 B00E4524 */  addiu       $5, $2, %lo(LIT_764__5)
/* 027E64 01DD3B64 FFFF0624 */  addiu       $6, $0, -0x1
/* 027E68 01DD3B68 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 027E6C 01DD3B6C 00000000 */   nop
/* 027E70 01DD3B70 28864070 */  paddub      $16, $2, $0
/* 027E74 01DD3B74 389C8427 */  addiu       $4, $28, -0x63C8
/* 027E78 01DD3B78 20000524 */  addiu       $5, $0, 0x20
/* 027E7C 01DD3B7C 7C54770C */  jal         Get__8CScFaderFi
/* 027E80 01DD3B80 00000000 */   nop
/* 027E84 01DD3B84 FF004830 */  andi        $8, $2, 0xFF
/* 027E88 01DD3B88 28262072 */  paddub      $4, $17, $0
/* 027E8C 01DD3B8C 282E0072 */  paddub      $5, $16, $0
/* 027E90 01DD3B90 2004A627 */  addiu       $6, $29, 0x420
/* 027E94 01DD3B94 3004A727 */  addiu       $7, $29, 0x430
/* 027E98 01DD3B98 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 027E9C 01DD3B9C 00000000 */   nop
/* 027EA0 01DD3BA0 5004A0AF */  sw          $0, 0x450($29)
/* 027EA4 01DD3BA4 40000224 */  addiu       $2, $0, 0x40
/* 027EA8 01DD3BA8 5404A2AF */  sw          $2, 0x454($29)
/* 027EAC 01DD3BAC 00010424 */  addiu       $4, $0, 0x100
/* 027EB0 01DD3BB0 5804A4AF */  sw          $4, 0x458($29)
/* 027EB4 01DD3BB4 20000324 */  addiu       $3, $0, 0x20
/* 027EB8 01DD3BB8 5C04A3AF */  sw          $3, 0x45C($29)
/* 027EBC 01DD3BBC C1000224 */  addiu       $2, $0, 0xC1
/* 027EC0 01DD3BC0 4004A2AF */  sw          $2, 0x440($29)
/* 027EC4 01DD3BC4 58010224 */  addiu       $2, $0, 0x158
/* 027EC8 01DD3BC8 4404A2AF */  sw          $2, 0x444($29)
/* 027ECC 01DD3BCC 4804A4AF */  sw          $4, 0x448($29)
/* 027ED0 01DD3BD0 4C04A3AF */  sw          $3, 0x44C($29)
/* 027ED4 01DD3BD4 A0B8040C */  jal         GetVif1Packet__Fv
/* 027ED8 01DD3BD8 00000000 */   nop
/* 027EDC 01DD3BDC 288E4070 */  paddub      $17, $2, $0
/* 027EE0 01DD3BE0 C701023C */  lui         $2, %hi(TexManager)
/* 027EE4 01DD3BE4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 027EE8 01DD3BE8 DE01023C */  lui         $2, %hi(LIT_764__5)
/* 027EEC 01DD3BEC B00E4524 */  addiu       $5, $2, %lo(LIT_764__5)
/* 027EF0 01DD3BF0 FFFF0624 */  addiu       $6, $0, -0x1
/* 027EF4 01DD3BF4 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 027EF8 01DD3BF8 00000000 */   nop
/* 027EFC 01DD3BFC 28864070 */  paddub      $16, $2, $0
/* 027F00 01DD3C00 389C8427 */  addiu       $4, $28, -0x63C8
/* 027F04 01DD3C04 649C858F */  lw          $5, -0x639C($28)
/* 027F08 01DD3C08 7C54770C */  jal         Get__8CScFaderFi
/* 027F0C 01DD3C0C 00000000 */   nop
/* 027F10 01DD3C10 FF004830 */  andi        $8, $2, 0xFF
/* 027F14 01DD3C14 28262072 */  paddub      $4, $17, $0
/* 027F18 01DD3C18 282E0072 */  paddub      $5, $16, $0
/* 027F1C 01DD3C1C 4004A627 */  addiu       $6, $29, 0x440
/* 027F20 01DD3C20 5004A727 */  addiu       $7, $29, 0x450
/* 027F24 01DD3C24 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 027F28 01DD3C28 00000000 */   nop
.L01DD3C2C_2D942C:
/* 027F2C 01DD3C2C 309C838F */  lw          $3, -0x63D0($28)
/* 027F30 01DD3C30 07000224 */  addiu       $2, $0, 0x7
/* 027F34 01DD3C34 4D006210 */  beq         $3, $2, .L01DD3D6C_2D956C
/* 027F38 01DD3C38 00000000 */   nop
/* 027F3C 01DD3C3C 28260070 */  paddub      $4, $0, $0
/* 027F40 01DD3C40 046F050C */  jal         setbilinear__Fi
/* 027F44 01DD3C44 00000000 */   nop
/* 027F48 01DD3C48 F896828F */  lw          $2, -0x6908($28)
/* 027F4C 01DD3C4C 01004224 */  addiu       $2, $2, 0x1
/* 027F50 01DD3C50 F89682AF */  sw          $2, -0x6908($28)
/* 027F54 01DD3C54 DE01023C */  lui         $2, %hi(LIT_592__3)
/* 027F58 01DD3C58 00BD4224 */  addiu       $2, $2, %lo(LIT_592__3)
/* 027F5C 01DD3C5C A001A327 */  addiu       $3, $29, 0x1A0
/* 027F60 01DD3C60 00004278 */  lq          $2, 0x0($2)
/* 027F64 01DD3C64 0000627C */  sq          $2, 0x0($3)
/* 027F68 01DD3C68 E601023C */  lui         $2, %hi(CCursol)
/* 027F6C 01DD3C6C 40DF4424 */  addiu       $4, $2, %lo(CCursol)
/* 027F70 01DD3C70 3454770C */  jal         GetPos__7CCursolFv
/* 027F74 01DD3C74 00000000 */   nop
/* 027F78 01DD3C78 288E4070 */  paddub      $17, $2, $0
/* 027F7C 01DD3C7C C701023C */  lui         $2, %hi(TexManager)
/* 027F80 01DD3C80 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 027F84 01DD3C84 DE01023C */  lui         $2, %hi(LIT_765__4)
/* 027F88 01DD3C88 B80E4524 */  addiu       $5, $2, %lo(LIT_765__4)
/* 027F8C 01DD3C8C FFFF0624 */  addiu       $6, $0, -0x1
/* 027F90 01DD3C90 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 027F94 01DD3C94 00000000 */   nop
/* 027F98 01DD3C98 28864070 */  paddub      $16, $2, $0
/* 027F9C 01DD3C9C 389C8427 */  addiu       $4, $28, -0x63C8
/* 027FA0 01DD3CA0 80000524 */  addiu       $5, $0, 0x80
/* 027FA4 01DD3CA4 7C54770C */  jal         Get__8CScFaderFi
/* 027FA8 01DD3CA8 00000000 */   nop
/* 027FAC 01DD3CAC E1000424 */  addiu       $4, $0, 0xE1
/* 027FB0 01DD3CB0 282E2072 */  paddub      $5, $17, $0
/* 027FB4 01DD3CB4 28360072 */  paddub      $6, $16, $0
/* 027FB8 01DD3CB8 A001A727 */  addiu       $7, $29, 0x1A0
/* 027FBC 01DD3CBC 80000824 */  addiu       $8, $0, 0x80
/* 027FC0 01DD3CC0 284E4070 */  paddub      $9, $2, $0
/* 027FC4 01DD3CC4 B45B080C */  jal         DrawObjectVibe__FiiP8CTexture4RECTUci
/* 027FC8 01DD3CC8 00000000 */   nop
/* 027FCC 01DD3CCC 01000424 */  addiu       $4, $0, 0x1
/* 027FD0 01DD3CD0 046F050C */  jal         setbilinear__Fi
/* 027FD4 01DD3CD4 00000000 */   nop
/* 027FD8 01DD3CD8 24000010 */  b           .L01DD3D6C_2D956C
/* 027FDC 01DD3CDC 00000000 */   nop
.L01DD3CE0_2D94E0:
/* 027FE0 01DD3CE0 A0B8040C */  jal         GetVif1Packet__Fv
/* 027FE4 01DD3CE4 00000000 */   nop
/* 027FE8 01DD3CE8 C701033C */  lui         $3, %hi(TexManager)
/* 027FEC 01DD3CEC 70586424 */  addiu       $4, $3, %lo(TexManager)
/* 027FF0 01DD3CF0 282E4070 */  paddub      $5, $2, $0
/* 027FF4 01DD3CF4 02000624 */  addiu       $6, $0, 0x2
/* 027FF8 01DD3CF8 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 027FFC 01DD3CFC 00000000 */   nop
/* 028000 01DD3D00 60F5080C */  jal         OpeningBookDraw__Fv
/* 028004 01DD3D04 00000000 */   nop
/* 028008 01DD3D08 18000010 */  b           .L01DD3D6C_2D956C
/* 02800C 01DD3D0C 00000000 */   nop
.L01DD3D10_2D9510:
/* 028010 01DD3D10 A0B8040C */  jal         GetVif1Packet__Fv
/* 028014 01DD3D14 00000000 */   nop
/* 028018 01DD3D18 C701033C */  lui         $3, %hi(TexManager)
/* 02801C 01DD3D1C 70586424 */  addiu       $4, $3, %lo(TexManager)
/* 028020 01DD3D20 282E4070 */  paddub      $5, $2, $0
/* 028024 01DD3D24 02000624 */  addiu       $6, $0, 0x2
/* 028028 01DD3D28 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 02802C 01DD3D2C 00000000 */   nop
/* 028030 01DD3D30 28260070 */  paddub      $4, $0, $0
/* 028034 01DD3D34 F480080C */  jal         DrawMenuSave__FPc
/* 028038 01DD3D38 00000000 */   nop
/* 02803C 01DD3D3C 0B000010 */  b           .L01DD3D6C_2D956C
/* 028040 01DD3D40 00000000 */   nop
.L01DD3D44_2D9544:
/* 028044 01DD3D44 A0B8040C */  jal         GetVif1Packet__Fv
/* 028048 01DD3D48 00000000 */   nop
/* 02804C 01DD3D4C C701033C */  lui         $3, %hi(TexManager)
/* 028050 01DD3D50 70586424 */  addiu       $4, $3, %lo(TexManager)
/* 028054 01DD3D54 282E4070 */  paddub      $5, $2, $0
/* 028058 01DD3D58 02000624 */  addiu       $6, $0, 0x2
/* 02805C 01DD3D5C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 028060 01DD3D60 00000000 */   nop
/* 028064 01DD3D64 AC7C080C */  jal         DrawMenuOption__Fv
/* 028068 01DD3D68 00000000 */   nop
.L01DD3D6C_2D956C:
/* 02806C 01DD3D6C 9804A427 */  addiu       $4, $29, 0x498
/* 028070 01DD3D70 68BC040C */  jal         MGGetFBuffBackTex__FP9sceGsTex0
/* 028074 01DD3D74 00000000 */   nop
/* 028078 01DD3D78 B001A427 */  addiu       $4, $29, 0x1B0
/* 02807C 01DD3D7C BCC3040C */  jal         __ct__8CTextureFv
/* 028080 01DD3D80 00000000 */   nop
/* 028084 01DD3D84 9804A227 */  addiu       $2, $29, 0x498
/* 028088 01DD3D88 000042DC */  ld          $2, 0x0($2)
/* 02808C 01DD3D8C D801A2FF */  sd          $2, 0x1D8($29)
/* 028090 01DD3D90 7004A0AF */  sw          $0, 0x470($29)
/* 028094 01DD3D94 7404A0AF */  sw          $0, 0x474($29)
/* 028098 01DD3D98 80020324 */  addiu       $3, $0, 0x280
/* 02809C 01DD3D9C 7804A3AF */  sw          $3, 0x478($29)
/* 0280A0 01DD3DA0 E0000224 */  addiu       $2, $0, 0xE0
/* 0280A4 01DD3DA4 7C04A2AF */  sw          $2, 0x47C($29)
/* 0280A8 01DD3DA8 6004A0AF */  sw          $0, 0x460($29)
/* 0280AC 01DD3DAC 6404A0AF */  sw          $0, 0x464($29)
/* 0280B0 01DD3DB0 6804A3AF */  sw          $3, 0x468($29)
/* 0280B4 01DD3DB4 C0010224 */  addiu       $2, $0, 0x1C0
/* 0280B8 01DD3DB8 6C04A2AF */  sw          $2, 0x46C($29)
/* 0280BC 01DD3DBC D48B848F */  lw          $4, -0x742C($28)
/* 0280C0 01DD3DC0 B001A527 */  addiu       $5, $29, 0x1B0
/* 0280C4 01DD3DC4 6004A627 */  addiu       $6, $29, 0x460
/* 0280C8 01DD3DC8 7004A727 */  addiu       $7, $29, 0x470
/* 0280CC 01DD3DCC 80000824 */  addiu       $8, $0, 0x80
/* 0280D0 01DD3DD0 284E0071 */  paddub      $9, $8, $0
/* 0280D4 01DD3DD4 28560071 */  paddub      $10, $8, $0
/* 0280D8 01DD3DD8 23000B24 */  addiu       $11, $0, 0x23
/* 0280DC 01DD3DDC 8C71050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
/* 0280E0 01DD3DE0 00000000 */   nop
/* 0280E4 01DD3DE4 2000BF7B */  lq          $31, 0x20($29)
/* 0280E8 01DD3DE8 1000B17B */  lq          $17, 0x10($29)
/* 0280EC 01DD3DEC 0000B07B */  lq          $16, 0x0($29)
/* 0280F0 01DD3DF0 A004BD27 */  addiu       $29, $29, 0x4A0
/* 0280F4 01DD3DF4 0800E003 */  jr          $31
/* 0280F8 01DD3DF8 00000000 */   nop
/* 0280FC 01DD3DFC 00000000 */  nop
