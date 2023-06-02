.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel TEIGIMdsLoad__FPUii
/* CEAF0 001CE9F0 70FCBD27 */  addiu      $sp, $sp, -0x390
/* CEAF4 001CE9F4 B000BF7F */  sq         $31, 0xB0($sp)
/* CEAF8 001CE9F8 A000BE7F */  sq         $fp, 0xA0($sp)
/* CEAFC 001CE9FC 9000B77F */  sq         $23, 0x90($sp)
/* CEB00 001CEA00 8000B67F */  sq         $22, 0x80($sp)
/* CEB04 001CEA04 7000B57F */  sq         $21, 0x70($sp)
/* CEB08 001CEA08 6000B47F */  sq         $20, 0x60($sp)
/* CEB0C 001CEA0C 5000B37F */  sq         $19, 0x50($sp)
/* CEB10 001CEA10 4000B27F */  sq         $18, 0x40($sp)
/* CEB14 001CEA14 3000B17F */  sq         $17, 0x30($sp)
/* CEB18 001CEA18 2000B07F */  sq         $16, 0x20($sp)
/* CEB1C 001CEA1C 1800B6E7 */  swc1       $f22, 0x18($sp)
/* CEB20 001CEA20 1400B5E7 */  swc1       $f21, 0x14($sp)
/* CEB24 001CEA24 1000B4E7 */  swc1       $f20, 0x10($sp)
/* CEB28 001CEA28 28968070 */  paddub     $18, $4, $0
/* CEB2C 001CEA2C 2C01A5AF */  sw         $5, 0x12C($sp)
/* CEB30 001CEA30 28AE0070 */  paddub     $21, $0, $0
/* CEB34 001CEA34 3001A427 */  addiu      $4, $sp, 0x130
/* CEB38 001CEA38 509F040C */  jal        __ct__10CFrameAttrFv
/* CEB3C 001CEA3C 00000000 */   nop
/* CEB40 001CEA40 9001A427 */  addiu      $4, $sp, 0x190
/* CEB44 001CEA44 509F040C */  jal        __ct__10CFrameAttrFv
/* CEB48 001CEA48 00000000 */   nop
/* CEB4C 001CEA4C A041023C */  lui        $2, (0x41A00000 >> 16)
/* CEB50 001CEA50 9401A2AF */  sw         $2, 0x194($sp)
/* CEB54 001CEA54 01000224 */  addiu      $2, $0, 0x1
/* CEB58 001CEA58 9801A2A3 */  sb         $2, 0x198($sp)
/* CEB5C 001CEA5C 9B01A0A3 */  sb         $0, 0x19B($sp)
/* CEB60 001CEA60 189480AF */  sw         $0, -0x6BE8($gp)
/* CEB64 001CEA64 282E0070 */  paddub     $5, $0, $0
/* CEB68 001CEA68 0A000010 */  b          .L001CEA94
/* CEB6C 001CEA6C 00000000 */   nop
.L001CEA70:
/* CEB70 001CEA70 FFFF0424 */  addiu      $4, $0, -0x1
/* CEB74 001CEA74 C0100500 */  sll        $2, $5, 3
/* CEB78 001CEA78 21104500 */  addu       $2, $2, $5
/* CEB7C 001CEA7C 00190200 */  sll        $3, $2, 4
/* CEB80 001CEA80 D801023C */  lui        $2, %hi(D_1D81F30)
/* CEB84 001CEA84 301F4224 */  addiu      $2, $2, %lo(D_1D81F30)
/* CEB88 001CEA88 21104300 */  addu       $2, $2, $3
/* CEB8C 001CEA8C 000044AC */  sw         $4, 0x0($2)
/* CEB90 001CEA90 0100A524 */  addiu      $5, $5, 0x1
.L001CEA94:
/* CEB94 001CEA94 3000A228 */  slti       $2, $5, 0x30
/* CEB98 001CEA98 F5FF4014 */  bnez       $2, .L001CEA70
/* CEB9C 001CEA9C 00000000 */   nop
/* CEBA0 001CEAA0 149480AF */  sw         $0, -0x6BEC($gp)
/* CEBA4 001CEAA4 2C01A28F */  lw         $2, 0x12C($sp)
/* CEBA8 001CEAA8 03004014 */  bnez       $2, .L001CEAB8
/* CEBAC 001CEAAC 00000000 */   nop
/* CEBB0 001CEAB0 1C9480AF */  sw         $0, -0x6BE4($gp)
/* CEBB4 001CEAB4 209480AF */  sw         $0, -0x6BE0($gp)
.L001CEAB8:
/* CEBB8 001CEAB8 D801023C */  lui        $2, %hi(pathName)
/* CEBBC 001CEABC 201E4424 */  addiu      $4, $2, %lo(pathName)
/* CEBC0 001CEAC0 2A00023C */  lui        $2, %hi(_766_2)
/* CEBC4 001CEAC4 88C24524 */  addiu      $5, $2, %lo(_766_2)
/* CEBC8 001CEAC8 5A15040C */  jal        strcpy
/* CEBCC 001CEACC 00000000 */   nop
/* CEBD0 001CEAD0 289E0070 */  paddub     $19, $0, $0
/* CEBD4 001CEAD4 98080010 */  b          .L001D0D38
/* CEBD8 001CEAD8 00000000 */   nop
.L001CEADC:
/* CEBDC 001CEADC 2800013C */  lui        $at, (0x280000 >> 16)
/* CEBE0 001CEAE0 A8A1348C */  lw         $20, -0x5E58($at)
/* CEBE4 001CEAE4 C0101300 */  sll        $2, $19, 3
/* CEBE8 001CEAE8 21105300 */  addu       $2, $2, $19
/* CEBEC 001CEAEC 00810200 */  sll        $16, $2, 4
/* CEBF0 001CEAF0 D701023C */  lui        $2, %hi(argValBuff)
/* CEBF4 001CEAF4 20B64224 */  addiu      $2, $2, %lo(argValBuff)
/* CEBF8 001CEAF8 21885000 */  addu       $17, $2, $16
/* CEBFC 001CEAFC 00002CC6 */  lwc1       $f12, 0x0($17)
/* CEC00 001CEB00 2C44040C */  jal        fptosi
/* CEC04 001CEB04 00000000 */   nop
/* CEC08 001CEB08 0D008216 */  bne        $20, $2, .L001CEB40
/* CEC0C 001CEB0C 00000000 */   nop
/* CEC10 001CEB10 D701023C */  lui        $2, %hi(D_1D6B624)
/* CEC14 001CEB14 24B64224 */  addiu      $2, $2, %lo(D_1D6B624)
/* CEC18 001CEB18 21105000 */  addu       $2, $2, $16
/* CEC1C 001CEB1C 00004CC4 */  lwc1       $f12, 0x0($2)
/* CEC20 001CEB20 2C44040C */  jal        fptosi
/* CEC24 001CEB24 00000000 */   nop
/* CEC28 001CEB28 DC8782AF */  sw         $2, -0x7824($gp)
/* CEC2C 001CEB2C 2A00023C */  lui        $2, %hi(_1149)
/* CEC30 001CEB30 D0C24424 */  addiu      $4, $2, %lo(_1149)
/* CEC34 001CEB34 DC87858F */  lw         $5, -0x7824($gp)
/* CEC38 001CEB38 A611040C */  jal        printf
/* CEC3C 001CEB3C 00000000 */   nop
.L001CEB40:
/* CEC40 001CEB40 2800013C */  lui        $at, (0x280000 >> 16)
/* CEC44 001CEB44 98A1348C */  lw         $20, -0x5E68($at)
/* CEC48 001CEB48 000034C6 */  lwc1       $f20, 0x0($17)
/* CEC4C 001CEB4C 06A30046 */  mov.s      $f12, $f20
/* CEC50 001CEB50 2C44040C */  jal        fptosi
/* CEC54 001CEB54 00000000 */   nop
/* CEC58 001CEB58 06008216 */  bne        $20, $2, .L001CEB74
/* CEC5C 001CEB5C 00000000 */   nop
/* CEC60 001CEB60 D701023C */  lui        $2, %hi(D_1D6B624)
/* CEC64 001CEB64 24B64224 */  addiu      $2, $2, %lo(D_1D6B624)
/* CEC68 001CEB68 21105000 */  addu       $2, $2, $16
/* CEC6C 001CEB6C 000040C4 */  lwc1       $f0, 0x0($2)
/* CEC70 001CEB70 E08780E7 */  swc1       $f0, -0x7820($gp)
.L001CEB74:
/* CEC74 001CEB74 2800013C */  lui        $at, (0x280000 >> 16)
/* CEC78 001CEB78 50A1348C */  lw         $20, -0x5EB0($at)
/* CEC7C 001CEB7C 06A30046 */  mov.s      $f12, $f20
/* CEC80 001CEB80 2C44040C */  jal        fptosi
/* CEC84 001CEB84 00000000 */   nop
/* CEC88 001CEB88 47008216 */  bne        $20, $2, .L001CECA8
/* CEC8C 001CEB8C 00000000 */   nop
/* CEC90 001CEB90 D701023C */  lui        $2, %hi(D_1D6B63C)
/* CEC94 001CEB94 3CB64224 */  addiu      $2, $2, %lo(D_1D6B63C)
/* CEC98 001CEB98 21105000 */  addu       $2, $2, $16
/* CEC9C 001CEB9C 00004CC4 */  lwc1       $f12, 0x0($2)
/* CECA0 001CEBA0 2C44040C */  jal        fptosi
/* CECA4 001CEBA4 00000000 */   nop
/* CECA8 001CEBA8 28A64070 */  paddub     $20, $2, $0
/* CECAC 001CEBAC D701023C */  lui        $2, %hi(D_1D6B624)
/* CECB0 001CEBB0 24B64224 */  addiu      $2, $2, %lo(D_1D6B624)
/* CECB4 001CEBB4 21105000 */  addu       $2, $2, $16
/* CECB8 001CEBB8 000040C4 */  lwc1       $f0, 0x0($2)
/* CECBC 001CEBBC 7002A0E7 */  swc1       $f0, 0x270($sp)
/* CECC0 001CEBC0 D701023C */  lui        $2, %hi(D_1D6B628)
/* CECC4 001CEBC4 28B64224 */  addiu      $2, $2, %lo(D_1D6B628)
/* CECC8 001CEBC8 21105000 */  addu       $2, $2, $16
/* CECCC 001CEBCC 000040C4 */  lwc1       $f0, 0x0($2)
/* CECD0 001CEBD0 7402BE27 */  addiu      $fp, $sp, 0x274
/* CECD4 001CEBD4 0000C0E7 */  swc1       $f0, 0x0($fp)
/* CECD8 001CEBD8 D701023C */  lui        $2, %hi(D_1D6B62C)
/* CECDC 001CEBDC 2CB64224 */  addiu      $2, $2, %lo(D_1D6B62C)
/* CECE0 001CEBE0 21105000 */  addu       $2, $2, $16
/* CECE4 001CEBE4 000040C4 */  lwc1       $f0, 0x0($2)
/* CECE8 001CEBE8 7802B727 */  addiu      $23, $sp, 0x278
/* CECEC 001CEBEC 0000E0E6 */  swc1       $f0, 0x0($23)
/* CECF0 001CEBF0 7002A427 */  addiu      $4, $sp, 0x270
/* CECF4 001CEBF4 282E8070 */  paddub     $5, $4, $0
/* CECF8 001CEBF8 9285040C */  jal        sceVu0Normalize
/* CECFC 001CEBFC 00000000 */   nop
/* CED00 001CEC00 7002A0C7 */  lwc1       $f0, 0x270($sp)
/* CED04 001CEC04 FFFF8326 */  addiu      $3, $20, -0x1
/* CED08 001CEC08 80300300 */  sll        $6, $3, 2
/* CED0C 001CEC0C E001023C */  lui        $2, %hi(ain_light)
/* CED10 001CEC10 B0864224 */  addiu      $2, $2, %lo(ain_light)
/* CED14 001CEC14 21104600 */  addu       $2, $2, $6
/* CED18 001CEC18 000040E4 */  swc1       $f0, 0x0($2)
/* CED1C 001CEC1C 0000C0C7 */  lwc1       $f0, 0x0($fp)
/* CED20 001CEC20 E001023C */  lui        $2, %hi(D_1DF86C0)
/* CED24 001CEC24 C0864224 */  addiu      $2, $2, %lo(D_1DF86C0)
/* CED28 001CEC28 21104600 */  addu       $2, $2, $6
/* CED2C 001CEC2C 000040E4 */  swc1       $f0, 0x0($2)
/* CED30 001CEC30 0000E0C6 */  lwc1       $f0, 0x0($23)
/* CED34 001CEC34 E001023C */  lui        $2, %hi(D_1DF86D0)
/* CED38 001CEC38 D0864224 */  addiu      $2, $2, %lo(D_1DF86D0)
/* CED3C 001CEC3C 21104600 */  addu       $2, $2, $6
/* CED40 001CEC40 000040E4 */  swc1       $f0, 0x0($2)
/* CED44 001CEC44 D701023C */  lui        $2, %hi(D_1D6B630)
/* CED48 001CEC48 30B64224 */  addiu      $2, $2, %lo(D_1D6B630)
/* CED4C 001CEC4C 21105000 */  addu       $2, $2, $16
/* CED50 001CEC50 000040C4 */  lwc1       $f0, 0x0($2)
/* CED54 001CEC54 00190300 */  sll        $3, $3, 4
/* CED58 001CEC58 E001023C */  lui        $2, %hi(ain_lightcolor)
/* CED5C 001CEC5C F0864224 */  addiu      $2, $2, %lo(ain_lightcolor)
/* CED60 001CEC60 21104300 */  addu       $2, $2, $3
/* CED64 001CEC64 000040E4 */  swc1       $f0, 0x0($2)
/* CED68 001CEC68 D701023C */  lui        $2, %hi(D_1D6B634)
/* CED6C 001CEC6C 34B64224 */  addiu      $2, $2, %lo(D_1D6B634)
/* CED70 001CEC70 21105000 */  addu       $2, $2, $16
/* CED74 001CEC74 000040C4 */  lwc1       $f0, 0x0($2)
/* CED78 001CEC78 E001023C */  lui        $2, %hi(D_1DF86F4)
/* CED7C 001CEC7C F4864224 */  addiu      $2, $2, %lo(D_1DF86F4)
/* CED80 001CEC80 21104300 */  addu       $2, $2, $3
/* CED84 001CEC84 000040E4 */  swc1       $f0, 0x0($2)
/* CED88 001CEC88 D701023C */  lui        $2, %hi(D_1D6B638)
/* CED8C 001CEC8C 38B64224 */  addiu      $2, $2, %lo(D_1D6B638)
/* CED90 001CEC90 21105000 */  addu       $2, $2, $16
/* CED94 001CEC94 000040C4 */  lwc1       $f0, 0x0($2)
/* CED98 001CEC98 E001023C */  lui        $2, %hi(D_1DF86F8)
/* CED9C 001CEC9C F8864224 */  addiu      $2, $2, %lo(D_1DF86F8)
/* CEDA0 001CECA0 21104300 */  addu       $2, $2, $3
/* CEDA4 001CECA4 000040E4 */  swc1       $f0, 0x0($2)
.L001CECA8:
/* CEDA8 001CECA8 2800013C */  lui        $at, (0x280000 >> 16)
/* CEDAC 001CECAC 30A1348C */  lw         $20, -0x5ED0($at)
/* CEDB0 001CECB0 000034C6 */  lwc1       $f20, 0x0($17)
/* CEDB4 001CECB4 06A30046 */  mov.s      $f12, $f20
/* CEDB8 001CECB8 2C44040C */  jal        fptosi
/* CEDBC 001CECBC 00000000 */   nop
/* CEDC0 001CECC0 13008216 */  bne        $20, $2, .L001CED10
/* CEDC4 001CECC4 00000000 */   nop
/* CEDC8 001CECC8 D701023C */  lui        $2, %hi(D_1D6B624)
/* CEDCC 001CECCC 24B64224 */  addiu      $2, $2, %lo(D_1D6B624)
/* CEDD0 001CECD0 21105000 */  addu       $2, $2, $16
/* CEDD4 001CECD4 000040C4 */  lwc1       $f0, 0x0($2)
/* CEDD8 001CECD8 E001013C */  lui        $at, (0x1E00000 >> 16)
/* CEDDC 001CECDC 308720E4 */  swc1       $f0, -0x78D0($at)
/* CEDE0 001CECE0 D701023C */  lui        $2, %hi(D_1D6B628)
/* CEDE4 001CECE4 28B64224 */  addiu      $2, $2, %lo(D_1D6B628)
/* CEDE8 001CECE8 21105000 */  addu       $2, $2, $16
/* CEDEC 001CECEC 000040C4 */  lwc1       $f0, 0x0($2)
/* CEDF0 001CECF0 E001013C */  lui        $at, (0x1E00000 >> 16)
/* CEDF4 001CECF4 348720E4 */  swc1       $f0, -0x78CC($at)
/* CEDF8 001CECF8 D701023C */  lui        $2, %hi(D_1D6B62C)
/* CEDFC 001CECFC 2CB64224 */  addiu      $2, $2, %lo(D_1D6B62C)
/* CEE00 001CED00 21105000 */  addu       $2, $2, $16
/* CEE04 001CED04 000040C4 */  lwc1       $f0, 0x0($2)
/* CEE08 001CED08 E001013C */  lui        $at, (0x1E00000 >> 16)
/* CEE0C 001CED0C 388720E4 */  swc1       $f0, -0x78C8($at)
.L001CED10:
/* CEE10 001CED10 2800013C */  lui        $at, (0x280000 >> 16)
/* CEE14 001CED14 20A2348C */  lw         $20, -0x5DE0($at)
/* CEE18 001CED18 06A30046 */  mov.s      $f12, $f20
/* CEE1C 001CED1C 2C44040C */  jal        fptosi
/* CEE20 001CED20 00000000 */   nop
/* CEE24 001CED24 47008216 */  bne        $20, $2, .L001CEE44
/* CEE28 001CED28 00000000 */   nop
/* CEE2C 001CED2C D701023C */  lui        $2, %hi(D_1D6B63C)
/* CEE30 001CED30 3CB64224 */  addiu      $2, $2, %lo(D_1D6B63C)
/* CEE34 001CED34 21105000 */  addu       $2, $2, $16
/* CEE38 001CED38 00004CC4 */  lwc1       $f12, 0x0($2)
/* CEE3C 001CED3C 2C44040C */  jal        fptosi
/* CEE40 001CED40 00000000 */   nop
/* CEE44 001CED44 28A64070 */  paddub     $20, $2, $0
/* CEE48 001CED48 D701023C */  lui        $2, %hi(D_1D6B624)
/* CEE4C 001CED4C 24B64224 */  addiu      $2, $2, %lo(D_1D6B624)
/* CEE50 001CED50 21105000 */  addu       $2, $2, $16
/* CEE54 001CED54 000040C4 */  lwc1       $f0, 0x0($2)
/* CEE58 001CED58 8002A0E7 */  swc1       $f0, 0x280($sp)
/* CEE5C 001CED5C D701023C */  lui        $2, %hi(D_1D6B628)
/* CEE60 001CED60 28B64224 */  addiu      $2, $2, %lo(D_1D6B628)
/* CEE64 001CED64 21105000 */  addu       $2, $2, $16
/* CEE68 001CED68 000040C4 */  lwc1       $f0, 0x0($2)
/* CEE6C 001CED6C 8402BE27 */  addiu      $fp, $sp, 0x284
/* CEE70 001CED70 0000C0E7 */  swc1       $f0, 0x0($fp)
/* CEE74 001CED74 D701023C */  lui        $2, %hi(D_1D6B62C)
/* CEE78 001CED78 2CB64224 */  addiu      $2, $2, %lo(D_1D6B62C)
/* CEE7C 001CED7C 21105000 */  addu       $2, $2, $16
/* CEE80 001CED80 000040C4 */  lwc1       $f0, 0x0($2)
/* CEE84 001CED84 8802B727 */  addiu      $23, $sp, 0x288
/* CEE88 001CED88 0000E0E6 */  swc1       $f0, 0x0($23)
/* CEE8C 001CED8C 8002A427 */  addiu      $4, $sp, 0x280
/* CEE90 001CED90 282E8070 */  paddub     $5, $4, $0
/* CEE94 001CED94 9285040C */  jal        sceVu0Normalize
/* CEE98 001CED98 00000000 */   nop
/* CEE9C 001CED9C 8002A0C7 */  lwc1       $f0, 0x280($sp)
/* CEEA0 001CEDA0 FFFF8326 */  addiu      $3, $20, -0x1
/* CEEA4 001CEDA4 80300300 */  sll        $6, $3, 2
/* CEEA8 001CEDA8 E001023C */  lui        $2, %hi(D_1DF8740)
/* CEEAC 001CEDAC 40874224 */  addiu      $2, $2, %lo(D_1DF8740)
/* CEEB0 001CEDB0 21104600 */  addu       $2, $2, $6
/* CEEB4 001CEDB4 000040E4 */  swc1       $f0, 0x0($2)
/* CEEB8 001CEDB8 0000C0C7 */  lwc1       $f0, 0x0($fp)
/* CEEBC 001CEDBC E001023C */  lui        $2, %hi(D_1DF8750)
/* CEEC0 001CEDC0 50874224 */  addiu      $2, $2, %lo(D_1DF8750)
/* CEEC4 001CEDC4 21104600 */  addu       $2, $2, $6
/* CEEC8 001CEDC8 000040E4 */  swc1       $f0, 0x0($2)
/* CEECC 001CEDCC 0000E0C6 */  lwc1       $f0, 0x0($23)
/* CEED0 001CEDD0 E001023C */  lui        $2, %hi(D_1DF8760)
/* CEED4 001CEDD4 60874224 */  addiu      $2, $2, %lo(D_1DF8760)
/* CEED8 001CEDD8 21104600 */  addu       $2, $2, $6
/* CEEDC 001CEDDC 000040E4 */  swc1       $f0, 0x0($2)
/* CEEE0 001CEDE0 D701023C */  lui        $2, %hi(D_1D6B630)
/* CEEE4 001CEDE4 30B64224 */  addiu      $2, $2, %lo(D_1D6B630)
/* CEEE8 001CEDE8 21105000 */  addu       $2, $2, $16
/* CEEEC 001CEDEC 000040C4 */  lwc1       $f0, 0x0($2)
/* CEEF0 001CEDF0 00190300 */  sll        $3, $3, 4
/* CEEF4 001CEDF4 E001023C */  lui        $2, %hi(D_1DF8780)
/* CEEF8 001CEDF8 80874224 */  addiu      $2, $2, %lo(D_1DF8780)
/* CEEFC 001CEDFC 21104300 */  addu       $2, $2, $3
/* CEF00 001CEE00 000040E4 */  swc1       $f0, 0x0($2)
/* CEF04 001CEE04 D701023C */  lui        $2, %hi(D_1D6B634)
/* CEF08 001CEE08 34B64224 */  addiu      $2, $2, %lo(D_1D6B634)
/* CEF0C 001CEE0C 21105000 */  addu       $2, $2, $16
/* CEF10 001CEE10 000040C4 */  lwc1       $f0, 0x0($2)
/* CEF14 001CEE14 E001023C */  lui        $2, %hi(D_1DF8784)
/* CEF18 001CEE18 84874224 */  addiu      $2, $2, %lo(D_1DF8784)
/* CEF1C 001CEE1C 21104300 */  addu       $2, $2, $3
/* CEF20 001CEE20 000040E4 */  swc1       $f0, 0x0($2)
/* CEF24 001CEE24 D701023C */  lui        $2, %hi(D_1D6B638)
/* CEF28 001CEE28 38B64224 */  addiu      $2, $2, %lo(D_1D6B638)
/* CEF2C 001CEE2C 21105000 */  addu       $2, $2, $16
/* CEF30 001CEE30 000040C4 */  lwc1       $f0, 0x0($2)
/* CEF34 001CEE34 E001023C */  lui        $2, %hi(D_1DF8788)
/* CEF38 001CEE38 88874224 */  addiu      $2, $2, %lo(D_1DF8788)
/* CEF3C 001CEE3C 21104300 */  addu       $2, $2, $3
/* CEF40 001CEE40 000040E4 */  swc1       $f0, 0x0($2)
.L001CEE44:
/* CEF44 001CEE44 2800013C */  lui        $at, (0x280000 >> 16)
/* CEF48 001CEE48 00A2348C */  lw         $20, -0x5E00($at)
/* CEF4C 001CEE4C 000034C6 */  lwc1       $f20, 0x0($17)
/* CEF50 001CEE50 06A30046 */  mov.s      $f12, $f20
/* CEF54 001CEE54 2C44040C */  jal        fptosi
/* CEF58 001CEE58 00000000 */   nop
/* CEF5C 001CEE5C 13008216 */  bne        $20, $2, .L001CEEAC
/* CEF60 001CEE60 00000000 */   nop
/* CEF64 001CEE64 D701023C */  lui        $2, %hi(D_1D6B624)
/* CEF68 001CEE68 24B64224 */  addiu      $2, $2, %lo(D_1D6B624)
/* CEF6C 001CEE6C 21105000 */  addu       $2, $2, $16
/* CEF70 001CEE70 000040C4 */  lwc1       $f0, 0x0($2)
/* CEF74 001CEE74 E001013C */  lui        $at, (0x1E00000 >> 16)
/* CEF78 001CEE78 C08720E4 */  swc1       $f0, -0x7840($at)
/* CEF7C 001CEE7C D701023C */  lui        $2, %hi(D_1D6B628)
/* CEF80 001CEE80 28B64224 */  addiu      $2, $2, %lo(D_1D6B628)
/* CEF84 001CEE84 21105000 */  addu       $2, $2, $16
/* CEF88 001CEE88 000040C4 */  lwc1       $f0, 0x0($2)
/* CEF8C 001CEE8C E001013C */  lui        $at, (0x1E00000 >> 16)
/* CEF90 001CEE90 C48720E4 */  swc1       $f0, -0x783C($at)
/* CEF94 001CEE94 D701023C */  lui        $2, %hi(D_1D6B62C)
/* CEF98 001CEE98 2CB64224 */  addiu      $2, $2, %lo(D_1D6B62C)
/* CEF9C 001CEE9C 21105000 */  addu       $2, $2, $16
/* CEFA0 001CEEA0 000040C4 */  lwc1       $f0, 0x0($2)
/* CEFA4 001CEEA4 E001013C */  lui        $at, (0x1E00000 >> 16)
/* CEFA8 001CEEA8 C88720E4 */  swc1       $f0, -0x7838($at)
.L001CEEAC:
/* CEFAC 001CEEAC 2800013C */  lui        $at, (0x280000 >> 16)
/* CEFB0 001CEEB0 00A1348C */  lw         $20, -0x5F00($at)
/* CEFB4 001CEEB4 06A30046 */  mov.s      $f12, $f20
/* CEFB8 001CEEB8 2C44040C */  jal        fptosi
/* CEFBC 001CEEBC 00000000 */   nop
/* CEFC0 001CEEC0 33008216 */  bne        $20, $2, .L001CEF90
/* CEFC4 001CEEC4 00000000 */   nop
/* CEFC8 001CEEC8 D701023C */  lui        $2, %hi(D_1D6B624)
/* CEFCC 001CEECC 24B64224 */  addiu      $2, $2, %lo(D_1D6B624)
/* CEFD0 001CEED0 21105000 */  addu       $2, $2, $16
/* CEFD4 001CEED4 000040C4 */  lwc1       $f0, 0x0($2)
/* CEFD8 001CEED8 DC01013C */  lui        $at, (0x1DC24A0 >> 16)
/* CEFDC 001CEEDC A02420E4 */  swc1       $f0, (0x1DC24A0 & 0xFFFF)($at)
/* CEFE0 001CEEE0 D701023C */  lui        $2, %hi(D_1D6B628)
/* CEFE4 001CEEE4 28B64224 */  addiu      $2, $2, %lo(D_1D6B628)
/* CEFE8 001CEEE8 21105000 */  addu       $2, $2, $16
/* CEFEC 001CEEEC 000040C4 */  lwc1       $f0, 0x0($2)
/* CEFF0 001CEEF0 DC01013C */  lui        $at, (0x1DC24A4 >> 16)
/* CEFF4 001CEEF4 A42420E4 */  swc1       $f0, (0x1DC24A4 & 0xFFFF)($at)
/* CEFF8 001CEEF8 D701023C */  lui        $2, %hi(D_1D6B638)
/* CEFFC 001CEEFC 38B64224 */  addiu      $2, $2, %lo(D_1D6B638)
/* CF000 001CEF00 21105000 */  addu       $2, $2, $16
/* CF004 001CEF04 000040C4 */  lwc1       $f0, 0x0($2)
/* CF008 001CEF08 DC01013C */  lui        $at, (0x1DC24A8 >> 16)
/* CF00C 001CEF0C A82420E4 */  swc1       $f0, (0x1DC24A8 & 0xFFFF)($at)
/* CF010 001CEF10 D701023C */  lui        $2, %hi(D_1D6B63C)
/* CF014 001CEF14 3CB64224 */  addiu      $2, $2, %lo(D_1D6B63C)
/* CF018 001CEF18 21105000 */  addu       $2, $2, $16
/* CF01C 001CEF1C 000040C4 */  lwc1       $f0, 0x0($2)
/* CF020 001CEF20 DC01013C */  lui        $at, (0x1DC24AC >> 16)
/* CF024 001CEF24 AC2420E4 */  swc1       $f0, (0x1DC24AC & 0xFFFF)($at)
/* CF028 001CEF28 D701023C */  lui        $2, %hi(D_1D6B62C)
/* CF02C 001CEF2C 2CB64224 */  addiu      $2, $2, %lo(D_1D6B62C)
/* CF030 001CEF30 21105000 */  addu       $2, $2, $16
/* CF034 001CEF34 00004CC4 */  lwc1       $f12, 0x0($2)
/* CF038 001CEF38 5044040C */  jal        fptoui
/* CF03C 001CEF3C 00000000 */   nop
/* CF040 001CEF40 2A00013C */  lui        $at, (0x2A22E4 >> 16)
/* CF044 001CEF44 E42222A0 */  sb         $2, (0x2A22E4 & 0xFFFF)($at)
/* CF048 001CEF48 D701023C */  lui        $2, %hi(D_1D6B630)
/* CF04C 001CEF4C 30B64224 */  addiu      $2, $2, %lo(D_1D6B630)
/* CF050 001CEF50 21105000 */  addu       $2, $2, $16
/* CF054 001CEF54 00004CC4 */  lwc1       $f12, 0x0($2)
/* CF058 001CEF58 5044040C */  jal        fptoui
/* CF05C 001CEF5C 00000000 */   nop
/* CF060 001CEF60 2A00013C */  lui        $at, (0x2A22E5 >> 16)
/* CF064 001CEF64 E52222A0 */  sb         $2, (0x2A22E5 & 0xFFFF)($at)
/* CF068 001CEF68 D701023C */  lui        $2, %hi(D_1D6B634)
/* CF06C 001CEF6C 34B64224 */  addiu      $2, $2, %lo(D_1D6B634)
/* CF070 001CEF70 21105000 */  addu       $2, $2, $16
/* CF074 001CEF74 00004CC4 */  lwc1       $f12, 0x0($2)
/* CF078 001CEF78 5044040C */  jal        fptoui
/* CF07C 001CEF7C 00000000 */   nop
/* CF080 001CEF80 2A00013C */  lui        $at, (0x2A22E6 >> 16)
/* CF084 001CEF84 E62222A0 */  sb         $2, (0x2A22E6 & 0xFFFF)($at)
/* CF088 001CEF88 01000224 */  addiu      $2, $0, 0x1
/* CF08C 001CEF8C 9C01A2A3 */  sb         $2, 0x19C($sp)
.L001CEF90:
/* CF090 001CEF90 2800013C */  lui        $at, (0x280000 >> 16)
/* CF094 001CEF94 80A1348C */  lw         $20, -0x5E80($at)
/* CF098 001CEF98 06A30046 */  mov.s      $f12, $f20
/* CF09C 001CEF9C 2C44040C */  jal        fptosi
/* CF0A0 001CEFA0 00000000 */   nop
/* CF0A4 001CEFA4 4D008216 */  bne        $20, $2, .L001CF0DC
/* CF0A8 001CEFA8 00000000 */   nop
/* CF0AC 001CEFAC D701023C */  lui        $2, %hi(D_1D6B624)
/* CF0B0 001CEFB0 24B64224 */  addiu      $2, $2, %lo(D_1D6B624)
/* CF0B4 001CEFB4 21105000 */  addu       $2, $2, $16
/* CF0B8 001CEFB8 00004CC4 */  lwc1       $f12, 0x0($2)
/* CF0BC 001CEFBC 5044040C */  jal        fptoui
/* CF0C0 001CEFC0 00000000 */   nop
/* CF0C4 001CEFC4 2A00013C */  lui        $at, (0x2A34C4 >> 16)
/* CF0C8 001CEFC8 C43422A0 */  sb         $2, (0x2A34C4 & 0xFFFF)($at)
/* CF0CC 001CEFCC D701023C */  lui        $2, %hi(D_1D6B628)
/* CF0D0 001CEFD0 28B64224 */  addiu      $2, $2, %lo(D_1D6B628)
/* CF0D4 001CEFD4 21105000 */  addu       $2, $2, $16
/* CF0D8 001CEFD8 00004CC4 */  lwc1       $f12, 0x0($2)
/* CF0DC 001CEFDC 5044040C */  jal        fptoui
/* CF0E0 001CEFE0 00000000 */   nop
/* CF0E4 001CEFE4 2A00013C */  lui        $at, (0x2A34C5 >> 16)
/* CF0E8 001CEFE8 C53422A0 */  sb         $2, (0x2A34C5 & 0xFFFF)($at)
/* CF0EC 001CEFEC D701023C */  lui        $2, %hi(D_1D6B62C)
/* CF0F0 001CEFF0 2CB64224 */  addiu      $2, $2, %lo(D_1D6B62C)
/* CF0F4 001CEFF4 21105000 */  addu       $2, $2, $16
/* CF0F8 001CEFF8 00004CC4 */  lwc1       $f12, 0x0($2)
/* CF0FC 001CEFFC 5044040C */  jal        fptoui
/* CF100 001CF000 00000000 */   nop
/* CF104 001CF004 2A00013C */  lui        $at, (0x2A34C6 >> 16)
/* CF108 001CF008 C63422A0 */  sb         $2, (0x2A34C6 & 0xFFFF)($at)
/* CF10C 001CF00C 2A00013C */  lui        $at, (0x2A34C4 >> 16)
/* CF110 001CF010 C4342290 */  lbu        $2, (0x2A34C4 & 0xFFFF)($at)
/* CF114 001CF014 06004004 */  bltz       $2, .L001CF030
/* CF118 001CF018 00000000 */   nop
/* CF11C 001CF01C 00008244 */  mtc1       $2, $f0
/* CF120 001CF020 00000000 */  nop
/* CF124 001CF024 20038046 */  cvt.s.w    $f12, $f0
/* CF128 001CF028 08000010 */  b          .L001CF04C
/* CF12C 001CF02C 00000000 */   nop
.L001CF030:
/* CF130 001CF030 42180200 */  srl        $3, $2, 1
/* CF134 001CF034 01004230 */  andi       $2, $2, 0x1
/* CF138 001CF038 25186200 */  or         $3, $3, $2
/* CF13C 001CF03C 00008344 */  mtc1       $3, $f0
/* CF140 001CF040 00000000 */  nop
/* CF144 001CF044 20038046 */  cvt.s.w    $f12, $f0
/* CF148 001CF048 00630C46 */  add.s      $f12, $f12, $f12
.L001CF04C:
/* CF14C 001CF04C 2A00013C */  lui        $at, (0x2A34C5 >> 16)
/* CF150 001CF050 C5342290 */  lbu        $2, (0x2A34C5 & 0xFFFF)($at)
/* CF154 001CF054 06004004 */  bltz       $2, .L001CF070
/* CF158 001CF058 00000000 */   nop
/* CF15C 001CF05C 00008244 */  mtc1       $2, $f0
/* CF160 001CF060 00000000 */  nop
/* CF164 001CF064 60038046 */  cvt.s.w    $f13, $f0
/* CF168 001CF068 08000010 */  b          .L001CF08C
/* CF16C 001CF06C 00000000 */   nop
.L001CF070:
/* CF170 001CF070 42180200 */  srl        $3, $2, 1
/* CF174 001CF074 01004230 */  andi       $2, $2, 0x1
/* CF178 001CF078 25186200 */  or         $3, $3, $2
/* CF17C 001CF07C 00008344 */  mtc1       $3, $f0
/* CF180 001CF080 00000000 */  nop
/* CF184 001CF084 60038046 */  cvt.s.w    $f13, $f0
/* CF188 001CF088 406B0D46 */  add.s      $f13, $f13, $f13
.L001CF08C:
/* CF18C 001CF08C 2A00013C */  lui        $at, (0x2A34C6 >> 16)
/* CF190 001CF090 C6342290 */  lbu        $2, (0x2A34C6 & 0xFFFF)($at)
/* CF194 001CF094 06004004 */  bltz       $2, .L001CF0B0
/* CF198 001CF098 00000000 */   nop
/* CF19C 001CF09C 00008244 */  mtc1       $2, $f0
/* CF1A0 001CF0A0 00000000 */  nop
/* CF1A4 001CF0A4 A0038046 */  cvt.s.w    $f14, $f0
/* CF1A8 001CF0A8 08000010 */  b          .L001CF0CC
/* CF1AC 001CF0AC 00000000 */   nop
.L001CF0B0:
/* CF1B0 001CF0B0 42180200 */  srl        $3, $2, 1
/* CF1B4 001CF0B4 01004230 */  andi       $2, $2, 0x1
/* CF1B8 001CF0B8 25186200 */  or         $3, $3, $2
/* CF1BC 001CF0BC 00008344 */  mtc1       $3, $f0
/* CF1C0 001CF0C0 00000000 */  nop
/* CF1C4 001CF0C4 A0038046 */  cvt.s.w    $f14, $f0
/* CF1C8 001CF0C8 80730E46 */  add.s      $f14, $f14, $f14
.L001CF0CC:
/* CF1CC 001CF0CC 0043023C */  lui        $2, (0x43000000 >> 16)
/* CF1D0 001CF0D0 00788244 */  mtc1       $2, $f15
/* CF1D4 001CF0D4 24B8040C */  jal        MGSetBGColor__Fffff
/* CF1D8 001CF0D8 00000000 */   nop
.L001CF0DC:
/* CF1DC 001CF0DC 2800013C */  lui        $at, (0x280000 >> 16)
/* CF1E0 001CF0E0 80A2348C */  lw         $20, -0x5D80($at)
/* CF1E4 001CF0E4 000034C6 */  lwc1       $f20, 0x0($17)
/* CF1E8 001CF0E8 06A30046 */  mov.s      $f12, $f20
/* CF1EC 001CF0EC 2C44040C */  jal        fptosi
/* CF1F0 001CF0F0 00000000 */   nop
/* CF1F4 001CF0F4 19008216 */  bne        $20, $2, .L001CF15C
/* CF1F8 001CF0F8 00000000 */   nop
/* CF1FC 001CF0FC D701023C */  lui        $2, %hi(D_1D6B624)
/* CF200 001CF100 24B64224 */  addiu      $2, $2, %lo(D_1D6B624)
/* CF204 001CF104 21105000 */  addu       $2, $2, $16
/* CF208 001CF108 00004CC4 */  lwc1       $f12, 0x0($2)
/* CF20C 001CF10C 5044040C */  jal        fptoui
/* CF210 001CF110 00000000 */   nop
/* CF214 001CF114 2A00013C */  lui        $at, (0x2A34C8 >> 16)
/* CF218 001CF118 C83422A0 */  sb         $2, (0x2A34C8 & 0xFFFF)($at)
/* CF21C 001CF11C D701023C */  lui        $2, %hi(D_1D6B628)
/* CF220 001CF120 28B64224 */  addiu      $2, $2, %lo(D_1D6B628)
/* CF224 001CF124 21105000 */  addu       $2, $2, $16
/* CF228 001CF128 00004CC4 */  lwc1       $f12, 0x0($2)
/* CF22C 001CF12C 5044040C */  jal        fptoui
/* CF230 001CF130 00000000 */   nop
/* CF234 001CF134 2A00013C */  lui        $at, (0x2A34C9 >> 16)
/* CF238 001CF138 C93422A0 */  sb         $2, (0x2A34C9 & 0xFFFF)($at)
/* CF23C 001CF13C D701023C */  lui        $2, %hi(D_1D6B62C)
/* CF240 001CF140 2CB64224 */  addiu      $2, $2, %lo(D_1D6B62C)
/* CF244 001CF144 21105000 */  addu       $2, $2, $16
/* CF248 001CF148 00004CC4 */  lwc1       $f12, 0x0($2)
/* CF24C 001CF14C 5044040C */  jal        fptoui
/* CF250 001CF150 00000000 */   nop
/* CF254 001CF154 2A00013C */  lui        $at, (0x2A34CA >> 16)
/* CF258 001CF158 CA3422A0 */  sb         $2, (0x2A34CA & 0xFFFF)($at)
.L001CF15C:
/* CF25C 001CF15C 2800013C */  lui        $at, (0x280000 >> 16)
/* CF260 001CF160 50A2348C */  lw         $20, -0x5DB0($at)
/* CF264 001CF164 06A30046 */  mov.s      $f12, $f20
/* CF268 001CF168 2C44040C */  jal        fptosi
/* CF26C 001CF16C 00000000 */   nop
/* CF270 001CF170 33008216 */  bne        $20, $2, .L001CF240
/* CF274 001CF174 00000000 */   nop
/* CF278 001CF178 D701023C */  lui        $2, %hi(D_1D6B624)
/* CF27C 001CF17C 24B64224 */  addiu      $2, $2, %lo(D_1D6B624)
/* CF280 001CF180 21105000 */  addu       $2, $2, $16
/* CF284 001CF184 000040C4 */  lwc1       $f0, 0x0($2)
/* CF288 001CF188 DC01013C */  lui        $at, (0x1DC24B0 >> 16)
/* CF28C 001CF18C B02420E4 */  swc1       $f0, (0x1DC24B0 & 0xFFFF)($at)
/* CF290 001CF190 D701023C */  lui        $2, %hi(D_1D6B628)
/* CF294 001CF194 28B64224 */  addiu      $2, $2, %lo(D_1D6B628)
/* CF298 001CF198 21105000 */  addu       $2, $2, $16
/* CF29C 001CF19C 000040C4 */  lwc1       $f0, 0x0($2)
/* CF2A0 001CF1A0 DC01013C */  lui        $at, (0x1DC24B4 >> 16)
/* CF2A4 001CF1A4 B42420E4 */  swc1       $f0, (0x1DC24B4 & 0xFFFF)($at)
/* CF2A8 001CF1A8 D701023C */  lui        $2, %hi(D_1D6B638)
/* CF2AC 001CF1AC 38B64224 */  addiu      $2, $2, %lo(D_1D6B638)
/* CF2B0 001CF1B0 21105000 */  addu       $2, $2, $16
/* CF2B4 001CF1B4 000040C4 */  lwc1       $f0, 0x0($2)
/* CF2B8 001CF1B8 DC01013C */  lui        $at, (0x1DC24B8 >> 16)
/* CF2BC 001CF1BC B82420E4 */  swc1       $f0, (0x1DC24B8 & 0xFFFF)($at)
/* CF2C0 001CF1C0 D701023C */  lui        $2, %hi(D_1D6B63C)
/* CF2C4 001CF1C4 3CB64224 */  addiu      $2, $2, %lo(D_1D6B63C)
/* CF2C8 001CF1C8 21105000 */  addu       $2, $2, $16
/* CF2CC 001CF1CC 000040C4 */  lwc1       $f0, 0x0($2)
/* CF2D0 001CF1D0 DC01013C */  lui        $at, (0x1DC24BC >> 16)
/* CF2D4 001CF1D4 BC2420E4 */  swc1       $f0, (0x1DC24BC & 0xFFFF)($at)
/* CF2D8 001CF1D8 D701023C */  lui        $2, %hi(D_1D6B62C)
/* CF2DC 001CF1DC 2CB64224 */  addiu      $2, $2, %lo(D_1D6B62C)
/* CF2E0 001CF1E0 21105000 */  addu       $2, $2, $16
/* CF2E4 001CF1E4 00004CC4 */  lwc1       $f12, 0x0($2)
/* CF2E8 001CF1E8 5044040C */  jal        fptoui
/* CF2EC 001CF1EC 00000000 */   nop
/* CF2F0 001CF1F0 2A00013C */  lui        $at, (0x2A22E8 >> 16)
/* CF2F4 001CF1F4 E82222A0 */  sb         $2, (0x2A22E8 & 0xFFFF)($at)
/* CF2F8 001CF1F8 D701023C */  lui        $2, %hi(D_1D6B630)
/* CF2FC 001CF1FC 30B64224 */  addiu      $2, $2, %lo(D_1D6B630)
/* CF300 001CF200 21105000 */  addu       $2, $2, $16
/* CF304 001CF204 00004CC4 */  lwc1       $f12, 0x0($2)
/* CF308 001CF208 5044040C */  jal        fptoui
/* CF30C 001CF20C 00000000 */   nop
/* CF310 001CF210 2A00013C */  lui        $at, (0x2A22E9 >> 16)
/* CF314 001CF214 E92222A0 */  sb         $2, (0x2A22E9 & 0xFFFF)($at)
/* CF318 001CF218 D701023C */  lui        $2, %hi(D_1D6B634)
/* CF31C 001CF21C 34B64224 */  addiu      $2, $2, %lo(D_1D6B634)
/* CF320 001CF220 21105000 */  addu       $2, $2, $16
/* CF324 001CF224 00004CC4 */  lwc1       $f12, 0x0($2)
/* CF328 001CF228 5044040C */  jal        fptoui
/* CF32C 001CF22C 00000000 */   nop
/* CF330 001CF230 2A00013C */  lui        $at, (0x2A22EA >> 16)
/* CF334 001CF234 EA2222A0 */  sb         $2, (0x2A22EA & 0xFFFF)($at)
/* CF338 001CF238 01000224 */  addiu      $2, $0, 0x1
/* CF33C 001CF23C 9C01A2A3 */  sb         $2, 0x19C($sp)
.L001CF240:
/* CF340 001CF240 2800013C */  lui        $at, (0x280000 >> 16)
/* CF344 001CF244 B8A1348C */  lw         $20, -0x5E48($at)
/* CF348 001CF248 06A30046 */  mov.s      $f12, $f20
/* CF34C 001CF24C 2C44040C */  jal        fptosi
/* CF350 001CF250 00000000 */   nop
/* CF354 001CF254 0B008216 */  bne        $20, $2, .L001CF284
/* CF358 001CF258 00000000 */   nop
/* CF35C 001CF25C C0101300 */  sll        $2, $19, 3
/* CF360 001CF260 21105300 */  addu       $2, $2, $19
/* CF364 001CF264 80180200 */  sll        $3, $2, 2
/* CF368 001CF268 D601023C */  lui        $2, %hi(argStrBuff)
/* CF36C 001CF26C 205C4224 */  addiu      $2, $2, %lo(argStrBuff)
/* CF370 001CF270 21284300 */  addu       $5, $2, $3
/* CF374 001CF274 D801023C */  lui        $2, %hi(pathName)
/* CF378 001CF278 201E4424 */  addiu      $4, $2, %lo(pathName)
/* CF37C 001CF27C 5A15040C */  jal        strcpy
/* CF380 001CF280 00000000 */   nop
.L001CF284:
/* CF384 001CF284 2800013C */  lui        $at, (0x280000 >> 16)
/* CF388 001CF288 C8A1348C */  lw         $20, -0x5E38($at)
/* CF38C 001CF28C 00002CC6 */  lwc1       $f12, 0x0($17)
/* CF390 001CF290 2C44040C */  jal        fptosi
/* CF394 001CF294 00000000 */   nop
/* CF398 001CF298 07008216 */  bne        $20, $2, .L001CF2B8
/* CF39C 001CF29C 00000000 */   nop
/* CF3A0 001CF2A0 D701023C */  lui        $2, %hi(D_1D6B624)
/* CF3A4 001CF2A4 24B64224 */  addiu      $2, $2, %lo(D_1D6B624)
/* CF3A8 001CF2A8 21105000 */  addu       $2, $2, $16
/* CF3AC 001CF2AC 000040C4 */  lwc1       $f0, 0x0($2)
/* CF3B0 001CF2B0 C89C828F */  lw         $2, -0x6338($gp)
/* CF3B4 001CF2B4 B00340E4 */  swc1       $f0, 0x3B0($2)
.L001CF2B8:
/* CF3B8 001CF2B8 2800013C */  lui        $at, (0x280000 >> 16)
/* CF3BC 001CF2BC 70A3348C */  lw         $20, -0x5C90($at)
/* CF3C0 001CF2C0 00002CC6 */  lwc1       $f12, 0x0($17)
/* CF3C4 001CF2C4 2C44040C */  jal        fptosi
/* CF3C8 001CF2C8 00000000 */   nop
/* CF3CC 001CF2CC 27008216 */  bne        $20, $2, .L001CF36C
/* CF3D0 001CF2D0 00000000 */   nop
/* CF3D4 001CF2D4 C0101300 */  sll        $2, $19, 3
/* CF3D8 001CF2D8 21105300 */  addu       $2, $2, $19
/* CF3DC 001CF2DC 80180200 */  sll        $3, $2, 2
/* CF3E0 001CF2E0 D601023C */  lui        $2, %hi(argStrBuff)
/* CF3E4 001CF2E4 205C4224 */  addiu      $2, $2, %lo(argStrBuff)
/* CF3E8 001CF2E8 21284300 */  addu       $5, $2, $3
/* CF3EC 001CF2EC 28264072 */  paddub     $4, $18, $0
/* CF3F0 001CF2F0 8803A627 */  addiu      $6, $sp, 0x388
/* CF3F4 001CF2F4 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* CF3F8 001CF2F8 00000000 */   nop
/* CF3FC 001CF2FC 28A64070 */  paddub     $20, $2, $0
/* CF400 001CF300 06008016 */  bnez       $20, .L001CF31C
/* CF404 001CF304 00000000 */   nop
/* CF408 001CF308 2A00023C */  lui        $2, %hi(_1150_2)
/* CF40C 001CF30C E0C24424 */  addiu      $4, $2, %lo(_1150_2)
/* CF410 001CF310 F001A527 */  addiu      $5, $sp, 0x1F0
/* CF414 001CF314 A611040C */  jal        printf
/* CF418 001CF318 00000000 */   nop
.L001CF31C:
/* CF41C 001CF31C 28268072 */  paddub     $4, $20, $0
/* CF420 001CF320 F001023C */  lui        $2, %hi(D_1F06650)
/* CF424 001CF324 50664524 */  addiu      $5, $2, %lo(D_1F06650)
/* CF428 001CF328 28360070 */  paddub     $6, $0, $0
/* CF42C 001CF32C 283E0070 */  paddub     $7, $0, $0
/* CF430 001CF330 28460070 */  paddub     $8, $0, $0
/* CF434 001CF334 AC98040C */  jal        LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* CF438 001CF338 00000000 */   nop
/* CF43C 001CF33C 28A64070 */  paddub     $20, $2, $0
/* CF440 001CF340 C89C838F */  lw         $3, -0x6338($gp)
/* CF444 001CF344 B403628C */  lw         $2, 0x3B4($3)
/* CF448 001CF348 06004128 */  slti       $at, $2, 0x6
/* CF44C 001CF34C 07002010 */  beqz       $at, .L001CF36C
/* CF450 001CF350 00000000 */   nop
/* CF454 001CF354 80100200 */  sll        $2, $2, 2
/* CF458 001CF358 21104300 */  addu       $2, $2, $3
/* CF45C 001CF35C 780454AC */  sw         $20, 0x478($2)
/* CF460 001CF360 B403628C */  lw         $2, 0x3B4($3)
/* CF464 001CF364 01004224 */  addiu      $2, $2, 0x1
/* CF468 001CF368 B40362AC */  sw         $2, 0x3B4($3)
.L001CF36C:
/* CF46C 001CF36C 2800013C */  lui        $at, (0x280000 >> 16)
/* CF470 001CF370 B0A3348C */  lw         $20, -0x5C50($at)
/* CF474 001CF374 00002CC6 */  lwc1       $f12, 0x0($17)
/* CF478 001CF378 2C44040C */  jal        fptosi
/* CF47C 001CF37C 00000000 */   nop
/* CF480 001CF380 25008216 */  bne        $20, $2, .L001CF418
/* CF484 001CF384 00000000 */   nop
/* CF488 001CF388 C0101300 */  sll        $2, $19, 3
/* CF48C 001CF38C 21105300 */  addu       $2, $2, $19
/* CF490 001CF390 80180200 */  sll        $3, $2, 2
/* CF494 001CF394 D601023C */  lui        $2, %hi(argStrBuff)
/* CF498 001CF398 205C4224 */  addiu      $2, $2, %lo(argStrBuff)
/* CF49C 001CF39C 21A04300 */  addu       $20, $2, $3
/* CF4A0 001CF3A0 C89C848F */  lw         $4, -0x6338($gp)
/* CF4A4 001CF3A4 282E8072 */  paddub     $5, $20, $0
/* CF4A8 001CF3A8 CC08070C */  jal        GetFrameSearch__11CDungeonMapFPc
/* CF4AC 001CF3AC 00000000 */   nop
/* CF4B0 001CF3B0 28BE4070 */  paddub     $23, $2, $0
/* CF4B4 001CF3B4 0800E016 */  bnez       $23, .L001CF3D8
/* CF4B8 001CF3B8 00000000 */   nop
/* CF4BC 001CF3BC 2A00023C */  lui        $2, %hi(_1151_2)
/* CF4C0 001CF3C0 F0C24424 */  addiu      $4, $2, %lo(_1151_2)
/* CF4C4 001CF3C4 282E8072 */  paddub     $5, $20, $0
/* CF4C8 001CF3C8 A611040C */  jal        printf
/* CF4CC 001CF3CC 00000000 */   nop
.L001CF3D0:
/* CF4D0 001CF3D0 FFFF0010 */  b          .L001CF3D0
/* CF4D4 001CF3D4 00000000 */   nop
.L001CF3D8:
/* CF4D8 001CF3D8 D701023C */  lui        $2, %hi(D_1D6B628)
/* CF4DC 001CF3DC 28B64224 */  addiu      $2, $2, %lo(D_1D6B628)
/* CF4E0 001CF3E0 21105000 */  addu       $2, $2, $16
/* CF4E4 001CF3E4 000054C4 */  lwc1       $f20, 0x0($2)
/* CF4E8 001CF3E8 06A30046 */  mov.s      $f12, $f20
/* CF4EC 001CF3EC 2C44040C */  jal        fptosi
/* CF4F0 001CF3F0 00000000 */   nop
/* CF4F4 001CF3F4 02001424 */  addiu      $20, $0, 0x2
/* CF4F8 001CF3F8 06A30046 */  mov.s      $f12, $f20
/* CF4FC 001CF3FC 2C44040C */  jal        fptosi
/* CF500 001CF400 00000000 */   nop
/* CF504 001CF404 02004010 */  beqz       $2, .L001CF410
/* CF508 001CF408 00000000 */   nop
/* CF50C 001CF40C 01001424 */  addiu      $20, $0, 0x1
.L001CF410:
/* CF510 001CF410 B000F4A6 */  sh         $20, 0xB0($23)
/* CF514 001CF414 0000F4AE */  sw         $20, 0x0($23)
.L001CF418:
/* CF518 001CF418 2800013C */  lui        $at, (0x280000 >> 16)
/* CF51C 001CF41C 80A3348C */  lw         $20, -0x5C80($at)
/* CF520 001CF420 00002CC6 */  lwc1       $f12, 0x0($17)
/* CF524 001CF424 2C44040C */  jal        fptosi
/* CF528 001CF428 00000000 */   nop
/* CF52C 001CF42C 31008216 */  bne        $20, $2, .L001CF4F4
/* CF530 001CF430 00000000 */   nop
/* CF534 001CF434 C0101300 */  sll        $2, $19, 3
/* CF538 001CF438 21105300 */  addu       $2, $2, $19
/* CF53C 001CF43C 80180200 */  sll        $3, $2, 2
/* CF540 001CF440 D601023C */  lui        $2, %hi(argStrBuff)
/* CF544 001CF444 205C4224 */  addiu      $2, $2, %lo(argStrBuff)
/* CF548 001CF448 21284300 */  addu       $5, $2, $3
/* CF54C 001CF44C 28264072 */  paddub     $4, $18, $0
/* CF550 001CF450 8803A627 */  addiu      $6, $sp, 0x388
/* CF554 001CF454 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* CF558 001CF458 00000000 */   nop
/* CF55C 001CF45C 28A64070 */  paddub     $20, $2, $0
/* CF560 001CF460 06008016 */  bnez       $20, .L001CF47C
/* CF564 001CF464 00000000 */   nop
/* CF568 001CF468 2A00023C */  lui        $2, %hi(_1150_2)
/* CF56C 001CF46C E0C24424 */  addiu      $4, $2, %lo(_1150_2)
/* CF570 001CF470 F001A527 */  addiu      $5, $sp, 0x1F0
/* CF574 001CF474 A611040C */  jal        printf
/* CF578 001CF478 00000000 */   nop
.L001CF47C:
/* CF57C 001CF47C 28268072 */  paddub     $4, $20, $0
/* CF580 001CF480 F001023C */  lui        $2, %hi(D_1F06650)
/* CF584 001CF484 50664524 */  addiu      $5, $2, %lo(D_1F06650)
/* CF588 001CF488 28360070 */  paddub     $6, $0, $0
/* CF58C 001CF48C 283E0070 */  paddub     $7, $0, $0
/* CF590 001CF490 28460070 */  paddub     $8, $0, $0
/* CF594 001CF494 AC98040C */  jal        LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* CF598 001CF498 00000000 */   nop
/* CF59C 001CF49C 28A64070 */  paddub     $20, $2, $0
/* CF5A0 001CF4A0 28268072 */  paddub     $4, $20, $0
/* CF5A4 001CF4A4 9001A527 */  addiu      $5, $sp, 0x190
/* CF5A8 001CF4A8 01000624 */  addiu      $6, $0, 0x1
/* CF5AC 001CF4AC 40000724 */  addiu      $7, $0, 0x40
/* CF5B0 001CF4B0 D4A2040C */  jal        SetAttr__6CFrameFR10CFrameAttrii
/* CF5B4 001CF4B4 00000000 */   nop
/* CF5B8 001CF4B8 28268072 */  paddub     $4, $20, $0
/* CF5BC 001CF4BC 01000524 */  addiu      $5, $0, 0x1
/* CF5C0 001CF4C0 BC97040C */  jal        SetFrameAttr__FP6CFramei
/* CF5C4 001CF4C4 00000000 */   nop
/* CF5C8 001CF4C8 C89C838F */  lw         $3, -0x6338($gp)
/* CF5CC 001CF4CC B803628C */  lw         $2, 0x3B8($3)
/* CF5D0 001CF4D0 03004128 */  slti       $at, $2, 0x3
/* CF5D4 001CF4D4 07002010 */  beqz       $at, .L001CF4F4
/* CF5D8 001CF4D8 00000000 */   nop
/* CF5DC 001CF4DC 80100200 */  sll        $2, $2, 2
/* CF5E0 001CF4E0 21104300 */  addu       $2, $2, $3
/* CF5E4 001CF4E4 6C0454AC */  sw         $20, 0x46C($2)
/* CF5E8 001CF4E8 B803628C */  lw         $2, 0x3B8($3)
/* CF5EC 001CF4EC 01004224 */  addiu      $2, $2, 0x1
/* CF5F0 001CF4F0 B80362AC */  sw         $2, 0x3B8($3)
.L001CF4F4:
/* CF5F4 001CF4F4 2800013C */  lui        $at, (0x280000 >> 16)
/* CF5F8 001CF4F8 D8A1348C */  lw         $20, -0x5E28($at)
/* CF5FC 001CF4FC 00002CC6 */  lwc1       $f12, 0x0($17)
/* CF600 001CF500 2C44040C */  jal        fptosi
/* CF604 001CF504 00000000 */   nop
/* CF608 001CF508 1F008216 */  bne        $20, $2, .L001CF588
/* CF60C 001CF50C 00000000 */   nop
/* CF610 001CF510 C0101300 */  sll        $2, $19, 3
/* CF614 001CF514 21105300 */  addu       $2, $2, $19
/* CF618 001CF518 80180200 */  sll        $3, $2, 2
/* CF61C 001CF51C D601023C */  lui        $2, %hi(argStrBuff)
/* CF620 001CF520 205C4224 */  addiu      $2, $2, %lo(argStrBuff)
/* CF624 001CF524 21B84300 */  addu       $23, $2, $3
/* CF628 001CF528 28264072 */  paddub     $4, $18, $0
/* CF62C 001CF52C 282EE072 */  paddub     $5, $23, $0
/* CF630 001CF530 8803A627 */  addiu      $6, $sp, 0x388
/* CF634 001CF534 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* CF638 001CF538 00000000 */   nop
/* CF63C 001CF53C 28A64070 */  paddub     $20, $2, $0
/* CF640 001CF540 06008016 */  bnez       $20, .L001CF55C
/* CF644 001CF544 00000000 */   nop
/* CF648 001CF548 2A00023C */  lui        $2, %hi(_1150_2)
/* CF64C 001CF54C E0C24424 */  addiu      $4, $2, %lo(_1150_2)
/* CF650 001CF550 F001A527 */  addiu      $5, $sp, 0x1F0
/* CF654 001CF554 A611040C */  jal        printf
/* CF658 001CF558 00000000 */   nop
.L001CF55C:
/* CF65C 001CF55C 2A00023C */  lui        $2, %hi(_1152_2)
/* CF660 001CF560 10C34424 */  addiu      $4, $2, %lo(_1152_2)
/* CF664 001CF564 282EE072 */  paddub     $5, $23, $0
/* CF668 001CF568 A611040C */  jal        printf
/* CF66C 001CF56C 00000000 */   nop
/* CF670 001CF570 CC9C848F */  lw         $4, -0x6334($gp)
/* CF674 001CF574 282E8072 */  paddub     $5, $20, $0
/* CF678 001CF578 F001023C */  lui        $2, %hi(D_1F06650)
/* CF67C 001CF57C 50664624 */  addiu      $6, $2, %lo(D_1F06650)
/* CF680 001CF580 F034070C */  jal        LoadModel__13CDranMapFieldFPUiP14CDataAlloc2_1_
/* CF684 001CF584 00000000 */   nop
.L001CF588:
/* CF688 001CF588 2800013C */  lui        $at, (0x280000 >> 16)
/* CF68C 001CF58C E8A1348C */  lw         $20, -0x5E18($at)
/* CF690 001CF590 00002CC6 */  lwc1       $f12, 0x0($17)
/* CF694 001CF594 2C44040C */  jal        fptosi
/* CF698 001CF598 00000000 */   nop
/* CF69C 001CF59C 19008216 */  bne        $20, $2, .L001CF604
/* CF6A0 001CF5A0 00000000 */   nop
/* CF6A4 001CF5A4 C0101300 */  sll        $2, $19, 3
/* CF6A8 001CF5A8 21105300 */  addu       $2, $2, $19
/* CF6AC 001CF5AC 80180200 */  sll        $3, $2, 2
/* CF6B0 001CF5B0 D601023C */  lui        $2, %hi(argStrBuff)
/* CF6B4 001CF5B4 205C4224 */  addiu      $2, $2, %lo(argStrBuff)
/* CF6B8 001CF5B8 21284300 */  addu       $5, $2, $3
/* CF6BC 001CF5BC 28264072 */  paddub     $4, $18, $0
/* CF6C0 001CF5C0 8803A627 */  addiu      $6, $sp, 0x388
/* CF6C4 001CF5C4 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* CF6C8 001CF5C8 00000000 */   nop
/* CF6CC 001CF5CC 28A64070 */  paddub     $20, $2, $0
/* CF6D0 001CF5D0 06008016 */  bnez       $20, .L001CF5EC
/* CF6D4 001CF5D4 00000000 */   nop
/* CF6D8 001CF5D8 2A00023C */  lui        $2, %hi(_1150_2)
/* CF6DC 001CF5DC E0C24424 */  addiu      $4, $2, %lo(_1150_2)
/* CF6E0 001CF5E0 F001A527 */  addiu      $5, $sp, 0x1F0
/* CF6E4 001CF5E4 A611040C */  jal        printf
/* CF6E8 001CF5E8 00000000 */   nop
.L001CF5EC:
/* CF6EC 001CF5EC CC9C848F */  lw         $4, -0x6334($gp)
/* CF6F0 001CF5F0 282E8072 */  paddub     $5, $20, $0
/* CF6F4 001CF5F4 F001023C */  lui        $2, %hi(D_1F06650)
/* CF6F8 001CF5F8 50664624 */  addiu      $6, $2, %lo(D_1F06650)
/* CF6FC 001CF5FC 8435070C */  jal        LoadCollision__13CDranMapFieldFPUiP14CDataAlloc2_1_
/* CF700 001CF600 00000000 */   nop
.L001CF604:
/* CF704 001CF604 E887948F */  lw         $20, -0x7818($gp)
/* CF708 001CF608 000034C6 */  lwc1       $f20, 0x0($17)
/* CF70C 001CF60C 06A30046 */  mov.s      $f12, $f20
/* CF710 001CF610 2C44040C */  jal        fptosi
/* CF714 001CF614 00000000 */   nop
/* CF718 001CF618 02008216 */  bne        $20, $2, .L001CF624
/* CF71C 001CF61C 00000000 */   nop
/* CF720 001CF620 C000A0AF */  sw         $0, 0xC0($sp)
.L001CF624:
/* CF724 001CF624 F087948F */  lw         $20, -0x7810($gp)
/* CF728 001CF628 06A30046 */  mov.s      $f12, $f20
/* CF72C 001CF62C 2C44040C */  jal        fptosi
/* CF730 001CF630 00000000 */   nop
/* CF734 001CF634 0E008216 */  bne        $20, $2, .L001CF670
/* CF738 001CF638 00000000 */   nop
/* CF73C 001CF63C 1494828F */  lw         $2, -0x6BEC($gp)
/* CF740 001CF640 01004224 */  addiu      $2, $2, 0x1
/* CF744 001CF644 149482AF */  sw         $2, -0x6BEC($gp)
/* CF748 001CF648 1494828F */  lw         $2, -0x6BEC($gp)
/* CF74C 001CF64C 48004228 */  slti       $2, $2, 0x48
/* CF750 001CF650 07004014 */  bnez       $2, .L001CF670
/* CF754 001CF654 00000000 */   nop
/* CF758 001CF658 2A00023C */  lui        $2, %hi(_1153_2)
/* CF75C 001CF65C 20C34424 */  addiu      $4, $2, %lo(_1153_2)
/* CF760 001CF660 A611040C */  jal        printf
/* CF764 001CF664 00000000 */   nop
.L001CF668:
/* CF768 001CF668 FFFF0010 */  b          .L001CF668
/* CF76C 001CF66C 00000000 */   nop
.L001CF670:
/* CF770 001CF670 2800013C */  lui        $at, (0x280000 >> 16)
/* CF774 001CF674 B0A2348C */  lw         $20, -0x5D50($at)
/* CF778 001CF678 06A30046 */  mov.s      $f12, $f20
/* CF77C 001CF67C 2C44040C */  jal        fptosi
/* CF780 001CF680 00000000 */   nop
/* CF784 001CF684 CF008216 */  bne        $20, $2, .L001CF9C4
/* CF788 001CF688 00000000 */   nop
/* CF78C 001CF68C C000A28F */  lw         $2, 0xC0($sp)
/* CF790 001CF690 06004228 */  slti       $2, $2, 0x6
/* CF794 001CF694 08004014 */  bnez       $2, .L001CF6B8
/* CF798 001CF698 00000000 */   nop
/* CF79C 001CF69C 2A00023C */  lui        $2, %hi(_1154_2)
/* CF7A0 001CF6A0 30C34424 */  addiu      $4, $2, %lo(_1154_2)
/* CF7A4 001CF6A4 1494858F */  lw         $5, -0x6BEC($gp)
/* CF7A8 001CF6A8 A611040C */  jal        printf
/* CF7AC 001CF6AC 00000000 */   nop
.L001CF6B0:
/* CF7B0 001CF6B0 FFFF0010 */  b          .L001CF6B0
/* CF7B4 001CF6B4 00000000 */   nop
.L001CF6B8:
/* CF7B8 001CF6B8 1C94858F */  lw         $5, -0x6BE4($gp)
/* CF7BC 001CF6BC 4800A228 */  slti       $2, $5, 0x48
/* CF7C0 001CF6C0 07004014 */  bnez       $2, .L001CF6E0
/* CF7C4 001CF6C4 00000000 */   nop
/* CF7C8 001CF6C8 2A00023C */  lui        $2, %hi(_1155_2)
/* CF7CC 001CF6CC 50C34424 */  addiu      $4, $2, %lo(_1155_2)
/* CF7D0 001CF6D0 A611040C */  jal        printf
/* CF7D4 001CF6D4 00000000 */   nop
.L001CF6D8:
/* CF7D8 001CF6D8 FFFF0010 */  b          .L001CF6D8
/* CF7DC 001CF6DC 00000000 */   nop
.L001CF6E0:
/* CF7E0 001CF6E0 F001A427 */  addiu      $4, $sp, 0x1F0
/* CF7E4 001CF6E4 D801023C */  lui        $2, %hi(pathName)
/* CF7E8 001CF6E8 201E4524 */  addiu      $5, $2, %lo(pathName)
/* CF7EC 001CF6EC 5A15040C */  jal        strcpy
/* CF7F0 001CF6F0 00000000 */   nop
/* CF7F4 001CF6F4 C0101300 */  sll        $2, $19, 3
/* CF7F8 001CF6F8 21105300 */  addu       $2, $2, $19
/* CF7FC 001CF6FC 80180200 */  sll        $3, $2, 2
/* CF800 001CF700 D601023C */  lui        $2, %hi(argStrBuff)
/* CF804 001CF704 205C4224 */  addiu      $2, $2, %lo(argStrBuff)
/* CF808 001CF708 21284300 */  addu       $5, $2, $3
/* CF80C 001CF70C F001A427 */  addiu      $4, $sp, 0x1F0
/* CF810 001CF710 BC14040C */  jal        strcat
/* CF814 001CF714 00000000 */   nop
/* CF818 001CF718 FFFF1624 */  addiu      $22, $0, -0x1
/* CF81C 001CF71C 28A60070 */  paddub     $20, $0, $0
/* CF820 001CF720 0C000010 */  b          .L001CF754
/* CF824 001CF724 00000000 */   nop
.L001CF728:
/* CF828 001CF728 80191400 */  sll        $3, $20, 6
/* CF82C 001CF72C D801023C */  lui        $2, %hi(filePathList)
/* CF830 001CF730 203A4224 */  addiu      $2, $2, %lo(filePathList)
/* CF834 001CF734 21204300 */  addu       $4, $2, $3
/* CF838 001CF738 F001A527 */  addiu      $5, $sp, 0x1F0
/* CF83C 001CF73C 0815040C */  jal        strcmp
/* CF840 001CF740 00000000 */   nop
/* CF844 001CF744 02004014 */  bnez       $2, .L001CF750
/* CF848 001CF748 00000000 */   nop
/* CF84C 001CF74C 28B68072 */  paddub     $22, $20, $0
.L001CF750:
/* CF850 001CF750 01009426 */  addiu      $20, $20, 0x1
.L001CF754:
/* CF854 001CF754 1C94828F */  lw         $2, -0x6BE4($gp)
/* CF858 001CF758 2A108202 */  slt        $2, $20, $2
/* CF85C 001CF75C F2FF4014 */  bnez       $2, .L001CF728
/* CF860 001CF760 00000000 */   nop
/* CF864 001CF764 FFFF0224 */  addiu      $2, $0, -0x1
/* CF868 001CF768 0800C212 */  beq        $22, $2, .L001CF78C
/* CF86C 001CF76C 00000000 */   nop
/* CF870 001CF770 80181600 */  sll        $3, $22, 2
/* CF874 001CF774 D801023C */  lui        $2, %hi(frameList)
/* CF878 001CF778 204C4224 */  addiu      $2, $2, %lo(frameList)
/* CF87C 001CF77C 21104300 */  addu       $2, $2, $3
/* CF880 001CF780 0000568C */  lw         $22, 0x0($2)
/* CF884 001CF784 51000010 */  b          .L001CF8CC
/* CF888 001CF788 00000000 */   nop
.L001CF78C:
/* CF88C 001CF78C 2C01A28F */  lw         $2, 0x12C($sp)
/* CF890 001CF790 09004010 */  beqz       $2, .L001CF7B8
/* CF894 001CF794 00000000 */   nop
/* CF898 001CF798 2A00023C */  lui        $2, %hi(_1156_2)
/* CF89C 001CF79C 68C34424 */  addiu      $4, $2, %lo(_1156_2)
/* CF8A0 001CF7A0 F001A527 */  addiu      $5, $sp, 0x1F0
/* CF8A4 001CF7A4 A611040C */  jal        printf
/* CF8A8 001CF7A8 00000000 */   nop
/* CF8AC 001CF7AC FFFF0424 */  addiu      $4, $0, -0x1
/* CF8B0 001CF7B0 DC05040C */  jal        exit_2
/* CF8B4 001CF7B4 00000000 */   nop
.L001CF7B8:
/* CF8B8 001CF7B8 19004012 */  beqz       $18, .L001CF820
/* CF8BC 001CF7BC 00000000 */   nop
/* CF8C0 001CF7C0 28264072 */  paddub     $4, $18, $0
/* CF8C4 001CF7C4 F001A527 */  addiu      $5, $sp, 0x1F0
/* CF8C8 001CF7C8 8803A627 */  addiu      $6, $sp, 0x388
/* CF8CC 001CF7CC C8FD040C */  jal        GetPackFile__FPUiPcPi
/* CF8D0 001CF7D0 00000000 */   nop
/* CF8D4 001CF7D4 28A64070 */  paddub     $20, $2, $0
/* CF8D8 001CF7D8 06008016 */  bnez       $20, .L001CF7F4
/* CF8DC 001CF7DC 00000000 */   nop
/* CF8E0 001CF7E0 2A00023C */  lui        $2, %hi(_1150_2)
/* CF8E4 001CF7E4 E0C24424 */  addiu      $4, $2, %lo(_1150_2)
/* CF8E8 001CF7E8 F001A527 */  addiu      $5, $sp, 0x1F0
/* CF8EC 001CF7EC A611040C */  jal        printf
/* CF8F0 001CF7F0 00000000 */   nop
.L001CF7F4:
/* CF8F4 001CF7F4 28268072 */  paddub     $4, $20, $0
/* CF8F8 001CF7F8 F001023C */  lui        $2, %hi(D_1F06650)
/* CF8FC 001CF7FC 50664524 */  addiu      $5, $2, %lo(D_1F06650)
/* CF900 001CF800 28360070 */  paddub     $6, $0, $0
/* CF904 001CF804 283E0070 */  paddub     $7, $0, $0
/* CF908 001CF808 28460070 */  paddub     $8, $0, $0
/* CF90C 001CF80C AC98040C */  jal        LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* CF910 001CF810 00000000 */   nop
/* CF914 001CF814 28B64070 */  paddub     $22, $2, $0
/* CF918 001CF818 11000010 */  b          .L001CF860
/* CF91C 001CF81C 00000000 */   nop
.L001CF820:
/* CF920 001CF820 948B858F */  lw         $5, -0x746C($gp)
/* CF924 001CF824 F001A427 */  addiu      $4, $sp, 0x1F0
/* CF928 001CF828 28360070 */  paddub     $6, $0, $0
/* CF92C 001CF82C D8FC040C */  jal        LoadFile__FPcPvPi
/* CF930 001CF830 00000000 */   nop
/* CF934 001CF834 DC4F050C */  jal        wait_now_loading_vsync__Fv
/* CF938 001CF838 00000000 */   nop
/* CF93C 001CF83C 948B848F */  lw         $4, -0x746C($gp)
/* CF940 001CF840 F001023C */  lui        $2, %hi(D_1F06650)
/* CF944 001CF844 50664524 */  addiu      $5, $2, %lo(D_1F06650)
/* CF948 001CF848 28360070 */  paddub     $6, $0, $0
/* CF94C 001CF84C 283E0070 */  paddub     $7, $0, $0
/* CF950 001CF850 28460070 */  paddub     $8, $0, $0
/* CF954 001CF854 AC98040C */  jal        LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* CF958 001CF858 00000000 */   nop
/* CF95C 001CF85C 28B64070 */  paddub     $22, $2, $0
.L001CF860:
/* CF960 001CF860 2826C072 */  paddub     $4, $22, $0
/* CF964 001CF864 9001A527 */  addiu      $5, $sp, 0x190
/* CF968 001CF868 01000624 */  addiu      $6, $0, 0x1
/* CF96C 001CF86C 40000724 */  addiu      $7, $0, 0x40
/* CF970 001CF870 D4A2040C */  jal        SetAttr__6CFrameFR10CFrameAttrii
/* CF974 001CF874 00000000 */   nop
/* CF978 001CF878 2826C072 */  paddub     $4, $22, $0
/* CF97C 001CF87C 01000524 */  addiu      $5, $0, 0x1
/* CF980 001CF880 BC97040C */  jal        SetFrameAttr__FP6CFramei
/* CF984 001CF884 00000000 */   nop
/* CF988 001CF888 1C94828F */  lw         $2, -0x6BE4($gp)
/* CF98C 001CF88C 80190200 */  sll        $3, $2, 6
/* CF990 001CF890 D801023C */  lui        $2, %hi(filePathList)
/* CF994 001CF894 203A4224 */  addiu      $2, $2, %lo(filePathList)
/* CF998 001CF898 21204300 */  addu       $4, $2, $3
/* CF99C 001CF89C F001A527 */  addiu      $5, $sp, 0x1F0
/* CF9A0 001CF8A0 5A15040C */  jal        strcpy
/* CF9A4 001CF8A4 00000000 */   nop
/* CF9A8 001CF8A8 1C94828F */  lw         $2, -0x6BE4($gp)
/* CF9AC 001CF8AC 80180200 */  sll        $3, $2, 2
/* CF9B0 001CF8B0 D801023C */  lui        $2, %hi(frameList)
/* CF9B4 001CF8B4 204C4224 */  addiu      $2, $2, %lo(frameList)
/* CF9B8 001CF8B8 21104300 */  addu       $2, $2, $3
/* CF9BC 001CF8BC 000056AC */  sw         $22, 0x0($2)
/* CF9C0 001CF8C0 1C94828F */  lw         $2, -0x6BE4($gp)
/* CF9C4 001CF8C4 01004224 */  addiu      $2, $2, 0x1
/* CF9C8 001CF8C8 1C9482AF */  sw         $2, -0x6BE4($gp)
.L001CF8CC:
/* CF9CC 001CF8CC D701023C */  lui        $2, %hi(D_1D6B638)
/* CF9D0 001CF8D0 38B64224 */  addiu      $2, $2, %lo(D_1D6B638)
/* CF9D4 001CF8D4 21105000 */  addu       $2, $2, $16
/* CF9D8 001CF8D8 00004CC4 */  lwc1       $f12, 0x0($2)
/* CF9DC 001CF8DC 2C44040C */  jal        fptosi
/* CF9E0 001CF8E0 00000000 */   nop
/* CF9E4 001CF8E4 28A64070 */  paddub     $20, $2, $0
/* CF9E8 001CF8E8 D701023C */  lui        $2, %hi(D_1D6B634)
/* CF9EC 001CF8EC 34B64224 */  addiu      $2, $2, %lo(D_1D6B634)
/* CF9F0 001CF8F0 21105000 */  addu       $2, $2, $16
/* CF9F4 001CF8F4 000056C4 */  lwc1       $f22, 0x0($2)
/* CF9F8 001CF8F8 D701023C */  lui        $2, %hi(D_1D6B630)
/* CF9FC 001CF8FC 30B64224 */  addiu      $2, $2, %lo(D_1D6B630)
/* CFA00 001CF900 21105000 */  addu       $2, $2, $16
/* CFA04 001CF904 000055C4 */  lwc1       $f21, 0x0($2)
/* CFA08 001CF908 D701023C */  lui        $2, %hi(D_1D6B62C)
/* CFA0C 001CF90C 2CB64224 */  addiu      $2, $2, %lo(D_1D6B62C)
/* CFA10 001CF910 21105000 */  addu       $2, $2, $16
/* CFA14 001CF914 000054C4 */  lwc1       $f20, 0x0($2)
/* CFA18 001CF918 D701023C */  lui        $2, %hi(D_1D6B628)
/* CFA1C 001CF91C 28B64224 */  addiu      $2, $2, %lo(D_1D6B628)
/* CFA20 001CF920 21105000 */  addu       $2, $2, $16
/* CFA24 001CF924 00004CC4 */  lwc1       $f12, 0x0($2)
/* CFA28 001CF928 2C44040C */  jal        fptosi
/* CFA2C 001CF92C 00000000 */   nop
/* CFA30 001CF930 1494878F */  lw         $7, -0x6BEC($gp)
/* CFA34 001CF934 C89C868F */  lw         $6, -0x6338($gp)
/* CFA38 001CF938 4800E128 */  slti       $at, $7, 0x48
/* CFA3C 001CF93C 1E002010 */  beqz       $at, .L001CF9B8
/* CFA40 001CF940 00000000 */   nop
/* CFA44 001CF944 C0180700 */  sll        $3, $7, 3
/* CFA48 001CF948 23186700 */  subu       $3, $3, $7
/* CFA4C 001CF94C 80180300 */  sll        $3, $3, 2
/* CFA50 001CF950 21186700 */  addu       $3, $3, $7
/* CFA54 001CF954 00190300 */  sll        $3, $3, 4
/* CFA58 001CF958 21406600 */  addu       $8, $3, $6
/* CFA5C 001CF95C C000A38F */  lw         $3, 0xC0($sp)
/* CFA60 001CF960 80180300 */  sll        $3, $3, 2
/* CFA64 001CF964 21386800 */  addu       $7, $3, $8
/* CFA68 001CF968 4006F6AC */  sw         $22, 0x640($7)
/* CFA6C 001CF96C 2041033C */  lui        $3, (0x41200000 >> 16)
/* CFA70 001CF970 00088344 */  mtc1       $3, $f1
/* CFA74 001CF974 00000000 */  nop
/* CFA78 001CF978 02081446 */  mul.s      $f0, $f1, $f20
/* CFA7C 001CF97C C000A38F */  lw         $3, 0xC0($sp)
/* CFA80 001CF980 00190300 */  sll        $3, $3, 4
/* CFA84 001CF984 21306800 */  addu       $6, $3, $8
/* CFA88 001CF988 A005C0E4 */  swc1       $f0, 0x5A0($6)
/* CFA8C 001CF98C 02081546 */  mul.s      $f0, $f1, $f21
/* CFA90 001CF990 A405C0E4 */  swc1       $f0, 0x5A4($6)
/* CFA94 001CF994 02081646 */  mul.s      $f0, $f1, $f22
/* CFA98 001CF998 A805C0E4 */  swc1       $f0, 0x5A8($6)
/* CFA9C 001CF99C 803F033C */  lui        $3, (0x3F800000 >> 16)
/* CFAA0 001CF9A0 AC05C3AC */  sw         $3, 0x5AC($6)
/* CFAA4 001CF9A4 00009444 */  mtc1       $20, $f0
/* CFAA8 001CF9A8 00000000 */  nop
/* CFAAC 001CF9AC 20008046 */  cvt.s.w    $f0, $f0
/* CFAB0 001CF9B0 0006E0E4 */  swc1       $f0, 0x600($7)
/* CFAB4 001CF9B4 900402A5 */  sh         $2, 0x490($8)
.L001CF9B8:
/* CFAB8 001CF9B8 C000A28F */  lw         $2, 0xC0($sp)
/* CFABC 001CF9BC 01004224 */  addiu      $2, $2, 0x1
/* CFAC0 001CF9C0 C000A2AF */  sw         $2, 0xC0($sp)
.L001CF9C4:
/* CFAC4 001CF9C4 2800013C */  lui        $at, (0x280000 >> 16)
/* CFAC8 001CF9C8 D0A2348C */  lw         $20, -0x5D30($at)
/* CFACC 001CF9CC 00002CC6 */  lwc1       $f12, 0x0($17)
/* CFAD0 001CF9D0 2C44040C */  jal        fptosi
/* CFAD4 001CF9D4 00000000 */   nop
/* CFAD8 001CF9D8 93008216 */  bne        $20, $2, .L001CFC28
/* CFADC 001CF9DC 00000000 */   nop
/* CFAE0 001CF9E0 2094858F */  lw         $5, -0x6BE0($gp)
/* CFAE4 001CF9E4 4800A228 */  slti       $2, $5, 0x48
/* CFAE8 001CF9E8 07004014 */  bnez       $2, .L001CFA08
/* CFAEC 001CF9EC 00000000 */   nop
/* CFAF0 001CF9F0 2A00023C */  lui        $2, %hi(_1157)
/* CFAF4 001CF9F4 80C34424 */  addiu      $4, $2, %lo(_1157)
/* CFAF8 001CF9F8 A611040C */  jal        printf
/* CFAFC 001CF9FC 00000000 */   nop
.L001CFA00:
/* CFB00 001CFA00 FFFF0010 */  b          .L001CFA00
/* CFB04 001CFA04 00000000 */   nop
.L001CFA08:
/* CFB08 001CFA08 F001A427 */  addiu      $4, $sp, 0x1F0
/* CFB0C 001CFA0C D801023C */  lui        $2, %hi(pathName)
/* CFB10 001CFA10 201E4524 */  addiu      $5, $2, %lo(pathName)
/* CFB14 001CFA14 5A15040C */  jal        strcpy
/* CFB18 001CFA18 00000000 */   nop
/* CFB1C 001CFA1C C0101300 */  sll        $2, $19, 3
/* CFB20 001CFA20 21105300 */  addu       $2, $2, $19
/* CFB24 001CFA24 80180200 */  sll        $3, $2, 2
/* CFB28 001CFA28 D601023C */  lui        $2, %hi(argStrBuff)
/* CFB2C 001CFA2C 205C4224 */  addiu      $2, $2, %lo(argStrBuff)
/* CFB30 001CFA30 21284300 */  addu       $5, $2, $3
/* CFB34 001CFA34 F001A427 */  addiu      $4, $sp, 0x1F0
/* CFB38 001CFA38 BC14040C */  jal        strcat
/* CFB3C 001CFA3C 00000000 */   nop
/* CFB40 001CFA40 FFFF1524 */  addiu      $21, $0, -0x1
/* CFB44 001CFA44 28A60070 */  paddub     $20, $0, $0
/* CFB48 001CFA48 0C000010 */  b          .L001CFA7C
/* CFB4C 001CFA4C 00000000 */   nop
.L001CFA50:
/* CFB50 001CFA50 80191400 */  sll        $3, $20, 6
/* CFB54 001CFA54 D801023C */  lui        $2, %hi(filePathColList)
/* CFB58 001CFA58 404D4224 */  addiu      $2, $2, %lo(filePathColList)
/* CFB5C 001CFA5C 21204300 */  addu       $4, $2, $3
/* CFB60 001CFA60 F001A527 */  addiu      $5, $sp, 0x1F0
/* CFB64 001CFA64 0815040C */  jal        strcmp
/* CFB68 001CFA68 00000000 */   nop
/* CFB6C 001CFA6C 02004014 */  bnez       $2, .L001CFA78
/* CFB70 001CFA70 00000000 */   nop
/* CFB74 001CFA74 28AE8072 */  paddub     $21, $20, $0
.L001CFA78:
/* CFB78 001CFA78 01009426 */  addiu      $20, $20, 0x1
.L001CFA7C:
/* CFB7C 001CFA7C 2094828F */  lw         $2, -0x6BE0($gp)
/* CFB80 001CFA80 2A108202 */  slt        $2, $20, $2
/* CFB84 001CFA84 F2FF4014 */  bnez       $2, .L001CFA50
/* CFB88 001CFA88 00000000 */   nop
/* CFB8C 001CFA8C FFFF0224 */  addiu      $2, $0, -0x1
/* CFB90 001CFA90 0800A212 */  beq        $21, $2, .L001CFAB4
/* CFB94 001CFA94 00000000 */   nop
/* CFB98 001CFA98 80181500 */  sll        $3, $21, 2
/* CFB9C 001CFA9C D801023C */  lui        $2, %hi(frameListCol)
/* CFBA0 001CFAA0 40714224 */  addiu      $2, $2, %lo(frameListCol)
/* CFBA4 001CFAA4 21104300 */  addu       $2, $2, $3
/* CFBA8 001CFAA8 0000558C */  lw         $21, 0x0($2)
/* CFBAC 001CFAAC 4E000010 */  b          .L001CFBE8
/* CFBB0 001CFAB0 00000000 */   nop
.L001CFAB4:
/* CFBB4 001CFAB4 2C01A28F */  lw         $2, 0x12C($sp)
/* CFBB8 001CFAB8 09004010 */  beqz       $2, .L001CFAE0
/* CFBBC 001CFABC 00000000 */   nop
/* CFBC0 001CFAC0 2A00023C */  lui        $2, %hi(_1158)
/* CFBC4 001CFAC4 A0C34424 */  addiu      $4, $2, %lo(_1158)
/* CFBC8 001CFAC8 F001A527 */  addiu      $5, $sp, 0x1F0
/* CFBCC 001CFACC A611040C */  jal        printf
/* CFBD0 001CFAD0 00000000 */   nop
/* CFBD4 001CFAD4 FFFF0424 */  addiu      $4, $0, -0x1
/* CFBD8 001CFAD8 DC05040C */  jal        exit_2
/* CFBDC 001CFADC 00000000 */   nop
.L001CFAE0:
/* CFBE0 001CFAE0 16004012 */  beqz       $18, .L001CFB3C
/* CFBE4 001CFAE4 00000000 */   nop
/* CFBE8 001CFAE8 28264072 */  paddub     $4, $18, $0
/* CFBEC 001CFAEC F001A527 */  addiu      $5, $sp, 0x1F0
/* CFBF0 001CFAF0 8803A627 */  addiu      $6, $sp, 0x388
/* CFBF4 001CFAF4 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* CFBF8 001CFAF8 00000000 */   nop
/* CFBFC 001CFAFC 28A64070 */  paddub     $20, $2, $0
/* CFC00 001CFB00 06008016 */  bnez       $20, .L001CFB1C
/* CFC04 001CFB04 00000000 */   nop
/* CFC08 001CFB08 2A00023C */  lui        $2, %hi(_1150_2)
/* CFC0C 001CFB0C E0C24424 */  addiu      $4, $2, %lo(_1150_2)
/* CFC10 001CFB10 F001A527 */  addiu      $5, $sp, 0x1F0
/* CFC14 001CFB14 A611040C */  jal        printf
/* CFC18 001CFB18 00000000 */   nop
.L001CFB1C:
/* CFC1C 001CFB1C 28268072 */  paddub     $4, $20, $0
/* CFC20 001CFB20 F001023C */  lui        $2, %hi(D_1F06650)
/* CFC24 001CFB24 50664524 */  addiu      $5, $2, %lo(D_1F06650)
/* CFC28 001CFB28 DC9B040C */  jal        LoadCollisionFile__FPUiP14CDataAlloc2_1_
/* CFC2C 001CFB2C 00000000 */   nop
/* CFC30 001CFB30 28AE4070 */  paddub     $21, $2, $0
/* CFC34 001CFB34 0E000010 */  b          .L001CFB70
/* CFC38 001CFB38 00000000 */   nop
.L001CFB3C:
/* CFC3C 001CFB3C 948B858F */  lw         $5, -0x746C($gp)
/* CFC40 001CFB40 F001A427 */  addiu      $4, $sp, 0x1F0
/* CFC44 001CFB44 28360070 */  paddub     $6, $0, $0
/* CFC48 001CFB48 D8FC040C */  jal        LoadFile__FPcPvPi
/* CFC4C 001CFB4C 00000000 */   nop
/* CFC50 001CFB50 DC4F050C */  jal        wait_now_loading_vsync__Fv
/* CFC54 001CFB54 00000000 */   nop
/* CFC58 001CFB58 948B848F */  lw         $4, -0x746C($gp)
/* CFC5C 001CFB5C F001023C */  lui        $2, %hi(D_1F06650)
/* CFC60 001CFB60 50664524 */  addiu      $5, $2, %lo(D_1F06650)
/* CFC64 001CFB64 DC9B040C */  jal        LoadCollisionFile__FPUiP14CDataAlloc2_1_
/* CFC68 001CFB68 00000000 */   nop
/* CFC6C 001CFB6C 28AE4070 */  paddub     $21, $2, $0
.L001CFB70:
/* CFC70 001CFB70 01000224 */  addiu      $2, $0, 0x1
/* CFC74 001CFB74 0000A2AE */  sw         $2, 0x0($21)
/* CFC78 001CFB78 2826A072 */  paddub     $4, $21, $0
/* CFC7C 001CFB7C 2A00023C */  lui        $2, %hi(_1159_2)
/* CFC80 001CFB80 B8C34524 */  addiu      $5, $2, %lo(_1159_2)
/* CFC84 001CFB84 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* CFC88 001CFB88 00000000 */   nop
/* CFC8C 001CFB8C 05004010 */  beqz       $2, .L001CFBA4
/* CFC90 001CFB90 00000000 */   nop
/* CFC94 001CFB94 2A00023C */  lui        $2, %hi(_1160)
/* CFC98 001CFB98 D0C34424 */  addiu      $4, $2, %lo(_1160)
/* CFC9C 001CFB9C A611040C */  jal        printf
/* CFCA0 001CFBA0 00000000 */   nop
.L001CFBA4:
/* CFCA4 001CFBA4 2094828F */  lw         $2, -0x6BE0($gp)
/* CFCA8 001CFBA8 80190200 */  sll        $3, $2, 6
/* CFCAC 001CFBAC D801023C */  lui        $2, %hi(filePathColList)
/* CFCB0 001CFBB0 404D4224 */  addiu      $2, $2, %lo(filePathColList)
/* CFCB4 001CFBB4 21204300 */  addu       $4, $2, $3
/* CFCB8 001CFBB8 F001A527 */  addiu      $5, $sp, 0x1F0
/* CFCBC 001CFBBC 5A15040C */  jal        strcpy
/* CFCC0 001CFBC0 00000000 */   nop
/* CFCC4 001CFBC4 2094828F */  lw         $2, -0x6BE0($gp)
/* CFCC8 001CFBC8 80180200 */  sll        $3, $2, 2
/* CFCCC 001CFBCC D801023C */  lui        $2, %hi(frameListCol)
/* CFCD0 001CFBD0 40714224 */  addiu      $2, $2, %lo(frameListCol)
/* CFCD4 001CFBD4 21104300 */  addu       $2, $2, $3
/* CFCD8 001CFBD8 000055AC */  sw         $21, 0x0($2)
/* CFCDC 001CFBDC 2094828F */  lw         $2, -0x6BE0($gp)
/* CFCE0 001CFBE0 01004224 */  addiu      $2, $2, 0x1
/* CFCE4 001CFBE4 209482AF */  sw         $2, -0x6BE0($gp)
.L001CFBE8:
/* CFCE8 001CFBE8 D701023C */  lui        $2, %hi(D_1D6B628)
/* CFCEC 001CFBEC 28B64224 */  addiu      $2, $2, %lo(D_1D6B628)
/* CFCF0 001CFBF0 21105000 */  addu       $2, $2, $16
/* CFCF4 001CFBF4 00004CC4 */  lwc1       $f12, 0x0($2)
/* CFCF8 001CFBF8 2C44040C */  jal        fptosi
/* CFCFC 001CFBFC 00000000 */   nop
/* CFD00 001CFC00 1494868F */  lw         $6, -0x6BEC($gp)
/* CFD04 001CFC04 C89C878F */  lw         $7, -0x6338($gp)
/* CFD08 001CFC08 C0180600 */  sll        $3, $6, 3
/* CFD0C 001CFC0C 23186600 */  subu       $3, $3, $6
/* CFD10 001CFC10 80180300 */  sll        $3, $3, 2
/* CFD14 001CFC14 21186600 */  addu       $3, $3, $6
/* CFD18 001CFC18 00190300 */  sll        $3, $3, 4
/* CFD1C 001CFC1C 21186700 */  addu       $3, $3, $7
/* CFD20 001CFC20 9C0475AC */  sw         $21, 0x49C($3)
/* CFD24 001CFC24 A00462A4 */  sh         $2, 0x4A0($3)
.L001CFC28:
/* CFD28 001CFC28 2800013C */  lui        $at, (0x280000 >> 16)
/* CFD2C 001CFC2C E0A2348C */  lw         $20, -0x5D20($at)
/* CFD30 001CFC30 00002CC6 */  lwc1       $f12, 0x0($17)
/* CFD34 001CFC34 2C44040C */  jal        fptosi
/* CFD38 001CFC38 00000000 */   nop
/* CFD3C 001CFC3C 8A008216 */  bne        $20, $2, .L001CFE68
/* CFD40 001CFC40 00000000 */   nop
/* CFD44 001CFC44 2094858F */  lw         $5, -0x6BE0($gp)
/* CFD48 001CFC48 4800A228 */  slti       $2, $5, 0x48
/* CFD4C 001CFC4C 07004014 */  bnez       $2, .L001CFC6C
/* CFD50 001CFC50 00000000 */   nop
/* CFD54 001CFC54 2A00023C */  lui        $2, %hi(_1157)
/* CFD58 001CFC58 80C34424 */  addiu      $4, $2, %lo(_1157)
/* CFD5C 001CFC5C A611040C */  jal        printf
/* CFD60 001CFC60 00000000 */   nop
.L001CFC64:
/* CFD64 001CFC64 FFFF0010 */  b          .L001CFC64
/* CFD68 001CFC68 00000000 */   nop
.L001CFC6C:
/* CFD6C 001CFC6C F001A427 */  addiu      $4, $sp, 0x1F0
/* CFD70 001CFC70 D801023C */  lui        $2, %hi(pathName)
/* CFD74 001CFC74 201E4524 */  addiu      $5, $2, %lo(pathName)
/* CFD78 001CFC78 5A15040C */  jal        strcpy
/* CFD7C 001CFC7C 00000000 */   nop
/* CFD80 001CFC80 C0101300 */  sll        $2, $19, 3
/* CFD84 001CFC84 21105300 */  addu       $2, $2, $19
/* CFD88 001CFC88 80180200 */  sll        $3, $2, 2
/* CFD8C 001CFC8C D601023C */  lui        $2, %hi(argStrBuff)
/* CFD90 001CFC90 205C4224 */  addiu      $2, $2, %lo(argStrBuff)
/* CFD94 001CFC94 21284300 */  addu       $5, $2, $3
/* CFD98 001CFC98 F001A427 */  addiu      $4, $sp, 0x1F0
/* CFD9C 001CFC9C BC14040C */  jal        strcat
/* CFDA0 001CFCA0 00000000 */   nop
/* CFDA4 001CFCA4 FFFF1724 */  addiu      $23, $0, -0x1
/* CFDA8 001CFCA8 28A60070 */  paddub     $20, $0, $0
/* CFDAC 001CFCAC 0C000010 */  b          .L001CFCE0
/* CFDB0 001CFCB0 00000000 */   nop
.L001CFCB4:
/* CFDB4 001CFCB4 80191400 */  sll        $3, $20, 6
/* CFDB8 001CFCB8 D801023C */  lui        $2, %hi(filePathColList)
/* CFDBC 001CFCBC 404D4224 */  addiu      $2, $2, %lo(filePathColList)
/* CFDC0 001CFCC0 21204300 */  addu       $4, $2, $3
/* CFDC4 001CFCC4 F001A527 */  addiu      $5, $sp, 0x1F0
/* CFDC8 001CFCC8 0815040C */  jal        strcmp
/* CFDCC 001CFCCC 00000000 */   nop
/* CFDD0 001CFCD0 02004014 */  bnez       $2, .L001CFCDC
/* CFDD4 001CFCD4 00000000 */   nop
/* CFDD8 001CFCD8 28BE8072 */  paddub     $23, $20, $0
.L001CFCDC:
/* CFDDC 001CFCDC 01009426 */  addiu      $20, $20, 0x1
.L001CFCE0:
/* CFDE0 001CFCE0 2094828F */  lw         $2, -0x6BE0($gp)
/* CFDE4 001CFCE4 2A108202 */  slt        $2, $20, $2
/* CFDE8 001CFCE8 F2FF4014 */  bnez       $2, .L001CFCB4
/* CFDEC 001CFCEC 00000000 */   nop
/* CFDF0 001CFCF0 FFFF0224 */  addiu      $2, $0, -0x1
/* CFDF4 001CFCF4 0800E212 */  beq        $23, $2, .L001CFD18
/* CFDF8 001CFCF8 00000000 */   nop
/* CFDFC 001CFCFC 80181700 */  sll        $3, $23, 2
/* CFE00 001CFD00 D801023C */  lui        $2, %hi(frameListCol)
/* CFE04 001CFD04 40714224 */  addiu      $2, $2, %lo(frameListCol)
/* CFE08 001CFD08 21104300 */  addu       $2, $2, $3
/* CFE0C 001CFD0C 0000548C */  lw         $20, 0x0($2)
/* CFE10 001CFD10 45000010 */  b          .L001CFE28
/* CFE14 001CFD14 00000000 */   nop
.L001CFD18:
/* CFE18 001CFD18 2C01A28F */  lw         $2, 0x12C($sp)
/* CFE1C 001CFD1C 09004010 */  beqz       $2, .L001CFD44
/* CFE20 001CFD20 00000000 */   nop
/* CFE24 001CFD24 2A00023C */  lui        $2, %hi(_1161)
/* CFE28 001CFD28 F0C34424 */  addiu      $4, $2, %lo(_1161)
/* CFE2C 001CFD2C F001A527 */  addiu      $5, $sp, 0x1F0
/* CFE30 001CFD30 A611040C */  jal        printf
/* CFE34 001CFD34 00000000 */   nop
/* CFE38 001CFD38 FFFF0424 */  addiu      $4, $0, -0x1
/* CFE3C 001CFD3C DC05040C */  jal        exit_2
/* CFE40 001CFD40 00000000 */   nop
.L001CFD44:
/* CFE44 001CFD44 18004012 */  beqz       $18, .L001CFDA8
/* CFE48 001CFD48 00000000 */   nop
/* CFE4C 001CFD4C 28264072 */  paddub     $4, $18, $0
/* CFE50 001CFD50 F001A527 */  addiu      $5, $sp, 0x1F0
/* CFE54 001CFD54 8803A627 */  addiu      $6, $sp, 0x388
/* CFE58 001CFD58 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* CFE5C 001CFD5C 00000000 */   nop
/* CFE60 001CFD60 28A64070 */  paddub     $20, $2, $0
/* CFE64 001CFD64 08008016 */  bnez       $20, .L001CFD88
/* CFE68 001CFD68 00000000 */   nop
/* CFE6C 001CFD6C 2A00023C */  lui        $2, %hi(_1150_2)
/* CFE70 001CFD70 E0C24424 */  addiu      $4, $2, %lo(_1150_2)
/* CFE74 001CFD74 F001A527 */  addiu      $5, $sp, 0x1F0
/* CFE78 001CFD78 A611040C */  jal        printf
/* CFE7C 001CFD7C 00000000 */   nop
.L001CFD80:
/* CFE80 001CFD80 FFFF0010 */  b          .L001CFD80
/* CFE84 001CFD84 00000000 */   nop
.L001CFD88:
/* CFE88 001CFD88 28268072 */  paddub     $4, $20, $0
/* CFE8C 001CFD8C F001023C */  lui        $2, %hi(D_1F06650)
/* CFE90 001CFD90 50664524 */  addiu      $5, $2, %lo(D_1F06650)
/* CFE94 001CFD94 DC9B040C */  jal        LoadCollisionFile__FPUiP14CDataAlloc2_1_
/* CFE98 001CFD98 00000000 */   nop
/* CFE9C 001CFD9C 28A64070 */  paddub     $20, $2, $0
/* CFEA0 001CFDA0 0E000010 */  b          .L001CFDDC
/* CFEA4 001CFDA4 00000000 */   nop
.L001CFDA8:
/* CFEA8 001CFDA8 948B858F */  lw         $5, -0x746C($gp)
/* CFEAC 001CFDAC F001A427 */  addiu      $4, $sp, 0x1F0
/* CFEB0 001CFDB0 28360070 */  paddub     $6, $0, $0
/* CFEB4 001CFDB4 D8FC040C */  jal        LoadFile__FPcPvPi
/* CFEB8 001CFDB8 00000000 */   nop
/* CFEBC 001CFDBC DC4F050C */  jal        wait_now_loading_vsync__Fv
/* CFEC0 001CFDC0 00000000 */   nop
/* CFEC4 001CFDC4 948B848F */  lw         $4, -0x746C($gp)
/* CFEC8 001CFDC8 F001023C */  lui        $2, %hi(D_1F06650)
/* CFECC 001CFDCC 50664524 */  addiu      $5, $2, %lo(D_1F06650)
/* CFED0 001CFDD0 DC9B040C */  jal        LoadCollisionFile__FPUiP14CDataAlloc2_1_
/* CFED4 001CFDD4 00000000 */   nop
/* CFED8 001CFDD8 28A64070 */  paddub     $20, $2, $0
.L001CFDDC:
/* CFEDC 001CFDDC 01000224 */  addiu      $2, $0, 0x1
/* CFEE0 001CFDE0 000082AE */  sw         $2, 0x0($20)
/* CFEE4 001CFDE4 2094828F */  lw         $2, -0x6BE0($gp)
/* CFEE8 001CFDE8 80190200 */  sll        $3, $2, 6
/* CFEEC 001CFDEC D801023C */  lui        $2, %hi(filePathColList)
/* CFEF0 001CFDF0 404D4224 */  addiu      $2, $2, %lo(filePathColList)
/* CFEF4 001CFDF4 21204300 */  addu       $4, $2, $3
/* CFEF8 001CFDF8 F001A527 */  addiu      $5, $sp, 0x1F0
/* CFEFC 001CFDFC 5A15040C */  jal        strcpy
/* CFF00 001CFE00 00000000 */   nop
/* CFF04 001CFE04 2094828F */  lw         $2, -0x6BE0($gp)
/* CFF08 001CFE08 80180200 */  sll        $3, $2, 2
/* CFF0C 001CFE0C D801023C */  lui        $2, %hi(frameListCol)
/* CFF10 001CFE10 40714224 */  addiu      $2, $2, %lo(frameListCol)
/* CFF14 001CFE14 21104300 */  addu       $2, $2, $3
/* CFF18 001CFE18 000054AC */  sw         $20, 0x0($2)
/* CFF1C 001CFE1C 2094828F */  lw         $2, -0x6BE0($gp)
/* CFF20 001CFE20 01004224 */  addiu      $2, $2, 0x1
/* CFF24 001CFE24 209482AF */  sw         $2, -0x6BE0($gp)
.L001CFE28:
/* CFF28 001CFE28 D701023C */  lui        $2, %hi(D_1D6B628)
/* CFF2C 001CFE2C 28B64224 */  addiu      $2, $2, %lo(D_1D6B628)
/* CFF30 001CFE30 21105000 */  addu       $2, $2, $16
/* CFF34 001CFE34 00004CC4 */  lwc1       $f12, 0x0($2)
/* CFF38 001CFE38 2C44040C */  jal        fptosi
/* CFF3C 001CFE3C 00000000 */   nop
/* CFF40 001CFE40 1494868F */  lw         $6, -0x6BEC($gp)
/* CFF44 001CFE44 C89C878F */  lw         $7, -0x6338($gp)
/* CFF48 001CFE48 C0180600 */  sll        $3, $6, 3
/* CFF4C 001CFE4C 23186600 */  subu       $3, $3, $6
/* CFF50 001CFE50 80180300 */  sll        $3, $3, 2
/* CFF54 001CFE54 21186600 */  addu       $3, $3, $6
/* CFF58 001CFE58 00190300 */  sll        $3, $3, 4
/* CFF5C 001CFE5C 21186700 */  addu       $3, $3, $7
/* CFF60 001CFE60 940474AC */  sw         $20, 0x494($3)
/* CFF64 001CFE64 980462A4 */  sh         $2, 0x498($3)
.L001CFE68:
/* CFF68 001CFE68 2800013C */  lui        $at, (0x280000 >> 16)
/* CFF6C 001CFE6C A0A3348C */  lw         $20, -0x5C60($at)
/* CFF70 001CFE70 00002CC6 */  lwc1       $f12, 0x0($17)
/* CFF74 001CFE74 2C44040C */  jal        fptosi
/* CFF78 001CFE78 00000000 */   nop
/* CFF7C 001CFE7C 25008216 */  bne        $20, $2, .L001CFF14
/* CFF80 001CFE80 00000000 */   nop
/* CFF84 001CFE84 C0101300 */  sll        $2, $19, 3
/* CFF88 001CFE88 21105300 */  addu       $2, $2, $19
/* CFF8C 001CFE8C 80180200 */  sll        $3, $2, 2
/* CFF90 001CFE90 D601023C */  lui        $2, %hi(argStrBuff)
/* CFF94 001CFE94 205C4224 */  addiu      $2, $2, %lo(argStrBuff)
/* CFF98 001CFE98 21A04300 */  addu       $20, $2, $3
/* CFF9C 001CFE9C 2826C072 */  paddub     $4, $22, $0
/* CFFA0 001CFEA0 282E8072 */  paddub     $5, $20, $0
/* CFFA4 001CFEA4 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* CFFA8 001CFEA8 00000000 */   nop
/* CFFAC 001CFEAC 28BE4070 */  paddub     $23, $2, $0
/* CFFB0 001CFEB0 0800E016 */  bnez       $23, .L001CFED4
/* CFFB4 001CFEB4 00000000 */   nop
/* CFFB8 001CFEB8 2A00023C */  lui        $2, %hi(_1151_2)
/* CFFBC 001CFEBC F0C24424 */  addiu      $4, $2, %lo(_1151_2)
/* CFFC0 001CFEC0 282E8072 */  paddub     $5, $20, $0
/* CFFC4 001CFEC4 A611040C */  jal        printf
/* CFFC8 001CFEC8 00000000 */   nop
.L001CFECC:
/* CFFCC 001CFECC FFFF0010 */  b          .L001CFECC
/* CFFD0 001CFED0 00000000 */   nop
.L001CFED4:
/* CFFD4 001CFED4 D701023C */  lui        $2, %hi(D_1D6B628)
/* CFFD8 001CFED8 28B64224 */  addiu      $2, $2, %lo(D_1D6B628)
/* CFFDC 001CFEDC 21105000 */  addu       $2, $2, $16
/* CFFE0 001CFEE0 000054C4 */  lwc1       $f20, 0x0($2)
/* CFFE4 001CFEE4 06A30046 */  mov.s      $f12, $f20
/* CFFE8 001CFEE8 2C44040C */  jal        fptosi
/* CFFEC 001CFEEC 00000000 */   nop
/* CFFF0 001CFEF0 02001424 */  addiu      $20, $0, 0x2
/* CFFF4 001CFEF4 06A30046 */  mov.s      $f12, $f20
/* CFFF8 001CFEF8 2C44040C */  jal        fptosi
/* CFFFC 001CFEFC 00000000 */   nop
/* D0000 001CFF00 02004010 */  beqz       $2, .L001CFF0C
/* D0004 001CFF04 00000000 */   nop
/* D0008 001CFF08 01001424 */  addiu      $20, $0, 0x1
.L001CFF0C:
/* D000C 001CFF0C B000F4A6 */  sh         $20, 0xB0($23)
/* D0010 001CFF10 0000F4AE */  sw         $20, 0x0($23)
.L001CFF14:
/* D0014 001CFF14 2800013C */  lui        $at, (0x280000 >> 16)
/* D0018 001CFF18 28A3348C */  lw         $20, -0x5CD8($at)
/* D001C 001CFF1C 00002CC6 */  lwc1       $f12, 0x0($17)
/* D0020 001CFF20 2C44040C */  jal        fptosi
/* D0024 001CFF24 00000000 */   nop
/* D0028 001CFF28 50008216 */  bne        $20, $2, .L001D006C
/* D002C 001CFF2C 00000000 */   nop
/* D0030 001CFF30 2800023C */  lui        $2, %hi(_983)
/* D0034 001CFF34 A0A64224 */  addiu      $2, $2, %lo(_983)
/* D0038 001CFF38 9002A327 */  addiu      $3, $sp, 0x290
/* D003C 001CFF3C 00004278 */  lq         $2, 0x0($2)
/* D0040 001CFF40 0000627C */  sq         $2, 0x0($3)
/* D0044 001CFF44 2800023C */  lui        $2, %hi(_984)
/* D0048 001CFF48 B0A64224 */  addiu      $2, $2, %lo(_984)
/* D004C 001CFF4C A002A327 */  addiu      $3, $sp, 0x2A0
/* D0050 001CFF50 00004278 */  lq         $2, 0x0($2)
/* D0054 001CFF54 0000627C */  sq         $2, 0x0($3)
/* D0058 001CFF58 1894838F */  lw         $3, -0x6BE8($gp)
/* D005C 001CFF5C 30006228 */  slti       $2, $3, 0x30
/* D0060 001CFF60 07004014 */  bnez       $2, .L001CFF80
/* D0064 001CFF64 00000000 */   nop
/* D0068 001CFF68 2A00023C */  lui        $2, %hi(_1162)
/* D006C 001CFF6C 10C44424 */  addiu      $4, $2, %lo(_1162)
/* D0070 001CFF70 A611040C */  jal        printf
/* D0074 001CFF74 00000000 */   nop
/* D0078 001CFF78 3C000010 */  b          .L001D006C
/* D007C 001CFF7C 00000000 */   nop
.L001CFF80:
/* D0080 001CFF80 C0100300 */  sll        $2, $3, 3
/* D0084 001CFF84 21104300 */  addu       $2, $2, $3
/* D0088 001CFF88 00190200 */  sll        $3, $2, 4
/* D008C 001CFF8C D801023C */  lui        $2, %hi(FrameObjAnim)
/* D0090 001CFF90 201F4224 */  addiu      $2, $2, %lo(FrameObjAnim)
/* D0094 001CFF94 21204300 */  addu       $4, $2, $3
/* D0098 001CFF98 C0101300 */  sll        $2, $19, 3
/* D009C 001CFF9C 21105300 */  addu       $2, $2, $19
/* D00A0 001CFFA0 80180200 */  sll        $3, $2, 2
/* D00A4 001CFFA4 D601023C */  lui        $2, %hi(argStrBuff)
/* D00A8 001CFFA8 205C4224 */  addiu      $2, $2, %lo(argStrBuff)
/* D00AC 001CFFAC 21284300 */  addu       $5, $2, $3
/* D00B0 001CFFB0 5A15040C */  jal        strcpy
/* D00B4 001CFFB4 00000000 */   nop
/* D00B8 001CFFB8 03000424 */  addiu      $4, $0, 0x3
/* D00BC 001CFFBC 1894838F */  lw         $3, -0x6BE8($gp)
/* D00C0 001CFFC0 C0100300 */  sll        $2, $3, 3
/* D00C4 001CFFC4 21104300 */  addu       $2, $2, $3
/* D00C8 001CFFC8 00290200 */  sll        $5, $2, 4
/* D00CC 001CFFCC D801023C */  lui        $2, %hi(D_1D81F30)
/* D00D0 001CFFD0 301F4224 */  addiu      $2, $2, %lo(D_1D81F30)
/* D00D4 001CFFD4 21104500 */  addu       $2, $2, $5
/* D00D8 001CFFD8 000044AC */  sw         $4, 0x0($2)
/* D00DC 001CFFDC 06000324 */  addiu      $3, $0, 0x6
/* D00E0 001CFFE0 D801023C */  lui        $2, %hi(D_1D81F34)
/* D00E4 001CFFE4 341F4224 */  addiu      $2, $2, %lo(D_1D81F34)
/* D00E8 001CFFE8 21104500 */  addu       $2, $2, $5
/* D00EC 001CFFEC 000043AC */  sw         $3, 0x0($2)
/* D00F0 001CFFF0 D801023C */  lui        $2, %hi(FrameObjAnim)
/* D00F4 001CFFF4 201F4224 */  addiu      $2, $2, %lo(FrameObjAnim)
/* D00F8 001CFFF8 21104500 */  addu       $2, $2, $5
/* D00FC 001CFFFC 20004424 */  addiu      $4, $2, 0x20
/* D0100 001D0000 9002A527 */  addiu      $5, $sp, 0x290
/* D0104 001D0004 0C86040C */  jal        sceVu0CopyVector
/* D0108 001D0008 00000000 */   nop
/* D010C 001D000C 1894838F */  lw         $3, -0x6BE8($gp)
/* D0110 001D0010 C0100300 */  sll        $2, $3, 3
/* D0114 001D0014 21104300 */  addu       $2, $2, $3
/* D0118 001D0018 00190200 */  sll        $3, $2, 4
/* D011C 001D001C D801023C */  lui        $2, %hi(FrameObjAnim)
/* D0120 001D0020 201F4224 */  addiu      $2, $2, %lo(FrameObjAnim)
/* D0124 001D0024 21104300 */  addu       $2, $2, $3
/* D0128 001D0028 30004424 */  addiu      $4, $2, 0x30
/* D012C 001D002C A002A527 */  addiu      $5, $sp, 0x2A0
/* D0130 001D0030 0C86040C */  jal        sceVu0CopyVector
/* D0134 001D0034 00000000 */   nop
/* D0138 001D0038 1894838F */  lw         $3, -0x6BE8($gp)
/* D013C 001D003C C0100300 */  sll        $2, $3, 3
/* D0140 001D0040 21104300 */  addu       $2, $2, $3
/* D0144 001D0044 00190200 */  sll        $3, $2, 4
/* D0148 001D0048 D801023C */  lui        $2, %hi(FrameObjAnim)
/* D014C 001D004C 201F4224 */  addiu      $2, $2, %lo(FrameObjAnim)
/* D0150 001D0050 21284300 */  addu       $5, $2, $3
/* D0154 001D0054 2826C072 */  paddub     $4, $22, $0
/* D0158 001D0058 4097050C */  jal        InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ
/* D015C 001D005C 00000000 */   nop
/* D0160 001D0060 1894828F */  lw         $2, -0x6BE8($gp)
/* D0164 001D0064 01004224 */  addiu      $2, $2, 0x1
/* D0168 001D0068 189482AF */  sw         $2, -0x6BE8($gp)
.L001D006C:
/* D016C 001D006C 2800013C */  lui        $at, (0x280000 >> 16)
/* D0170 001D0070 10A3348C */  lw         $20, -0x5CF0($at)
/* D0174 001D0074 00002CC6 */  lwc1       $f12, 0x0($17)
/* D0178 001D0078 2C44040C */  jal        fptosi
/* D017C 001D007C 00000000 */   nop
/* D0180 001D0080 2B008216 */  bne        $20, $2, .L001D0130
/* D0184 001D0084 00000000 */   nop
/* D0188 001D0088 1494838F */  lw         $3, -0x6BEC($gp)
/* D018C 001D008C D701023C */  lui        $2, %hi(D_1D6B62C)
/* D0190 001D0090 2CB64224 */  addiu      $2, $2, %lo(D_1D6B62C)
/* D0194 001D0094 21105000 */  addu       $2, $2, $16
/* D0198 001D0098 000042C4 */  lwc1       $f2, 0x0($2)
/* D019C 001D009C D701023C */  lui        $2, %hi(D_1D6B628)
/* D01A0 001D00A0 28B64224 */  addiu      $2, $2, %lo(D_1D6B628)
/* D01A4 001D00A4 21105000 */  addu       $2, $2, $16
/* D01A8 001D00A8 000041C4 */  lwc1       $f1, 0x0($2)
/* D01AC 001D00AC D701023C */  lui        $2, %hi(D_1D6B624)
/* D01B0 001D00B0 24B64224 */  addiu      $2, $2, %lo(D_1D6B624)
/* D01B4 001D00B4 21105000 */  addu       $2, $2, $16
/* D01B8 001D00B8 000040C4 */  lwc1       $f0, 0x0($2)
/* D01BC 001D00BC C89C868F */  lw         $6, -0x6338($gp)
/* D01C0 001D00C0 C0100300 */  sll        $2, $3, 3
/* D01C4 001D00C4 23104300 */  subu       $2, $2, $3
/* D01C8 001D00C8 80100200 */  sll        $2, $2, 2
/* D01CC 001D00CC 21104300 */  addu       $2, $2, $3
/* D01D0 001D00D0 00110200 */  sll        $2, $2, 4
/* D01D4 001D00D4 21304600 */  addu       $6, $2, $6
/* D01D8 001D00D8 A204C284 */  lh         $2, 0x4A2($6)
/* D01DC 001D00DC 06004128 */  slti       $at, $2, 0x6
/* D01E0 001D00E0 13002010 */  beqz       $at, .L001D0130
/* D01E4 001D00E4 00000000 */   nop
/* D01E8 001D00E8 00110200 */  sll        $2, $2, 4
/* D01EC 001D00EC 21104600 */  addu       $2, $2, $6
/* D01F0 001D00F0 B00440E4 */  swc1       $f0, 0x4B0($2)
/* D01F4 001D00F4 A204C284 */  lh         $2, 0x4A2($6)
/* D01F8 001D00F8 00110200 */  sll        $2, $2, 4
/* D01FC 001D00FC 21104600 */  addu       $2, $2, $6
/* D0200 001D0100 B40441E4 */  swc1       $f1, 0x4B4($2)
/* D0204 001D0104 A204C284 */  lh         $2, 0x4A2($6)
/* D0208 001D0108 00110200 */  sll        $2, $2, 4
/* D020C 001D010C 21104600 */  addu       $2, $2, $6
/* D0210 001D0110 B80442E4 */  swc1       $f2, 0x4B8($2)
/* D0214 001D0114 02000324 */  addiu      $3, $0, 0x2
/* D0218 001D0118 A204C284 */  lh         $2, 0x4A2($6)
/* D021C 001D011C 21104600 */  addu       $2, $2, $6
/* D0220 001D0120 100543A0 */  sb         $3, 0x510($2)
/* D0224 001D0124 A204C284 */  lh         $2, 0x4A2($6)
/* D0228 001D0128 01004224 */  addiu      $2, $2, 0x1
/* D022C 001D012C A204C2A4 */  sh         $2, 0x4A2($6)
.L001D0130:
/* D0230 001D0130 2800013C */  lui        $at, (0x280000 >> 16)
/* D0234 001D0134 50A4348C */  lw         $20, -0x5BB0($at)
/* D0238 001D0138 00002CC6 */  lwc1       $f12, 0x0($17)
/* D023C 001D013C 2C44040C */  jal        fptosi
/* D0240 001D0140 00000000 */   nop
/* D0244 001D0144 2B008216 */  bne        $20, $2, .L001D01F4
/* D0248 001D0148 00000000 */   nop
/* D024C 001D014C D701023C */  lui        $2, %hi(D_1D6B624)
/* D0250 001D0150 24B64224 */  addiu      $2, $2, %lo(D_1D6B624)
/* D0254 001D0154 21185000 */  addu       $3, $2, $16
/* D0258 001D0158 2041023C */  lui        $2, (0x41200000 >> 16)
/* D025C 001D015C 00088244 */  mtc1       $2, $f1
/* D0260 001D0160 000060C4 */  lwc1       $f0, 0x0($3)
/* D0264 001D0164 02080046 */  mul.s      $f0, $f1, $f0
/* D0268 001D0168 B002A0E7 */  swc1       $f0, 0x2B0($sp)
/* D026C 001D016C D701023C */  lui        $2, %hi(D_1D6B628)
/* D0270 001D0170 28B64224 */  addiu      $2, $2, %lo(D_1D6B628)
/* D0274 001D0174 21105000 */  addu       $2, $2, $16
/* D0278 001D0178 000040C4 */  lwc1       $f0, 0x0($2)
/* D027C 001D017C 02080046 */  mul.s      $f0, $f1, $f0
/* D0280 001D0180 B402A0E7 */  swc1       $f0, 0x2B4($sp)
/* D0284 001D0184 D701023C */  lui        $2, %hi(D_1D6B62C)
/* D0288 001D0188 2CB64224 */  addiu      $2, $2, %lo(D_1D6B62C)
/* D028C 001D018C 21105000 */  addu       $2, $2, $16
/* D0290 001D0190 000040C4 */  lwc1       $f0, 0x0($2)
/* D0294 001D0194 02080046 */  mul.s      $f0, $f1, $f0
/* D0298 001D0198 B802A0E7 */  swc1       $f0, 0x2B8($sp)
/* D029C 001D019C D701023C */  lui        $2, %hi(D_1D6B630)
/* D02A0 001D01A0 30B64224 */  addiu      $2, $2, %lo(D_1D6B630)
/* D02A4 001D01A4 21105000 */  addu       $2, $2, $16
/* D02A8 001D01A8 000040C4 */  lwc1       $f0, 0x0($2)
/* D02AC 001D01AC 020B0046 */  mul.s      $f12, $f1, $f0
/* D02B0 001D01B0 D701023C */  lui        $2, %hi(D_1D6B634)
/* D02B4 001D01B4 34B64224 */  addiu      $2, $2, %lo(D_1D6B634)
/* D02B8 001D01B8 21105000 */  addu       $2, $2, $16
/* D02BC 001D01BC 000040C4 */  lwc1       $f0, 0x0($2)
/* D02C0 001D01C0 420B0046 */  mul.s      $f13, $f1, $f0
/* D02C4 001D01C4 1494838F */  lw         $3, -0x6BEC($gp)
/* D02C8 001D01C8 C0100300 */  sll        $2, $3, 3
/* D02CC 001D01CC 23104300 */  subu       $2, $2, $3
/* D02D0 001D01D0 80100200 */  sll        $2, $2, 2
/* D02D4 001D01D4 21104300 */  addu       $2, $2, $3
/* D02D8 001D01D8 00190200 */  sll        $3, $2, 4
/* D02DC 001D01DC C89C828F */  lw         $2, -0x6338($gp)
/* D02E0 001D01E0 21104300 */  addu       $2, $2, $3
/* D02E4 001D01E4 90044424 */  addiu      $4, $2, 0x490
/* D02E8 001D01E8 B002A527 */  addiu      $5, $sp, 0x2B0
/* D02EC 001D01EC 9C05070C */  jal        SetHealZone__13CDungeonPartsFPfff
/* D02F0 001D01F0 00000000 */   nop
.L001D01F4:
/* D02F4 001D01F4 2800013C */  lui        $at, (0x280000 >> 16)
/* D02F8 001D01F8 40A3348C */  lw         $20, -0x5CC0($at)
/* D02FC 001D01FC 00002CC6 */  lwc1       $f12, 0x0($17)
/* D0300 001D0200 2C44040C */  jal        fptosi
/* D0304 001D0204 00000000 */   nop
/* D0308 001D0208 63008216 */  bne        $20, $2, .L001D0398
/* D030C 001D020C 00000000 */   nop
/* D0310 001D0210 D701023C */  lui        $2, %hi(D_1D6B624)
/* D0314 001D0214 24B64224 */  addiu      $2, $2, %lo(D_1D6B624)
/* D0318 001D0218 21185000 */  addu       $3, $2, $16
/* D031C 001D021C 2041023C */  lui        $2, (0x41200000 >> 16)
/* D0320 001D0220 00088244 */  mtc1       $2, $f1
/* D0324 001D0224 000060C4 */  lwc1       $f0, 0x0($3)
/* D0328 001D0228 02080046 */  mul.s      $f0, $f1, $f0
/* D032C 001D022C E002A0E7 */  swc1       $f0, 0x2E0($sp)
/* D0330 001D0230 C002A0E7 */  swc1       $f0, 0x2C0($sp)
/* D0334 001D0234 D701023C */  lui        $2, %hi(D_1D6B630)
/* D0338 001D0238 30B64224 */  addiu      $2, $2, %lo(D_1D6B630)
/* D033C 001D023C 21105000 */  addu       $2, $2, $16
/* D0340 001D0240 000040C4 */  lwc1       $f0, 0x0($2)
/* D0344 001D0244 02080046 */  mul.s      $f0, $f1, $f0
/* D0348 001D0248 F002A0E7 */  swc1       $f0, 0x2F0($sp)
/* D034C 001D024C D002A0E7 */  swc1       $f0, 0x2D0($sp)
/* D0350 001D0250 D701023C */  lui        $2, %hi(D_1D6B628)
/* D0354 001D0254 28B64224 */  addiu      $2, $2, %lo(D_1D6B628)
/* D0358 001D0258 21105000 */  addu       $2, $2, $16
/* D035C 001D025C 000040C4 */  lwc1       $f0, 0x0($2)
/* D0360 001D0260 02080046 */  mul.s      $f0, $f1, $f0
/* D0364 001D0264 F402A0E7 */  swc1       $f0, 0x2F4($sp)
/* D0368 001D0268 E402A0E7 */  swc1       $f0, 0x2E4($sp)
/* D036C 001D026C D402A0E7 */  swc1       $f0, 0x2D4($sp)
/* D0370 001D0270 C402A0E7 */  swc1       $f0, 0x2C4($sp)
/* D0374 001D0274 D701023C */  lui        $2, %hi(D_1D6B62C)
/* D0378 001D0278 2CB64224 */  addiu      $2, $2, %lo(D_1D6B62C)
/* D037C 001D027C 21105000 */  addu       $2, $2, $16
/* D0380 001D0280 000040C4 */  lwc1       $f0, 0x0($2)
/* D0384 001D0284 02080046 */  mul.s      $f0, $f1, $f0
/* D0388 001D0288 D802A0E7 */  swc1       $f0, 0x2D8($sp)
/* D038C 001D028C C802A0E7 */  swc1       $f0, 0x2C8($sp)
/* D0390 001D0290 D701023C */  lui        $2, %hi(D_1D6B638)
/* D0394 001D0294 38B64224 */  addiu      $2, $2, %lo(D_1D6B638)
/* D0398 001D0298 21105000 */  addu       $2, $2, $16
/* D039C 001D029C 000040C4 */  lwc1       $f0, 0x0($2)
/* D03A0 001D02A0 02080046 */  mul.s      $f0, $f1, $f0
/* D03A4 001D02A4 F802A0E7 */  swc1       $f0, 0x2F8($sp)
/* D03A8 001D02A8 E802A0E7 */  swc1       $f0, 0x2E8($sp)
/* D03AC 001D02AC D701023C */  lui        $2, %hi(D_1D6B63C)
/* D03B0 001D02B0 3CB64224 */  addiu      $2, $2, %lo(D_1D6B63C)
/* D03B4 001D02B4 21105000 */  addu       $2, $2, $16
/* D03B8 001D02B8 00004CC4 */  lwc1       $f12, 0x0($2)
/* D03BC 001D02BC 5044040C */  jal        fptoui
/* D03C0 001D02C0 00000000 */   nop
/* D03C4 001D02C4 D000A2A3 */  sb         $2, 0xD0($sp)
/* D03C8 001D02C8 D701023C */  lui        $2, %hi(D_1D6B640)
/* D03CC 001D02CC 40B64224 */  addiu      $2, $2, %lo(D_1D6B640)
/* D03D0 001D02D0 21105000 */  addu       $2, $2, $16
/* D03D4 001D02D4 00004CC4 */  lwc1       $f12, 0x0($2)
/* D03D8 001D02D8 5044040C */  jal        fptoui
/* D03DC 001D02DC 00000000 */   nop
/* D03E0 001D02E0 E000A2A3 */  sb         $2, 0xE0($sp)
/* D03E4 001D02E4 D701023C */  lui        $2, %hi(D_1D6B644)
/* D03E8 001D02E8 44B64224 */  addiu      $2, $2, %lo(D_1D6B644)
/* D03EC 001D02EC 21105000 */  addu       $2, $2, $16
/* D03F0 001D02F0 00004CC4 */  lwc1       $f12, 0x0($2)
/* D03F4 001D02F4 5044040C */  jal        fptoui
/* D03F8 001D02F8 00000000 */   nop
/* D03FC 001D02FC F000A2A3 */  sb         $2, 0xF0($sp)
/* D0400 001D0300 1494848F */  lw         $4, -0x6BEC($gp)
/* D0404 001D0304 C89C9E8F */  lw         $fp, -0x6338($gp)
/* D0408 001D0308 01000324 */  addiu      $3, $0, 0x1
/* D040C 001D030C C0100400 */  sll        $2, $4, 3
/* D0410 001D0310 23104400 */  subu       $2, $2, $4
/* D0414 001D0314 80100200 */  sll        $2, $2, 2
/* D0418 001D0318 21104400 */  addu       $2, $2, $4
/* D041C 001D031C 00B90200 */  sll        $23, $2, 4
/* D0420 001D0320 2110FE02 */  addu       $2, $23, $fp
/* D0424 001D0324 200543AC */  sw         $3, 0x520($2)
/* D0428 001D0328 90045424 */  addiu      $20, $2, 0x490
/* D042C 001D032C A0008426 */  addiu      $4, $20, 0xA0
/* D0430 001D0330 C002A527 */  addiu      $5, $sp, 0x2C0
/* D0434 001D0334 0C86040C */  jal        sceVu0CopyVector
/* D0438 001D0338 00000000 */   nop
/* D043C 001D033C B0008426 */  addiu      $4, $20, 0xB0
/* D0440 001D0340 D002A527 */  addiu      $5, $sp, 0x2D0
/* D0444 001D0344 0C86040C */  jal        sceVu0CopyVector
/* D0448 001D0348 00000000 */   nop
/* D044C 001D034C C0008426 */  addiu      $4, $20, 0xC0
/* D0450 001D0350 E002A527 */  addiu      $5, $sp, 0x2E0
/* D0454 001D0354 0C86040C */  jal        sceVu0CopyVector
/* D0458 001D0358 00000000 */   nop
/* D045C 001D035C D0008426 */  addiu      $4, $20, 0xD0
/* D0460 001D0360 F002A527 */  addiu      $5, $sp, 0x2F0
/* D0464 001D0364 0C86040C */  jal        sceVu0CopyVector
/* D0468 001D0368 00000000 */   nop
/* D046C 001D036C D000A293 */  lbu        $2, 0xD0($sp)
/* D0470 001D0370 28164070 */  paddub     $2, $2, $0
/* D0474 001D0374 2118FE02 */  addu       $3, $23, $fp
/* D0478 001D0378 700562AC */  sw         $2, 0x570($3)
/* D047C 001D037C E000A293 */  lbu        $2, 0xE0($sp)
/* D0480 001D0380 28164070 */  paddub     $2, $2, $0
/* D0484 001D0384 740562AC */  sw         $2, 0x574($3)
/* D0488 001D0388 F000A293 */  lbu        $2, 0xF0($sp)
/* D048C 001D038C 28164070 */  paddub     $2, $2, $0
/* D0490 001D0390 780562AC */  sw         $2, 0x578($3)
/* D0494 001D0394 7C0560AC */  sw         $0, 0x57C($3)
.L001D0398:
/* D0498 001D0398 2800013C */  lui        $at, (0x280000 >> 16)
/* D049C 001D039C C0A3348C */  lw         $20, -0x5C40($at)
/* D04A0 001D03A0 00002CC6 */  lwc1       $f12, 0x0($17)
/* D04A4 001D03A4 2C44040C */  jal        fptosi
/* D04A8 001D03A8 00000000 */   nop
/* D04AC 001D03AC 5E008216 */  bne        $20, $2, .L001D0528
/* D04B0 001D03B0 00000000 */   nop
/* D04B4 001D03B4 C0101300 */  sll        $2, $19, 3
/* D04B8 001D03B8 21105300 */  addu       $2, $2, $19
/* D04BC 001D03BC 80180200 */  sll        $3, $2, 2
/* D04C0 001D03C0 D601023C */  lui        $2, %hi(argStrBuff)
/* D04C4 001D03C4 205C4224 */  addiu      $2, $2, %lo(argStrBuff)
/* D04C8 001D03C8 21284300 */  addu       $5, $2, $3
/* D04CC 001D03CC 0003A427 */  addiu      $4, $sp, 0x300
/* D04D0 001D03D0 5A15040C */  jal        strcpy
/* D04D4 001D03D4 00000000 */   nop
/* D04D8 001D03D8 D701023C */  lui        $2, %hi(D_1D6B628)
/* D04DC 001D03DC 28B64224 */  addiu      $2, $2, %lo(D_1D6B628)
/* D04E0 001D03E0 21105000 */  addu       $2, $2, $16
/* D04E4 001D03E4 000054C4 */  lwc1       $f20, 0x0($2)
/* D04E8 001D03E8 D701023C */  lui        $2, %hi(D_1D6B62C)
/* D04EC 001D03EC 2CB64224 */  addiu      $2, $2, %lo(D_1D6B62C)
/* D04F0 001D03F0 21105000 */  addu       $2, $2, $16
/* D04F4 001D03F4 00004CC4 */  lwc1       $f12, 0x0($2)
/* D04F8 001D03F8 2C44040C */  jal        fptosi
/* D04FC 001D03FC 00000000 */   nop
/* D0500 001D0400 0C01A2AF */  sw         $2, 0x10C($sp)
/* D0504 001D0404 D701023C */  lui        $2, %hi(D_1D6B630)
/* D0508 001D0408 30B64224 */  addiu      $2, $2, %lo(D_1D6B630)
/* D050C 001D040C 21105000 */  addu       $2, $2, $16
/* D0510 001D0410 00004CC4 */  lwc1       $f12, 0x0($2)
/* D0514 001D0414 2C44040C */  jal        fptosi
/* D0518 001D0418 00000000 */   nop
/* D051C 001D041C 1001A2AF */  sw         $2, 0x110($sp)
/* D0520 001D0420 D701023C */  lui        $2, %hi(D_1D6B634)
/* D0524 001D0424 34B64224 */  addiu      $2, $2, %lo(D_1D6B634)
/* D0528 001D0428 21105000 */  addu       $2, $2, $16
/* D052C 001D042C 00004CC4 */  lwc1       $f12, 0x0($2)
/* D0530 001D0430 2C44040C */  jal        fptosi
/* D0534 001D0434 00000000 */   nop
/* D0538 001D0438 1401A2AF */  sw         $2, 0x114($sp)
/* D053C 001D043C D701023C */  lui        $2, %hi(D_1D6B638)
/* D0540 001D0440 38B64224 */  addiu      $2, $2, %lo(D_1D6B638)
/* D0544 001D0444 21105000 */  addu       $2, $2, $16
/* D0548 001D0448 00004CC4 */  lwc1       $f12, 0x0($2)
/* D054C 001D044C 2C44040C */  jal        fptosi
/* D0550 001D0450 00000000 */   nop
/* D0554 001D0454 1801A2AF */  sw         $2, 0x118($sp)
/* D0558 001D0458 D701023C */  lui        $2, %hi(D_1D6B63C)
/* D055C 001D045C 3CB64224 */  addiu      $2, $2, %lo(D_1D6B63C)
/* D0560 001D0460 21105000 */  addu       $2, $2, $16
/* D0564 001D0464 00004CC4 */  lwc1       $f12, 0x0($2)
/* D0568 001D0468 2C44040C */  jal        fptosi
/* D056C 001D046C 00000000 */   nop
/* D0570 001D0470 28F64070 */  paddub     $fp, $2, $0
/* D0574 001D0474 D09C848F */  lw         $4, -0x6330($gp)
/* D0578 001D0478 5032070C */  jal        SearchSlot__16CDungeonEventManFv
/* D057C 001D047C 00000000 */   nop
/* D0580 001D0480 28A64070 */  paddub     $20, $2, $0
/* D0584 001D0484 28008012 */  beqz       $20, .L001D0528
/* D0588 001D0488 00000000 */   nop
/* D058C 001D048C 1494978F */  lw         $23, -0x6BEC($gp)
/* D0590 001D0490 1100A012 */  beqz       $21, .L001D04D8
/* D0594 001D0494 00000000 */   nop
/* D0598 001D0498 100095AE */  sw         $21, 0x10($20)
/* D059C 001D049C 1000848E */  lw         $4, 0x10($20)
/* D05A0 001D04A0 0003A527 */  addiu      $5, $sp, 0x300
/* D05A4 001D04A4 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* D05A8 001D04A8 00000000 */   nop
/* D05AC 001D04AC 140082AE */  sw         $2, 0x14($20)
/* D05B0 001D04B0 1400828E */  lw         $2, 0x14($20)
/* D05B4 001D04B4 08004014 */  bnez       $2, .L001D04D8
/* D05B8 001D04B8 00000000 */   nop
/* D05BC 001D04BC 2A00023C */  lui        $2, %hi(_1163)
/* D05C0 001D04C0 30C44424 */  addiu      $4, $2, %lo(_1163)
/* D05C4 001D04C4 0003A527 */  addiu      $5, $sp, 0x300
/* D05C8 001D04C8 A611040C */  jal        printf
/* D05CC 001D04CC 00000000 */   nop
/* D05D0 001D04D0 15000010 */  b          .L001D0528
/* D05D4 001D04D4 00000000 */   nop
.L001D04D8:
/* D05D8 001D04D8 1C0097AE */  sw         $23, 0x1C($20)
/* D05DC 001D04DC 28268072 */  paddub     $4, $20, $0
/* D05E0 001D04E0 0003A527 */  addiu      $5, $sp, 0x300
/* D05E4 001D04E4 5A15040C */  jal        strcpy
/* D05E8 001D04E8 00000000 */   nop
/* D05EC 001D04EC 180094E6 */  swc1       $f20, 0x18($20)
/* D05F0 001D04F0 0C01A28F */  lw         $2, 0x10C($sp)
/* D05F4 001D04F4 200082AE */  sw         $2, 0x20($20)
/* D05F8 001D04F8 1001A28F */  lw         $2, 0x110($sp)
/* D05FC 001D04FC 280082AE */  sw         $2, 0x28($20)
/* D0600 001D0500 1401A28F */  lw         $2, 0x114($sp)
/* D0604 001D0504 240082AE */  sw         $2, 0x24($20)
/* D0608 001D0508 FFFF0224 */  addiu      $2, $0, -0x1
/* D060C 001D050C 2C0082AE */  sw         $2, 0x2C($20)
/* D0610 001D0510 300082AE */  sw         $2, 0x30($20)
/* D0614 001D0514 1801A28F */  lw         $2, 0x118($sp)
/* D0618 001D0518 340082AE */  sw         $2, 0x34($20)
/* D061C 001D051C 38009EAE */  sw         $fp, 0x38($20)
/* D0620 001D0520 01000224 */  addiu      $2, $0, 0x1
/* D0624 001D0524 3C0082AE */  sw         $2, 0x3C($20)
.L001D0528:
/* D0628 001D0528 2800013C */  lui        $at, (0x280000 >> 16)
/* D062C 001D052C 70A4348C */  lw         $20, -0x5B90($at)
/* D0630 001D0530 00002CC6 */  lwc1       $f12, 0x0($17)
/* D0634 001D0534 2C44040C */  jal        fptosi
/* D0638 001D0538 00000000 */   nop
/* D063C 001D053C 62008216 */  bne        $20, $2, .L001D06C8
/* D0640 001D0540 00000000 */   nop
/* D0644 001D0544 C0101300 */  sll        $2, $19, 3
/* D0648 001D0548 21105300 */  addu       $2, $2, $19
/* D064C 001D054C 80180200 */  sll        $3, $2, 2
/* D0650 001D0550 D601023C */  lui        $2, %hi(argStrBuff)
/* D0654 001D0554 205C4224 */  addiu      $2, $2, %lo(argStrBuff)
/* D0658 001D0558 21284300 */  addu       $5, $2, $3
/* D065C 001D055C 2003A427 */  addiu      $4, $sp, 0x320
/* D0660 001D0560 5A15040C */  jal        strcpy
/* D0664 001D0564 00000000 */   nop
/* D0668 001D0568 D701023C */  lui        $2, %hi(D_1D6B628)
/* D066C 001D056C 28B64224 */  addiu      $2, $2, %lo(D_1D6B628)
/* D0670 001D0570 21105000 */  addu       $2, $2, $16
/* D0674 001D0574 000054C4 */  lwc1       $f20, 0x0($2)
/* D0678 001D0578 D701023C */  lui        $2, %hi(D_1D6B62C)
/* D067C 001D057C 2CB64224 */  addiu      $2, $2, %lo(D_1D6B62C)
/* D0680 001D0580 21105000 */  addu       $2, $2, $16
/* D0684 001D0584 00004CC4 */  lwc1       $f12, 0x0($2)
/* D0688 001D0588 2C44040C */  jal        fptosi
/* D068C 001D058C 00000000 */   nop
/* D0690 001D0590 1C01A2AF */  sw         $2, 0x11C($sp)
/* D0694 001D0594 D701023C */  lui        $2, %hi(D_1D6B630)
/* D0698 001D0598 30B64224 */  addiu      $2, $2, %lo(D_1D6B630)
/* D069C 001D059C 21105000 */  addu       $2, $2, $16
/* D06A0 001D05A0 00004CC4 */  lwc1       $f12, 0x0($2)
/* D06A4 001D05A4 2C44040C */  jal        fptosi
/* D06A8 001D05A8 00000000 */   nop
/* D06AC 001D05AC 2001A2AF */  sw         $2, 0x120($sp)
/* D06B0 001D05B0 D701023C */  lui        $2, %hi(D_1D6B634)
/* D06B4 001D05B4 34B64224 */  addiu      $2, $2, %lo(D_1D6B634)
/* D06B8 001D05B8 21105000 */  addu       $2, $2, $16
/* D06BC 001D05BC 00004CC4 */  lwc1       $f12, 0x0($2)
/* D06C0 001D05C0 2C44040C */  jal        fptosi
/* D06C4 001D05C4 00000000 */   nop
/* D06C8 001D05C8 28BE4070 */  paddub     $23, $2, $0
/* D06CC 001D05CC FEFF0224 */  addiu      $2, $0, -0x2
/* D06D0 001D05D0 0300E216 */  bne        $23, $2, .L001D05E0
/* D06D4 001D05D4 00000000 */   nop
/* D06D8 001D05D8 809C978F */  lw         $23, -0x6380($gp)
/* D06DC 001D05DC 00000000 */  nop
.L001D05E0:
/* D06E0 001D05E0 D701023C */  lui        $2, %hi(D_1D6B638)
/* D06E4 001D05E4 38B64224 */  addiu      $2, $2, %lo(D_1D6B638)
/* D06E8 001D05E8 21105000 */  addu       $2, $2, $16
/* D06EC 001D05EC 00004CC4 */  lwc1       $f12, 0x0($2)
/* D06F0 001D05F0 2C44040C */  jal        fptosi
/* D06F4 001D05F4 00000000 */   nop
/* D06F8 001D05F8 2401A2AF */  sw         $2, 0x124($sp)
/* D06FC 001D05FC D701023C */  lui        $2, %hi(D_1D6B63C)
/* D0700 001D0600 3CB64224 */  addiu      $2, $2, %lo(D_1D6B63C)
/* D0704 001D0604 21105000 */  addu       $2, $2, $16
/* D0708 001D0608 00004CC4 */  lwc1       $f12, 0x0($2)
/* D070C 001D060C 2C44040C */  jal        fptosi
/* D0710 001D0610 00000000 */   nop
/* D0714 001D0614 2801A2AF */  sw         $2, 0x128($sp)
/* D0718 001D0618 D09C848F */  lw         $4, -0x6330($gp)
/* D071C 001D061C 5032070C */  jal        SearchSlot__16CDungeonEventManFv
/* D0720 001D0620 00000000 */   nop
/* D0724 001D0624 28A64070 */  paddub     $20, $2, $0
/* D0728 001D0628 27008012 */  beqz       $20, .L001D06C8
/* D072C 001D062C 00000000 */   nop
/* D0730 001D0630 14949E8F */  lw         $fp, -0x6BEC($gp)
/* D0734 001D0634 1100A012 */  beqz       $21, .L001D067C
/* D0738 001D0638 00000000 */   nop
/* D073C 001D063C 100095AE */  sw         $21, 0x10($20)
/* D0740 001D0640 1000848E */  lw         $4, 0x10($20)
/* D0744 001D0644 2003A527 */  addiu      $5, $sp, 0x320
/* D0748 001D0648 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* D074C 001D064C 00000000 */   nop
/* D0750 001D0650 140082AE */  sw         $2, 0x14($20)
/* D0754 001D0654 1400828E */  lw         $2, 0x14($20)
/* D0758 001D0658 08004014 */  bnez       $2, .L001D067C
/* D075C 001D065C 00000000 */   nop
/* D0760 001D0660 2A00023C */  lui        $2, %hi(_1163)
/* D0764 001D0664 30C44424 */  addiu      $4, $2, %lo(_1163)
/* D0768 001D0668 2003A527 */  addiu      $5, $sp, 0x320
/* D076C 001D066C A611040C */  jal        printf
/* D0770 001D0670 00000000 */   nop
/* D0774 001D0674 14000010 */  b          .L001D06C8
/* D0778 001D0678 00000000 */   nop
.L001D067C:
/* D077C 001D067C 1C009EAE */  sw         $fp, 0x1C($20)
/* D0780 001D0680 28268072 */  paddub     $4, $20, $0
/* D0784 001D0684 2003A527 */  addiu      $5, $sp, 0x320
/* D0788 001D0688 5A15040C */  jal        strcpy
/* D078C 001D068C 00000000 */   nop
/* D0790 001D0690 180094E6 */  swc1       $f20, 0x18($20)
/* D0794 001D0694 1C01A28F */  lw         $2, 0x11C($sp)
/* D0798 001D0698 200082AE */  sw         $2, 0x20($20)
/* D079C 001D069C 280080AE */  sw         $0, 0x28($20)
/* D07A0 001D06A0 240080AE */  sw         $0, 0x24($20)
/* D07A4 001D06A4 2001A28F */  lw         $2, 0x120($sp)
/* D07A8 001D06A8 2C0082AE */  sw         $2, 0x2C($20)
/* D07AC 001D06AC 300097AE */  sw         $23, 0x30($20)
/* D07B0 001D06B0 2401A28F */  lw         $2, 0x124($sp)
/* D07B4 001D06B4 340082AE */  sw         $2, 0x34($20)
/* D07B8 001D06B8 2801A28F */  lw         $2, 0x128($sp)
/* D07BC 001D06BC 380082AE */  sw         $2, 0x38($20)
/* D07C0 001D06C0 01000224 */  addiu      $2, $0, 0x1
/* D07C4 001D06C4 3C0082AE */  sw         $2, 0x3C($20)
.L001D06C8:
/* D07C8 001D06C8 2800013C */  lui        $at, (0x280000 >> 16)
/* D07CC 001D06CC 20A4348C */  lw         $20, -0x5BE0($at)
/* D07D0 001D06D0 00002CC6 */  lwc1       $f12, 0x0($17)
/* D07D4 001D06D4 2C44040C */  jal        fptosi
/* D07D8 001D06D8 00000000 */   nop
/* D07DC 001D06DC 67008216 */  bne        $20, $2, .L001D087C
/* D07E0 001D06E0 00000000 */   nop
/* D07E4 001D06E4 1894838F */  lw         $3, -0x6BE8($gp)
/* D07E8 001D06E8 30006228 */  slti       $2, $3, 0x30
/* D07EC 001D06EC 07004014 */  bnez       $2, .L001D070C
/* D07F0 001D06F0 00000000 */   nop
/* D07F4 001D06F4 2A00023C */  lui        $2, %hi(_1162)
/* D07F8 001D06F8 10C44424 */  addiu      $4, $2, %lo(_1162)
/* D07FC 001D06FC A611040C */  jal        printf
/* D0800 001D0700 00000000 */   nop
/* D0804 001D0704 5D000010 */  b          .L001D087C
/* D0808 001D0708 00000000 */   nop
.L001D070C:
/* D080C 001D070C C0100300 */  sll        $2, $3, 3
/* D0810 001D0710 21104300 */  addu       $2, $2, $3
/* D0814 001D0714 00190200 */  sll        $3, $2, 4
/* D0818 001D0718 D801023C */  lui        $2, %hi(FrameObjAnim)
/* D081C 001D071C 201F4224 */  addiu      $2, $2, %lo(FrameObjAnim)
/* D0820 001D0720 21204300 */  addu       $4, $2, $3
/* D0824 001D0724 2497050C */  jal        Initialize__13OBJ_ANIME_SEQFv
/* D0828 001D0728 00000000 */   nop
/* D082C 001D072C 1894838F */  lw         $3, -0x6BE8($gp)
/* D0830 001D0730 C0100300 */  sll        $2, $3, 3
/* D0834 001D0734 21104300 */  addu       $2, $2, $3
/* D0838 001D0738 00110200 */  sll        $2, $2, 4
/* D083C 001D073C D801033C */  lui        $3, %hi(D_1D81F30)
/* D0840 001D0740 301F6324 */  addiu      $3, $3, %lo(D_1D81F30)
/* D0844 001D0744 21186200 */  addu       $3, $3, $2
/* D0848 001D0748 000060AC */  sw         $0, 0x0($3)
/* D084C 001D074C D801033C */  lui        $3, %hi(D_1D81F34)
/* D0850 001D0750 341F6324 */  addiu      $3, $3, %lo(D_1D81F34)
/* D0854 001D0754 21186200 */  addu       $3, $3, $2
/* D0858 001D0758 000060AC */  sw         $0, 0x0($3)
/* D085C 001D075C D701033C */  lui        $3, %hi(D_1D6B628)
/* D0860 001D0760 28B66324 */  addiu      $3, $3, %lo(D_1D6B628)
/* D0864 001D0764 21187000 */  addu       $3, $3, $16
/* D0868 001D0768 000060C4 */  lwc1       $f0, 0x0($3)
/* D086C 001D076C D801033C */  lui        $3, %hi(D_1D81F40)
/* D0870 001D0770 401F6324 */  addiu      $3, $3, %lo(D_1D81F40)
/* D0874 001D0774 21186200 */  addu       $3, $3, $2
/* D0878 001D0778 000060E4 */  swc1       $f0, 0x0($3)
/* D087C 001D077C D701033C */  lui        $3, %hi(D_1D6B62C)
/* D0880 001D0780 2CB66324 */  addiu      $3, $3, %lo(D_1D6B62C)
/* D0884 001D0784 21187000 */  addu       $3, $3, $16
/* D0888 001D0788 000060C4 */  lwc1       $f0, 0x0($3)
/* D088C 001D078C D801033C */  lui        $3, %hi(D_1D81F44)
/* D0890 001D0790 441F6324 */  addiu      $3, $3, %lo(D_1D81F44)
/* D0894 001D0794 21186200 */  addu       $3, $3, $2
/* D0898 001D0798 000060E4 */  swc1       $f0, 0x0($3)
/* D089C 001D079C D701033C */  lui        $3, %hi(D_1D6B630)
/* D08A0 001D07A0 30B66324 */  addiu      $3, $3, %lo(D_1D6B630)
/* D08A4 001D07A4 21187000 */  addu       $3, $3, $16
/* D08A8 001D07A8 000060C4 */  lwc1       $f0, 0x0($3)
/* D08AC 001D07AC D801033C */  lui        $3, %hi(D_1D81F48)
/* D08B0 001D07B0 481F6324 */  addiu      $3, $3, %lo(D_1D81F48)
/* D08B4 001D07B4 21186200 */  addu       $3, $3, $2
/* D08B8 001D07B8 000060E4 */  swc1       $f0, 0x0($3)
/* D08BC 001D07BC D701033C */  lui        $3, %hi(D_1D6B634)
/* D08C0 001D07C0 34B66324 */  addiu      $3, $3, %lo(D_1D6B634)
/* D08C4 001D07C4 21187000 */  addu       $3, $3, $16
/* D08C8 001D07C8 000060C4 */  lwc1       $f0, 0x0($3)
/* D08CC 001D07CC D801033C */  lui        $3, %hi(D_1D81F60)
/* D08D0 001D07D0 601F6324 */  addiu      $3, $3, %lo(D_1D81F60)
/* D08D4 001D07D4 21186200 */  addu       $3, $3, $2
/* D08D8 001D07D8 000060E4 */  swc1       $f0, 0x0($3)
/* D08DC 001D07DC D701033C */  lui        $3, %hi(D_1D6B638)
/* D08E0 001D07E0 38B66324 */  addiu      $3, $3, %lo(D_1D6B638)
/* D08E4 001D07E4 21187000 */  addu       $3, $3, $16
/* D08E8 001D07E8 000060C4 */  lwc1       $f0, 0x0($3)
/* D08EC 001D07EC D801033C */  lui        $3, %hi(D_1D81F64)
/* D08F0 001D07F0 641F6324 */  addiu      $3, $3, %lo(D_1D81F64)
/* D08F4 001D07F4 21186200 */  addu       $3, $3, $2
/* D08F8 001D07F8 000060E4 */  swc1       $f0, 0x0($3)
/* D08FC 001D07FC D701033C */  lui        $3, %hi(D_1D6B63C)
/* D0900 001D0800 3CB66324 */  addiu      $3, $3, %lo(D_1D6B63C)
/* D0904 001D0804 21187000 */  addu       $3, $3, $16
/* D0908 001D0808 000060C4 */  lwc1       $f0, 0x0($3)
/* D090C 001D080C D801033C */  lui        $3, %hi(D_1D81F68)
/* D0910 001D0810 681F6324 */  addiu      $3, $3, %lo(D_1D81F68)
/* D0914 001D0814 21186200 */  addu       $3, $3, $2
/* D0918 001D0818 000060E4 */  swc1       $f0, 0x0($3)
/* D091C 001D081C D801033C */  lui        $3, %hi(FrameObjAnim)
/* D0920 001D0820 201F6324 */  addiu      $3, $3, %lo(FrameObjAnim)
/* D0924 001D0824 21206200 */  addu       $4, $3, $2
/* D0928 001D0828 C0101300 */  sll        $2, $19, 3
/* D092C 001D082C 21105300 */  addu       $2, $2, $19
/* D0930 001D0830 80180200 */  sll        $3, $2, 2
/* D0934 001D0834 D601023C */  lui        $2, %hi(argStrBuff)
/* D0938 001D0838 205C4224 */  addiu      $2, $2, %lo(argStrBuff)
/* D093C 001D083C 21284300 */  addu       $5, $2, $3
/* D0940 001D0840 5A15040C */  jal        strcpy
/* D0944 001D0844 00000000 */   nop
/* D0948 001D0848 1894838F */  lw         $3, -0x6BE8($gp)
/* D094C 001D084C C0100300 */  sll        $2, $3, 3
/* D0950 001D0850 21104300 */  addu       $2, $2, $3
/* D0954 001D0854 00190200 */  sll        $3, $2, 4
/* D0958 001D0858 D801023C */  lui        $2, %hi(FrameObjAnim)
/* D095C 001D085C 201F4224 */  addiu      $2, $2, %lo(FrameObjAnim)
/* D0960 001D0860 21284300 */  addu       $5, $2, $3
/* D0964 001D0864 2826C072 */  paddub     $4, $22, $0
/* D0968 001D0868 4097050C */  jal        InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ
/* D096C 001D086C 00000000 */   nop
/* D0970 001D0870 1894828F */  lw         $2, -0x6BE8($gp)
/* D0974 001D0874 01004224 */  addiu      $2, $2, 0x1
/* D0978 001D0878 189482AF */  sw         $2, -0x6BE8($gp)
.L001D087C:
/* D097C 001D087C 2800013C */  lui        $at, (0x280000 >> 16)
/* D0980 001D0880 A0A4348C */  lw         $20, -0x5B60($at)
/* D0984 001D0884 00002CC6 */  lwc1       $f12, 0x0($17)
/* D0988 001D0888 2C44040C */  jal        fptosi
/* D098C 001D088C 00000000 */   nop
/* D0990 001D0890 80008216 */  bne        $20, $2, .L001D0A94
/* D0994 001D0894 00000000 */   nop
/* D0998 001D0898 1894838F */  lw         $3, -0x6BE8($gp)
/* D099C 001D089C 30006228 */  slti       $2, $3, 0x30
/* D09A0 001D08A0 07004014 */  bnez       $2, .L001D08C0
/* D09A4 001D08A4 00000000 */   nop
/* D09A8 001D08A8 2A00023C */  lui        $2, %hi(_1162)
/* D09AC 001D08AC 10C44424 */  addiu      $4, $2, %lo(_1162)
/* D09B0 001D08B0 A611040C */  jal        printf
/* D09B4 001D08B4 00000000 */   nop
/* D09B8 001D08B8 76000010 */  b          .L001D0A94
/* D09BC 001D08BC 00000000 */   nop
.L001D08C0:
/* D09C0 001D08C0 C0100300 */  sll        $2, $3, 3
/* D09C4 001D08C4 21104300 */  addu       $2, $2, $3
/* D09C8 001D08C8 00190200 */  sll        $3, $2, 4
/* D09CC 001D08CC D801023C */  lui        $2, %hi(FrameObjAnim)
/* D09D0 001D08D0 201F4224 */  addiu      $2, $2, %lo(FrameObjAnim)
/* D09D4 001D08D4 21204300 */  addu       $4, $2, $3
/* D09D8 001D08D8 2497050C */  jal        Initialize__13OBJ_ANIME_SEQFv
/* D09DC 001D08DC 00000000 */   nop
/* D09E0 001D08E0 02000424 */  addiu      $4, $0, 0x2
/* D09E4 001D08E4 1894838F */  lw         $3, -0x6BE8($gp)
/* D09E8 001D08E8 C0100300 */  sll        $2, $3, 3
/* D09EC 001D08EC 21104300 */  addu       $2, $2, $3
/* D09F0 001D08F0 00110200 */  sll        $2, $2, 4
/* D09F4 001D08F4 D801033C */  lui        $3, %hi(D_1D81F30)
/* D09F8 001D08F8 301F6324 */  addiu      $3, $3, %lo(D_1D81F30)
/* D09FC 001D08FC 21186200 */  addu       $3, $3, $2
/* D0A00 001D0900 000064AC */  sw         $4, 0x0($3)
/* D0A04 001D0904 D801033C */  lui        $3, %hi(D_1D81F34)
/* D0A08 001D0908 341F6324 */  addiu      $3, $3, %lo(D_1D81F34)
/* D0A0C 001D090C 21186200 */  addu       $3, $3, $2
/* D0A10 001D0910 000064AC */  sw         $4, 0x0($3)
/* D0A14 001D0914 D701033C */  lui        $3, %hi(D_1D6B628)
/* D0A18 001D0918 28B66324 */  addiu      $3, $3, %lo(D_1D6B628)
/* D0A1C 001D091C 21187000 */  addu       $3, $3, $16
/* D0A20 001D0920 000060C4 */  lwc1       $f0, 0x0($3)
/* D0A24 001D0924 D801033C */  lui        $3, %hi(D_1D81F40)
/* D0A28 001D0928 401F6324 */  addiu      $3, $3, %lo(D_1D81F40)
/* D0A2C 001D092C 21186200 */  addu       $3, $3, $2
/* D0A30 001D0930 000060E4 */  swc1       $f0, 0x0($3)
/* D0A34 001D0934 D701033C */  lui        $3, %hi(D_1D6B62C)
/* D0A38 001D0938 2CB66324 */  addiu      $3, $3, %lo(D_1D6B62C)
/* D0A3C 001D093C 21187000 */  addu       $3, $3, $16
/* D0A40 001D0940 000060C4 */  lwc1       $f0, 0x0($3)
/* D0A44 001D0944 D801033C */  lui        $3, %hi(D_1D81F44)
/* D0A48 001D0948 441F6324 */  addiu      $3, $3, %lo(D_1D81F44)
/* D0A4C 001D094C 21186200 */  addu       $3, $3, $2
/* D0A50 001D0950 000060E4 */  swc1       $f0, 0x0($3)
/* D0A54 001D0954 D701033C */  lui        $3, %hi(D_1D6B630)
/* D0A58 001D0958 30B66324 */  addiu      $3, $3, %lo(D_1D6B630)
/* D0A5C 001D095C 21187000 */  addu       $3, $3, $16
/* D0A60 001D0960 000060C4 */  lwc1       $f0, 0x0($3)
/* D0A64 001D0964 D801033C */  lui        $3, %hi(D_1D81F48)
/* D0A68 001D0968 481F6324 */  addiu      $3, $3, %lo(D_1D81F48)
/* D0A6C 001D096C 21186200 */  addu       $3, $3, $2
/* D0A70 001D0970 000060E4 */  swc1       $f0, 0x0($3)
/* D0A74 001D0974 D701033C */  lui        $3, %hi(D_1D6B634)
/* D0A78 001D0978 34B66324 */  addiu      $3, $3, %lo(D_1D6B634)
/* D0A7C 001D097C 21187000 */  addu       $3, $3, $16
/* D0A80 001D0980 000060C4 */  lwc1       $f0, 0x0($3)
/* D0A84 001D0984 D801033C */  lui        $3, %hi(D_1D81F50)
/* D0A88 001D0988 501F6324 */  addiu      $3, $3, %lo(D_1D81F50)
/* D0A8C 001D098C 21186200 */  addu       $3, $3, $2
/* D0A90 001D0990 000060E4 */  swc1       $f0, 0x0($3)
/* D0A94 001D0994 D701033C */  lui        $3, %hi(D_1D6B638)
/* D0A98 001D0998 38B66324 */  addiu      $3, $3, %lo(D_1D6B638)
/* D0A9C 001D099C 21187000 */  addu       $3, $3, $16
/* D0AA0 001D09A0 000060C4 */  lwc1       $f0, 0x0($3)
/* D0AA4 001D09A4 D801033C */  lui        $3, %hi(D_1D81F54)
/* D0AA8 001D09A8 541F6324 */  addiu      $3, $3, %lo(D_1D81F54)
/* D0AAC 001D09AC 21186200 */  addu       $3, $3, $2
/* D0AB0 001D09B0 000060E4 */  swc1       $f0, 0x0($3)
/* D0AB4 001D09B4 D701033C */  lui        $3, %hi(D_1D6B63C)
/* D0AB8 001D09B8 3CB66324 */  addiu      $3, $3, %lo(D_1D6B63C)
/* D0ABC 001D09BC 21187000 */  addu       $3, $3, $16
/* D0AC0 001D09C0 000060C4 */  lwc1       $f0, 0x0($3)
/* D0AC4 001D09C4 D801033C */  lui        $3, %hi(D_1D81F58)
/* D0AC8 001D09C8 581F6324 */  addiu      $3, $3, %lo(D_1D81F58)
/* D0ACC 001D09CC 21186200 */  addu       $3, $3, $2
/* D0AD0 001D09D0 000060E4 */  swc1       $f0, 0x0($3)
/* D0AD4 001D09D4 D701033C */  lui        $3, %hi(D_1D6B640)
/* D0AD8 001D09D8 40B66324 */  addiu      $3, $3, %lo(D_1D6B640)
/* D0ADC 001D09DC 21187000 */  addu       $3, $3, $16
/* D0AE0 001D09E0 000060C4 */  lwc1       $f0, 0x0($3)
/* D0AE4 001D09E4 D801033C */  lui        $3, %hi(D_1D81F60)
/* D0AE8 001D09E8 601F6324 */  addiu      $3, $3, %lo(D_1D81F60)
/* D0AEC 001D09EC 21186200 */  addu       $3, $3, $2
/* D0AF0 001D09F0 000060E4 */  swc1       $f0, 0x0($3)
/* D0AF4 001D09F4 D701033C */  lui        $3, %hi(D_1D6B644)
/* D0AF8 001D09F8 44B66324 */  addiu      $3, $3, %lo(D_1D6B644)
/* D0AFC 001D09FC 21187000 */  addu       $3, $3, $16
/* D0B00 001D0A00 000060C4 */  lwc1       $f0, 0x0($3)
/* D0B04 001D0A04 D801033C */  lui        $3, %hi(D_1D81F64)
/* D0B08 001D0A08 641F6324 */  addiu      $3, $3, %lo(D_1D81F64)
/* D0B0C 001D0A0C 21186200 */  addu       $3, $3, $2
/* D0B10 001D0A10 000060E4 */  swc1       $f0, 0x0($3)
/* D0B14 001D0A14 D701033C */  lui        $3, %hi(D_1D6B648)
/* D0B18 001D0A18 48B66324 */  addiu      $3, $3, %lo(D_1D6B648)
/* D0B1C 001D0A1C 21187000 */  addu       $3, $3, $16
/* D0B20 001D0A20 000060C4 */  lwc1       $f0, 0x0($3)
/* D0B24 001D0A24 D801033C */  lui        $3, %hi(D_1D81F68)
/* D0B28 001D0A28 681F6324 */  addiu      $3, $3, %lo(D_1D81F68)
/* D0B2C 001D0A2C 21186200 */  addu       $3, $3, $2
/* D0B30 001D0A30 000060E4 */  swc1       $f0, 0x0($3)
/* D0B34 001D0A34 D801033C */  lui        $3, %hi(FrameObjAnim)
/* D0B38 001D0A38 201F6324 */  addiu      $3, $3, %lo(FrameObjAnim)
/* D0B3C 001D0A3C 21206200 */  addu       $4, $3, $2
/* D0B40 001D0A40 C0101300 */  sll        $2, $19, 3
/* D0B44 001D0A44 21105300 */  addu       $2, $2, $19
/* D0B48 001D0A48 80180200 */  sll        $3, $2, 2
/* D0B4C 001D0A4C D601023C */  lui        $2, %hi(argStrBuff)
/* D0B50 001D0A50 205C4224 */  addiu      $2, $2, %lo(argStrBuff)
/* D0B54 001D0A54 21284300 */  addu       $5, $2, $3
/* D0B58 001D0A58 5A15040C */  jal        strcpy
/* D0B5C 001D0A5C 00000000 */   nop
/* D0B60 001D0A60 1894838F */  lw         $3, -0x6BE8($gp)
/* D0B64 001D0A64 C0100300 */  sll        $2, $3, 3
/* D0B68 001D0A68 21104300 */  addu       $2, $2, $3
/* D0B6C 001D0A6C 00190200 */  sll        $3, $2, 4
/* D0B70 001D0A70 D801023C */  lui        $2, %hi(FrameObjAnim)
/* D0B74 001D0A74 201F4224 */  addiu      $2, $2, %lo(FrameObjAnim)
/* D0B78 001D0A78 21284300 */  addu       $5, $2, $3
/* D0B7C 001D0A7C 2826C072 */  paddub     $4, $22, $0
/* D0B80 001D0A80 4097050C */  jal        InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ
/* D0B84 001D0A84 00000000 */   nop
/* D0B88 001D0A88 1894828F */  lw         $2, -0x6BE8($gp)
/* D0B8C 001D0A8C 01004224 */  addiu      $2, $2, 0x1
/* D0B90 001D0A90 189482AF */  sw         $2, -0x6BE8($gp)
.L001D0A94:
/* D0B94 001D0A94 2800013C */  lui        $at, (0x280000 >> 16)
/* D0B98 001D0A98 F0A3348C */  lw         $20, -0x5C10($at)
/* D0B9C 001D0A9C 00002CC6 */  lwc1       $f12, 0x0($17)
/* D0BA0 001D0AA0 2C44040C */  jal        fptosi
/* D0BA4 001D0AA4 00000000 */   nop
/* D0BA8 001D0AA8 71008216 */  bne        $20, $2, .L001D0C70
/* D0BAC 001D0AAC 00000000 */   nop
/* D0BB0 001D0AB0 C0101300 */  sll        $2, $19, 3
/* D0BB4 001D0AB4 21105300 */  addu       $2, $2, $19
/* D0BB8 001D0AB8 80180200 */  sll        $3, $2, 2
/* D0BBC 001D0ABC D601023C */  lui        $2, %hi(argStrBuff)
/* D0BC0 001D0AC0 205C4224 */  addiu      $2, $2, %lo(argStrBuff)
/* D0BC4 001D0AC4 21284300 */  addu       $5, $2, $3
/* D0BC8 001D0AC8 4003A427 */  addiu      $4, $sp, 0x340
/* D0BCC 001D0ACC 5A15040C */  jal        strcpy
/* D0BD0 001D0AD0 00000000 */   nop
/* D0BD4 001D0AD4 D701023C */  lui        $2, %hi(D_1D6B628)
/* D0BD8 001D0AD8 28B64224 */  addiu      $2, $2, %lo(D_1D6B628)
/* D0BDC 001D0ADC 21105000 */  addu       $2, $2, $16
/* D0BE0 001D0AE0 00004CC4 */  lwc1       $f12, 0x0($2)
/* D0BE4 001D0AE4 2C44040C */  jal        fptosi
/* D0BE8 001D0AE8 00000000 */   nop
/* D0BEC 001D0AEC 28F64070 */  paddub     $fp, $2, $0
/* D0BF0 001D0AF0 D701023C */  lui        $2, %hi(D_1D6B62C)
/* D0BF4 001D0AF4 2CB64224 */  addiu      $2, $2, %lo(D_1D6B62C)
/* D0BF8 001D0AF8 21105000 */  addu       $2, $2, $16
/* D0BFC 001D0AFC 000040C4 */  lwc1       $f0, 0x0($2)
/* D0C00 001D0B00 6003A0E7 */  swc1       $f0, 0x360($sp)
/* D0C04 001D0B04 D701023C */  lui        $2, %hi(D_1D6B630)
/* D0C08 001D0B08 30B64224 */  addiu      $2, $2, %lo(D_1D6B630)
/* D0C0C 001D0B0C 21105000 */  addu       $2, $2, $16
/* D0C10 001D0B10 000040C4 */  lwc1       $f0, 0x0($2)
/* D0C14 001D0B14 6403A0E7 */  swc1       $f0, 0x364($sp)
/* D0C18 001D0B18 D701023C */  lui        $2, %hi(D_1D6B634)
/* D0C1C 001D0B1C 34B64224 */  addiu      $2, $2, %lo(D_1D6B634)
/* D0C20 001D0B20 21105000 */  addu       $2, $2, $16
/* D0C24 001D0B24 000040C4 */  lwc1       $f0, 0x0($2)
/* D0C28 001D0B28 6803A0E7 */  swc1       $f0, 0x368($sp)
/* D0C2C 001D0B2C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* D0C30 001D0B30 6C03A2AF */  sw         $2, 0x36C($sp)
/* D0C34 001D0B34 D701023C */  lui        $2, %hi(D_1D6B638)
/* D0C38 001D0B38 38B64224 */  addiu      $2, $2, %lo(D_1D6B638)
/* D0C3C 001D0B3C 21105000 */  addu       $2, $2, $16
/* D0C40 001D0B40 000040C4 */  lwc1       $f0, 0x0($2)
/* D0C44 001D0B44 7003A0E7 */  swc1       $f0, 0x370($sp)
/* D0C48 001D0B48 D701023C */  lui        $2, %hi(D_1D6B63C)
/* D0C4C 001D0B4C 3CB64224 */  addiu      $2, $2, %lo(D_1D6B63C)
/* D0C50 001D0B50 21105000 */  addu       $2, $2, $16
/* D0C54 001D0B54 000040C4 */  lwc1       $f0, 0x0($2)
/* D0C58 001D0B58 7403A0E7 */  swc1       $f0, 0x374($sp)
/* D0C5C 001D0B5C D701023C */  lui        $2, %hi(D_1D6B640)
/* D0C60 001D0B60 40B64224 */  addiu      $2, $2, %lo(D_1D6B640)
/* D0C64 001D0B64 21105000 */  addu       $2, $2, $16
/* D0C68 001D0B68 000040C4 */  lwc1       $f0, 0x0($2)
/* D0C6C 001D0B6C 7803A0E7 */  swc1       $f0, 0x378($sp)
/* D0C70 001D0B70 281E0070 */  paddub     $3, $0, $0
/* D0C74 001D0B74 1B000010 */  b          .L001D0BE4
/* D0C78 001D0B78 00000000 */   nop
.L001D0B7C:
/* D0C7C 001D0B7C 80100300 */  sll        $2, $3, 2
/* D0C80 001D0B80 21105D00 */  addu       $2, $2, $sp
/* D0C84 001D0B84 70034224 */  addiu      $2, $2, 0x370
/* D0C88 001D0B88 A08181C7 */  lwc1       $f1, -0x7E60($gp)
/* D0C8C 001D0B8C 000040C4 */  lwc1       $f0, 0x0($2)
/* D0C90 001D0B90 42080046 */  mul.s      $f1, $f1, $f0
/* D0C94 001D0B94 000041E4 */  swc1       $f1, 0x0($2)
/* D0C98 001D0B98 288180C7 */  lwc1       $f0, -0x7ED8($gp)
/* D0C9C 001D0B9C 36080046 */  c.le.s     $f1, $f0
/* D0CA0 001D0BA0 00000000 */  nop
/* D0CA4 001D0BA4 05000145 */  bc1t       .L001D0BBC
/* D0CA8 001D0BA8 00000000 */   nop
/* D0CAC 001D0BAC 000041C4 */  lwc1       $f1, 0x0($2)
/* D0CB0 001D0BB0 4C8180C7 */  lwc1       $f0, -0x7EB4($gp)
/* D0CB4 001D0BB4 01080046 */  sub.s      $f0, $f1, $f0
/* D0CB8 001D0BB8 000040E4 */  swc1       $f0, 0x0($2)
.L001D0BBC:
/* D0CBC 001D0BBC 000041C4 */  lwc1       $f1, 0x0($2)
/* D0CC0 001D0BC0 A48180C7 */  lwc1       $f0, -0x7E5C($gp)
/* D0CC4 001D0BC4 34080046 */  c.lt.s     $f1, $f0
/* D0CC8 001D0BC8 00000000 */  nop
/* D0CCC 001D0BCC 04000045 */  bc1f       .L001D0BE0
/* D0CD0 001D0BD0 00000000 */   nop
/* D0CD4 001D0BD4 A88180C7 */  lwc1       $f0, -0x7E58($gp)
/* D0CD8 001D0BD8 00080046 */  add.s      $f0, $f1, $f0
/* D0CDC 001D0BDC 000040E4 */  swc1       $f0, 0x0($2)
.L001D0BE0:
/* D0CE0 001D0BE0 01006324 */  addiu      $3, $3, 0x1
.L001D0BE4:
/* D0CE4 001D0BE4 03006228 */  slti       $2, $3, 0x3
/* D0CE8 001D0BE8 E4FF4014 */  bnez       $2, .L001D0B7C
/* D0CEC 001D0BEC 00000000 */   nop
/* D0CF0 001D0BF0 D701023C */  lui        $2, %hi(D_1D6B644)
/* D0CF4 001D0BF4 44B64224 */  addiu      $2, $2, %lo(D_1D6B644)
/* D0CF8 001D0BF8 21105000 */  addu       $2, $2, $16
/* D0CFC 001D0BFC 00004CC4 */  lwc1       $f12, 0x0($2)
/* D0D00 001D0C00 2C44040C */  jal        fptosi
/* D0D04 001D0C04 00000000 */   nop
/* D0D08 001D0C08 28BE4070 */  paddub     $23, $2, $0
/* D0D0C 001D0C0C D701023C */  lui        $2, %hi(D_1D6B648)
/* D0D10 001D0C10 48B64224 */  addiu      $2, $2, %lo(D_1D6B648)
/* D0D14 001D0C14 21105000 */  addu       $2, $2, $16
/* D0D18 001D0C18 00004CC4 */  lwc1       $f12, 0x0($2)
/* D0D1C 001D0C1C 2C44040C */  jal        fptosi
/* D0D20 001D0C20 00000000 */   nop
/* D0D24 001D0C24 28A64070 */  paddub     $20, $2, $0
/* D0D28 001D0C28 28264072 */  paddub     $4, $18, $0
/* D0D2C 001D0C2C 4003A527 */  addiu      $5, $sp, 0x340
/* D0D30 001D0C30 8C03A627 */  addiu      $6, $sp, 0x38C
/* D0D34 001D0C34 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* D0D38 001D0C38 00000000 */   nop
/* D0D3C 001D0C3C F001033C */  lui        $3, %hi(D_1F06650)
/* D0D40 001D0C40 50666324 */  addiu      $3, $3, %lo(D_1F06650)
/* D0D44 001D0C44 0000A3FF */  sd         $3, 0x0($sp)
/* D0D48 001D0C48 C89C848F */  lw         $4, -0x6338($gp)
/* D0D4C 001D0C4C 282EC073 */  paddub     $5, $fp, $0
/* D0D50 001D0C50 28364070 */  paddub     $6, $2, $0
/* D0D54 001D0C54 1494878F */  lw         $7, -0x6BEC($gp)
/* D0D58 001D0C58 6003A827 */  addiu      $8, $sp, 0x360
/* D0D5C 001D0C5C 7003A927 */  addiu      $9, $sp, 0x370
/* D0D60 001D0C60 2856E072 */  paddub     $10, $23, $0
/* D0D64 001D0C64 285E8072 */  paddub     $11, $20, $0
/* D0D68 001D0C68 0007070C */  jal        SetNPC__11CDungeonMapFiPUiiPfPfiiP14CDataAlloc2_1_
/* D0D6C 001D0C6C 00000000 */   nop
.L001D0C70:
/* D0D70 001D0C70 2800013C */  lui        $at, (0x280000 >> 16)
/* D0D74 001D0C74 F0A2348C */  lw         $20, -0x5D10($at)
/* D0D78 001D0C78 00002CC6 */  lwc1       $f12, 0x0($17)
/* D0D7C 001D0C7C 2C44040C */  jal        fptosi
/* D0D80 001D0C80 00000000 */   nop
/* D0D84 001D0C84 2B008216 */  bne        $20, $2, .L001D0D34
/* D0D88 001D0C88 00000000 */   nop
/* D0D8C 001D0C8C 1494868F */  lw         $6, -0x6BEC($gp)
/* D0D90 001D0C90 D701033C */  lui        $3, %hi(D_1D6B62C)
/* D0D94 001D0C94 2CB66324 */  addiu      $3, $3, %lo(D_1D6B62C)
/* D0D98 001D0C98 21187000 */  addu       $3, $3, $16
/* D0D9C 001D0C9C 000062C4 */  lwc1       $f2, 0x0($3)
/* D0DA0 001D0CA0 D701033C */  lui        $3, %hi(D_1D6B628)
/* D0DA4 001D0CA4 28B66324 */  addiu      $3, $3, %lo(D_1D6B628)
/* D0DA8 001D0CA8 21187000 */  addu       $3, $3, $16
/* D0DAC 001D0CAC 000061C4 */  lwc1       $f1, 0x0($3)
/* D0DB0 001D0CB0 D701033C */  lui        $3, %hi(D_1D6B624)
/* D0DB4 001D0CB4 24B66324 */  addiu      $3, $3, %lo(D_1D6B624)
/* D0DB8 001D0CB8 21187000 */  addu       $3, $3, $16
/* D0DBC 001D0CBC 000060C4 */  lwc1       $f0, 0x0($3)
/* D0DC0 001D0CC0 C89C878F */  lw         $7, -0x6338($gp)
/* D0DC4 001D0CC4 C0180600 */  sll        $3, $6, 3
/* D0DC8 001D0CC8 23186600 */  subu       $3, $3, $6
/* D0DCC 001D0CCC 80180300 */  sll        $3, $3, 2
/* D0DD0 001D0CD0 21186600 */  addu       $3, $3, $6
/* D0DD4 001D0CD4 00190300 */  sll        $3, $3, 4
/* D0DD8 001D0CD8 21386700 */  addu       $7, $3, $7
/* D0DDC 001D0CDC A204E384 */  lh         $3, 0x4A2($7)
/* D0DE0 001D0CE0 06006128 */  slti       $at, $3, 0x6
/* D0DE4 001D0CE4 13002010 */  beqz       $at, .L001D0D34
/* D0DE8 001D0CE8 00000000 */   nop
/* D0DEC 001D0CEC 00190300 */  sll        $3, $3, 4
/* D0DF0 001D0CF0 21186700 */  addu       $3, $3, $7
/* D0DF4 001D0CF4 B00460E4 */  swc1       $f0, 0x4B0($3)
/* D0DF8 001D0CF8 A204E384 */  lh         $3, 0x4A2($7)
/* D0DFC 001D0CFC 00190300 */  sll        $3, $3, 4
/* D0E00 001D0D00 21186700 */  addu       $3, $3, $7
/* D0E04 001D0D04 B40461E4 */  swc1       $f1, 0x4B4($3)
/* D0E08 001D0D08 A204E384 */  lh         $3, 0x4A2($7)
/* D0E0C 001D0D0C 00190300 */  sll        $3, $3, 4
/* D0E10 001D0D10 21186700 */  addu       $3, $3, $7
/* D0E14 001D0D14 B80462E4 */  swc1       $f2, 0x4B8($3)
/* D0E18 001D0D18 03000624 */  addiu      $6, $0, 0x3
/* D0E1C 001D0D1C A204E384 */  lh         $3, 0x4A2($7)
/* D0E20 001D0D20 21186700 */  addu       $3, $3, $7
/* D0E24 001D0D24 100566A0 */  sb         $6, 0x510($3)
/* D0E28 001D0D28 A204E384 */  lh         $3, 0x4A2($7)
/* D0E2C 001D0D2C 01006324 */  addiu      $3, $3, 0x1
/* D0E30 001D0D30 A204E3A4 */  sh         $3, 0x4A2($7)
.L001D0D34:
/* D0E34 001D0D34 01007326 */  addiu      $19, $19, 0x1
.L001D0D38:
/* D0E38 001D0D38 0C94838F */  lw         $3, -0x6BF4($gp)
/* D0E3C 001D0D3C 2A186302 */  slt        $3, $19, $3
/* D0E40 001D0D40 66F76014 */  bnez       $3, .L001CEADC
/* D0E44 001D0D44 00000000 */   nop
/* D0E48 001D0D48 B000BF7B */  lq         $31, 0xB0($sp)
/* D0E4C 001D0D4C A000BE7B */  lq         $fp, 0xA0($sp)
/* D0E50 001D0D50 9000B77B */  lq         $23, 0x90($sp)
/* D0E54 001D0D54 8000B67B */  lq         $22, 0x80($sp)
/* D0E58 001D0D58 7000B57B */  lq         $21, 0x70($sp)
/* D0E5C 001D0D5C 6000B47B */  lq         $20, 0x60($sp)
/* D0E60 001D0D60 5000B37B */  lq         $19, 0x50($sp)
/* D0E64 001D0D64 4000B27B */  lq         $18, 0x40($sp)
/* D0E68 001D0D68 3000B17B */  lq         $17, 0x30($sp)
/* D0E6C 001D0D6C 2000B07B */  lq         $16, 0x20($sp)
/* D0E70 001D0D70 1800B6C7 */  lwc1       $f22, 0x18($sp)
/* D0E74 001D0D74 1400B5C7 */  lwc1       $f21, 0x14($sp)
/* D0E78 001D0D78 1000B4C7 */  lwc1       $f20, 0x10($sp)
/* D0E7C 001D0D7C 9003BD27 */  addiu      $sp, $sp, 0x390
/* D0E80 001D0D80 0800E003 */  jr         $31
/* D0E84 001D0D84 00000000 */   nop
/* D0E88 001D0D88 00000000 */  nop
/* D0E8C 001D0D8C 00000000 */  nop
