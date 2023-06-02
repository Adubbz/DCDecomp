.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel setRoomDivid__Fv
/* C6E70 001C6D70 B0FBBD27 */  addiu      $sp, $sp, -0x450
/* C6E74 001C6D74 4000BF7F */  sq         $31, 0x40($sp)
/* C6E78 001C6D78 3000B37F */  sq         $19, 0x30($sp)
/* C6E7C 001C6D7C 2000B27F */  sq         $18, 0x20($sp)
/* C6E80 001C6D80 1000B17F */  sq         $17, 0x10($sp)
/* C6E84 001C6D84 0000B07F */  sq         $16, 0x0($sp)
/* C6E88 001C6D88 28860070 */  paddub     $16, $0, $0
/* C6E8C 001C6D8C 37010010 */  b          .L001C726C
/* C6E90 001C6D90 00000000 */   nop
.L001C6D94:
/* C6E94 001C6D94 288E0070 */  paddub     $17, $0, $0
/* C6E98 001C6D98 01000524 */  addiu      $5, $0, 0x1
/* C6E9C 001C6D9C 3D000010 */  b          .L001C6E94
/* C6EA0 001C6DA0 00000000 */   nop
.L001C6DA4:
/* C6EA4 001C6DA4 01000324 */  addiu      $3, $0, 0x1
/* C6EA8 001C6DA8 28260070 */  paddub     $4, $0, $0
/* C6EAC 001C6DAC 1E000010 */  b          .L001C6E28
/* C6EB0 001C6DB0 00000000 */   nop
.L001C6DB4:
/* C6EB4 001C6DB4 D601073C */  lui        $7, %hi(D_1D65B24)
/* C6EB8 001C6DB8 245BE724 */  addiu      $7, $7, %lo(D_1D65B24)
/* C6EBC 001C6DBC 2138E600 */  addu       $7, $7, $6
/* C6EC0 001C6DC0 0000E78C */  lw         $7, 0x0($7)
/* C6EC4 001C6DC4 2140A700 */  addu       $8, $5, $7
/* C6EC8 001C6DC8 80380800 */  sll        $7, $8, 2
/* C6ECC 001C6DCC 2138E800 */  addu       $7, $7, $8
/* C6ED0 001C6DD0 80380700 */  sll        $7, $7, 2
/* C6ED4 001C6DD4 21408700 */  addu       $8, $4, $7
/* C6ED8 001C6DD8 D601073C */  lui        $7, %hi(roomStack)
/* C6EDC 001C6DDC 205BE724 */  addiu      $7, $7, %lo(roomStack)
/* C6EE0 001C6DE0 2138E600 */  addu       $7, $7, $6
/* C6EE4 001C6DE4 0000E78C */  lw         $7, 0x0($7)
/* C6EE8 001C6DE8 2140E800 */  addu       $8, $7, $8
/* C6EEC 001C6DEC C0380800 */  sll        $7, $8, 3
/* C6EF0 001C6DF0 2138E800 */  addu       $7, $7, $8
/* C6EF4 001C6DF4 40380700 */  sll        $7, $7, 1
/* C6EF8 001C6DF8 2138E800 */  addu       $7, $7, $8
/* C6EFC 001C6DFC 80400700 */  sll        $8, $7, 2
/* C6F00 001C6E00 D501073C */  lui        $7, %hi(D_1D56DE8)
/* C6F04 001C6E04 E86DE724 */  addiu      $7, $7, %lo(D_1D56DE8)
/* C6F08 001C6E08 2138E800 */  addu       $7, $7, $8
/* C6F0C 001C6E0C 0000E78C */  lw         $7, 0x0($7)
/* C6F10 001C6E10 4D00E830 */  andi       $8, $7, 0x4D
/* C6F14 001C6E14 01000724 */  addiu      $7, $0, 0x1
/* C6F18 001C6E18 02000711 */  beq        $8, $7, .L001C6E24
/* C6F1C 001C6E1C 00000000 */   nop
/* C6F20 001C6E20 281E0070 */  paddub     $3, $0, $0
.L001C6E24:
/* C6F24 001C6E24 01008424 */  addiu      $4, $4, 0x1
.L001C6E28:
/* C6F28 001C6E28 D601073C */  lui        $7, %hi(D_1D65B28)
/* C6F2C 001C6E2C 285BE724 */  addiu      $7, $7, %lo(D_1D65B28)
/* C6F30 001C6E30 2138E600 */  addu       $7, $7, $6
/* C6F34 001C6E34 0000E88C */  lw         $8, 0x0($7)
/* C6F38 001C6E38 2A388800 */  slt        $7, $4, $8
/* C6F3C 001C6E3C DDFFE014 */  bnez       $7, .L001C6DB4
/* C6F40 001C6E40 00000000 */   nop
/* C6F44 001C6E44 01000424 */  addiu      $4, $0, 0x1
/* C6F48 001C6E48 11006414 */  bne        $3, $4, .L001C6E90
/* C6F4C 001C6E4C 00000000 */   nop
/* C6F50 001C6E50 D601033C */  lui        $3, %hi(roomStack)
/* C6F54 001C6E54 205B6324 */  addiu      $3, $3, %lo(roomStack)
/* C6F58 001C6E58 21186600 */  addu       $3, $3, $6
/* C6F5C 001C6E5C 0000638C */  lw         $3, 0x0($3)
/* C6F60 001C6E60 80201100 */  sll        $4, $17, 2
/* C6F64 001C6E64 21209D00 */  addu       $4, $4, $sp
/* C6F68 001C6E68 500083AC */  sw         $3, 0x50($4)
/* C6F6C 001C6E6C D601033C */  lui        $3, %hi(D_1D65B24)
/* C6F70 001C6E70 245B6324 */  addiu      $3, $3, %lo(D_1D65B24)
/* C6F74 001C6E74 21186600 */  addu       $3, $3, $6
/* C6F78 001C6E78 0000638C */  lw         $3, 0x0($3)
/* C6F7C 001C6E7C 2118A300 */  addu       $3, $5, $3
/* C6F80 001C6E80 500183AC */  sw         $3, 0x150($4)
/* C6F84 001C6E84 500288AC */  sw         $8, 0x250($4)
/* C6F88 001C6E88 500380AC */  sw         $0, 0x350($4)
/* C6F8C 001C6E8C 01003126 */  addiu      $17, $17, 0x1
.L001C6E90:
/* C6F90 001C6E90 0100A524 */  addiu      $5, $5, 0x1
.L001C6E94:
/* C6F94 001C6E94 00311000 */  sll        $6, $16, 4
/* C6F98 001C6E98 D601033C */  lui        $3, %hi(D_1D65B2C)
/* C6F9C 001C6E9C 2C5B6324 */  addiu      $3, $3, %lo(D_1D65B2C)
/* C6FA0 001C6EA0 21186600 */  addu       $3, $3, $6
/* C6FA4 001C6EA4 0000678C */  lw         $7, 0x0($3)
/* C6FA8 001C6EA8 FFFFE324 */  addiu      $3, $7, -0x1
/* C6FAC 001C6EAC 2A18A300 */  slt        $3, $5, $3
/* C6FB0 001C6EB0 BCFF6014 */  bnez       $3, .L001C6DA4
/* C6FB4 001C6EB4 00000000 */   nop
/* C6FB8 001C6EB8 01000424 */  addiu      $4, $0, 0x1
/* C6FBC 001C6EBC 39000010 */  b          .L001C6FA4
/* C6FC0 001C6EC0 00000000 */   nop
.L001C6EC4:
/* C6FC4 001C6EC4 01000324 */  addiu      $3, $0, 0x1
/* C6FC8 001C6EC8 282E0070 */  paddub     $5, $0, $0
/* C6FCC 001C6ECC 1E000010 */  b          .L001C6F48
/* C6FD0 001C6ED0 00000000 */   nop
.L001C6ED4:
/* C6FD4 001C6ED4 D601083C */  lui        $8, %hi(D_1D65B24)
/* C6FD8 001C6ED8 245B0825 */  addiu      $8, $8, %lo(D_1D65B24)
/* C6FDC 001C6EDC 21400601 */  addu       $8, $8, $6
/* C6FE0 001C6EE0 0000088D */  lw         $8, 0x0($8)
/* C6FE4 001C6EE4 2148A800 */  addu       $9, $5, $8
/* C6FE8 001C6EE8 80400900 */  sll        $8, $9, 2
/* C6FEC 001C6EEC 21400901 */  addu       $8, $8, $9
/* C6FF0 001C6EF0 80400800 */  sll        $8, $8, 2
/* C6FF4 001C6EF4 21488800 */  addu       $9, $4, $8
/* C6FF8 001C6EF8 D601083C */  lui        $8, %hi(roomStack)
/* C6FFC 001C6EFC 205B0825 */  addiu      $8, $8, %lo(roomStack)
/* C7000 001C6F00 21400601 */  addu       $8, $8, $6
/* C7004 001C6F04 0000088D */  lw         $8, 0x0($8)
/* C7008 001C6F08 21480901 */  addu       $9, $8, $9
/* C700C 001C6F0C C0400900 */  sll        $8, $9, 3
/* C7010 001C6F10 21400901 */  addu       $8, $8, $9
/* C7014 001C6F14 40400800 */  sll        $8, $8, 1
/* C7018 001C6F18 21400901 */  addu       $8, $8, $9
/* C701C 001C6F1C 80480800 */  sll        $9, $8, 2
/* C7020 001C6F20 D501083C */  lui        $8, %hi(D_1D56DE8)
/* C7024 001C6F24 E86D0825 */  addiu      $8, $8, %lo(D_1D56DE8)
/* C7028 001C6F28 21400901 */  addu       $8, $8, $9
/* C702C 001C6F2C 0000088D */  lw         $8, 0x0($8)
/* C7030 001C6F30 4D000931 */  andi       $9, $8, 0x4D
/* C7034 001C6F34 01000824 */  addiu      $8, $0, 0x1
/* C7038 001C6F38 02002811 */  beq        $9, $8, .L001C6F44
/* C703C 001C6F3C 00000000 */   nop
/* C7040 001C6F40 281E0070 */  paddub     $3, $0, $0
.L001C6F44:
/* C7044 001C6F44 0100A524 */  addiu      $5, $5, 0x1
.L001C6F48:
/* C7048 001C6F48 2A40A700 */  slt        $8, $5, $7
/* C704C 001C6F4C E1FF0015 */  bnez       $8, .L001C6ED4
/* C7050 001C6F50 00000000 */   nop
/* C7054 001C6F54 01000824 */  addiu      $8, $0, 0x1
/* C7058 001C6F58 11006814 */  bne        $3, $8, .L001C6FA0
/* C705C 001C6F5C 00000000 */   nop
/* C7060 001C6F60 D601033C */  lui        $3, %hi(roomStack)
/* C7064 001C6F64 205B6324 */  addiu      $3, $3, %lo(roomStack)
/* C7068 001C6F68 21186600 */  addu       $3, $3, $6
/* C706C 001C6F6C 0000638C */  lw         $3, 0x0($3)
/* C7070 001C6F70 21188300 */  addu       $3, $4, $3
/* C7074 001C6F74 80281100 */  sll        $5, $17, 2
/* C7078 001C6F78 2128BD00 */  addu       $5, $5, $sp
/* C707C 001C6F7C 5000A3AC */  sw         $3, 0x50($5)
/* C7080 001C6F80 D601033C */  lui        $3, %hi(D_1D65B24)
/* C7084 001C6F84 245B6324 */  addiu      $3, $3, %lo(D_1D65B24)
/* C7088 001C6F88 21186600 */  addu       $3, $3, $6
/* C708C 001C6F8C 0000638C */  lw         $3, 0x0($3)
/* C7090 001C6F90 5001A3AC */  sw         $3, 0x150($5)
/* C7094 001C6F94 5002A7AC */  sw         $7, 0x250($5)
/* C7098 001C6F98 5003A8AC */  sw         $8, 0x350($5)
/* C709C 001C6F9C 01003126 */  addiu      $17, $17, 0x1
.L001C6FA0:
/* C70A0 001C6FA0 01008424 */  addiu      $4, $4, 0x1
.L001C6FA4:
/* C70A4 001C6FA4 D601033C */  lui        $3, %hi(D_1D65B28)
/* C70A8 001C6FA8 285B6324 */  addiu      $3, $3, %lo(D_1D65B28)
/* C70AC 001C6FAC 21186600 */  addu       $3, $3, $6
/* C70B0 001C6FB0 0000638C */  lw         $3, 0x0($3)
/* C70B4 001C6FB4 FFFF6324 */  addiu      $3, $3, -0x1
/* C70B8 001C6FB8 2A188300 */  slt        $3, $4, $3
/* C70BC 001C6FBC C1FF6014 */  bnez       $3, .L001C6EC4
/* C70C0 001C6FC0 00000000 */   nop
/* C70C4 001C6FC4 A8002012 */  beqz       $17, .L001C7268
/* C70C8 001C6FC8 00000000 */   nop
/* C70CC 001C6FCC BE11040C */  jal        rand
/* C70D0 001C6FD0 00000000 */   nop
/* C70D4 001C6FD4 00008244 */  mtc1       $2, $f0
/* C70D8 001C6FD8 00000000 */  nop
/* C70DC 001C6FDC 60008046 */  cvt.s.w    $f1, $f0
/* C70E0 001C6FE0 C842033C */  lui        $3, (0x42C80000 >> 16)
/* C70E4 001C6FE4 00008344 */  mtc1       $3, $f0
/* C70E8 001C6FE8 00000000 */  nop
/* C70EC 001C6FEC 42000146 */  mul.s      $f1, $f0, $f1
/* C70F0 001C6FF0 004F033C */  lui        $3, (0x4F000000 >> 16)
/* C70F4 001C6FF4 00008344 */  mtc1       $3, $f0
/* C70F8 001C6FF8 00000000 */  nop
/* C70FC 001C6FFC 43080046 */  div.s      $f1, $f1, $f0
/* C7100 001C7000 2042033C */  lui        $3, (0x42200000 >> 16)
/* C7104 001C7004 00008344 */  mtc1       $3, $f0
/* C7108 001C7008 00000000 */  nop
/* C710C 001C700C 36080046 */  c.le.s     $f1, $f0
/* C7110 001C7010 00000000 */  nop
/* C7114 001C7014 94000045 */  bc1f       .L001C7268
/* C7118 001C7018 00000000 */   nop
/* C711C 001C701C BE11040C */  jal        rand
/* C7120 001C7020 00000000 */   nop
/* C7124 001C7024 00008244 */  mtc1       $2, $f0
/* C7128 001C7028 00000000 */  nop
/* C712C 001C702C 60008046 */  cvt.s.w    $f1, $f0
/* C7130 001C7030 00009144 */  mtc1       $17, $f0
/* C7134 001C7034 00000000 */  nop
/* C7138 001C7038 20008046 */  cvt.s.w    $f0, $f0
/* C713C 001C703C 42000146 */  mul.s      $f1, $f0, $f1
/* C7140 001C7040 004F023C */  lui        $2, (0x4F000000 >> 16)
/* C7144 001C7044 00008244 */  mtc1       $2, $f0
/* C7148 001C7048 00000000 */  nop
/* C714C 001C704C 030B0046 */  div.s      $f12, $f1, $f0
/* C7150 001C7050 2C44040C */  jal        fptosi
/* C7154 001C7054 00000000 */   nop
/* C7158 001C7058 80880200 */  sll        $17, $2, 2
/* C715C 001C705C 21183D02 */  addu       $3, $17, $sp
/* C7160 001C7060 5003628C */  lw         $2, 0x350($3)
/* C7164 001C7064 41004014 */  bnez       $2, .L001C716C
/* C7168 001C7068 00000000 */   nop
/* C716C 001C706C 5000728C */  lw         $18, 0x50($3)
/* C7170 001C7070 28264072 */  paddub     $4, $18, $0
/* C7174 001C7074 13000010 */  b          .L001C70C4
/* C7178 001C7078 00000000 */   nop
.L001C707C:
/* C717C 001C707C 21103D02 */  addu       $2, $17, $sp
/* C7180 001C7080 5001438C */  lw         $3, 0x150($2)
/* C7184 001C7084 80100300 */  sll        $2, $3, 2
/* C7188 001C7088 21104300 */  addu       $2, $2, $3
/* C718C 001C708C 80100200 */  sll        $2, $2, 2
/* C7190 001C7090 21188200 */  addu       $3, $4, $2
/* C7194 001C7094 C0100300 */  sll        $2, $3, 3
/* C7198 001C7098 21104300 */  addu       $2, $2, $3
/* C719C 001C709C 40100200 */  sll        $2, $2, 1
/* C71A0 001C70A0 21104300 */  addu       $2, $2, $3
/* C71A4 001C70A4 80180200 */  sll        $3, $2, 2
/* C71A8 001C70A8 D501023C */  lui        $2, %hi(D_1D56DE8)
/* C71AC 001C70AC E86D4224 */  addiu      $2, $2, %lo(D_1D56DE8)
/* C71B0 001C70B0 21184300 */  addu       $3, $2, $3
/* C71B4 001C70B4 0000628C */  lw         $2, 0x0($3)
/* C71B8 001C70B8 10004234 */  ori        $2, $2, 0x10
/* C71BC 001C70BC 000062AC */  sw         $2, 0x0($3)
/* C71C0 001C70C0 01008424 */  addiu      $4, $4, 0x1
.L001C70C4:
/* C71C4 001C70C4 21103D02 */  addu       $2, $17, $sp
/* C71C8 001C70C8 5002538C */  lw         $19, 0x250($2)
/* C71CC 001C70CC 21105302 */  addu       $2, $18, $19
/* C71D0 001C70D0 2A108200 */  slt        $2, $4, $2
/* C71D4 001C70D4 E9FF4014 */  bnez       $2, .L001C707C
/* C71D8 001C70D8 00000000 */   nop
/* C71DC 001C70DC BE11040C */  jal        rand
/* C71E0 001C70E0 00000000 */   nop
/* C71E4 001C70E4 00008244 */  mtc1       $2, $f0
/* C71E8 001C70E8 00000000 */  nop
/* C71EC 001C70EC 60008046 */  cvt.s.w    $f1, $f0
/* C71F0 001C70F0 FEFF6226 */  addiu      $2, $19, -0x2
/* C71F4 001C70F4 00008244 */  mtc1       $2, $f0
/* C71F8 001C70F8 00000000 */  nop
/* C71FC 001C70FC 20008046 */  cvt.s.w    $f0, $f0
/* C7200 001C7100 42000146 */  mul.s      $f1, $f0, $f1
/* C7204 001C7104 004F023C */  lui        $2, (0x4F000000 >> 16)
/* C7208 001C7108 00008244 */  mtc1       $2, $f0
/* C720C 001C710C 00000000 */  nop
/* C7210 001C7110 030B0046 */  div.s      $f12, $f1, $f0
/* C7214 001C7114 2C44040C */  jal        fptosi
/* C7218 001C7118 00000000 */   nop
/* C721C 001C711C 21183D02 */  addu       $3, $17, $sp
/* C7220 001C7120 5001648C */  lw         $4, 0x150($3)
/* C7224 001C7124 80180400 */  sll        $3, $4, 2
/* C7228 001C7128 21186400 */  addu       $3, $3, $4
/* C722C 001C712C 80180300 */  sll        $3, $3, 2
/* C7230 001C7130 21184302 */  addu       $3, $18, $3
/* C7234 001C7134 21206200 */  addu       $4, $3, $2
/* C7238 001C7138 C0180400 */  sll        $3, $4, 3
/* C723C 001C713C 21186400 */  addu       $3, $3, $4
/* C7240 001C7140 40180300 */  sll        $3, $3, 1
/* C7244 001C7144 21186400 */  addu       $3, $3, $4
/* C7248 001C7148 80200300 */  sll        $4, $3, 2
/* C724C 001C714C D501033C */  lui        $3, %hi(D_1D56E34)
/* C7250 001C7150 346E6324 */  addiu      $3, $3, %lo(D_1D56E34)
/* C7254 001C7154 21206400 */  addu       $4, $3, $4
/* C7258 001C7158 0000838C */  lw         $3, 0x0($4)
/* C725C 001C715C 20006334 */  ori        $3, $3, 0x20
/* C7260 001C7160 000083AC */  sw         $3, 0x0($4)
/* C7264 001C7164 40000010 */  b          .L001C7268
/* C7268 001C7168 00000000 */   nop
.L001C716C:
/* C726C 001C716C 5001728C */  lw         $18, 0x150($3)
/* C7270 001C7170 282E4072 */  paddub     $5, $18, $0
/* C7274 001C7174 13000010 */  b          .L001C71C4
/* C7278 001C7178 00000000 */   nop
.L001C717C:
/* C727C 001C717C 80100500 */  sll        $2, $5, 2
/* C7280 001C7180 21104500 */  addu       $2, $2, $5
/* C7284 001C7184 80180200 */  sll        $3, $2, 2
/* C7288 001C7188 21103D02 */  addu       $2, $17, $sp
/* C728C 001C718C 5000428C */  lw         $2, 0x50($2)
/* C7290 001C7190 21186200 */  addu       $3, $3, $2
/* C7294 001C7194 C0100300 */  sll        $2, $3, 3
/* C7298 001C7198 21104300 */  addu       $2, $2, $3
/* C729C 001C719C 40100200 */  sll        $2, $2, 1
/* C72A0 001C71A0 21104300 */  addu       $2, $2, $3
/* C72A4 001C71A4 80180200 */  sll        $3, $2, 2
/* C72A8 001C71A8 D501023C */  lui        $2, %hi(D_1D56DE8)
/* C72AC 001C71AC E86D4224 */  addiu      $2, $2, %lo(D_1D56DE8)
/* C72B0 001C71B0 21184300 */  addu       $3, $2, $3
/* C72B4 001C71B4 0000628C */  lw         $2, 0x0($3)
/* C72B8 001C71B8 10004234 */  ori        $2, $2, 0x10
/* C72BC 001C71BC 000062AC */  sw         $2, 0x0($3)
/* C72C0 001C71C0 0100A524 */  addiu      $5, $5, 0x1
.L001C71C4:
/* C72C4 001C71C4 21103D02 */  addu       $2, $17, $sp
/* C72C8 001C71C8 5002538C */  lw         $19, 0x250($2)
/* C72CC 001C71CC 21105302 */  addu       $2, $18, $19
/* C72D0 001C71D0 2A10A200 */  slt        $2, $5, $2
/* C72D4 001C71D4 E9FF4014 */  bnez       $2, .L001C717C
/* C72D8 001C71D8 00000000 */   nop
/* C72DC 001C71DC BE11040C */  jal        rand
/* C72E0 001C71E0 00000000 */   nop
/* C72E4 001C71E4 00008244 */  mtc1       $2, $f0
/* C72E8 001C71E8 00000000 */  nop
/* C72EC 001C71EC 60008046 */  cvt.s.w    $f1, $f0
/* C72F0 001C71F0 FEFF6226 */  addiu      $2, $19, -0x2
/* C72F4 001C71F4 00008244 */  mtc1       $2, $f0
/* C72F8 001C71F8 00000000 */  nop
/* C72FC 001C71FC 20008046 */  cvt.s.w    $f0, $f0
/* C7300 001C7200 42000146 */  mul.s      $f1, $f0, $f1
/* C7304 001C7204 004F023C */  lui        $2, (0x4F000000 >> 16)
/* C7308 001C7208 00008244 */  mtc1       $2, $f0
/* C730C 001C720C 00000000 */  nop
/* C7310 001C7210 030B0046 */  div.s      $f12, $f1, $f0
/* C7314 001C7214 2C44040C */  jal        fptosi
/* C7318 001C7218 00000000 */   nop
/* C731C 001C721C 21184202 */  addu       $3, $18, $2
/* C7320 001C7220 01006424 */  addiu      $4, $3, 0x1
/* C7324 001C7224 80180400 */  sll        $3, $4, 2
/* C7328 001C7228 21186400 */  addu       $3, $3, $4
/* C732C 001C722C 80200300 */  sll        $4, $3, 2
/* C7330 001C7230 21183D02 */  addu       $3, $17, $sp
/* C7334 001C7234 5000638C */  lw         $3, 0x50($3)
/* C7338 001C7238 21206400 */  addu       $4, $3, $4
/* C733C 001C723C C0180400 */  sll        $3, $4, 3
/* C7340 001C7240 21186400 */  addu       $3, $3, $4
/* C7344 001C7244 40180300 */  sll        $3, $3, 1
/* C7348 001C7248 21186400 */  addu       $3, $3, $4
/* C734C 001C724C 80200300 */  sll        $4, $3, 2
/* C7350 001C7250 D501033C */  lui        $3, %hi(D_1D56DE8)
/* C7354 001C7254 E86D6324 */  addiu      $3, $3, %lo(D_1D56DE8)
/* C7358 001C7258 21206400 */  addu       $4, $3, $4
/* C735C 001C725C 0000838C */  lw         $3, 0x0($4)
/* C7360 001C7260 20006334 */  ori        $3, $3, 0x20
/* C7364 001C7264 000083AC */  sw         $3, 0x0($4)
.L001C7268:
/* C7368 001C7268 01001026 */  addiu      $16, $16, 0x1
.L001C726C:
/* C736C 001C726C 0494838F */  lw         $3, -0x6BFC($gp)
/* C7370 001C7270 2A180302 */  slt        $3, $16, $3
/* C7374 001C7274 C7FE6014 */  bnez       $3, .L001C6D94
/* C7378 001C7278 00000000 */   nop
/* C737C 001C727C 4000BF7B */  lq         $31, 0x40($sp)
/* C7380 001C7280 3000B37B */  lq         $19, 0x30($sp)
/* C7384 001C7284 2000B27B */  lq         $18, 0x20($sp)
/* C7388 001C7288 1000B17B */  lq         $17, 0x10($sp)
/* C738C 001C728C 0000B07B */  lq         $16, 0x0($sp)
/* C7390 001C7290 5004BD27 */  addiu      $sp, $sp, 0x450
/* C7394 001C7294 0800E003 */  jr         $31
/* C7398 001C7298 00000000 */   nop
/* C739C 001C729C 00000000 */  nop
