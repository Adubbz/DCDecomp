.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MapLoad2__Fv
/* 012F60 01DBEC60 90EDBD27 */  addiu       $29, $29, -0x1270
/* 012F64 01DBEC64 8000BF7F */  sq          $31, 0x80($29)
/* 012F68 01DBEC68 7000B77F */  sq          $23, 0x70($29)
/* 012F6C 01DBEC6C 6000B67F */  sq          $22, 0x60($29)
/* 012F70 01DBEC70 5000B57F */  sq          $21, 0x50($29)
/* 012F74 01DBEC74 4000B47F */  sq          $20, 0x40($29)
/* 012F78 01DBEC78 3000B37F */  sq          $19, 0x30($29)
/* 012F7C 01DBEC7C 2000B27F */  sq          $18, 0x20($29)
/* 012F80 01DBEC80 1000B17F */  sq          $17, 0x10($29)
/* 012F84 01DBEC84 0000B07F */  sq          $16, 0x0($29)
/* 012F88 01DBEC88 DE01023C */  lui         $2, %hi(LIT_770__2)
/* 012F8C 01DBEC8C 70934624 */  addiu       $6, $2, %lo(LIT_770__2)
/* 012F90 01DBEC90 9000A527 */  addiu       $5, $29, 0x90
/* 012F94 01DBEC94 4C000424 */  addiu       $4, $0, 0x4C
.L01DBEC98_2C4498:
/* 012F98 01DBEC98 0000C378 */  lq          $3, 0x0($6)
/* 012F9C 01DBEC9C 1000C278 */  lq          $2, 0x10($6)
/* 012FA0 01DBECA0 2000C624 */  addiu       $6, $6, 0x20
/* 012FA4 01DBECA4 FFFF8424 */  addiu       $4, $4, -0x1
/* 012FA8 01DBECA8 0000A37C */  sq          $3, 0x0($5)
/* 012FAC 01DBECAC 1000A27C */  sq          $2, 0x10($5)
/* 012FB0 01DBECB0 2000A524 */  addiu       $5, $5, 0x20
/* 012FB4 01DBECB4 F8FF801C */  bgtz        $4, .L01DBEC98_2C4498
/* 012FB8 01DBECB8 00000000 */   nop
/* 012FBC 01DBECBC 100AA427 */  addiu       $4, $29, 0xA10
/* 012FC0 01DBECC0 509F040C */  jal         __ct__10CFrameAttrFv
/* 012FC4 01DBECC4 00000000 */   nop
/* 012FC8 01DBECC8 01000324 */  addiu       $3, $0, 0x1
/* 012FCC 01DBECCC 1C0AA3A3 */  sb          $3, 0xA1C($29)
/* 012FD0 01DBECD0 DF01013C */  lui         $1, %hi(CharaDataBuffer__2 + 0x8)
/* 012FD4 01DBECD4 08FE20AC */  sw          $0, %lo(CharaDataBuffer__2 + 0x8)($1)
/* 012FD8 01DBECD8 288E0070 */  paddub      $17, $0, $0
/* 012FDC 01DBECDC C6000010 */  b           .L01DBEFF8_2C47F8
/* 012FE0 01DBECE0 00000000 */   nop
.L01DBECE4_2C44E4:
/* 012FE4 01DBECE4 40A11100 */  sll         $20, $17, 5
/* 012FE8 01DBECE8 21109D02 */  addu        $2, $20, $29
/* 012FEC 01DBECEC 9000458C */  lw          $5, 0x90($2)
/* 012FF0 01DBECF0 0E00A010 */  beqz        $5, .L01DBED2C_2C452C
/* 012FF4 01DBECF4 00000000 */   nop
/* 012FF8 01DBECF8 948B848F */  lw          $4, -0x746C($28)
/* 012FFC 01DBECFC 28360070 */  paddub      $6, $0, $0
/* 013000 01DBED00 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 013004 01DBED04 00000000 */   nop
/* 013008 01DBED08 28264070 */  paddub      $4, $2, $0
/* 01300C 01DBED0C DF01023C */  lui         $2, %hi(CharaDataBuffer__2)
/* 013010 01DBED10 00FE4524 */  addiu       $5, $2, %lo(CharaDataBuffer__2)
/* 013014 01DBED14 02000624 */  addiu       $6, $0, 0x2
/* 013018 01DBED18 283E0070 */  paddub      $7, $0, $0
/* 01301C 01DBED1C 28460070 */  paddub      $8, $0, $0
/* 013020 01DBED20 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 013024 01DBED24 00000000 */   nop
/* 013028 01DBED28 28864070 */  paddub      $16, $2, $0
.L01DBED2C_2C452C:
/* 01302C 01DBED2C 04000224 */  addiu       $2, $0, 0x4
/* 013030 01DBED30 02002216 */  bne         $17, $2, .L01DBED3C_2C453C
/* 013034 01DBED34 00000000 */   nop
/* 013038 01DBED38 D89990AF */  sw          $16, -0x6628($28)
.L01DBED3C_2C453C:
/* 01303C 01DBED3C 4A000224 */  addiu       $2, $0, 0x4A
/* 013040 01DBED40 02002216 */  bne         $17, $2, .L01DBED4C_2C454C
/* 013044 01DBED44 00000000 */   nop
/* 013048 01DBED48 DC9990AF */  sw          $16, -0x6624($28)
.L01DBED4C_2C454C:
/* 01304C 01DBED4C 4500222A */  slti        $2, $17, 0x45
/* 013050 01DBED50 09004014 */  bnez        $2, .L01DBED78_2C4578
/* 013054 01DBED54 00000000 */   nop
/* 013058 01DBED58 4A00212A */  slti        $1, $17, 0x4A
/* 01305C 01DBED5C 06002010 */  beqz        $1, .L01DBED78_2C4578
/* 013060 01DBED60 00000000 */   nop
/* 013064 01DBED64 80181100 */  sll         $3, $17, 2
/* 013068 01DBED68 E301023C */  lui         $2, %hi(Fuusya__2 + 0x3C)
/* 01306C 01DBED6C ACAB4224 */  addiu       $2, $2, %lo(Fuusya__2 + 0x3C)
/* 013070 01DBED70 21104300 */  addu        $2, $2, $3
/* 013074 01DBED74 000050AC */  sw          $16, 0x0($2)
.L01DBED78_2C4578:
/* 013078 01DBED78 28260072 */  paddub      $4, $16, $0
/* 01307C 01DBED7C 100AA527 */  addiu       $5, $29, 0xA10
/* 013080 01DBED80 01000624 */  addiu       $6, $0, 0x1
/* 013084 01DBED84 40000724 */  addiu       $7, $0, 0x40
/* 013088 01DBED88 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 01308C 01DBED8C 00000000 */   nop
/* 013090 01DBED90 28260072 */  paddub      $4, $16, $0
/* 013094 01DBED94 01000524 */  addiu       $5, $0, 0x1
/* 013098 01DBED98 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 01309C 01DBED9C 00000000 */   nop
/* 0130A0 01DBEDA0 00111100 */  sll         $2, $17, 4
/* 0130A4 01DBEDA4 23105100 */  subu        $2, $2, $17
/* 0130A8 01DBEDA8 00A90200 */  sll         $21, $2, 4
/* 0130AC 01DBEDAC E201023C */  lui         $2, %hi(OP_NornMapObj)
/* 0130B0 01DBEDB0 B0F64224 */  addiu       $2, $2, %lo(OP_NornMapObj)
/* 0130B4 01DBEDB4 21985500 */  addu        $19, $2, $21
/* 0130B8 01DBEDB8 28266072 */  paddub      $4, $19, $0
/* 0130BC 01DBEDBC 445E050C */  jal         Initialize__10CMapObjectFv
/* 0130C0 01DBEDC0 00000000 */   nop
/* 0130C4 01DBEDC4 28266072 */  paddub      $4, $19, $0
/* 0130C8 01DBEDC8 282E0072 */  paddub      $5, $16, $0
/* 0130CC 01DBEDCC 28360070 */  paddub      $6, $0, $0
/* 0130D0 01DBEDD0 305C050C */  jal         SetFrame__12CObjectFrameFP9CFrameVu1i
/* 0130D4 01DBEDD4 00000000 */   nop
/* 0130D8 01DBEDD8 E201023C */  lui         $2, %hi(OP_NornMapObj + 0xE8)
/* 0130DC 01DBEDDC 98F74224 */  addiu       $2, $2, %lo(OP_NornMapObj + 0xE8)
/* 0130E0 01DBEDE0 21105500 */  addu        $2, $2, $21
/* 0130E4 01DBEDE4 000040AC */  sw          $0, 0x0($2)
/* 0130E8 01DBEDE8 E201023C */  lui         $2, %hi(OP_NornMapObj + 0xE4)
/* 0130EC 01DBEDEC 94F74224 */  addiu       $2, $2, %lo(OP_NornMapObj + 0xE4)
/* 0130F0 01DBEDF0 21105500 */  addu        $2, $2, $21
/* 0130F4 01DBEDF4 000040AC */  sw          $0, 0x0($2)
/* 0130F8 01DBEDF8 21189D02 */  addu        $3, $20, $29
/* 0130FC 01DBEDFC 2041023C */  lui         $2, (0x41200000 >> 16)
/* 013100 01DBEE00 00088244 */  mtc1        $2, $f1
/* 013104 01DBEE04 A00060C4 */  lwc1        $f0, 0xA0($3)
/* 013108 01DBEE08 C2080046 */  mul.s       $f3, $f1, $f0
/* 01310C 01DBEE0C 9C0060C4 */  lwc1        $f0, 0x9C($3)
/* 013110 01DBEE10 82080046 */  mul.s       $f2, $f1, $f0
/* 013114 01DBEE14 980060C4 */  lwc1        $f0, 0x98($3)
/* 013118 01DBEE18 02080046 */  mul.s       $f0, $f1, $f0
/* 01311C 01DBEE1C 3012A0E7 */  swc1        $f0, 0x1230($29)
/* 013120 01DBEE20 3412A2E7 */  swc1        $f2, 0x1234($29)
/* 013124 01DBEE24 3812A3E7 */  swc1        $f3, 0x1238($29)
/* 013128 01DBEE28 28266072 */  paddub      $4, $19, $0
/* 01312C 01DBEE2C 3012A527 */  addiu       $5, $29, 0x1230
/* 013130 01DBEE30 A000798E */  lw          $25, 0xA0($19)
/* 013134 01DBEE34 1000398F */  lw          $25, 0x10($25)
/* 013138 01DBEE38 09F82003 */  jalr        $25
/* 01313C 01DBEE3C 00000000 */   nop
/* 013140 01DBEE40 21109D02 */  addu        $2, $20, $29
/* 013144 01DBEE44 AC004CC4 */  lwc1        $f12, 0xAC($2)
/* 013148 01DBEE48 9044040C */  jal         fptodp
/* 01314C 01DBEE4C 00000000 */   nop
/* 013150 01DBEE50 188084DF */  ld          $4, -0x7FE8($28)
/* 013154 01DBEE54 282E4070 */  paddub      $5, $2, $0
/* 013158 01DBEE58 9E3F040C */  jal         dpmul
/* 01315C 01DBEE5C 00000000 */   nop
/* 013160 01DBEE60 28AE4070 */  paddub      $21, $2, $0
/* 013164 01DBEE64 B4000424 */  addiu       $4, $0, 0xB4
/* 013168 01DBEE68 FC40040C */  jal         litodp
/* 01316C 01DBEE6C 00000000 */   nop
/* 013170 01DBEE70 2826A072 */  paddub      $4, $21, $0
/* 013174 01DBEE74 282E4070 */  paddub      $5, $2, $0
/* 013178 01DBEE78 4840040C */  jal         dpdiv
/* 01317C 01DBEE7C 00000000 */   nop
/* 013180 01DBEE80 28BE4070 */  paddub      $23, $2, $0
/* 013184 01DBEE84 28264070 */  paddub      $4, $2, $0
/* 013188 01DBEE88 9241040C */  jal         dptofp
/* 01318C 01DBEE8C 00000000 */   nop
/* 013190 01DBEE90 21109D02 */  addu        $2, $20, $29
/* 013194 01DBEE94 A8004CC4 */  lwc1        $f12, 0xA8($2)
/* 013198 01DBEE98 9044040C */  jal         fptodp
/* 01319C 01DBEE9C 00000000 */   nop
/* 0131A0 01DBEEA0 188084DF */  ld          $4, -0x7FE8($28)
/* 0131A4 01DBEEA4 282E4070 */  paddub      $5, $2, $0
/* 0131A8 01DBEEA8 9E3F040C */  jal         dpmul
/* 0131AC 01DBEEAC 00000000 */   nop
/* 0131B0 01DBEEB0 28AE4070 */  paddub      $21, $2, $0
/* 0131B4 01DBEEB4 B4000424 */  addiu       $4, $0, 0xB4
/* 0131B8 01DBEEB8 FC40040C */  jal         litodp
/* 0131BC 01DBEEBC 00000000 */   nop
/* 0131C0 01DBEEC0 2826A072 */  paddub      $4, $21, $0
/* 0131C4 01DBEEC4 282E4070 */  paddub      $5, $2, $0
/* 0131C8 01DBEEC8 4840040C */  jal         dpdiv
/* 0131CC 01DBEECC 00000000 */   nop
/* 0131D0 01DBEED0 28AE4070 */  paddub      $21, $2, $0
/* 0131D4 01DBEED4 28264070 */  paddub      $4, $2, $0
/* 0131D8 01DBEED8 9241040C */  jal         dptofp
/* 0131DC 01DBEEDC 00000000 */   nop
/* 0131E0 01DBEEE0 21109D02 */  addu        $2, $20, $29
/* 0131E4 01DBEEE4 A4004CC4 */  lwc1        $f12, 0xA4($2)
/* 0131E8 01DBEEE8 9044040C */  jal         fptodp
/* 0131EC 01DBEEEC 00000000 */   nop
/* 0131F0 01DBEEF0 188084DF */  ld          $4, -0x7FE8($28)
/* 0131F4 01DBEEF4 282E4070 */  paddub      $5, $2, $0
/* 0131F8 01DBEEF8 9E3F040C */  jal         dpmul
/* 0131FC 01DBEEFC 00000000 */   nop
/* 013200 01DBEF00 28B64070 */  paddub      $22, $2, $0
/* 013204 01DBEF04 B4000424 */  addiu       $4, $0, 0xB4
/* 013208 01DBEF08 FC40040C */  jal         litodp
/* 01320C 01DBEF0C 00000000 */   nop
/* 013210 01DBEF10 2826C072 */  paddub      $4, $22, $0
/* 013214 01DBEF14 282E4070 */  paddub      $5, $2, $0
/* 013218 01DBEF18 4840040C */  jal         dpdiv
/* 01321C 01DBEF1C 00000000 */   nop
/* 013220 01DBEF20 28264070 */  paddub      $4, $2, $0
/* 013224 01DBEF24 9241040C */  jal         dptofp
/* 013228 01DBEF28 00000000 */   nop
/* 01322C 01DBEF2C 4012A0E7 */  swc1        $f0, 0x1240($29)
/* 013230 01DBEF30 2826A072 */  paddub      $4, $21, $0
/* 013234 01DBEF34 9241040C */  jal         dptofp
/* 013238 01DBEF38 00000000 */   nop
/* 01323C 01DBEF3C 4412A0E7 */  swc1        $f0, 0x1244($29)
/* 013240 01DBEF40 2826E072 */  paddub      $4, $23, $0
/* 013244 01DBEF44 9241040C */  jal         dptofp
/* 013248 01DBEF48 00000000 */   nop
/* 01324C 01DBEF4C 4812A0E7 */  swc1        $f0, 0x1248($29)
/* 013250 01DBEF50 28266072 */  paddub      $4, $19, $0
/* 013254 01DBEF54 4012A527 */  addiu       $5, $29, 0x1240
/* 013258 01DBEF58 A000798E */  lw          $25, 0xA0($19)
/* 01325C 01DBEF5C 2C00398F */  lw          $25, 0x2C($25)
/* 013260 01DBEF60 09F82003 */  jalr        $25
/* 013264 01DBEF64 00000000 */   nop
/* 013268 01DBEF68 28266072 */  paddub      $4, $19, $0
/* 01326C 01DBEF6C DE01023C */  lui         $2, %hi(LIT_739__2)
/* 013270 01DBEF70 E8F54524 */  addiu       $5, $2, %lo(LIT_739__2)
/* 013274 01DBEF74 28360070 */  paddub      $6, $0, $0
/* 013278 01DBEF78 A000798E */  lw          $25, 0xA0($19)
/* 01327C 01DBEF7C 9000398F */  lw          $25, 0x90($25)
/* 013280 01DBEF80 09F82003 */  jalr        $25
/* 013284 01DBEF84 00000000 */   nop
/* 013288 01DBEF88 28266072 */  paddub      $4, $19, $0
/* 01328C 01DBEF8C DE01023C */  lui         $2, %hi(LIT_740__2)
/* 013290 01DBEF90 F0F54524 */  addiu       $5, $2, %lo(LIT_740__2)
/* 013294 01DBEF94 28360070 */  paddub      $6, $0, $0
/* 013298 01DBEF98 A000798E */  lw          $25, 0xA0($19)
/* 01329C 01DBEF9C 9000398F */  lw          $25, 0x90($25)
/* 0132A0 01DBEFA0 09F82003 */  jalr        $25
/* 0132A4 01DBEFA4 00000000 */   nop
/* 0132A8 01DBEFA8 21189D02 */  addu        $3, $20, $29
/* 0132AC 01DBEFAC 9400648C */  lw          $4, 0x94($3)
/* 0132B0 01DBEFB0 10008010 */  beqz        $4, .L01DBEFF4_2C47F4
/* 0132B4 01DBEFB4 00000000 */   nop
/* 0132B8 01DBEFB8 948B858F */  lw          $5, -0x746C($28)
/* 0132BC 01DBEFBC 28360070 */  paddub      $6, $0, $0
/* 0132C0 01DBEFC0 D8FC040C */  jal         LoadFile__FPcPvPi
/* 0132C4 01DBEFC4 00000000 */   nop
/* 0132C8 01DBEFC8 948B848F */  lw          $4, -0x746C($28)
/* 0132CC 01DBEFCC DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 0132D0 01DBEFD0 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 0132D4 01DBEFD4 0E000624 */  addiu       $6, $0, 0xE
/* 0132D8 01DBEFD8 283E0070 */  paddub      $7, $0, $0
/* 0132DC 01DBEFDC 28460070 */  paddub      $8, $0, $0
/* 0132E0 01DBEFE0 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 0132E4 01DBEFE4 00000000 */   nop
/* 0132E8 01DBEFE8 D40062AE */  sw          $2, 0xD4($19)
/* 0132EC 01DBEFEC A0C1033C */  lui         $3, (0xC1A00000 >> 16)
/* 0132F0 01DBEFF0 E00063AE */  sw          $3, 0xE0($19)
.L01DBEFF4_2C47F4:
/* 0132F4 01DBEFF4 01003126 */  addiu       $17, $17, 0x1
.L01DBEFF8_2C47F8:
/* 0132F8 01DBEFF8 4C00232A */  slti        $3, $17, 0x4C
/* 0132FC 01DBEFFC 39FF6014 */  bnez        $3, .L01DBECE4_2C44E4
/* 013300 01DBF000 00000000 */   nop
/* 013304 01DBF004 DE01033C */  lui         $3, %hi(LIT_800__4)
/* 013308 01DBF008 F09C6724 */  addiu       $7, $3, %lo(LIT_800__4)
/* 01330C 01DBF00C 700AA627 */  addiu       $6, $29, 0xA70
/* 013310 01DBF010 3E000524 */  addiu       $5, $0, 0x3E
.L01DBF014_2C4814:
/* 013314 01DBF014 0000E478 */  lq          $4, 0x0($7)
/* 013318 01DBF018 1000E378 */  lq          $3, 0x10($7)
/* 01331C 01DBF01C 2000E724 */  addiu       $7, $7, 0x20
/* 013320 01DBF020 FFFFA524 */  addiu       $5, $5, -0x1
/* 013324 01DBF024 0000C47C */  sq          $4, 0x0($6)
/* 013328 01DBF028 1000C37C */  sq          $3, 0x10($6)
/* 01332C 01DBF02C 2000C624 */  addiu       $6, $6, 0x20
/* 013330 01DBF030 F8FFA01C */  bgtz        $5, .L01DBF014_2C4814
/* 013334 01DBF034 00000000 */   nop
/* 013338 01DBF038 28860070 */  paddub      $16, $0, $0
/* 01333C 01DBF03C A1000010 */  b           .L01DBF2C4_2C4AC4
/* 013340 01DBF040 00000000 */   nop
.L01DBF044_2C4844:
/* 013344 01DBF044 40A11000 */  sll         $20, $16, 5
/* 013348 01DBF048 21109D02 */  addu        $2, $20, $29
/* 01334C 01DBF04C 700A458C */  lw          $5, 0xA70($2)
/* 013350 01DBF050 0E00A010 */  beqz        $5, .L01DBF08C_2C488C
/* 013354 01DBF054 00000000 */   nop
/* 013358 01DBF058 948B848F */  lw          $4, -0x746C($28)
/* 01335C 01DBF05C 28360070 */  paddub      $6, $0, $0
/* 013360 01DBF060 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 013364 01DBF064 00000000 */   nop
/* 013368 01DBF068 28264070 */  paddub      $4, $2, $0
/* 01336C 01DBF06C DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 013370 01DBF070 60FE4524 */  addiu       $5, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 013374 01DBF074 02000624 */  addiu       $6, $0, 0x2
/* 013378 01DBF078 283E0070 */  paddub      $7, $0, $0
/* 01337C 01DBF07C 28460070 */  paddub      $8, $0, $0
/* 013380 01DBF080 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 013384 01DBF084 00000000 */   nop
/* 013388 01DBF088 28964070 */  paddub      $18, $2, $0
.L01DBF08C_2C488C:
/* 01338C 01DBF08C 0B00001A */  blez        $16, .L01DBF0BC_2C48BC
/* 013390 01DBF090 00000000 */   nop
/* 013394 01DBF094 28264072 */  paddub      $4, $18, $0
/* 013398 01DBF098 100AA527 */  addiu       $5, $29, 0xA10
/* 01339C 01DBF09C 01000624 */  addiu       $6, $0, 0x1
/* 0133A0 01DBF0A0 40000724 */  addiu       $7, $0, 0x40
/* 0133A4 01DBF0A4 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0133A8 01DBF0A8 00000000 */   nop
/* 0133AC 01DBF0AC 28264072 */  paddub      $4, $18, $0
/* 0133B0 01DBF0B0 01000524 */  addiu       $5, $0, 0x1
/* 0133B4 01DBF0B4 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 0133B8 01DBF0B8 00000000 */   nop
.L01DBF0BC_2C48BC:
/* 0133BC 01DBF0BC 1A000224 */  addiu       $2, $0, 0x1A
/* 0133C0 01DBF0C0 03000216 */  bne         $16, $2, .L01DBF0D0_2C48D0
/* 0133C4 01DBF0C4 00000000 */   nop
/* 0133C8 01DBF0C8 E301013C */  lui         $1, %hi(TaimatsuFrame__2 + 0x20)
/* 0133CC 01DBF0CC E0AC32AC */  sw          $18, %lo(TaimatsuFrame__2 + 0x20)($1)
.L01DBF0D0_2C48D0:
/* 0133D0 01DBF0D0 00111000 */  sll         $2, $16, 4
/* 0133D4 01DBF0D4 23105000 */  subu        $2, $2, $16
/* 0133D8 01DBF0D8 00990200 */  sll         $19, $2, 4
/* 0133DC 01DBF0DC E201023C */  lui         $2, %hi(OP_NornMapObj2)
/* 0133E0 01DBF0E0 F03D4224 */  addiu       $2, $2, %lo(OP_NornMapObj2)
/* 0133E4 01DBF0E4 21885300 */  addu        $17, $2, $19
/* 0133E8 01DBF0E8 28262072 */  paddub      $4, $17, $0
/* 0133EC 01DBF0EC 445E050C */  jal         Initialize__10CMapObjectFv
/* 0133F0 01DBF0F0 00000000 */   nop
/* 0133F4 01DBF0F4 28262072 */  paddub      $4, $17, $0
/* 0133F8 01DBF0F8 282E4072 */  paddub      $5, $18, $0
/* 0133FC 01DBF0FC 28360070 */  paddub      $6, $0, $0
/* 013400 01DBF100 305C050C */  jal         SetFrame__12CObjectFrameFP9CFrameVu1i
/* 013404 01DBF104 00000000 */   nop
/* 013408 01DBF108 E201023C */  lui         $2, %hi(OP_NornMapObj2 + 0xE8)
/* 01340C 01DBF10C D83E4224 */  addiu       $2, $2, %lo(OP_NornMapObj2 + 0xE8)
/* 013410 01DBF110 21105300 */  addu        $2, $2, $19
/* 013414 01DBF114 000040AC */  sw          $0, 0x0($2)
/* 013418 01DBF118 E201023C */  lui         $2, %hi(OP_NornMapObj2 + 0xE4)
/* 01341C 01DBF11C D43E4224 */  addiu       $2, $2, %lo(OP_NornMapObj2 + 0xE4)
/* 013420 01DBF120 21105300 */  addu        $2, $2, $19
/* 013424 01DBF124 000040AC */  sw          $0, 0x0($2)
/* 013428 01DBF128 21189D02 */  addu        $3, $20, $29
/* 01342C 01DBF12C 2041023C */  lui         $2, (0x41200000 >> 16)
/* 013430 01DBF130 00088244 */  mtc1        $2, $f1
/* 013434 01DBF134 800A60C4 */  lwc1        $f0, 0xA80($3)
/* 013438 01DBF138 C2080046 */  mul.s       $f3, $f1, $f0
/* 01343C 01DBF13C 7C0A60C4 */  lwc1        $f0, 0xA7C($3)
/* 013440 01DBF140 82080046 */  mul.s       $f2, $f1, $f0
/* 013444 01DBF144 780A60C4 */  lwc1        $f0, 0xA78($3)
/* 013448 01DBF148 02080046 */  mul.s       $f0, $f1, $f0
/* 01344C 01DBF14C 5012A0E7 */  swc1        $f0, 0x1250($29)
/* 013450 01DBF150 5412A2E7 */  swc1        $f2, 0x1254($29)
/* 013454 01DBF154 5812A3E7 */  swc1        $f3, 0x1258($29)
/* 013458 01DBF158 28262072 */  paddub      $4, $17, $0
/* 01345C 01DBF15C 5012A527 */  addiu       $5, $29, 0x1250
/* 013460 01DBF160 A000398E */  lw          $25, 0xA0($17)
/* 013464 01DBF164 1000398F */  lw          $25, 0x10($25)
/* 013468 01DBF168 09F82003 */  jalr        $25
/* 01346C 01DBF16C 00000000 */   nop
/* 013470 01DBF170 21109D02 */  addu        $2, $20, $29
/* 013474 01DBF174 8C0A4CC4 */  lwc1        $f12, 0xA8C($2)
/* 013478 01DBF178 9044040C */  jal         fptodp
/* 01347C 01DBF17C 00000000 */   nop
/* 013480 01DBF180 188084DF */  ld          $4, -0x7FE8($28)
/* 013484 01DBF184 282E4070 */  paddub      $5, $2, $0
/* 013488 01DBF188 9E3F040C */  jal         dpmul
/* 01348C 01DBF18C 00000000 */   nop
/* 013490 01DBF190 289E4070 */  paddub      $19, $2, $0
/* 013494 01DBF194 B4000424 */  addiu       $4, $0, 0xB4
/* 013498 01DBF198 FC40040C */  jal         litodp
/* 01349C 01DBF19C 00000000 */   nop
/* 0134A0 01DBF1A0 28266072 */  paddub      $4, $19, $0
/* 0134A4 01DBF1A4 282E4070 */  paddub      $5, $2, $0
/* 0134A8 01DBF1A8 4840040C */  jal         dpdiv
/* 0134AC 01DBF1AC 00000000 */   nop
/* 0134B0 01DBF1B0 28AE4070 */  paddub      $21, $2, $0
/* 0134B4 01DBF1B4 28264070 */  paddub      $4, $2, $0
/* 0134B8 01DBF1B8 9241040C */  jal         dptofp
/* 0134BC 01DBF1BC 00000000 */   nop
/* 0134C0 01DBF1C0 21109D02 */  addu        $2, $20, $29
/* 0134C4 01DBF1C4 880A4CC4 */  lwc1        $f12, 0xA88($2)
/* 0134C8 01DBF1C8 9044040C */  jal         fptodp
/* 0134CC 01DBF1CC 00000000 */   nop
/* 0134D0 01DBF1D0 188084DF */  ld          $4, -0x7FE8($28)
/* 0134D4 01DBF1D4 282E4070 */  paddub      $5, $2, $0
/* 0134D8 01DBF1D8 9E3F040C */  jal         dpmul
/* 0134DC 01DBF1DC 00000000 */   nop
/* 0134E0 01DBF1E0 289E4070 */  paddub      $19, $2, $0
/* 0134E4 01DBF1E4 B4000424 */  addiu       $4, $0, 0xB4
/* 0134E8 01DBF1E8 FC40040C */  jal         litodp
/* 0134EC 01DBF1EC 00000000 */   nop
/* 0134F0 01DBF1F0 28266072 */  paddub      $4, $19, $0
/* 0134F4 01DBF1F4 282E4070 */  paddub      $5, $2, $0
/* 0134F8 01DBF1F8 4840040C */  jal         dpdiv
/* 0134FC 01DBF1FC 00000000 */   nop
/* 013500 01DBF200 289E4070 */  paddub      $19, $2, $0
/* 013504 01DBF204 28264070 */  paddub      $4, $2, $0
/* 013508 01DBF208 9241040C */  jal         dptofp
/* 01350C 01DBF20C 00000000 */   nop
/* 013510 01DBF210 21109D02 */  addu        $2, $20, $29
/* 013514 01DBF214 840A4CC4 */  lwc1        $f12, 0xA84($2)
/* 013518 01DBF218 9044040C */  jal         fptodp
/* 01351C 01DBF21C 00000000 */   nop
/* 013520 01DBF220 188084DF */  ld          $4, -0x7FE8($28)
/* 013524 01DBF224 282E4070 */  paddub      $5, $2, $0
/* 013528 01DBF228 9E3F040C */  jal         dpmul
/* 01352C 01DBF22C 00000000 */   nop
/* 013530 01DBF230 28A64070 */  paddub      $20, $2, $0
/* 013534 01DBF234 B4000424 */  addiu       $4, $0, 0xB4
/* 013538 01DBF238 FC40040C */  jal         litodp
/* 01353C 01DBF23C 00000000 */   nop
/* 013540 01DBF240 28268072 */  paddub      $4, $20, $0
/* 013544 01DBF244 282E4070 */  paddub      $5, $2, $0
/* 013548 01DBF248 4840040C */  jal         dpdiv
/* 01354C 01DBF24C 00000000 */   nop
/* 013550 01DBF250 28264070 */  paddub      $4, $2, $0
/* 013554 01DBF254 9241040C */  jal         dptofp
/* 013558 01DBF258 00000000 */   nop
/* 01355C 01DBF25C 6012A0E7 */  swc1        $f0, 0x1260($29)
/* 013560 01DBF260 28266072 */  paddub      $4, $19, $0
/* 013564 01DBF264 9241040C */  jal         dptofp
/* 013568 01DBF268 00000000 */   nop
/* 01356C 01DBF26C 6412A0E7 */  swc1        $f0, 0x1264($29)
/* 013570 01DBF270 2826A072 */  paddub      $4, $21, $0
/* 013574 01DBF274 9241040C */  jal         dptofp
/* 013578 01DBF278 00000000 */   nop
/* 01357C 01DBF27C 6812A0E7 */  swc1        $f0, 0x1268($29)
/* 013580 01DBF280 28262072 */  paddub      $4, $17, $0
/* 013584 01DBF284 6012A527 */  addiu       $5, $29, 0x1260
/* 013588 01DBF288 A000398E */  lw          $25, 0xA0($17)
/* 01358C 01DBF28C 2C00398F */  lw          $25, 0x2C($25)
/* 013590 01DBF290 09F82003 */  jalr        $25
/* 013594 01DBF294 00000000 */   nop
/* 013598 01DBF298 09000016 */  bnez        $16, .L01DBF2C0_2C4AC0
/* 01359C 01DBF29C 00000000 */   nop
/* 0135A0 01DBF2A0 28262072 */  paddub      $4, $17, $0
/* 0135A4 01DBF2A4 DE01023C */  lui         $2, %hi(LIT_741__3)
/* 0135A8 01DBF2A8 F8F54524 */  addiu       $5, $2, %lo(LIT_741__3)
/* 0135AC 01DBF2AC 28360070 */  paddub      $6, $0, $0
/* 0135B0 01DBF2B0 A000398E */  lw          $25, 0xA0($17)
/* 0135B4 01DBF2B4 9000398F */  lw          $25, 0x90($25)
/* 0135B8 01DBF2B8 09F82003 */  jalr        $25
/* 0135BC 01DBF2BC 00000000 */   nop
.L01DBF2C0_2C4AC0:
/* 0135C0 01DBF2C0 01001026 */  addiu       $16, $16, 0x1
.L01DBF2C4_2C4AC4:
/* 0135C4 01DBF2C4 3E00032A */  slti        $3, $16, 0x3E
/* 0135C8 01DBF2C8 5EFF6014 */  bnez        $3, .L01DBF044_2C4844
/* 0135CC 01DBF2CC 00000000 */   nop
/* 0135D0 01DBF2D0 8000BF7B */  lq          $31, 0x80($29)
/* 0135D4 01DBF2D4 7000B77B */  lq          $23, 0x70($29)
/* 0135D8 01DBF2D8 6000B67B */  lq          $22, 0x60($29)
/* 0135DC 01DBF2DC 5000B57B */  lq          $21, 0x50($29)
/* 0135E0 01DBF2E0 4000B47B */  lq          $20, 0x40($29)
/* 0135E4 01DBF2E4 3000B37B */  lq          $19, 0x30($29)
/* 0135E8 01DBF2E8 2000B27B */  lq          $18, 0x20($29)
/* 0135EC 01DBF2EC 1000B17B */  lq          $17, 0x10($29)
/* 0135F0 01DBF2F0 0000B07B */  lq          $16, 0x0($29)
/* 0135F4 01DBF2F4 7012BD27 */  addiu       $29, $29, 0x1270
/* 0135F8 01DBF2F8 0800E003 */  jr          $31
/* 0135FC 01DBF2FC 00000000 */   nop
