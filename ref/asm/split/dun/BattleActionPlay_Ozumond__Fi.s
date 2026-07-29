.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BattleActionPlay_Ozumond__Fi
/* 011FF0 01DBDCF0 90FFBD27 */  addiu       $29, $29, -0x70
/* 011FF4 01DBDCF4 3000BF7F */  sq          $31, 0x30($29)
/* 011FF8 01DBDCF8 2000B17F */  sq          $17, 0x20($29)
/* 011FFC 01DBDCFC 1000B07F */  sq          $16, 0x10($29)
/* 012000 01DBDD00 0000B4E7 */  swc1        $f20, 0x0($29)
/* 012004 01DBDD04 288E8070 */  paddub      $17, $4, $0
/* 012008 01DBDD08 049D848F */  lw          $4, -0x62FC($28)
/* 01200C 01DBDD0C 04008284 */  lh          $2, 0x4($4)
/* 012010 01DBDD10 43180200 */  sra         $3, $2, 1
/* 012014 01DBDD14 0A008284 */  lh          $2, 0xA($4)
/* 012018 01DBDD18 43100200 */  sra         $2, $2, 1
/* 01201C 01DBDD1C 21806200 */  addu        $16, $3, $2
/* 012020 01DBDD20 08000424 */  addiu       $4, $0, 0x8
/* 012024 01DBDD24 4CC6060C */  jal         StatusErrCheck__Fi
/* 012028 01DBDD28 00000000 */   nop
/* 01202C 01DBDD2C 02004010 */  beqz        $2, .L01DBDD38_2F9338
/* 012030 01DBDD30 00000000 */   nop
/* 012034 01DBDD34 40801000 */  sll         $16, $16, 1
.L01DBDD38_2F9338:
/* 012038 01DBDD38 049D838F */  lw          $3, -0x62FC($28)
/* 01203C 01DBDD3C 08006384 */  lh          $3, 0x8($3)
/* 012040 01DBDD40 00008344 */  mtc1        $3, $f0
/* 012044 01DBDD44 00000000 */  nop
/* 012048 01DBDD48 60008046 */  cvt.s.w     $f1, $f0
/* 01204C 01DBDD4C 148480C7 */  lwc1        $f0, -0x7BEC($28)
/* 012050 01DBDD50 42000146 */  mul.s       $f1, $f0, $f1
/* 012054 01DBDD54 C03F033C */  lui         $3, (0x3FC00000 >> 16)
/* 012058 01DBDD58 00008344 */  mtc1        $3, $f0
/* 01205C 01DBDD5C 00000000 */  nop
/* 012060 01DBDD60 01050146 */  sub.s       $f20, $f0, $f1
/* 012064 01DBDD64 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 012068 01DBDD68 9444248C */  lw          $4, %lo(BtActStatus + 0x14)($1)
/* 01206C 01DBDD6C 0B000324 */  addiu       $3, $0, 0xB
/* 012070 01DBDD70 C9008314 */  bne         $4, $3, .L01DBE098_2F9698
/* 012074 01DBDD74 00000000 */   nop
/* 012078 01DBDD78 CC01023C */  lui         $2, %hi(GamePad)
/* 01207C 01DBDD7C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 012080 01DBDD80 9C9C858F */  lw          $5, -0x6364($28)
/* 012084 01DBDD84 04AE040C */  jal         On__8CGamePadFi
/* 012088 01DBDD88 00000000 */   nop
/* 01208C 01DBDD8C 04004014 */  bnez        $2, .L01DBDDA0_2F93A0
/* 012090 01DBDD90 00000000 */   nop
/* 012094 01DBDD94 01000224 */  addiu       $2, $0, 0x1
/* 012098 01DBDD98 DC01013C */  lui         $1, %hi(BtActStatus + 0x18)
/* 01209C 01DBDD9C 984422AC */  sw          $2, %lo(BtActStatus + 0x18)($1)
.L01DBDDA0_2F93A0:
/* 0120A0 01DBDDA0 90010424 */  addiu       $4, $0, 0x190
/* 0120A4 01DBDDA4 05000524 */  addiu       $5, $0, 0x5
/* 0120A8 01DBDDA8 28360070 */  paddub      $6, $0, $0
/* 0120AC 01DBDDAC C86B050C */  jal         SndSeSeqPlayStop__Fiii
/* 0120B0 01DBDDB0 00000000 */   nop
/* 0120B4 01DBDDB4 DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 0120B8 01DBDDB8 C84420C4 */  lwc1        $f0, %lo(BtActStatus + 0x48)($1)
/* 0120BC 01DBDDBC 41001446 */  sub.s       $f1, $f0, $f20
/* 0120C0 01DBDDC0 DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 0120C4 01DBDDC4 C84421E4 */  swc1        $f1, %lo(BtActStatus + 0x48)($1)
/* 0120C8 01DBDDC8 00008044 */  mtc1        $0, $f0
/* 0120CC 01DBDDCC 00000000 */  nop
/* 0120D0 01DBDDD0 36080046 */  c.le.s      $f1, $f0
/* 0120D4 01DBDDD4 00000000 */  nop
/* 0120D8 01DBDDD8 10000045 */  bc1f        .L01DBDE1C_2F941C
/* 0120DC 01DBDDDC 00000000 */   nop
/* 0120E0 01DBDDE0 DC01013C */  lui         $1, %hi(BtActStatus + 0x28)
/* 0120E4 01DBDDE4 A84420AC */  sw          $0, %lo(BtActStatus + 0x28)($1)
/* 0120E8 01DBDDE8 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0120EC 01DBDDEC 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 0120F0 01DBDDF0 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 0120F4 01DBDDF4 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 0120F8 01DBDDF8 01000224 */  addiu       $2, $0, 0x1
/* 0120FC 01DBDDFC DC01013C */  lui         $1, %hi(BtActStatus + 0xA4)
/* 012100 01DBDE00 244522AC */  sw          $2, %lo(BtActStatus + 0xA4)($1)
/* 012104 01DBDE04 989D828F */  lw          $2, -0x6268($28)
/* 012108 01DBDE08 04004010 */  beqz        $2, .L01DBDE1C_2F941C
/* 01210C 01DBDE0C 00000000 */   nop
/* 012110 01DBDE10 12000224 */  addiu       $2, $0, 0x12
/* 012114 01DBDE14 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 012118 01DBDE18 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
.L01DBDE1C_2F941C:
/* 01211C 01DBDE1C 0B000224 */  addiu       $2, $0, 0xB
/* 012120 01DBDE20 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 012124 01DBDE24 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 012128 01DBDE28 0E002016 */  bnez        $17, .L01DBDE64_2F9464
/* 01212C 01DBDE2C 00000000 */   nop
/* 012130 01DBDE30 009D828F */  lw          $2, -0x6300($28)
/* 012134 01DBDE34 BC00448C */  lw          $4, 0xBC($2)
/* 012138 01DBDE38 DC01023C */  lui         $2, %hi(LIT_4408)
/* 01213C 01DBDE3C 982F4524 */  addiu       $5, $2, %lo(LIT_4408)
/* 012140 01DBDE40 4000A627 */  addiu       $6, $29, 0x40
/* 012144 01DBDE44 CCDB060C */  jal         getFramePos__FP9CFrameVu1PcPf
/* 012148 01DBDE48 00000000 */   nop
/* 01214C 01DBDE4C 00608044 */  mtc1        $0, $f12
/* 012150 01DBDE50 5000A427 */  addiu       $4, $29, 0x50
/* 012154 01DBDE54 6850070C */  jal         getCharacterVector__FPff
/* 012158 01DBDE58 00000000 */   nop
/* 01215C 01DBDE5C 13000010 */  b           .L01DBDEAC_2F94AC
/* 012160 01DBDE60 00000000 */   nop
.L01DBDE64_2F9464:
/* 012164 01DBDE64 6040023C */  lui         $2, (0x40600000 >> 16)
/* 012168 01DBDE68 00608244 */  mtc1        $2, $f12
/* 01216C 01DBDE6C 5000A427 */  addiu       $4, $29, 0x50
/* 012170 01DBDE70 AC9C8DC7 */  lwc1        $f13, -0x6354($28)
/* 012174 01DBDE74 B09C8EC7 */  lwc1        $f14, -0x6350($28)
/* 012178 01DBDE78 4050070C */  jal         setShotVector__FPffff
/* 01217C 01DBDE7C 00000000 */   nop
/* 012180 01DBDE80 4000A427 */  addiu       $4, $29, 0x40
/* 012184 01DBDE84 EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 012188 01DBDE88 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 01218C 01DBDE8C 0C86040C */  jal         sceVu0CopyVector
/* 012190 01DBDE90 00000000 */   nop
/* 012194 01DBDE94 4400A1C7 */  lwc1        $f1, 0x44($29)
/* 012198 01DBDE98 2041023C */  lui         $2, (0x41200000 >> 16)
/* 01219C 01DBDE9C 00008244 */  mtc1        $2, $f0
/* 0121A0 01DBDEA0 00000000 */  nop
/* 0121A4 01DBDEA4 00080046 */  add.s       $f0, $f1, $f0
/* 0121A8 01DBDEA8 4400A0E7 */  swc1        $f0, 0x44($29)
.L01DBDEAC_2F94AC:
/* 0121AC 01DBDEAC 6000A427 */  addiu       $4, $29, 0x60
/* 0121B0 01DBDEB0 5000A527 */  addiu       $5, $29, 0x50
/* 0121B4 01DBDEB4 0C86040C */  jal         sceVu0CopyVector
/* 0121B8 01DBDEB8 00000000 */   nop
/* 0121BC 01DBDEBC 5000A0C7 */  lwc1        $f0, 0x50($29)
/* 0121C0 01DBDEC0 4000A1C7 */  lwc1        $f1, 0x40($29)
/* 0121C4 01DBDEC4 00000146 */  add.s       $f0, $f0, $f1
/* 0121C8 01DBDEC8 5000A0E7 */  swc1        $f0, 0x50($29)
/* 0121CC 01DBDECC 5400A0C7 */  lwc1        $f0, 0x54($29)
/* 0121D0 01DBDED0 4400A2C7 */  lwc1        $f2, 0x44($29)
/* 0121D4 01DBDED4 00000246 */  add.s       $f0, $f0, $f2
/* 0121D8 01DBDED8 5400A0E7 */  swc1        $f0, 0x54($29)
/* 0121DC 01DBDEDC 5800A0C7 */  lwc1        $f0, 0x58($29)
/* 0121E0 01DBDEE0 4800A3C7 */  lwc1        $f3, 0x48($29)
/* 0121E4 01DBDEE4 00000346 */  add.s       $f0, $f0, $f3
/* 0121E8 01DBDEE8 5800A0E7 */  swc1        $f0, 0x58($29)
/* 0121EC 01DBDEEC 989D838F */  lw          $3, -0x6268($28)
/* 0121F0 01DBDEF0 0D006010 */  beqz        $3, .L01DBDF28_2F9528
/* 0121F4 01DBDEF4 00000000 */   nop
/* 0121F8 01DBDEF8 DC01013C */  lui         $1, %hi(BtActStatus + 0x80)
/* 0121FC 01DBDEFC 004520C4 */  lwc1        $f0, %lo(BtActStatus + 0x80)($1)
/* 012200 01DBDF00 01000146 */  sub.s       $f0, $f0, $f1
/* 012204 01DBDF04 6000A0E7 */  swc1        $f0, 0x60($29)
/* 012208 01DBDF08 DC01013C */  lui         $1, %hi(BtActStatus + 0x84)
/* 01220C 01DBDF0C 044520C4 */  lwc1        $f0, %lo(BtActStatus + 0x84)($1)
/* 012210 01DBDF10 01000246 */  sub.s       $f0, $f0, $f2
/* 012214 01DBDF14 6400A0E7 */  swc1        $f0, 0x64($29)
/* 012218 01DBDF18 DC01013C */  lui         $1, %hi(BtActStatus + 0x88)
/* 01221C 01DBDF1C 084520C4 */  lwc1        $f0, %lo(BtActStatus + 0x88)($1)
/* 012220 01DBDF20 01000346 */  sub.s       $f0, $f0, $f3
/* 012224 01DBDF24 6800A0E7 */  swc1        $f0, 0x68($29)
.L01DBDF28_2F9528:
/* 012228 01DBDF28 B89E8383 */  lb          $3, -0x6148($28)
/* 01222C 01DBDF2C 04006014 */  bnez        $3, .L01DBDF40_2F9540
/* 012230 01DBDF30 00000000 */   nop
/* 012234 01DBDF34 B49E80AF */  sw          $0, -0x614C($28)
/* 012238 01DBDF38 01000324 */  addiu       $3, $0, 0x1
/* 01223C 01DBDF3C B89E83A3 */  sb          $3, -0x6148($28)
.L01DBDF40_2F9540:
/* 012240 01DBDF40 B49E838F */  lw          $3, -0x614C($28)
/* 012244 01DBDF44 01006324 */  addiu       $3, $3, 0x1
/* 012248 01DBDF48 B49E83AF */  sw          $3, -0x614C($28)
/* 01224C 01DBDF4C B49E838F */  lw          $3, -0x614C($28)
/* 012250 01DBDF50 0A006328 */  slti        $3, $3, 0xA
/* 012254 01DBDF54 14006014 */  bnez        $3, .L01DBDFA8_2F95A8
/* 012258 01DBDF58 00000000 */   nop
/* 01225C 01DBDF5C B49E80AF */  sw          $0, -0x614C($28)
/* 012260 01DBDF60 11002016 */  bnez        $17, .L01DBDFA8_2F95A8
/* 012264 01DBDF64 00000000 */   nop
/* 012268 01DBDF68 009D828F */  lw          $2, -0x6300($28)
/* 01226C 01DBDF6C BC00448C */  lw          $4, 0xBC($2)
/* 012270 01DBDF70 DC01023C */  lui         $2, %hi(LIT_4408)
/* 012274 01DBDF74 982F4524 */  addiu       $5, $2, %lo(LIT_4408)
/* 012278 01DBDF78 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 01227C 01DBDF7C 00000000 */   nop
/* 012280 01DBDF80 FC9C848F */  lw          $4, -0x6304($28)
/* 012284 01DBDF84 4000A527 */  addiu       $5, $29, 0x40
/* 012288 01DBDF88 5000A627 */  addiu       $6, $29, 0x50
/* 01228C 01DBDF8C FFFF0724 */  addiu       $7, $0, -0x1
/* 012290 01DBDF90 2846E070 */  paddub      $8, $7, $0
/* 012294 01DBDF94 284E0070 */  paddub      $9, $0, $0
/* 012298 01DBDF98 28564070 */  paddub      $10, $2, $0
/* 01229C 01DBDF9C 285EE070 */  paddub      $11, $7, $0
/* 0122A0 01DBDFA0 58B7060C */  jal         Set__12CSHOT_EFFECTFPfPfiiiP6CFramei
/* 0122A4 01DBDFA4 00000000 */   nop
.L01DBDFA8_2F95A8:
/* 0122A8 01DBDFA8 C09E8383 */  lb          $3, -0x6140($28)
/* 0122AC 01DBDFAC 04006014 */  bnez        $3, .L01DBDFC0_2F95C0
/* 0122B0 01DBDFB0 00000000 */   nop
/* 0122B4 01DBDFB4 BC9E80AF */  sw          $0, -0x6144($28)
/* 0122B8 01DBDFB8 01000324 */  addiu       $3, $0, 0x1
/* 0122BC 01DBDFBC C09E83A3 */  sb          $3, -0x6140($28)
.L01DBDFC0_2F95C0:
/* 0122C0 01DBDFC0 BC9E838F */  lw          $3, -0x6144($28)
/* 0122C4 01DBDFC4 01006324 */  addiu       $3, $3, 0x1
/* 0122C8 01DBDFC8 BC9E83AF */  sw          $3, -0x6144($28)
/* 0122CC 01DBDFCC BC9E838F */  lw          $3, -0x6144($28)
/* 0122D0 01DBDFD0 0A006328 */  slti        $3, $3, 0xA
/* 0122D4 01DBDFD4 1B006014 */  bnez        $3, .L01DBE044_2F9644
/* 0122D8 01DBDFD8 00000000 */   nop
/* 0122DC 01DBDFDC BC9E80AF */  sw          $0, -0x6144($28)
/* 0122E0 01DBDFE0 6000A427 */  addiu       $4, $29, 0x60
/* 0122E4 01DBDFE4 282E8070 */  paddub      $5, $4, $0
/* 0122E8 01DBDFE8 9285040C */  jal         sceVu0Normalize
/* 0122EC 01DBDFEC 00000000 */   nop
/* 0122F0 01DBDFF0 2041023C */  lui         $2, (0x41200000 >> 16)
/* 0122F4 01DBDFF4 00608244 */  mtc1        $2, $f12
/* 0122F8 01DBDFF8 6000A427 */  addiu       $4, $29, 0x60
/* 0122FC 01DBDFFC 282E8070 */  paddub      $5, $4, $0
/* 012300 01DBE000 4688040C */  jal         sceVu0ScaleVectorXYZ
/* 012304 01DBE004 00000000 */   nop
/* 012308 01DBE008 F001023C */  lui         $2, %hi(OzumondShot)
/* 01230C 01DBE00C 30B04424 */  addiu       $4, $2, %lo(OzumondShot)
/* 012310 01DBE010 4000A527 */  addiu       $5, $29, 0x40
/* 012314 01DBE014 6000A627 */  addiu       $6, $29, 0x60
/* 012318 01DBE018 283E0072 */  paddub      $7, $16, $0
/* 01231C 01DBE01C 28460070 */  paddub      $8, $0, $0
/* 012320 01DBE020 98B9060C */  jal         Set__15CSHOT_MACHINGUNFPfPfii
/* 012324 01DBE024 00000000 */   nop
/* 012328 01DBE028 DC01013C */  lui         $1, %hi(BtActStatus + 0xE0)
/* 01232C 01DBE02C 604520AC */  sw          $0, %lo(BtActStatus + 0xE0)($1)
/* 012330 01DBE030 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 012334 01DBE034 00608244 */  mtc1        $2, $f12
/* 012338 01DBE038 28260070 */  paddub      $4, $0, $0
/* 01233C 01DBE03C CCE6760C */  jal         SwordDmgCheck1__Ffi
/* 012340 01DBE040 00000000 */   nop
.L01DBE044_2F9644:
/* 012344 01DBE044 DC01013C */  lui         $1, %hi(BtActStatus + 0x18)
/* 012348 01DBE048 9844248C */  lw          $4, %lo(BtActStatus + 0x18)($1)
/* 01234C 01DBE04C 01000324 */  addiu       $3, $0, 0x1
/* 012350 01DBE050 11008314 */  bne         $4, $3, .L01DBE098_2F9698
/* 012354 01DBE054 00000000 */   nop
/* 012358 01DBE058 DC01013C */  lui         $1, %hi(BtActStatus + 0x28)
/* 01235C 01DBE05C A84420AC */  sw          $0, %lo(BtActStatus + 0x28)($1)
/* 012360 01DBE060 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 012364 01DBE064 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 012368 01DBE068 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 01236C 01DBE06C 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 012370 01DBE070 989D828F */  lw          $2, -0x6268($28)
/* 012374 01DBE074 04004010 */  beqz        $2, .L01DBE088_2F9688
/* 012378 01DBE078 00000000 */   nop
/* 01237C 01DBE07C 12000224 */  addiu       $2, $0, 0x12
/* 012380 01DBE080 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 012384 01DBE084 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
.L01DBE088_2F9688:
/* 012388 01DBE088 FC9C848F */  lw          $4, -0x6304($28)
/* 01238C 01DBE08C FFFF0524 */  addiu       $5, $0, -0x1
/* 012390 01DBE090 04B3060C */  jal         OffEffect__12CSHOT_EFFECTFi
/* 012394 01DBE094 00000000 */   nop
.L01DBE098_2F9698:
/* 012398 01DBE098 3000BF7B */  lq          $31, 0x30($29)
/* 01239C 01DBE09C 2000B17B */  lq          $17, 0x20($29)
/* 0123A0 01DBE0A0 1000B07B */  lq          $16, 0x10($29)
/* 0123A4 01DBE0A4 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0123A8 01DBE0A8 7000BD27 */  addiu       $29, $29, 0x70
/* 0123AC 01DBE0AC 0800E003 */  jr          $31
/* 0123B0 01DBE0B0 00000000 */   nop
/* 0123B4 01DBE0B4 00000000 */  nop
/* 0123B8 01DBE0B8 00000000 */  nop
/* 0123BC 01DBE0BC 00000000 */  nop
