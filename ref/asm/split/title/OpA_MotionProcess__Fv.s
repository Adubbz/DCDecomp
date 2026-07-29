.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpA_MotionProcess__Fv
/* 00AEF0 01DB6BF0 10FFBD27 */  addiu       $29, $29, -0xF0
/* 00AEF4 01DB6BF4 3000BF7F */  sq          $31, 0x30($29)
/* 00AEF8 01DB6BF8 2000B17F */  sq          $17, 0x20($29)
/* 00AEFC 01DB6BFC 1000B07F */  sq          $16, 0x10($29)
/* 00AF00 01DB6C00 0000B4E7 */  swc1        $f20, 0x0($29)
/* 00AF04 01DB6C04 DE01013C */  lui         $1, %hi(CScript__2)
/* 00AF08 01DB6C08 001B238C */  lw          $3, %lo(CScript__2)($1)
/* 00AF0C 01DB6C0C 30000224 */  addiu       $2, $0, 0x30
/* 00AF10 01DB6C10 41006210 */  beq         $3, $2, .L01DB6D18_2BC518
/* 00AF14 01DB6C14 00000000 */   nop
/* 00AF18 01DB6C18 2A000224 */  addiu       $2, $0, 0x2A
/* 00AF1C 01DB6C1C 3E006210 */  beq         $3, $2, .L01DB6D18_2BC518
/* 00AF20 01DB6C20 00000000 */   nop
/* 00AF24 01DB6C24 29000224 */  addiu       $2, $0, 0x29
/* 00AF28 01DB6C28 3B006210 */  beq         $3, $2, .L01DB6D18_2BC518
/* 00AF2C 01DB6C2C 00000000 */   nop
/* 00AF30 01DB6C30 28000224 */  addiu       $2, $0, 0x28
/* 00AF34 01DB6C34 38006210 */  beq         $3, $2, .L01DB6D18_2BC518
/* 00AF38 01DB6C38 00000000 */   nop
/* 00AF3C 01DB6C3C 27000224 */  addiu       $2, $0, 0x27
/* 00AF40 01DB6C40 29006210 */  beq         $3, $2, .L01DB6CE8_2BC4E8
/* 00AF44 01DB6C44 00000000 */   nop
/* 00AF48 01DB6C48 27006010 */  beqz        $3, .L01DB6CE8_2BC4E8
/* 00AF4C 01DB6C4C 00000000 */   nop
/* 00AF50 01DB6C50 25000224 */  addiu       $2, $0, 0x25
/* 00AF54 01DB6C54 18006210 */  beq         $3, $2, .L01DB6CB8_2BC4B8
/* 00AF58 01DB6C58 00000000 */   nop
/* 00AF5C 01DB6C5C 0F000224 */  addiu       $2, $0, 0xF
/* 00AF60 01DB6C60 09006210 */  beq         $3, $2, .L01DB6C88_2BC488
/* 00AF64 01DB6C64 00000000 */   nop
/* 00AF68 01DB6C68 03000224 */  addiu       $2, $0, 0x3
/* 00AF6C 01DB6C6C 06006210 */  beq         $3, $2, .L01DB6C88_2BC488
/* 00AF70 01DB6C70 00000000 */   nop
/* 00AF74 01DB6C74 02000224 */  addiu       $2, $0, 0x2
/* 00AF78 01DB6C78 03006210 */  beq         $3, $2, .L01DB6C88_2BC488
/* 00AF7C 01DB6C7C 00000000 */   nop
/* 00AF80 01DB6C80 31000010 */  b           .L01DB6D48_2BC548
/* 00AF84 01DB6C84 00000000 */   nop
.L01DB6C88_2BC488:
/* 00AF88 01DB6C88 FFFF0234 */  ori         $2, $0, 0xFFFF
/* 00AF8C 01DB6C8C 00008244 */  mtc1        $2, $f0
/* 00AF90 01DB6C90 00000000 */  nop
/* 00AF94 01DB6C94 A0038046 */  cvt.s.w     $f14, $f0
/* 00AF98 01DB6C98 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00AF9C 01DB6C9C 00688244 */  mtc1        $2, $f13
/* 00AFA0 01DB6CA0 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1A0)
/* 00AFA4 01DB6CA4 C0562CC4 */  lwc1        $f12, %lo(mgRenderInfo + 0x1A0)($1)
/* 00AFA8 01DB6CA8 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 00AFAC 01DB6CAC 00000000 */   nop
/* 00AFB0 01DB6CB0 2F000010 */  b           .L01DB6D70_2BC570
/* 00AFB4 01DB6CB4 00000000 */   nop
.L01DB6CB8_2BC4B8:
/* 00AFB8 01DB6CB8 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00AFBC 01DB6CBC 00688244 */  mtc1        $2, $f13
/* 00AFC0 01DB6CC0 FFFF0234 */  ori         $2, $0, 0xFFFF
/* 00AFC4 01DB6CC4 00008244 */  mtc1        $2, $f0
/* 00AFC8 01DB6CC8 00000000 */  nop
/* 00AFCC 01DB6CCC A0038046 */  cvt.s.w     $f14, $f0
/* 00AFD0 01DB6CD0 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1A0)
/* 00AFD4 01DB6CD4 C0562CC4 */  lwc1        $f12, %lo(mgRenderInfo + 0x1A0)($1)
/* 00AFD8 01DB6CD8 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 00AFDC 01DB6CDC 00000000 */   nop
/* 00AFE0 01DB6CE0 23000010 */  b           .L01DB6D70_2BC570
/* 00AFE4 01DB6CE4 00000000 */   nop
.L01DB6CE8_2BC4E8:
/* 00AFE8 01DB6CE8 8041023C */  lui         $2, (0x41800000 >> 16)
/* 00AFEC 01DB6CEC 00688244 */  mtc1        $2, $f13
/* 00AFF0 01DB6CF0 FFFF0234 */  ori         $2, $0, 0xFFFF
/* 00AFF4 01DB6CF4 00008244 */  mtc1        $2, $f0
/* 00AFF8 01DB6CF8 00000000 */  nop
/* 00AFFC 01DB6CFC A0038046 */  cvt.s.w     $f14, $f0
/* 00B000 01DB6D00 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1A0)
/* 00B004 01DB6D04 C0562CC4 */  lwc1        $f12, %lo(mgRenderInfo + 0x1A0)($1)
/* 00B008 01DB6D08 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 00B00C 01DB6D0C 00000000 */   nop
/* 00B010 01DB6D10 17000010 */  b           .L01DB6D70_2BC570
/* 00B014 01DB6D14 00000000 */   nop
.L01DB6D18_2BC518:
/* 00B018 01DB6D18 FFFF0234 */  ori         $2, $0, 0xFFFF
/* 00B01C 01DB6D1C 00008244 */  mtc1        $2, $f0
/* 00B020 01DB6D20 00000000 */  nop
/* 00B024 01DB6D24 A0038046 */  cvt.s.w     $f14, $f0
/* 00B028 01DB6D28 9041023C */  lui         $2, (0x41900000 >> 16)
/* 00B02C 01DB6D2C 00688244 */  mtc1        $2, $f13
/* 00B030 01DB6D30 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1A0)
/* 00B034 01DB6D34 C0562CC4 */  lwc1        $f12, %lo(mgRenderInfo + 0x1A0)($1)
/* 00B038 01DB6D38 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 00B03C 01DB6D3C 00000000 */   nop
/* 00B040 01DB6D40 0B000010 */  b           .L01DB6D70_2BC570
/* 00B044 01DB6D44 00000000 */   nop
.L01DB6D48_2BC548:
/* 00B048 01DB6D48 C040023C */  lui         $2, (0x40C00000 >> 16)
/* 00B04C 01DB6D4C 00688244 */  mtc1        $2, $f13
/* 00B050 01DB6D50 FFFF0234 */  ori         $2, $0, 0xFFFF
/* 00B054 01DB6D54 00008244 */  mtc1        $2, $f0
/* 00B058 01DB6D58 00000000 */  nop
/* 00B05C 01DB6D5C A0038046 */  cvt.s.w     $f14, $f0
/* 00B060 01DB6D60 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1A0)
/* 00B064 01DB6D64 C0562CC4 */  lwc1        $f12, %lo(mgRenderInfo + 0x1A0)($1)
/* 00B068 01DB6D68 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 00B06C 01DB6D6C 00000000 */   nop
.L01DB6D70_2BC570:
/* 00B070 01DB6D70 282E0070 */  paddub      $5, $0, $0
/* 00B074 01DB6D74 DE01013C */  lui         $1, %hi(CScript__2)
/* 00B078 01DB6D78 001B248C */  lw          $4, %lo(CScript__2)($1)
/* 00B07C 01DB6D7C 2C000324 */  addiu       $3, $0, 0x2C
/* 00B080 01DB6D80 2F008310 */  beq         $4, $3, .L01DB6E40_2BC640
/* 00B084 01DB6D84 00000000 */   nop
/* 00B088 01DB6D88 12000324 */  addiu       $3, $0, 0x12
/* 00B08C 01DB6D8C 19008310 */  beq         $4, $3, .L01DB6DF4_2BC5F4
/* 00B090 01DB6D90 00000000 */   nop
/* 00B094 01DB6D94 11000324 */  addiu       $3, $0, 0x11
/* 00B098 01DB6D98 11008310 */  beq         $4, $3, .L01DB6DE0_2BC5E0
/* 00B09C 01DB6D9C 00000000 */   nop
/* 00B0A0 01DB6DA0 10000324 */  addiu       $3, $0, 0x10
/* 00B0A4 01DB6DA4 0E008310 */  beq         $4, $3, .L01DB6DE0_2BC5E0
/* 00B0A8 01DB6DA8 00000000 */   nop
/* 00B0AC 01DB6DAC 0E000324 */  addiu       $3, $0, 0xE
/* 00B0B0 01DB6DB0 0B008310 */  beq         $4, $3, .L01DB6DE0_2BC5E0
/* 00B0B4 01DB6DB4 00000000 */   nop
/* 00B0B8 01DB6DB8 0F000324 */  addiu       $3, $0, 0xF
/* 00B0BC 01DB6DBC 03008310 */  beq         $4, $3, .L01DB6DCC_2BC5CC
/* 00B0C0 01DB6DC0 00000000 */   nop
/* 00B0C4 01DB6DC4 25000010 */  b           .L01DB6E5C_2BC65C
/* 00B0C8 01DB6DC8 00000000 */   nop
.L01DB6DCC_2BC5CC:
/* 00B0CC 01DB6DCC 01000564 */  daddiu      $5, $0, 0x1
/* 00B0D0 01DB6DD0 03000324 */  addiu       $3, $0, 0x3
/* 00B0D4 01DB6DD4 2C9983AF */  sw          $3, -0x66D4($28)
/* 00B0D8 01DB6DD8 20000010 */  b           .L01DB6E5C_2BC65C
/* 00B0DC 01DB6DDC 00000000 */   nop
.L01DB6DE0_2BC5E0:
/* 00B0E0 01DB6DE0 01000564 */  daddiu      $5, $0, 0x1
/* 00B0E4 01DB6DE4 0A000324 */  addiu       $3, $0, 0xA
/* 00B0E8 01DB6DE8 2C9983AF */  sw          $3, -0x66D4($28)
/* 00B0EC 01DB6DEC 1B000010 */  b           .L01DB6E5C_2BC65C
/* 00B0F0 01DB6DF0 00000000 */   nop
.L01DB6DF4_2BC5F4:
/* 00B0F4 01DB6DF4 0498848F */  lw          $4, -0x67FC($28)
/* 00B0F8 01DB6DF8 B0110324 */  addiu       $3, $0, 0x11B0
/* 00B0FC 01DB6DFC 18208300 */  mult        $4, $4, $3
/* 00B100 01DB6E00 E101033C */  lui         $3, %hi(Cam__2 + 0x2F0)
/* 00B104 01DB6E04 C09B6324 */  addiu       $3, $3, %lo(Cam__2 + 0x2F0)
/* 00B108 01DB6E08 21186400 */  addu        $3, $3, $4
/* 00B10C 01DB6E0C 000061C4 */  lwc1        $f1, 0x0($3)
/* 00B110 01DB6E10 6042033C */  lui         $3, (0x42600000 >> 16)
/* 00B114 01DB6E14 00008344 */  mtc1        $3, $f0
/* 00B118 01DB6E18 00000000 */  nop
/* 00B11C 01DB6E1C 34080046 */  c.lt.s      $f1, $f0
/* 00B120 01DB6E20 00000000 */  nop
/* 00B124 01DB6E24 0D000045 */  bc1f        .L01DB6E5C_2BC65C
/* 00B128 01DB6E28 00000000 */   nop
/* 00B12C 01DB6E2C 01000564 */  daddiu      $5, $0, 0x1
/* 00B130 01DB6E30 0F000324 */  addiu       $3, $0, 0xF
/* 00B134 01DB6E34 2C9983AF */  sw          $3, -0x66D4($28)
/* 00B138 01DB6E38 08000010 */  b           .L01DB6E5C_2BC65C
/* 00B13C 01DB6E3C 00000000 */   nop
.L01DB6E40_2BC640:
/* 00B140 01DB6E40 C8988483 */  lb          $4, -0x6738($28)
/* 00B144 01DB6E44 01000324 */  addiu       $3, $0, 0x1
/* 00B148 01DB6E48 04008314 */  bne         $4, $3, .L01DB6E5C_2BC65C
/* 00B14C 01DB6E4C 00000000 */   nop
/* 00B150 01DB6E50 01000564 */  daddiu      $5, $0, 0x1
/* 00B154 01DB6E54 05000324 */  addiu       $3, $0, 0x5
/* 00B158 01DB6E58 2C9983AF */  sw          $3, -0x66D4($28)
.L01DB6E5C_2BC65C:
/* 00B15C 01DB6E5C 4100A010 */  beqz        $5, .L01DB6F64_2BC764
/* 00B160 01DB6E60 00000000 */   nop
/* 00B164 01DB6E64 E101023C */  lui         $2, %hi(OP_MainCamera)
/* 00B168 01DB6E68 E0954424 */  addiu       $4, $2, %lo(OP_MainCamera)
/* 00B16C 01DB6E6C 4000A527 */  addiu       $5, $29, 0x40
/* 00B170 01DB6E70 A891040C */  jal         GetRef__7CCameraFPf
/* 00B174 01DB6E74 00000000 */   nop
/* 00B178 01DB6E78 BE11040C */  jal         rand
/* 00B17C 01DB6E7C 00000000 */   nop
/* 00B180 01DB6E80 2C99838F */  lw          $3, -0x66D4($28)
/* 00B184 01DB6E84 1A004300 */  div         $0, $2, $3
/* 00B188 01DB6E88 02006014 */  bnez        $3, .L01DB6E94_2BC694
/* 00B18C 01DB6E8C 00000000 */   nop
/* 00B190 01DB6E90 CD010000 */  break       0, 7
.L01DB6E94_2BC694:
/* 00B194 01DB6E94 10100000 */  mfhi        $2
/* 00B198 01DB6E98 00008244 */  mtc1        $2, $f0
/* 00B19C 01DB6E9C 00000000 */  nop
/* 00B1A0 01DB6EA0 60008046 */  cvt.s.w     $f1, $f0
/* 00B1A4 01DB6EA4 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00B1A8 01DB6EA8 00008244 */  mtc1        $2, $f0
/* 00B1AC 01DB6EAC 00000000 */  nop
/* 00B1B0 01DB6EB0 43080046 */  div.s       $f1, $f1, $f0
/* 00B1B4 01DB6EB4 4000A0C7 */  lwc1        $f0, 0x40($29)
/* 00B1B8 01DB6EB8 00000146 */  add.s       $f0, $f0, $f1
/* 00B1BC 01DB6EBC 4000A0E7 */  swc1        $f0, 0x40($29)
/* 00B1C0 01DB6EC0 BE11040C */  jal         rand
/* 00B1C4 01DB6EC4 00000000 */   nop
/* 00B1C8 01DB6EC8 2C99838F */  lw          $3, -0x66D4($28)
/* 00B1CC 01DB6ECC 1A004300 */  div         $0, $2, $3
/* 00B1D0 01DB6ED0 02006014 */  bnez        $3, .L01DB6EDC_2BC6DC
/* 00B1D4 01DB6ED4 00000000 */   nop
/* 00B1D8 01DB6ED8 CD010000 */  break       0, 7
.L01DB6EDC_2BC6DC:
/* 00B1DC 01DB6EDC 10100000 */  mfhi        $2
/* 00B1E0 01DB6EE0 00008244 */  mtc1        $2, $f0
/* 00B1E4 01DB6EE4 00000000 */  nop
/* 00B1E8 01DB6EE8 60008046 */  cvt.s.w     $f1, $f0
/* 00B1EC 01DB6EEC 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00B1F0 01DB6EF0 00008244 */  mtc1        $2, $f0
/* 00B1F4 01DB6EF4 00000000 */  nop
/* 00B1F8 01DB6EF8 43080046 */  div.s       $f1, $f1, $f0
/* 00B1FC 01DB6EFC 4400A0C7 */  lwc1        $f0, 0x44($29)
/* 00B200 01DB6F00 00000146 */  add.s       $f0, $f0, $f1
/* 00B204 01DB6F04 4400A0E7 */  swc1        $f0, 0x44($29)
/* 00B208 01DB6F08 BE11040C */  jal         rand
/* 00B20C 01DB6F0C 00000000 */   nop
/* 00B210 01DB6F10 2C99838F */  lw          $3, -0x66D4($28)
/* 00B214 01DB6F14 1A004300 */  div         $0, $2, $3
/* 00B218 01DB6F18 02006014 */  bnez        $3, .L01DB6F24_2BC724
/* 00B21C 01DB6F1C 00000000 */   nop
/* 00B220 01DB6F20 CD010000 */  break       0, 7
.L01DB6F24_2BC724:
/* 00B224 01DB6F24 10100000 */  mfhi        $2
/* 00B228 01DB6F28 00008244 */  mtc1        $2, $f0
/* 00B22C 01DB6F2C 00000000 */  nop
/* 00B230 01DB6F30 60008046 */  cvt.s.w     $f1, $f0
/* 00B234 01DB6F34 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00B238 01DB6F38 00008244 */  mtc1        $2, $f0
/* 00B23C 01DB6F3C 00000000 */  nop
/* 00B240 01DB6F40 43080046 */  div.s       $f1, $f1, $f0
/* 00B244 01DB6F44 4800A0C7 */  lwc1        $f0, 0x48($29)
/* 00B248 01DB6F48 00000146 */  add.s       $f0, $f0, $f1
/* 00B24C 01DB6F4C 4800A0E7 */  swc1        $f0, 0x48($29)
/* 00B250 01DB6F50 E101023C */  lui         $2, %hi(OP_MainCamera)
/* 00B254 01DB6F54 E0954424 */  addiu       $4, $2, %lo(OP_MainCamera)
/* 00B258 01DB6F58 4000A527 */  addiu       $5, $29, 0x40
/* 00B25C 01DB6F5C C490040C */  jal         SetRef__7CCameraFPf
/* 00B260 01DB6F60 00000000 */   nop
.L01DB6F64_2BC764:
/* 00B264 01DB6F64 28860070 */  paddub      $16, $0, $0
/* 00B268 01DB6F68 0A000010 */  b           .L01DB6F94_2BC794
/* 00B26C 01DB6F6C 00000000 */   nop
.L01DB6F70_2BC770:
/* 00B270 01DB6F70 C0101000 */  sll         $2, $16, 3
/* 00B274 01DB6F74 21105000 */  addu        $2, $2, $16
/* 00B278 01DB6F78 00190200 */  sll         $3, $2, 4
/* 00B27C 01DB6F7C E201023C */  lui         $2, %hi(OP_AnimeSeq)
/* 00B280 01DB6F80 20C54224 */  addiu       $2, $2, %lo(OP_AnimeSeq)
/* 00B284 01DB6F84 21204300 */  addu        $4, $2, $3
/* 00B288 01DB6F88 7898050C */  jal         ObjAnimePlay__FP13OBJ_ANIME_SEQ
/* 00B28C 01DB6F8C 00000000 */   nop
/* 00B290 01DB6F90 01001026 */  addiu       $16, $16, 0x1
.L01DB6F94_2BC794:
/* 00B294 01DB6F94 B498838F */  lw          $3, -0x674C($28)
/* 00B298 01DB6F98 2A180302 */  slt         $3, $16, $3
/* 00B29C 01DB6F9C F4FF6014 */  bnez        $3, .L01DB6F70_2BC770
/* 00B2A0 01DB6FA0 00000000 */   nop
/* 00B2A4 01DB6FA4 281E0070 */  paddub      $3, $0, $0
/* 00B2A8 01DB6FA8 84000010 */  b           .L01DB71BC_2BC9BC
/* 00B2AC 01DB6FAC 00000000 */   nop
.L01DB6FB0_2BC7B0:
/* 00B2B0 01DB6FB0 40200300 */  sll         $4, $3, 1
/* 00B2B4 01DB6FB4 21208300 */  addu        $4, $4, $3
/* 00B2B8 01DB6FB8 80200400 */  sll         $4, $4, 2
/* 00B2BC 01DB6FBC 21208300 */  addu        $4, $4, $3
/* 00B2C0 01DB6FC0 80200400 */  sll         $4, $4, 2
/* 00B2C4 01DB6FC4 DE01053C */  lui         $5, %hi(CScript__2 + 0x30)
/* 00B2C8 01DB6FC8 301BA524 */  addiu       $5, $5, %lo(CScript__2 + 0x30)
/* 00B2CC 01DB6FCC 2128A400 */  addu        $5, $5, $4
/* 00B2D0 01DB6FD0 0000A590 */  lbu         $5, 0x0($5)
/* 00B2D4 01DB6FD4 7800A010 */  beqz        $5, .L01DB71B8_2BC9B8
/* 00B2D8 01DB6FD8 00000000 */   nop
/* 00B2DC 01DB6FDC DE01053C */  lui         $5, %hi(CScript__2 + 0x38)
/* 00B2E0 01DB6FE0 381BA524 */  addiu       $5, $5, %lo(CScript__2 + 0x38)
/* 00B2E4 01DB6FE4 2128A400 */  addu        $5, $5, $4
/* 00B2E8 01DB6FE8 0000A98C */  lw          $9, 0x0($5)
/* 00B2EC 01DB6FEC FFFF0624 */  addiu       $6, $0, -0x1
/* 00B2F0 01DB6FF0 20002611 */  beq         $9, $6, .L01DB7074_2BC874
/* 00B2F4 01DB6FF4 00000000 */   nop
/* 00B2F8 01DB6FF8 B0110624 */  addiu       $6, $0, 0x11B0
/* 00B2FC 01DB6FFC 18406600 */  mult        $8, $3, $6
/* 00B300 01DB7000 DF01063C */  lui         $6, %hi(Chara__3 + 0x344)
/* 00B304 01DB7004 2402C624 */  addiu       $6, $6, %lo(Chara__3 + 0x344)
/* 00B308 01DB7008 2130C800 */  addu        $6, $6, $8
/* 00B30C 01DB700C 0000C78C */  lw          $7, 0x0($6)
/* 00B310 01DB7010 DE01063C */  lui         $6, %hi(CScript__2 + 0x34)
/* 00B314 01DB7014 341BC624 */  addiu       $6, $6, %lo(CScript__2 + 0x34)
/* 00B318 01DB7018 2150C400 */  addu        $10, $6, $4
/* 00B31C 01DB701C 0000468D */  lw          $6, 0x0($10)
/* 00B320 01DB7020 00310600 */  sll         $6, $6, 4
/* 00B324 01DB7024 2130C700 */  addu        $6, $6, $7
/* 00B328 01DB7028 0400C68C */  lw          $6, 0x4($6)
/* 00B32C 01DB702C FFFFC624 */  addiu       $6, $6, -0x1
/* 00B330 01DB7030 00008644 */  mtc1        $6, $f0
/* 00B334 01DB7034 00000000 */  nop
/* 00B338 01DB7038 60008046 */  cvt.s.w     $f1, $f0
/* 00B33C 01DB703C DF01063C */  lui         $6, %hi(Chara__3 + 0x2F0)
/* 00B340 01DB7040 D001C624 */  addiu       $6, $6, %lo(Chara__3 + 0x2F0)
/* 00B344 01DB7044 2130C800 */  addu        $6, $6, $8
/* 00B348 01DB7048 0000C0C4 */  lwc1        $f0, 0x0($6)
/* 00B34C 01DB704C 36000146 */  c.le.s      $f0, $f1
/* 00B350 01DB7050 01000624 */  addiu       $6, $0, 0x1
/* 00B354 01DB7054 02000045 */  bc1f        .L01DB7060_2BC860
/* 00B358 01DB7058 00000000 */   nop
/* 00B35C 01DB705C 28360070 */  paddub      $6, $0, $0
.L01DB7060_2BC860:
/* 00B360 01DB7060 0400C010 */  beqz        $6, .L01DB7074_2BC874
/* 00B364 01DB7064 00000000 */   nop
/* 00B368 01DB7068 000049AD */  sw          $9, 0x0($10)
/* 00B36C 01DB706C FFFF0624 */  addiu       $6, $0, -0x1
/* 00B370 01DB7070 0000A6AC */  sw          $6, 0x0($5)
.L01DB7074_2BC874:
/* 00B374 01DB7074 DE01053C */  lui         $5, %hi(CScript__2 + 0x60)
/* 00B378 01DB7078 601BA524 */  addiu       $5, $5, %lo(CScript__2 + 0x60)
/* 00B37C 01DB707C 2128A400 */  addu        $5, $5, $4
/* 00B380 01DB7080 0000A1C4 */  lwc1        $f1, 0x0($5)
/* 00B384 01DB7084 B0110524 */  addiu       $5, $0, 0x11B0
/* 00B388 01DB7088 18286500 */  mult        $5, $3, $5
/* 00B38C 01DB708C DF01063C */  lui         $6, %hi(Chara__3 + 0x2F8)
/* 00B390 01DB7090 D801C624 */  addiu       $6, $6, %lo(Chara__3 + 0x2F8)
/* 00B394 01DB7094 2130C500 */  addu        $6, $6, $5
/* 00B398 01DB7098 0000C1E4 */  swc1        $f1, 0x0($6)
/* 00B39C 01DB709C 803F063C */  lui         $6, (0x3F800000 >> 16)
/* 00B3A0 01DB70A0 00008644 */  mtc1        $6, $f0
/* 00B3A4 01DB70A4 00000000 */  nop
/* 00B3A8 01DB70A8 32000146 */  c.eq.s      $f0, $f1
/* 00B3AC 01DB70AC 00000000 */  nop
/* 00B3B0 01DB70B0 30000045 */  bc1f        .L01DB7174_2BC974
/* 00B3B4 01DB70B4 00000000 */   nop
/* 00B3B8 01DB70B8 DE01063C */  lui         $6, %hi(CScript__2 + 0x34)
/* 00B3BC 01DB70BC 341BC624 */  addiu       $6, $6, %lo(CScript__2 + 0x34)
/* 00B3C0 01DB70C0 2120C400 */  addu        $4, $6, $4
/* 00B3C4 01DB70C4 0000878C */  lw          $7, 0x0($4)
/* 00B3C8 01DB70C8 DF01043C */  lui         $4, %hi(Chara__3 + 0xC68)
/* 00B3CC 01DB70CC 480B8424 */  addiu       $4, $4, %lo(Chara__3 + 0xC68)
/* 00B3D0 01DB70D0 21408500 */  addu        $8, $4, $5
/* 00B3D4 01DB70D4 0000048D */  lw          $4, 0x0($8)
/* 00B3D8 01DB70D8 1A00E410 */  beq         $7, $4, .L01DB7144_2BC944
/* 00B3DC 01DB70DC 00000000 */   nop
/* 00B3E0 01DB70E0 DF01043C */  lui         $4, %hi(Chara__3 + 0x344)
/* 00B3E4 01DB70E4 24028424 */  addiu       $4, $4, %lo(Chara__3 + 0x344)
/* 00B3E8 01DB70E8 21208500 */  addu        $4, $4, $5
/* 00B3EC 01DB70EC 00310700 */  sll         $6, $7, 4
/* 00B3F0 01DB70F0 0000848C */  lw          $4, 0x0($4)
/* 00B3F4 01DB70F4 21208600 */  addu        $4, $4, $6
/* 00B3F8 01DB70F8 000080C4 */  lwc1        $f0, 0x0($4)
/* 00B3FC 01DB70FC 20008046 */  cvt.s.w     $f0, $f0
/* 00B400 01DB7100 DF01043C */  lui         $4, %hi(Chara__3 + 0x2F0)
/* 00B404 01DB7104 D0018424 */  addiu       $4, $4, %lo(Chara__3 + 0x2F0)
/* 00B408 01DB7108 21208500 */  addu        $4, $4, $5
/* 00B40C 01DB710C 000080E4 */  swc1        $f0, 0x0($4)
/* 00B410 01DB7110 000007AD */  sw          $7, 0x0($8)
/* 00B414 01DB7114 04000624 */  addiu       $6, $0, 0x4
/* 00B418 01DB7118 DF01043C */  lui         $4, %hi(Chara__3 + 0xC64)
/* 00B41C 01DB711C 440B8424 */  addiu       $4, $4, %lo(Chara__3 + 0xC64)
/* 00B420 01DB7120 21208500 */  addu        $4, $4, $5
/* 00B424 01DB7124 000086AC */  sw          $6, 0x0($4)
/* 00B428 01DB7128 80BF063C */  lui         $6, (0xBF800000 >> 16)
/* 00B42C 01DB712C DF01043C */  lui         $4, %hi(Chara__3 + 0xC60)
/* 00B430 01DB7130 400B8424 */  addiu       $4, $4, %lo(Chara__3 + 0xC60)
/* 00B434 01DB7134 21208500 */  addu        $4, $4, $5
/* 00B438 01DB7138 000086AC */  sw          $6, 0x0($4)
/* 00B43C 01DB713C 1E000010 */  b           .L01DB71B8_2BC9B8
/* 00B440 01DB7140 00000000 */   nop
.L01DB7144_2BC944:
/* 00B444 01DB7144 000007AD */  sw          $7, 0x0($8)
/* 00B448 01DB7148 DF01043C */  lui         $4, %hi(Chara__3 + 0xC64)
/* 00B44C 01DB714C 440B8424 */  addiu       $4, $4, %lo(Chara__3 + 0xC64)
/* 00B450 01DB7150 21208500 */  addu        $4, $4, $5
/* 00B454 01DB7154 000080AC */  sw          $0, 0x0($4)
/* 00B458 01DB7158 80BF063C */  lui         $6, (0xBF800000 >> 16)
/* 00B45C 01DB715C DF01043C */  lui         $4, %hi(Chara__3 + 0xC60)
/* 00B460 01DB7160 400B8424 */  addiu       $4, $4, %lo(Chara__3 + 0xC60)
/* 00B464 01DB7164 21208500 */  addu        $4, $4, $5
/* 00B468 01DB7168 000086AC */  sw          $6, 0x0($4)
/* 00B46C 01DB716C 12000010 */  b           .L01DB71B8_2BC9B8
/* 00B470 01DB7170 00000000 */   nop
.L01DB7174_2BC974:
/* 00B474 01DB7174 DE01063C */  lui         $6, %hi(CScript__2 + 0x34)
/* 00B478 01DB7178 341BC624 */  addiu       $6, $6, %lo(CScript__2 + 0x34)
/* 00B47C 01DB717C 2120C400 */  addu        $4, $6, $4
/* 00B480 01DB7180 0000868C */  lw          $6, 0x0($4)
/* 00B484 01DB7184 DF01043C */  lui         $4, %hi(Chara__3 + 0xC68)
/* 00B488 01DB7188 480B8424 */  addiu       $4, $4, %lo(Chara__3 + 0xC68)
/* 00B48C 01DB718C 21208500 */  addu        $4, $4, $5
/* 00B490 01DB7190 000086AC */  sw          $6, 0x0($4)
/* 00B494 01DB7194 DF01043C */  lui         $4, %hi(Chara__3 + 0xC64)
/* 00B498 01DB7198 440B8424 */  addiu       $4, $4, %lo(Chara__3 + 0xC64)
/* 00B49C 01DB719C 21208500 */  addu        $4, $4, $5
/* 00B4A0 01DB71A0 000080AC */  sw          $0, 0x0($4)
/* 00B4A4 01DB71A4 80BF063C */  lui         $6, (0xBF800000 >> 16)
/* 00B4A8 01DB71A8 DF01043C */  lui         $4, %hi(Chara__3 + 0xC60)
/* 00B4AC 01DB71AC 400B8424 */  addiu       $4, $4, %lo(Chara__3 + 0xC60)
/* 00B4B0 01DB71B0 21208500 */  addu        $4, $4, $5
/* 00B4B4 01DB71B4 000086AC */  sw          $6, 0x0($4)
.L01DB71B8_2BC9B8:
/* 00B4B8 01DB71B8 01006324 */  addiu       $3, $3, 0x1
.L01DB71BC_2BC9BC:
/* 00B4BC 01DB71BC 06006428 */  slti        $4, $3, 0x6
/* 00B4C0 01DB71C0 7BFF8014 */  bnez        $4, .L01DB6FB0_2BC7B0
/* 00B4C4 01DB71C4 00000000 */   nop
/* 00B4C8 01DB71C8 DE01013C */  lui         $1, %hi(CScript__2 + 0x168)
/* 00B4CC 01DB71CC 681C2390 */  lbu         $3, %lo(CScript__2 + 0x168)($1)
/* 00B4D0 01DB71D0 03006010 */  beqz        $3, .L01DB71E0_2BC9E0
/* 00B4D4 01DB71D4 00000000 */   nop
/* 00B4D8 01DB71D8 38E4760C */  jal         LoadMotionData__Fv
/* 00B4DC 01DB71DC 00000000 */   nop
.L01DB71E0_2BC9E0:
/* 00B4E0 01DB71E0 DD01033C */  lui         $3, %hi(LIT_762__3)
/* 00B4E4 01DB71E4 A0666624 */  addiu       $6, $3, %lo(LIT_762__3)
/* 00B4E8 01DB71E8 5000A527 */  addiu       $5, $29, 0x50
/* 00B4EC 01DB71EC 05000424 */  addiu       $4, $0, 0x5
.L01DB71F0_2BC9F0:
/* 00B4F0 01DB71F0 0000C378 */  lq          $3, 0x0($6)
/* 00B4F4 01DB71F4 1000C624 */  addiu       $6, $6, 0x10
/* 00B4F8 01DB71F8 FFFF8424 */  addiu       $4, $4, -0x1
/* 00B4FC 01DB71FC 0000A37C */  sq          $3, 0x0($5)
/* 00B500 01DB7200 1000A524 */  addiu       $5, $5, 0x10
/* 00B504 01DB7204 FAFF801C */  bgtz        $4, .L01DB71F0_2BC9F0
/* 00B508 01DB7208 00000000 */   nop
/* 00B50C 01DB720C 0000C4DC */  ld          $4, 0x0($6)
/* 00B510 01DB7210 0800C3C4 */  lwc1        $f3, 0x8($6)
/* 00B514 01DB7214 0000A4FC */  sd          $4, 0x0($5)
/* 00B518 01DB7218 0800A3E4 */  swc1        $f3, 0x8($5)
/* 00B51C 01DB721C 28860070 */  paddub      $16, $0, $0
/* 00B520 01DB7220 C5000010 */  b           .L01DB7538_2BCD38
/* 00B524 01DB7224 00000000 */   nop
.L01DB7228_2BCA28:
/* 00B528 01DB7228 40181000 */  sll         $3, $16, 1
/* 00B52C 01DB722C 21187000 */  addu        $3, $3, $16
/* 00B530 01DB7230 80180300 */  sll         $3, $3, 2
/* 00B534 01DB7234 21187000 */  addu        $3, $3, $16
/* 00B538 01DB7238 80200300 */  sll         $4, $3, 2
/* 00B53C 01DB723C DE01033C */  lui         $3, %hi(CScript__2 + 0x30)
/* 00B540 01DB7240 301B6324 */  addiu       $3, $3, %lo(CScript__2 + 0x30)
/* 00B544 01DB7244 21186400 */  addu        $3, $3, $4
/* 00B548 01DB7248 00006390 */  lbu         $3, 0x0($3)
/* 00B54C 01DB724C B9006010 */  beqz        $3, .L01DB7534_2BCD34
/* 00B550 01DB7250 00000000 */   nop
/* 00B554 01DB7254 DE01033C */  lui         $3, %hi(CScript__2 + 0x40)
/* 00B558 01DB7258 401B6324 */  addiu       $3, $3, %lo(CScript__2 + 0x40)
/* 00B55C 01DB725C 21186400 */  addu        $3, $3, $4
/* 00B560 01DB7260 00006390 */  lbu         $3, 0x0($3)
/* 00B564 01DB7264 B3006010 */  beqz        $3, .L01DB7534_2BCD34
/* 00B568 01DB7268 00000000 */   nop
/* 00B56C 01DB726C 0498838F */  lw          $3, -0x67FC($28)
/* 00B570 01DB7270 B0110224 */  addiu       $2, $0, 0x11B0
/* 00B574 01DB7274 18186200 */  mult        $3, $3, $2
/* 00B578 01DB7278 E101023C */  lui         $2, %hi(Cam__2 + 0xBC)
/* 00B57C 01DB727C 8C994224 */  addiu       $2, $2, %lo(Cam__2 + 0xBC)
/* 00B580 01DB7280 21184300 */  addu        $3, $2, $3
/* 00B584 01DB7284 80101000 */  sll         $2, $16, 2
/* 00B588 01DB7288 21105D00 */  addu        $2, $2, $29
/* 00B58C 01DB728C 0000648C */  lw          $4, 0x0($3)
/* 00B590 01DB7290 5000458C */  lw          $5, 0x50($2)
/* 00B594 01DB7294 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00B598 01DB7298 00000000 */   nop
/* 00B59C 01DB729C 28264070 */  paddub      $4, $2, $0
/* 00B5A0 01DB72A0 A4008010 */  beqz        $4, .L01DB7534_2BCD34
/* 00B5A4 01DB72A4 00000000 */   nop
/* 00B5A8 01DB72A8 B000A527 */  addiu       $5, $29, 0xB0
/* 00B5AC 01DB72AC 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 00B5B0 01DB72B0 00000000 */   nop
/* 00B5B4 01DB72B4 06000224 */  addiu       $2, $0, 0x6
/* 00B5B8 01DB72B8 1C000216 */  bne         $16, $2, .L01DB732C_2BCB2C
/* 00B5BC 01DB72BC 00000000 */   nop
/* 00B5C0 01DB72C0 D000ACC7 */  lwc1        $f12, 0xD0($29)
/* 00B5C4 01DB72C4 D800ADC7 */  lwc1        $f13, 0xD8($29)
/* 00B5C8 01DB72C8 5077040C */  jal         atan2f
/* 00B5CC 01DB72CC 00000000 */   nop
/* 00B5D0 01DB72D0 06030046 */  mov.s       $f12, $f0
/* 00B5D4 01DB72D4 9044040C */  jal         fptodp
/* 00B5D8 01DB72D8 00000000 */   nop
/* 00B5DC 01DB72DC 188084DF */  ld          $4, -0x7FE8($28)
/* 00B5E0 01DB72E0 282E4070 */  paddub      $5, $2, $0
/* 00B5E4 01DB72E4 6E3F040C */  jal         dpadd
/* 00B5E8 01DB72E8 00000000 */   nop
/* 00B5EC 01DB72EC 28264070 */  paddub      $4, $2, $0
/* 00B5F0 01DB72F0 9241040C */  jal         dptofp
/* 00B5F4 01DB72F4 00000000 */   nop
/* 00B5F8 01DB72F8 B0110224 */  addiu       $2, $0, 0x11B0
/* 00B5FC 01DB72FC 18180202 */  mult        $3, $16, $2
/* 00B600 01DB7300 DF01023C */  lui         $2, %hi(Chara__3)
/* 00B604 01DB7304 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 00B608 01DB7308 21204300 */  addu        $4, $2, $3
/* 00B60C 01DB730C 00608044 */  mtc1        $0, $f12
/* 00B610 01DB7310 00000000 */  nop
/* 00B614 01DB7314 86630046 */  mov.s       $f14, $f12
/* 00B618 01DB7318 46030046 */  mov.s       $f13, $f0
/* 00B61C 01DB731C 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 00B620 01DB7320 00000000 */   nop
/* 00B624 01DB7324 38000010 */  b           .L01DB7408_2BCC08
/* 00B628 01DB7328 00000000 */   nop
.L01DB732C_2BCB2C:
/* 00B62C 01DB732C 05000224 */  addiu       $2, $0, 0x5
/* 00B630 01DB7330 26000216 */  bne         $16, $2, .L01DB73CC_2BCBCC
/* 00B634 01DB7334 00000000 */   nop
/* 00B638 01DB7338 D400A0C7 */  lwc1        $f0, 0xD4($29)
/* 00B63C 01DB733C 07030046 */  neg.s       $f12, $f0
/* 00B640 01DB7340 D800B127 */  addiu       $17, $29, 0xD8
/* 00B644 01DB7344 00002DC6 */  lwc1        $f13, 0x0($17)
/* 00B648 01DB7348 5077040C */  jal         atan2f
/* 00B64C 01DB734C 00000000 */   nop
/* 00B650 01DB7350 06050046 */  mov.s       $f20, $f0
/* 00B654 01DB7354 B88380C7 */  lwc1        $f0, -0x7C48($28)
/* 00B658 01DB7358 36A00046 */  c.le.s      $f20, $f0
/* 00B65C 01DB735C 00000000 */  nop
/* 00B660 01DB7360 03000145 */  bc1t        .L01DB7370_2BCB70
/* 00B664 01DB7364 00000000 */   nop
/* 00B668 01DB7368 BC8380C7 */  lwc1        $f0, -0x7C44($28)
/* 00B66C 01DB736C 01A50046 */  sub.s       $f20, $f20, $f0
.L01DB7370_2BCB70:
/* 00B670 01DB7370 C08380C7 */  lwc1        $f0, -0x7C40($28)
/* 00B674 01DB7374 34A00046 */  c.lt.s      $f20, $f0
/* 00B678 01DB7378 00000000 */  nop
/* 00B67C 01DB737C 03000045 */  bc1f        .L01DB738C_2BCB8C
/* 00B680 01DB7380 00000000 */   nop
/* 00B684 01DB7384 C48380C7 */  lwc1        $f0, -0x7C3C($28)
/* 00B688 01DB7388 00A50046 */  add.s       $f20, $f20, $f0
.L01DB738C_2BCB8C:
/* 00B68C 01DB738C D000ACC7 */  lwc1        $f12, 0xD0($29)
/* 00B690 01DB7390 00002DC6 */  lwc1        $f13, 0x0($17)
/* 00B694 01DB7394 5077040C */  jal         atan2f
/* 00B698 01DB7398 00000000 */   nop
/* 00B69C 01DB739C B0110224 */  addiu       $2, $0, 0x11B0
/* 00B6A0 01DB73A0 18180202 */  mult        $3, $16, $2
/* 00B6A4 01DB73A4 DF01023C */  lui         $2, %hi(Chara__3)
/* 00B6A8 01DB73A8 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 00B6AC 01DB73AC 21204300 */  addu        $4, $2, $3
/* 00B6B0 01DB73B0 00708044 */  mtc1        $0, $f14
/* 00B6B4 01DB73B4 06A30046 */  mov.s       $f12, $f20
/* 00B6B8 01DB73B8 46030046 */  mov.s       $f13, $f0
/* 00B6BC 01DB73BC 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 00B6C0 01DB73C0 00000000 */   nop
/* 00B6C4 01DB73C4 10000010 */  b           .L01DB7408_2BCC08
/* 00B6C8 01DB73C8 00000000 */   nop
.L01DB73CC_2BCBCC:
/* 00B6CC 01DB73CC D000ACC7 */  lwc1        $f12, 0xD0($29)
/* 00B6D0 01DB73D0 D800ADC7 */  lwc1        $f13, 0xD8($29)
/* 00B6D4 01DB73D4 5077040C */  jal         atan2f
/* 00B6D8 01DB73D8 00000000 */   nop
/* 00B6DC 01DB73DC B0110224 */  addiu       $2, $0, 0x11B0
/* 00B6E0 01DB73E0 18180202 */  mult        $3, $16, $2
/* 00B6E4 01DB73E4 DF01023C */  lui         $2, %hi(Chara__3)
/* 00B6E8 01DB73E8 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 00B6EC 01DB73EC 21204300 */  addu        $4, $2, $3
/* 00B6F0 01DB73F0 00608044 */  mtc1        $0, $f12
/* 00B6F4 01DB73F4 00000000 */  nop
/* 00B6F8 01DB73F8 86630046 */  mov.s       $f14, $f12
/* 00B6FC 01DB73FC 46030046 */  mov.s       $f13, $f0
/* 00B700 01DB7400 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 00B704 01DB7404 00000000 */   nop
.L01DB7408_2BCC08:
/* 00B708 01DB7408 02000224 */  addiu       $2, $0, 0x2
/* 00B70C 01DB740C 3F000216 */  bne         $16, $2, .L01DB750C_2BCD0C
/* 00B710 01DB7410 00000000 */   nop
/* 00B714 01DB7414 DE01013C */  lui         $1, %hi(CScript__2)
/* 00B718 01DB7418 001B238C */  lw          $3, %lo(CScript__2)($1)
/* 00B71C 01DB741C 24000224 */  addiu       $2, $0, 0x24
/* 00B720 01DB7420 3A006214 */  bne         $3, $2, .L01DB750C_2BCD0C
/* 00B724 01DB7424 00000000 */   nop
/* 00B728 01DB7428 B0110224 */  addiu       $2, $0, 0x11B0
/* 00B72C 01DB742C 18180202 */  mult        $3, $16, $2
/* 00B730 01DB7430 DF01023C */  lui         $2, %hi(Chara__3 + 0x2F0)
/* 00B734 01DB7434 D0014224 */  addiu       $2, $2, %lo(Chara__3 + 0x2F0)
/* 00B738 01DB7438 21104300 */  addu        $2, $2, $3
/* 00B73C 01DB743C 000041C4 */  lwc1        $f1, 0x0($2)
/* 00B740 01DB7440 59010224 */  addiu       $2, $0, 0x159
/* 00B744 01DB7444 00008244 */  mtc1        $2, $f0
/* 00B748 01DB7448 00000000 */  nop
/* 00B74C 01DB744C 20008046 */  cvt.s.w     $f0, $f0
/* 00B750 01DB7450 36080046 */  c.le.s      $f1, $f0
/* 00B754 01DB7454 00000000 */  nop
/* 00B758 01DB7458 0C000145 */  bc1t        .L01DB748C_2BCC8C
/* 00B75C 01DB745C 00000000 */   nop
/* 00B760 01DB7460 AF43023C */  lui         $2, (0x43AF0000 >> 16)
/* 00B764 01DB7464 00008244 */  mtc1        $2, $f0
/* 00B768 01DB7468 00000000 */  nop
/* 00B76C 01DB746C 34080046 */  c.lt.s      $f1, $f0
/* 00B770 01DB7470 00000000 */  nop
/* 00B774 01DB7474 05000045 */  bc1f        .L01DB748C_2BCC8C
/* 00B778 01DB7478 00000000 */   nop
/* 00B77C 01DB747C C03F023C */  lui         $2, (0x3FC00000 >> 16)
/* 00B780 01DB7480 309982AF */  sw          $2, -0x66D0($28)
/* 00B784 01DB7484 15000010 */  b           .L01DB74DC_2BCCDC
/* 00B788 01DB7488 00000000 */   nop
.L01DB748C_2BCC8C:
/* 00B78C 01DB748C AF43023C */  lui         $2, (0x43AF0000 >> 16)
/* 00B790 01DB7490 00008244 */  mtc1        $2, $f0
/* 00B794 01DB7494 00000000 */  nop
/* 00B798 01DB7498 34080046 */  c.lt.s      $f1, $f0
/* 00B79C 01DB749C 00000000 */  nop
/* 00B7A0 01DB74A0 0D000145 */  bc1t        .L01DB74D8_2BCCD8
/* 00B7A4 01DB74A4 00000000 */   nop
/* 00B7A8 01DB74A8 309981C7 */  lwc1        $f1, -0x66D0($28)
/* 00B7AC 01DB74AC 00008044 */  mtc1        $0, $f0
/* 00B7B0 01DB74B0 00000000 */  nop
/* 00B7B4 01DB74B4 36080046 */  c.le.s      $f1, $f0
/* 00B7B8 01DB74B8 00000000 */  nop
/* 00B7BC 01DB74BC 07000145 */  bc1t        .L01DB74DC_2BCCDC
/* 00B7C0 01DB74C0 00000000 */   nop
/* 00B7C4 01DB74C4 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 00B7C8 01DB74C8 01080046 */  sub.s       $f0, $f1, $f0
/* 00B7CC 01DB74CC 309980E7 */  swc1        $f0, -0x66D0($28)
/* 00B7D0 01DB74D0 02000010 */  b           .L01DB74DC_2BCCDC
/* 00B7D4 01DB74D4 00000000 */   nop
.L01DB74D8_2BCCD8:
/* 00B7D8 01DB74D8 309980AF */  sw          $0, -0x66D0($28)
.L01DB74DC_2BCCDC:
/* 00B7DC 01DB74DC E000ACC7 */  lwc1        $f12, 0xE0($29)
/* 00B7E0 01DB74E0 E400A1C7 */  lwc1        $f1, 0xE4($29)
/* 00B7E4 01DB74E4 309980C7 */  lwc1        $f0, -0x66D0($28)
/* 00B7E8 01DB74E8 410B0046 */  sub.s       $f13, $f1, $f0
/* 00B7EC 01DB74EC E800AEC7 */  lwc1        $f14, 0xE8($29)
/* 00B7F0 01DB74F0 DF01023C */  lui         $2, %hi(Chara__3)
/* 00B7F4 01DB74F4 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 00B7F8 01DB74F8 21204300 */  addu        $4, $2, $3
/* 00B7FC 01DB74FC ECE3040C */  jal         SetPosition__10CCharacterFfff
/* 00B800 01DB7500 00000000 */   nop
/* 00B804 01DB7504 0B000010 */  b           .L01DB7534_2BCD34
/* 00B808 01DB7508 00000000 */   nop
.L01DB750C_2BCD0C:
/* 00B80C 01DB750C E000ACC7 */  lwc1        $f12, 0xE0($29)
/* 00B810 01DB7510 E400ADC7 */  lwc1        $f13, 0xE4($29)
/* 00B814 01DB7514 E800AEC7 */  lwc1        $f14, 0xE8($29)
/* 00B818 01DB7518 B0110224 */  addiu       $2, $0, 0x11B0
/* 00B81C 01DB751C 18180202 */  mult        $3, $16, $2
/* 00B820 01DB7520 DF01023C */  lui         $2, %hi(Chara__3)
/* 00B824 01DB7524 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 00B828 01DB7528 21204300 */  addu        $4, $2, $3
/* 00B82C 01DB752C ECE3040C */  jal         SetPosition__10CCharacterFfff
/* 00B830 01DB7530 00000000 */   nop
.L01DB7534_2BCD34:
/* 00B834 01DB7534 01001026 */  addiu       $16, $16, 0x1
.L01DB7538_2BCD38:
/* 00B838 01DB7538 0800032A */  slti        $3, $16, 0x8
/* 00B83C 01DB753C 3AFF6014 */  bnez        $3, .L01DB7228_2BCA28
/* 00B840 01DB7540 00000000 */   nop
/* 00B844 01DB7544 DE01013C */  lui         $1, %hi(CScript__2 + 0x168)
/* 00B848 01DB7548 681C2390 */  lbu         $3, %lo(CScript__2 + 0x168)($1)
/* 00B84C 01DB754C 03006010 */  beqz        $3, .L01DB755C_2BCD5C
/* 00B850 01DB7550 00000000 */   nop
/* 00B854 01DB7554 74DD760C */  jal         MoveDancers__Fv
/* 00B858 01DB7558 00000000 */   nop
.L01DB755C_2BCD5C:
/* 00B85C 01DB755C 28860070 */  paddub      $16, $0, $0
/* 00B860 01DB7560 11000010 */  b           .L01DB75A8_2BCDA8
/* 00B864 01DB7564 00000000 */   nop
.L01DB7568_2BCD68:
/* 00B868 01DB7568 40181000 */  sll         $3, $16, 1
/* 00B86C 01DB756C 21187000 */  addu        $3, $3, $16
/* 00B870 01DB7570 80180300 */  sll         $3, $3, 2
/* 00B874 01DB7574 21187000 */  addu        $3, $3, $16
/* 00B878 01DB7578 80200300 */  sll         $4, $3, 2
/* 00B87C 01DB757C DE01033C */  lui         $3, %hi(CScript__2 + 0x58)
/* 00B880 01DB7580 581B6324 */  addiu       $3, $3, %lo(CScript__2 + 0x58)
/* 00B884 01DB7584 21186400 */  addu        $3, $3, $4
/* 00B888 01DB7588 0000648C */  lw          $4, 0x0($3)
/* 00B88C 01DB758C FFFF0324 */  addiu       $3, $0, -0x1
/* 00B890 01DB7590 04008310 */  beq         $4, $3, .L01DB75A4_2BCDA4
/* 00B894 01DB7594 00000000 */   nop
/* 00B898 01DB7598 282E0072 */  paddub      $5, $16, $0
/* 00B89C 01DB759C C0E3760C */  jal         LoadCharaData__Fii
/* 00B8A0 01DB75A0 00000000 */   nop
.L01DB75A4_2BCDA4:
/* 00B8A4 01DB75A4 01001026 */  addiu       $16, $16, 0x1
.L01DB75A8_2BCDA8:
/* 00B8A8 01DB75A8 1700032A */  slti        $3, $16, 0x17
/* 00B8AC 01DB75AC EEFF6014 */  bnez        $3, .L01DB7568_2BCD68
/* 00B8B0 01DB75B0 00000000 */   nop
/* 00B8B4 01DB75B4 3000BF7B */  lq          $31, 0x30($29)
/* 00B8B8 01DB75B8 2000B17B */  lq          $17, 0x20($29)
/* 00B8BC 01DB75BC 1000B07B */  lq          $16, 0x10($29)
/* 00B8C0 01DB75C0 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 00B8C4 01DB75C4 F000BD27 */  addiu       $29, $29, 0xF0
/* 00B8C8 01DB75C8 0800E003 */  jr          $31
/* 00B8CC 01DB75CC 00000000 */   nop
