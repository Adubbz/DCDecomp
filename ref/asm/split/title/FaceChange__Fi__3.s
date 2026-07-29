.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FaceChange__Fi__3
/* 017F90 01DC3C90 40FFBD27 */  addiu       $29, $29, -0xC0
/* 017F94 01DC3C94 9000BF7F */  sq          $31, 0x90($29)
/* 017F98 01DC3C98 8000B67F */  sq          $22, 0x80($29)
/* 017F9C 01DC3C9C 7000B57F */  sq          $21, 0x70($29)
/* 017FA0 01DC3CA0 6000B47F */  sq          $20, 0x60($29)
/* 017FA4 01DC3CA4 5000B37F */  sq          $19, 0x50($29)
/* 017FA8 01DC3CA8 4000B27F */  sq          $18, 0x40($29)
/* 017FAC 01DC3CAC 3000B17F */  sq          $17, 0x30($29)
/* 017FB0 01DC3CB0 2000B07F */  sq          $16, 0x20($29)
/* 017FB4 01DC3CB4 28A68070 */  paddub      $20, $4, $0
/* 017FB8 01DC3CB8 D48B848F */  lw          $4, -0x742C($28)
/* 017FBC 01DC3CBC 282E0070 */  paddub      $5, $0, $0
/* 017FC0 01DC3CC0 2083040C */  jal         sceVif1PkCnt
/* 017FC4 01DC3CC4 00000000 */   nop
/* 017FC8 01DC3CC8 D48B848F */  lw          $4, -0x742C($28)
/* 017FCC 01DC3CCC 282E0070 */  paddub      $5, $0, $0
/* 017FD0 01DC3CD0 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 017FD4 01DC3CD4 00000000 */   nop
/* 017FD8 01DC3CD8 C701023C */  lui         $2, %hi(GiftagAD)
/* 017FDC 01DC3CDC C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 017FE0 01DC3CE0 D48B848F */  lw          $4, -0x742C($28)
/* 017FE4 01DC3CE4 00004578 */  lq          $5, 0x0($2)
/* 017FE8 01DC3CE8 B083040C */  jal         sceVif1PkOpenGifTag
/* 017FEC 01DC3CEC 00000000 */   nop
/* 017FF0 01DC3CF0 D48B848F */  lw          $4, -0x742C($28)
/* 017FF4 01DC3CF4 3F000524 */  addiu       $5, $0, 0x3F
/* 017FF8 01DC3CF8 28360070 */  paddub      $6, $0, $0
/* 017FFC 01DC3CFC 0A84040C */  jal         sceVif1PkAddGsAD
/* 018000 01DC3D00 00000000 */   nop
/* 018004 01DC3D04 D48B848F */  lw          $4, -0x742C($28)
/* 018008 01DC3D08 B683040C */  jal         sceVif1PkCloseGifTag
/* 01800C 01DC3D0C 00000000 */   nop
/* 018010 01DC3D10 D48B848F */  lw          $4, -0x742C($28)
/* 018014 01DC3D14 A483040C */  jal         sceVif1PkCloseDirectCode
/* 018018 01DC3D18 00000000 */   nop
/* 01801C 01DC3D1C 80181400 */  sll         $3, $20, 2
/* 018020 01DC3D20 21187400 */  addu        $3, $3, $20
/* 018024 01DC3D24 40180300 */  sll         $3, $3, 1
/* 018028 01DC3D28 21187400 */  addu        $3, $3, $20
/* 01802C 01DC3D2C 80980300 */  sll         $19, $3, 2
/* 018030 01DC3D30 DE01033C */  lui         $3, %hi(face$1875)
/* 018034 01DC3D34 C0A96324 */  addiu       $3, $3, %lo(face$1875)
/* 018038 01DC3D38 21187300 */  addu        $3, $3, $19
/* 01803C 01DC3D3C 0000658C */  lw          $5, 0x0($3)
/* 018040 01DC3D40 CF00A010 */  beqz        $5, .L01DC4080_2C9880
/* 018044 01DC3D44 00000000 */   nop
/* 018048 01DC3D48 C701023C */  lui         $2, %hi(TexManager)
/* 01804C 01DC3D4C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 018050 01DC3D50 FFFF0624 */  addiu       $6, $0, -0x1
/* 018054 01DC3D54 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 018058 01DC3D58 00000000 */   nop
/* 01805C 01DC3D5C 28964070 */  paddub      $18, $2, $0
/* 018060 01DC3D60 DE01023C */  lui         $2, %hi(face$1875 + 0x4)
/* 018064 01DC3D64 C4A94224 */  addiu       $2, $2, %lo(face$1875 + 0x4)
/* 018068 01DC3D68 21185300 */  addu        $3, $2, $19
/* 01806C 01DC3D6C C701023C */  lui         $2, %hi(TexManager)
/* 018070 01DC3D70 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 018074 01DC3D74 0000658C */  lw          $5, 0x0($3)
/* 018078 01DC3D78 FFFF0624 */  addiu       $6, $0, -0x1
/* 01807C 01DC3D7C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 018080 01DC3D80 00000000 */   nop
/* 018084 01DC3D84 03004012 */  beqz        $18, .L01DC3D94_2C9594
/* 018088 01DC3D88 00000000 */   nop
/* 01808C 01DC3D8C 03004014 */  bnez        $2, .L01DC3D9C_2C959C
/* 018090 01DC3D90 00000000 */   nop
.L01DC3D94_2C9594:
/* 018094 01DC3D94 BA000010 */  b           .L01DC4080_2C9880
/* 018098 01DC3D98 00000000 */   nop
.L01DC3D9C_2C959C:
/* 01809C 01DC3D9C 2800438C */  lw          $3, 0x28($2)
/* 0180A0 01DC3DA0 FF3F7630 */  andi        $22, $3, 0x3FFF
/* 0180A4 01DC3DA4 2800438E */  lw          $3, 0x28($18)
/* 0180A8 01DC3DA8 FF3F7030 */  andi        $16, $3, 0x3FFF
/* 0180AC 01DC3DAC 280042DC */  ld          $2, 0x28($2)
/* 0180B0 01DC3DB0 BA130200 */  dsrl        $2, $2, 14
/* 0180B4 01DC3DB4 3F004230 */  andi        $2, $2, 0x3F
/* 0180B8 01DC3DB8 3C880200 */  dsll32      $17, $2, 0
/* 0180BC 01DC3DBC 3F881100 */  dsra32      $17, $17, 0
/* 0180C0 01DC3DC0 280042DE */  ld          $2, 0x28($18)
/* 0180C4 01DC3DC4 BA130200 */  dsrl        $2, $2, 14
/* 0180C8 01DC3DC8 3F004230 */  andi        $2, $2, 0x3F
/* 0180CC 01DC3DCC 3C900200 */  dsll32      $18, $2, 0
/* 0180D0 01DC3DD0 3F901200 */  dsra32      $18, $18, 0
/* 0180D4 01DC3DD4 40101400 */  sll         $2, $20, 1
/* 0180D8 01DC3DD8 21105400 */  addu        $2, $2, $20
/* 0180DC 01DC3DDC 80100200 */  sll         $2, $2, 2
/* 0180E0 01DC3DE0 21105400 */  addu        $2, $2, $20
/* 0180E4 01DC3DE4 80A00200 */  sll         $20, $2, 2
/* 0180E8 01DC3DE8 DE01023C */  lui         $2, %hi(CScript__2 + 0x44)
/* 0180EC 01DC3DEC 441B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x44)
/* 0180F0 01DC3DF0 21105400 */  addu        $2, $2, $20
/* 0180F4 01DC3DF4 0000438C */  lw          $3, 0x0($2)
/* 0180F8 01DC3DF8 DE01023C */  lui         $2, %hi(face$1875 + 0x18)
/* 0180FC 01DC3DFC D8A94224 */  addiu       $2, $2, %lo(face$1875 + 0x18)
/* 018100 01DC3E00 21205300 */  addu        $4, $2, $19
/* 018104 01DC3E04 000083AC */  sw          $3, 0x0($4)
/* 018108 01DC3E08 DE01023C */  lui         $2, %hi(face$1875 + 0xC)
/* 01810C 01DC3E0C CCA94224 */  addiu       $2, $2, %lo(face$1875 + 0xC)
/* 018110 01DC3E10 21105300 */  addu        $2, $2, $19
/* 018114 01DC3E14 0000458C */  lw          $5, 0x0($2)
/* 018118 01DC3E18 DE01023C */  lui         $2, %hi(face$1875 + 0x20)
/* 01811C 01DC3E1C E0A94224 */  addiu       $2, $2, %lo(face$1875 + 0x20)
/* 018120 01DC3E20 21A85300 */  addu        $21, $2, $19
/* 018124 01DC3E24 0000A38E */  lw          $3, 0x0($21)
/* 018128 01DC3E28 0000828C */  lw          $2, 0x0($4)
/* 01812C 01DC3E2C 01004224 */  addiu       $2, $2, 0x1
/* 018130 01DC3E30 1810A200 */  mult        $2, $5, $2
/* 018134 01DC3E34 23106200 */  subu        $2, $3, $2
/* 018138 01DC3E38 A000A0AF */  sw          $0, 0xA0($29)
/* 01813C 01DC3E3C A400A2AF */  sw          $2, 0xA4($29)
/* 018140 01DC3E40 80000224 */  addiu       $2, $0, 0x80
/* 018144 01DC3E44 A800A2AF */  sw          $2, 0xA8($29)
/* 018148 01DC3E48 AC00A5AF */  sw          $5, 0xAC($29)
/* 01814C 01DC3E4C 0000A0FF */  sd          $0, 0x0($29)
/* 018150 01DC3E50 23184500 */  subu        $3, $2, $5
/* 018154 01DC3E54 DE01023C */  lui         $2, %hi(face$1875 + 0x8)
/* 018158 01DC3E58 C8A94224 */  addiu       $2, $2, %lo(face$1875 + 0x8)
/* 01815C 01DC3E5C 21105300 */  addu        $2, $2, $19
/* 018160 01DC3E60 0000428C */  lw          $2, 0x0($2)
/* 018164 01DC3E64 23106200 */  subu        $2, $3, $2
/* 018168 01DC3E68 0800A2FF */  sd          $2, 0x8($29)
/* 01816C 01DC3E6C 1000A0FF */  sd          $0, 0x10($29)
/* 018170 01DC3E70 D48B848F */  lw          $4, -0x742C($28)
/* 018174 01DC3E74 282EC072 */  paddub      $5, $22, $0
/* 018178 01DC3E78 28362072 */  paddub      $6, $17, $0
/* 01817C 01DC3E7C 13000724 */  addiu       $7, $0, 0x13
/* 018180 01DC3E80 A000A827 */  addiu       $8, $29, 0xA0
/* 018184 01DC3E84 284E0072 */  paddub      $9, $16, $0
/* 018188 01DC3E88 28564072 */  paddub      $10, $18, $0
/* 01818C 01DC3E8C 285EE070 */  paddub      $11, $7, $0
/* 018190 01DC3E90 9801050C */  jal         MoveImageTest__FP13sceVif1PacketiiiRC8CRect_i_iiiiii
/* 018194 01DC3E94 00000000 */   nop
/* 018198 01DC3E98 0898828F */  lw          $2, -0x67F8($28)
/* 01819C 01DC3E9C 36004014 */  bnez        $2, .L01DC3F78_2C9778
/* 0181A0 01DC3EA0 00000000 */   nop
/* 0181A4 01DC3EA4 DE01023C */  lui         $2, %hi(CScript__2 + 0x50)
/* 0181A8 01DC3EA8 501B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x50)
/* 0181AC 01DC3EAC 21185400 */  addu        $3, $2, $20
/* 0181B0 01DC3EB0 000060C4 */  lwc1        $f0, 0x0($3)
/* 0181B4 01DC3EB4 DE01013C */  lui         $1, %hi(CScript__2 + 0x4E4)
/* 0181B8 01DC3EB8 E41F21C4 */  lwc1        $f1, %lo(CScript__2 + 0x4E4)($1)
/* 0181BC 01DC3EBC 34000146 */  c.lt.s      $f0, $f1
/* 0181C0 01DC3EC0 00000000 */  nop
/* 0181C4 01DC3EC4 24000145 */  bc1t        .L01DC3F58_2C9758
/* 0181C8 01DC3EC8 00000000 */   nop
/* 0181CC 01DC3ECC 01000146 */  sub.s       $f0, $f0, $f1
/* 0181D0 01DC3ED0 000060E4 */  swc1        $f0, 0x0($3)
/* 0181D4 01DC3ED4 DE01023C */  lui         $2, %hi(CScript__2 + 0x54)
/* 0181D8 01DC3ED8 541B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x54)
/* 0181DC 01DC3EDC 21105400 */  addu        $2, $2, $20
/* 0181E0 01DC3EE0 00004290 */  lbu         $2, 0x0($2)
/* 0181E4 01DC3EE4 24004010 */  beqz        $2, .L01DC3F78_2C9778
/* 0181E8 01DC3EE8 00000000 */   nop
/* 0181EC 01DC3EEC C842023C */  lui         $2, (0x42C80000 >> 16)
/* 0181F0 01DC3EF0 00088244 */  mtc1        $2, $f1
/* 0181F4 01DC3EF4 000060C4 */  lwc1        $f0, 0x0($3)
/* 0181F8 01DC3EF8 020B0046 */  mul.s       $f12, $f1, $f0
/* 0181FC 01DC3EFC 2C44040C */  jal         fptosi
/* 018200 01DC3F00 00000000 */   nop
/* 018204 01DC3F04 06000324 */  addiu       $3, $0, 0x6
/* 018208 01DC3F08 1A004300 */  div         $0, $2, $3
/* 01820C 01DC3F0C 00000000 */  nop
/* 018210 01DC3F10 00000000 */  nop
/* 018214 01DC3F14 10100000 */  mfhi        $2
/* 018218 01DC3F18 17004014 */  bnez        $2, .L01DC3F78_2C9778
/* 01821C 01DC3F1C 00000000 */   nop
/* 018220 01DC3F20 BE11040C */  jal         rand
/* 018224 01DC3F24 00000000 */   nop
/* 018228 01DC3F28 03004330 */  andi        $3, $2, 0x3
/* 01822C 01DC3F2C 04004104 */  bgez        $2, .L01DC3F40_2C9740
/* 018230 01DC3F30 00000000 */   nop
/* 018234 01DC3F34 02006010 */  beqz        $3, .L01DC3F40_2C9740
/* 018238 01DC3F38 00000000 */   nop
/* 01823C 01DC3F3C FCFF6324 */  addiu       $3, $3, -0x4
.L01DC3F40_2C9740:
/* 018240 01DC3F40 DE01023C */  lui         $2, %hi(CScript__2 + 0x4C)
/* 018244 01DC3F44 4C1B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x4C)
/* 018248 01DC3F48 21105400 */  addu        $2, $2, $20
/* 01824C 01DC3F4C 000043AC */  sw          $3, 0x0($2)
/* 018250 01DC3F50 09000010 */  b           .L01DC3F78_2C9778
/* 018254 01DC3F54 00000000 */   nop
.L01DC3F58_2C9758:
/* 018258 01DC3F58 DE01023C */  lui         $2, %hi(CScript__2 + 0x4C)
/* 01825C 01DC3F5C 4C1B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x4C)
/* 018260 01DC3F60 21105400 */  addu        $2, $2, $20
/* 018264 01DC3F64 000040AC */  sw          $0, 0x0($2)
/* 018268 01DC3F68 DE01023C */  lui         $2, %hi(CScript__2 + 0x54)
/* 01826C 01DC3F6C 541B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x54)
/* 018270 01DC3F70 21105400 */  addu        $2, $2, $20
/* 018274 01DC3F74 000040A0 */  sb          $0, 0x0($2)
.L01DC3F78_2C9778:
/* 018278 01DC3F78 DE01023C */  lui         $2, %hi(CScript__2 + 0x4C)
/* 01827C 01DC3F7C 4C1B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x4C)
/* 018280 01DC3F80 21105400 */  addu        $2, $2, $20
/* 018284 01DC3F84 0000438C */  lw          $3, 0x0($2)
/* 018288 01DC3F88 DE01023C */  lui         $2, %hi(face$1875 + 0x1C)
/* 01828C 01DC3F8C DCA94224 */  addiu       $2, $2, %lo(face$1875 + 0x1C)
/* 018290 01DC3F90 21205300 */  addu        $4, $2, $19
/* 018294 01DC3F94 000083AC */  sw          $3, 0x0($4)
/* 018298 01DC3F98 DE01023C */  lui         $2, %hi(face$1875 + 0x14)
/* 01829C 01DC3F9C D4A94224 */  addiu       $2, $2, %lo(face$1875 + 0x14)
/* 0182A0 01DC3FA0 21105300 */  addu        $2, $2, $19
/* 0182A4 01DC3FA4 0000458C */  lw          $5, 0x0($2)
/* 0182A8 01DC3FA8 0000828C */  lw          $2, 0x0($4)
/* 0182AC 01DC3FAC 01004224 */  addiu       $2, $2, 0x1
/* 0182B0 01DC3FB0 1818A200 */  mult        $3, $5, $2
/* 0182B4 01DC3FB4 0000A28E */  lw          $2, 0x0($21)
/* 0182B8 01DC3FB8 23184300 */  subu        $3, $2, $3
/* 0182BC 01DC3FBC 80000224 */  addiu       $2, $0, 0x80
/* 0182C0 01DC3FC0 B000A2AF */  sw          $2, 0xB0($29)
/* 0182C4 01DC3FC4 B400A3AF */  sw          $3, 0xB4($29)
/* 0182C8 01DC3FC8 B800A2AF */  sw          $2, 0xB8($29)
/* 0182CC 01DC3FCC BC00A5AF */  sw          $5, 0xBC($29)
/* 0182D0 01DC3FD0 0000A0FF */  sd          $0, 0x0($29)
/* 0182D4 01DC3FD4 23184500 */  subu        $3, $2, $5
/* 0182D8 01DC3FD8 DE01023C */  lui         $2, %hi(face$1875 + 0x10)
/* 0182DC 01DC3FDC D0A94224 */  addiu       $2, $2, %lo(face$1875 + 0x10)
/* 0182E0 01DC3FE0 21105300 */  addu        $2, $2, $19
/* 0182E4 01DC3FE4 0000428C */  lw          $2, 0x0($2)
/* 0182E8 01DC3FE8 23106200 */  subu        $2, $3, $2
/* 0182EC 01DC3FEC 0800A2FF */  sd          $2, 0x8($29)
/* 0182F0 01DC3FF0 1000A0FF */  sd          $0, 0x10($29)
/* 0182F4 01DC3FF4 D48B848F */  lw          $4, -0x742C($28)
/* 0182F8 01DC3FF8 282EC072 */  paddub      $5, $22, $0
/* 0182FC 01DC3FFC 28362072 */  paddub      $6, $17, $0
/* 018300 01DC4000 13000724 */  addiu       $7, $0, 0x13
/* 018304 01DC4004 B000A827 */  addiu       $8, $29, 0xB0
/* 018308 01DC4008 284E0072 */  paddub      $9, $16, $0
/* 01830C 01DC400C 28564072 */  paddub      $10, $18, $0
/* 018310 01DC4010 285EE070 */  paddub      $11, $7, $0
/* 018314 01DC4014 9801050C */  jal         MoveImageTest__FP13sceVif1PacketiiiRC8CRect_i_iiiiii
/* 018318 01DC4018 00000000 */   nop
/* 01831C 01DC401C D48B848F */  lw          $4, -0x742C($28)
/* 018320 01DC4020 282E0070 */  paddub      $5, $0, $0
/* 018324 01DC4024 2083040C */  jal         sceVif1PkCnt
/* 018328 01DC4028 00000000 */   nop
/* 01832C 01DC402C D48B848F */  lw          $4, -0x742C($28)
/* 018330 01DC4030 282E0070 */  paddub      $5, $0, $0
/* 018334 01DC4034 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 018338 01DC4038 00000000 */   nop
/* 01833C 01DC403C C701023C */  lui         $2, %hi(GiftagAD)
/* 018340 01DC4040 C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 018344 01DC4044 D48B848F */  lw          $4, -0x742C($28)
/* 018348 01DC4048 00004578 */  lq          $5, 0x0($2)
/* 01834C 01DC404C B083040C */  jal         sceVif1PkOpenGifTag
/* 018350 01DC4050 00000000 */   nop
/* 018354 01DC4054 D48B848F */  lw          $4, -0x742C($28)
/* 018358 01DC4058 3F000524 */  addiu       $5, $0, 0x3F
/* 01835C 01DC405C 28360070 */  paddub      $6, $0, $0
/* 018360 01DC4060 0A84040C */  jal         sceVif1PkAddGsAD
/* 018364 01DC4064 00000000 */   nop
/* 018368 01DC4068 D48B848F */  lw          $4, -0x742C($28)
/* 01836C 01DC406C B683040C */  jal         sceVif1PkCloseGifTag
/* 018370 01DC4070 00000000 */   nop
/* 018374 01DC4074 D48B848F */  lw          $4, -0x742C($28)
/* 018378 01DC4078 A483040C */  jal         sceVif1PkCloseDirectCode
/* 01837C 01DC407C 00000000 */   nop
.L01DC4080_2C9880:
/* 018380 01DC4080 9000BF7B */  lq          $31, 0x90($29)
/* 018384 01DC4084 8000B67B */  lq          $22, 0x80($29)
/* 018388 01DC4088 7000B57B */  lq          $21, 0x70($29)
/* 01838C 01DC408C 6000B47B */  lq          $20, 0x60($29)
/* 018390 01DC4090 5000B37B */  lq          $19, 0x50($29)
/* 018394 01DC4094 4000B27B */  lq          $18, 0x40($29)
/* 018398 01DC4098 3000B17B */  lq          $17, 0x30($29)
/* 01839C 01DC409C 2000B07B */  lq          $16, 0x20($29)
/* 0183A0 01DC40A0 C000BD27 */  addiu       $29, $29, 0xC0
/* 0183A4 01DC40A4 0800E003 */  jr          $31
/* 0183A8 01DC40A8 00000000 */   nop
/* 0183AC 01DC40AC 00000000 */  nop
