.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel PauseProcess__Fv
/* 003F50 01DAFC50 F0FFBD27 */  addiu       $29, $29, -0x10
/* 003F54 01DAFC54 0000BF7F */  sq          $31, 0x0($29)
/* 003F58 01DAFC58 3C988283 */  lb          $2, -0x67C4($28)
/* 003F5C 01DAFC5C 04004014 */  bnez        $2, .L01DAFC70_2B5470
/* 003F60 01DAFC60 00000000 */   nop
/* 003F64 01DAFC64 389880AF */  sw          $0, -0x67C8($28)
/* 003F68 01DAFC68 01000224 */  addiu       $2, $0, 0x1
/* 003F6C 01DAFC6C 3C9882A3 */  sb          $2, -0x67C4($28)
.L01DAFC70_2B5470:
/* 003F70 01DAFC70 E101023C */  lui         $2, %hi(DispFade)
/* 003F74 01DAFC74 B0E54424 */  addiu       $4, $2, %lo(DispFade)
/* 003F78 01DAFC78 90B4760C */  jal         GetRate__9CDispFadeFv
/* 003F7C 01DAFC7C 00000000 */   nop
/* 003F80 01DAFC80 06030046 */  mov.s       $f12, $f0
/* 003F84 01DAFC84 9044040C */  jal         fptodp
/* 003F88 01DAFC88 00000000 */   nop
/* 003F8C 01DAFC8C 28260070 */  paddub      $4, $0, $0
/* 003F90 01DAFC90 282E4070 */  paddub      $5, $2, $0
/* 003F94 01DAFC94 3C00040C */  jal         _dpfne
/* 003F98 01DAFC98 00000000 */   nop
/* 003F9C 01DAFC9C 88004014 */  bnez        $2, .L01DAFEC0_2B56C0
/* 003FA0 01DAFCA0 00000000 */   nop
/* 003FA4 01DAFCA4 3898838F */  lw          $3, -0x67C8($28)
/* 003FA8 01DAFCA8 83006014 */  bnez        $3, .L01DAFEB8_2B56B8
/* 003FAC 01DAFCAC 00000000 */   nop
/* 003FB0 01DAFCB0 24988393 */  lbu         $3, -0x67DC($28)
/* 003FB4 01DAFCB4 82006014 */  bnez        $3, .L01DAFEC0_2B56C0
/* 003FB8 01DAFCB8 00000000 */   nop
/* 003FBC 01DAFCBC 0898848F */  lw          $4, -0x67F8($28)
/* 003FC0 01DAFCC0 35008014 */  bnez        $4, .L01DAFD98_2B5598
/* 003FC4 01DAFCC4 00000000 */   nop
/* 003FC8 01DAFCC8 CC01023C */  lui         $2, %hi(GamePad)
/* 003FCC 01DAFCCC 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 003FD0 01DAFCD0 00080524 */  addiu       $5, $0, 0x800
/* 003FD4 01DAFCD4 1CAE040C */  jal         Down__8CGamePadFi
/* 003FD8 01DAFCD8 00000000 */   nop
/* 003FDC 01DAFCDC 78004010 */  beqz        $2, .L01DAFEC0_2B56C0
/* 003FE0 01DAFCE0 00000000 */   nop
/* 003FE4 01DAFCE4 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 003FE8 01DAFCE8 282E0070 */  paddub      $5, $0, $0
/* 003FEC 01DAFCEC 441A050C */  jal         Stop__6CSoundFi
/* 003FF0 01DAFCF0 00000000 */   nop
/* 003FF4 01DAFCF4 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 003FF8 01DAFCF8 181B228C */  lw          $2, %lo(CScript__2 + 0x18)($1)
/* 003FFC 01DAFCFC 05004010 */  beqz        $2, .L01DAFD14_2B5514
/* 004000 01DAFD00 00000000 */   nop
/* 004004 01DAFD04 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 004008 01DAFD08 01000524 */  addiu       $5, $0, 0x1
/* 00400C 01DAFD0C 441A050C */  jal         Stop__6CSoundFi
/* 004010 01DAFD10 00000000 */   nop
.L01DAFD14_2B5514:
/* 004014 01DAFD14 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 004018 01DAFD18 0F000524 */  addiu       $5, $0, 0xF
/* 00401C 01DAFD1C 28360070 */  paddub      $6, $0, $0
/* 004020 01DAFD20 581A050C */  jal         SetVol__6CSoundFii
/* 004024 01DAFD24 00000000 */   nop
/* 004028 01DAFD28 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00402C 01DAFD2C 0E000524 */  addiu       $5, $0, 0xE
/* 004030 01DAFD30 28360070 */  paddub      $6, $0, $0
/* 004034 01DAFD34 581A050C */  jal         SetVol__6CSoundFii
/* 004038 01DAFD38 00000000 */   nop
/* 00403C 01DAFD3C 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 004040 01DAFD40 0D000524 */  addiu       $5, $0, 0xD
/* 004044 01DAFD44 28360070 */  paddub      $6, $0, $0
/* 004048 01DAFD48 581A050C */  jal         SetVol__6CSoundFii
/* 00404C 01DAFD4C 00000000 */   nop
/* 004050 01DAFD50 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 004054 01DAFD54 0C000524 */  addiu       $5, $0, 0xC
/* 004058 01DAFD58 28360070 */  paddub      $6, $0, $0
/* 00405C 01DAFD5C 581A050C */  jal         SetVol__6CSoundFii
/* 004060 01DAFD60 00000000 */   nop
/* 004064 01DAFD64 01000324 */  addiu       $3, $0, 0x1
/* 004068 01DAFD68 089883AF */  sw          $3, -0x67F8($28)
/* 00406C 01DAFD6C 389880AF */  sw          $0, -0x67C8($28)
/* 004070 01DAFD70 0498848F */  lw          $4, -0x67FC($28)
/* 004074 01DAFD74 B0110324 */  addiu       $3, $0, 0x11B0
/* 004078 01DAFD78 18208300 */  mult        $4, $4, $3
/* 00407C 01DAFD7C E101033C */  lui         $3, %hi(Cam__2 + 0x2F0)
/* 004080 01DAFD80 C09B6324 */  addiu       $3, $3, %lo(Cam__2 + 0x2F0)
/* 004084 01DAFD84 21186400 */  addu        $3, $3, $4
/* 004088 01DAFD88 000060C4 */  lwc1        $f0, 0x0($3)
/* 00408C 01DAFD8C 209880E7 */  swc1        $f0, -0x67E0($28)
/* 004090 01DAFD90 4B000010 */  b           .L01DAFEC0_2B56C0
/* 004094 01DAFD94 00000000 */   nop
.L01DAFD98_2B5598:
/* 004098 01DAFD98 01000324 */  addiu       $3, $0, 0x1
/* 00409C 01DAFD9C 48008314 */  bne         $4, $3, .L01DAFEC0_2B56C0
/* 0040A0 01DAFDA0 00000000 */   nop
/* 0040A4 01DAFDA4 CC01023C */  lui         $2, %hi(GamePad)
/* 0040A8 01DAFDA8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0040AC 01DAFDAC 20000524 */  addiu       $5, $0, 0x20
/* 0040B0 01DAFDB0 1CAE040C */  jal         Down__8CGamePadFi
/* 0040B4 01DAFDB4 00000000 */   nop
/* 0040B8 01DAFDB8 29004010 */  beqz        $2, .L01DAFE60_2B5660
/* 0040BC 01DAFDBC 00000000 */   nop
/* 0040C0 01DAFDC0 01000224 */  addiu       $2, $0, 0x1
/* 0040C4 01DAFDC4 389882AF */  sw          $2, -0x67C8($28)
/* 0040C8 01DAFDC8 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0040CC 01DAFDCC 0F000524 */  addiu       $5, $0, 0xF
/* 0040D0 01DAFDD0 00010624 */  addiu       $6, $0, 0x100
/* 0040D4 01DAFDD4 581A050C */  jal         SetVol__6CSoundFii
/* 0040D8 01DAFDD8 00000000 */   nop
/* 0040DC 01DAFDDC 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0040E0 01DAFDE0 0E000524 */  addiu       $5, $0, 0xE
/* 0040E4 01DAFDE4 00010624 */  addiu       $6, $0, 0x100
/* 0040E8 01DAFDE8 581A050C */  jal         SetVol__6CSoundFii
/* 0040EC 01DAFDEC 00000000 */   nop
/* 0040F0 01DAFDF0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0040F4 01DAFDF4 0D000524 */  addiu       $5, $0, 0xD
/* 0040F8 01DAFDF8 00010624 */  addiu       $6, $0, 0x100
/* 0040FC 01DAFDFC 581A050C */  jal         SetVol__6CSoundFii
/* 004100 01DAFE00 00000000 */   nop
/* 004104 01DAFE04 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 004108 01DAFE08 0C000524 */  addiu       $5, $0, 0xC
/* 00410C 01DAFE0C 00010624 */  addiu       $6, $0, 0x100
/* 004110 01DAFE10 581A050C */  jal         SetVol__6CSoundFii
/* 004114 01DAFE14 00000000 */   nop
/* 004118 01DAFE18 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 00411C 01DAFE1C 181B238C */  lw          $3, %lo(CScript__2 + 0x18)($1)
/* 004120 01DAFE20 05006010 */  beqz        $3, .L01DAFE38_2B5638
/* 004124 01DAFE24 00000000 */   nop
/* 004128 01DAFE28 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00412C 01DAFE2C 01000524 */  addiu       $5, $0, 0x1
/* 004130 01DAFE30 6815050C */  jal         SQ_RePlay__6CSoundFi
/* 004134 01DAFE34 00000000 */   nop
.L01DAFE38_2B5638:
/* 004138 01DAFE38 FC97848F */  lw          $4, -0x6804($28)
/* 00413C 01DAFE3C FFFF0324 */  addiu       $3, $0, -0x1
/* 004140 01DAFE40 1F008310 */  beq         $4, $3, .L01DAFEC0_2B56C0
/* 004144 01DAFE44 00000000 */   nop
/* 004148 01DAFE48 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00414C 01DAFE4C 282E0070 */  paddub      $5, $0, $0
/* 004150 01DAFE50 6815050C */  jal         SQ_RePlay__6CSoundFi
/* 004154 01DAFE54 00000000 */   nop
/* 004158 01DAFE58 19000010 */  b           .L01DAFEC0_2B56C0
/* 00415C 01DAFE5C 00000000 */   nop
.L01DAFE60_2B5660:
/* 004160 01DAFE60 CC01023C */  lui         $2, %hi(GamePad)
/* 004164 01DAFE64 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 004168 01DAFE68 40000524 */  addiu       $5, $0, 0x40
/* 00416C 01DAFE6C 1CAE040C */  jal         Down__8CGamePadFi
/* 004170 01DAFE70 00000000 */   nop
/* 004174 01DAFE74 12004010 */  beqz        $2, .L01DAFEC0_2B56C0
/* 004178 01DAFE78 00000000 */   nop
.L01DAFE7C_2B567C:
/* 00417C 01DAFE7C 8CFB040C */  jal         ReadBGSync__Fv
/* 004180 01DAFE80 00000000 */   nop
/* 004184 01DAFE84 FDFF4014 */  bnez        $2, .L01DAFE7C_2B567C
/* 004188 01DAFE88 00000000 */   nop
/* 00418C 01DAFE8C 01000224 */  addiu       $2, $0, 0x1
/* 004190 01DAFE90 249882A3 */  sb          $2, -0x67DC($28)
/* 004194 01DAFE94 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 004198 01DAFE98 00608244 */  mtc1        $2, $f12
/* 00419C 01DAFE9C E101023C */  lui         $2, %hi(DispFade)
/* 0041A0 01DAFEA0 B0E54424 */  addiu       $4, $2, %lo(DispFade)
/* 0041A4 01DAFEA4 282E0070 */  paddub      $5, $0, $0
/* 0041A8 01DAFEA8 78B4760C */  jal         FadeOutStart__9CDispFadeFfi
/* 0041AC 01DAFEAC 00000000 */   nop
/* 0041B0 01DAFEB0 03000010 */  b           .L01DAFEC0_2B56C0
/* 0041B4 01DAFEB4 00000000 */   nop
.L01DAFEB8_2B56B8:
/* 0041B8 01DAFEB8 389880AF */  sw          $0, -0x67C8($28)
/* 0041BC 01DAFEBC 089880AF */  sw          $0, -0x67F8($28)
.L01DAFEC0_2B56C0:
/* 0041C0 01DAFEC0 0000BF7B */  lq          $31, 0x0($29)
/* 0041C4 01DAFEC4 1000BD27 */  addiu       $29, $29, 0x10
/* 0041C8 01DAFEC8 0800E003 */  jr          $31
/* 0041CC 01DAFECC 00000000 */   nop
