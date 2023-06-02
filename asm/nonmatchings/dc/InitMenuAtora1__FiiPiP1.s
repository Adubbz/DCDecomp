.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitMenuAtora1__FiiPiP1
/* 11A230 0021A130 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 11A234 0021A134 3000BF7F */  sq         $31, 0x30($sp)
/* 11A238 0021A138 2000B27F */  sq         $18, 0x20($sp)
/* 11A23C 0021A13C 1000B17F */  sq         $17, 0x10($sp)
/* 11A240 0021A140 0000B07F */  sq         $16, 0x0($sp)
/* 11A244 0021A144 2886A070 */  paddub     $16, $5, $0
/* 11A248 0021A148 2896C070 */  paddub     $18, $6, $0
/* 11A24C 0021A14C 288EE070 */  paddub     $17, $7, $0
/* 11A250 0021A150 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A254 0021A154 D48024AC */  sw         $4, -0x7F2C($at)
/* 11A258 0021A158 1C8D848F */  lw         $4, -0x72E4($gp)
/* 11A25C 0021A15C 7860050C */  jal        GetDngStatus__9CSaveDataFv
/* 11A260 0021A160 00000000 */   nop
/* 11A264 0021A164 03000726 */  addiu      $7, $16, 0x3
/* 11A268 0021A168 28264070 */  paddub     $4, $2, $0
/* 11A26C 0021A16C DB01023C */  lui        $2, %hi(D_1DA80E4)
/* 11A270 0021A170 E4804524 */  addiu      $5, $2, %lo(D_1DA80E4)
/* 11A274 0021A174 02000624 */  addiu      $6, $0, 0x2
/* 11A278 0021A178 D0B9080C */  jal        InitPersonalBoardMode__FP11CUserStatusP14PERSONAL_BOARDii
/* 11A27C 0021A17C 00000000 */   nop
/* 11A280 0021A180 DA01013C */  lui        $at, (0x1DA3AF0 >> 16)
/* 11A284 0021A184 F03A228C */  lw         $2, (0x1DA3AF0 & 0xFFFF)($at)
/* 11A288 0021A188 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A28C 0021A18C 748222AC */  sw         $2, -0x7D8C($at)
/* 11A290 0021A190 0000428E */  lw         $2, 0x0($18)
/* 11A294 0021A194 EC9682AF */  sw         $2, -0x6914($gp)
/* 11A298 0021A198 0400428E */  lw         $2, 0x4($18)
/* 11A29C 0021A19C F09682AF */  sw         $2, -0x6910($gp)
/* 11A2A0 0021A1A0 F49691AF */  sw         $17, -0x690C($gp)
/* 11A2A4 0021A1A4 28262072 */  paddub     $4, $17, $0
/* 11A2A8 0021A1A8 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 11A2AC 0021A1AC 00000000 */   nop
/* 11A2B0 0021A1B0 F49682AF */  sw         $2, -0x690C($gp)
/* 11A2B4 0021A1B4 E89680AF */  sw         $0, -0x6918($gp)
/* 11A2B8 0021A1B8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A2BC 0021A1BC D88030AC */  sw         $16, -0x7F28($at)
/* 11A2C0 0021A1C0 DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* 11A2C4 0021A1C4 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* 11A2C8 0021A1C8 04000524 */  addiu      $5, $0, 0x4
/* 11A2CC 0021A1CC 9836050C */  jal        Preset__6ClsMesFi
/* 11A2D0 0021A1D0 00000000 */   nop
/* 11A2D4 0021A1D4 DA01013C */  lui        $at, (0x1DA51D0 >> 16)
/* 11A2D8 0021A1D8 D05120AC */  sw         $0, (0x1DA51D0 & 0xFFFF)($at)
/* 11A2DC 0021A1DC DA01013C */  lui        $at, (0x1DA51D8 >> 16)
/* 11A2E0 0021A1E0 D85120AC */  sw         $0, (0x1DA51D8 & 0xFFFF)($at)
/* 11A2E4 0021A1E4 FFFF0224 */  addiu      $2, $0, -0x1
/* 11A2E8 0021A1E8 DA01013C */  lui        $at, (0x1DA3B64 >> 16)
/* 11A2EC 0021A1EC 643B22AC */  sw         $2, (0x1DA3B64 & 0xFFFF)($at)
/* 11A2F0 0021A1F0 DA01013C */  lui        $at, (0x1DA51CC >> 16)
/* 11A2F4 0021A1F4 CC5122AC */  sw         $2, (0x1DA51CC & 0xFFFF)($at)
/* 11A2F8 0021A1F8 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* 11A2FC 0021A1FC D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* 11A300 0021A200 04000524 */  addiu      $5, $0, 0x4
/* 11A304 0021A204 9836050C */  jal        Preset__6ClsMesFi
/* 11A308 0021A208 00000000 */   nop
/* 11A30C 0021A20C D001023C */  lui        $2, %hi(MesWinTexBuff_12)
/* 11A310 0021A210 408E4224 */  addiu      $2, $2, %lo(MesWinTexBuff_12)
/* 11A314 0021A214 DA01013C */  lui        $at, (0x1DA6A80 >> 16)
/* 11A318 0021A218 806A22AC */  sw         $2, (0x1DA6A80 & 0xFFFF)($at)
/* 11A31C 0021A21C DA01013C */  lui        $at, (0x1DA6A80 >> 16)
/* 11A320 0021A220 806A248C */  lw         $4, (0x1DA6A80 & 0xFFFF)($at)
/* 11A324 0021A224 282E0070 */  paddub     $5, $0, $0
/* 11A328 0021A228 00010624 */  addiu      $6, $0, 0x100
/* 11A32C 0021A22C 5A0D040C */  jal        memset
/* 11A330 0021A230 00000000 */   nop
/* 11A334 0021A234 04000224 */  addiu      $2, $0, 0x4
/* 11A338 0021A238 DA01013C */  lui        $at, (0x1DA52E4 >> 16)
/* 11A33C 0021A23C E45222AC */  sw         $2, (0x1DA52E4 & 0xFFFF)($at)
/* 11A340 0021A240 4800A427 */  addiu      $4, $sp, 0x48
/* 11A344 0021A244 508980C7 */  lwc1       $f0, -0x76B0($gp)
/* 11A348 0021A248 54898387 */  lh         $3, -0x76AC($gp)
/* 11A34C 0021A24C 56898293 */  lbu        $2, -0x76AA($gp)
/* 11A350 0021A250 000080E4 */  swc1       $f0, 0x0($4)
/* 11A354 0021A254 040083A4 */  sh         $3, 0x4($4)
/* 11A358 0021A258 060082A0 */  sb         $2, 0x6($4)
/* 11A35C 0021A25C 80AE080C */  jal        GetMenuLangFlag__Fv
/* 11A360 0021A260 00000000 */   nop
/* 11A364 0021A264 21105D00 */  addu       $2, $2, $sp
/* 11A368 0021A268 48004280 */  lb         $2, 0x48($2)
/* 11A36C 0021A26C DA01013C */  lui        $at, (0x1DA52D8 >> 16)
/* 11A370 0021A270 D85222AC */  sw         $2, (0x1DA52D8 & 0xFFFF)($at)
/* 11A374 0021A274 02000224 */  addiu      $2, $0, 0x2
/* 11A378 0021A278 DA01013C */  lui        $at, (0x1DA69A8 >> 16)
/* 11A37C 0021A27C A86922AC */  sw         $2, (0x1DA69A8 & 0xFFFF)($at)
/* 11A380 0021A280 28260070 */  paddub     $4, $0, $0
/* 11A384 0021A284 0D000010 */  b          .L0021A2BC
/* 11A388 0021A288 00000000 */   nop
.L0021A28C:
/* 11A38C 0021A28C E7030324 */  addiu      $3, $0, 0x3E7
/* 11A390 0021A290 80280400 */  sll        $5, $4, 2
/* 11A394 0021A294 DA01023C */  lui        $2, %hi(D_1DA69B0)
/* 11A398 0021A298 B0694224 */  addiu      $2, $2, %lo(D_1DA69B0)
/* 11A39C 0021A29C 21104500 */  addu       $2, $2, $5
/* 11A3A0 0021A2A0 000043AC */  sw         $3, 0x0($2)
/* 11A3A4 0021A2A4 FFFF0324 */  addiu      $3, $0, -0x1
/* 11A3A8 0021A2A8 DA01023C */  lui        $2, %hi(D_1DA69D8)
/* 11A3AC 0021A2AC D8694224 */  addiu      $2, $2, %lo(D_1DA69D8)
/* 11A3B0 0021A2B0 21104500 */  addu       $2, $2, $5
/* 11A3B4 0021A2B4 000043AC */  sw         $3, 0x0($2)
/* 11A3B8 0021A2B8 01008424 */  addiu      $4, $4, 0x1
.L0021A2BC:
/* 11A3BC 0021A2BC 0A008228 */  slti       $2, $4, 0xA
/* 11A3C0 0021A2C0 F2FF4014 */  bnez       $2, .L0021A28C
/* 11A3C4 0021A2C4 00000000 */   nop
/* 11A3C8 0021A2C8 FFFF0224 */  addiu      $2, $0, -0x1
/* 11A3CC 0021A2CC DA01013C */  lui        $at, (0x1DA698C >> 16)
/* 11A3D0 0021A2D0 8C6922AC */  sw         $2, (0x1DA698C & 0xFFFF)($at)
/* 11A3D4 0021A2D4 01000324 */  addiu      $3, $0, 0x1
/* 11A3D8 0021A2D8 DA01013C */  lui        $at, (0x1DA69AC >> 16)
/* 11A3DC 0021A2DC AC6923AC */  sw         $3, (0x1DA69AC & 0xFFFF)($at)
/* 11A3E0 0021A2E0 DB01023C */  lui        $2, %hi(D_1DA8114)
/* 11A3E4 0021A2E4 14814224 */  addiu      $2, $2, %lo(D_1DA8114)
/* 11A3E8 0021A2E8 E49682AF */  sw         $2, -0x691C($gp)
/* 11A3EC 0021A2EC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A3F0 0021A2F0 4E8220A4 */  sh         $0, -0x7DB2($at)
/* 11A3F4 0021A2F4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A3F8 0021A2F8 F08020AC */  sw         $0, -0x7F10($at)
/* 11A3FC 0021A2FC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A400 0021A300 5C8223AC */  sw         $3, -0x7DA4($at)
/* 11A404 0021A304 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A408 0021A308 608220AC */  sw         $0, -0x7DA0($at)
/* 11A40C 0021A30C 28260070 */  paddub     $4, $0, $0
/* 11A410 0021A310 2868080C */  jal        SetMenuAtraEventFlag__Fi
/* 11A414 0021A314 00000000 */   nop
/* 11A418 0021A318 1C8D848F */  lw         $4, -0x72E4($gp)
/* 11A41C 0021A31C D05E050C */  jal        GetMenuCursor__9CSaveDataFv
/* 11A420 0021A320 00000000 */   nop
/* 11A424 0021A324 00004384 */  lh         $3, 0x0($2)
/* 11A428 0021A328 30006014 */  bnez       $3, .L0021A3EC
/* 11A42C 0021A32C 00000000 */   nop
/* 11A430 0021A330 1C004384 */  lh         $3, 0x1C($2)
/* 11A434 0021A334 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A438 0021A338 D08023AC */  sw         $3, -0x7F30($at)
/* 11A43C 0021A33C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A440 0021A340 D080238C */  lw         $3, -0x7F30($at)
/* 11A444 0021A344 04006004 */  bltz       $3, .L0021A358
/* 11A448 0021A348 00000000 */   nop
/* 11A44C 0021A34C 02006128 */  slti       $at, $3, 0x2
/* 11A450 0021A350 03002014 */  bnez       $at, .L0021A360
/* 11A454 0021A354 00000000 */   nop
.L0021A358:
/* 11A458 0021A358 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A45C 0021A35C D08020AC */  sw         $0, -0x7F30($at)
.L0021A360:
/* 11A460 0021A360 08004484 */  lh         $4, 0x8($2)
/* 11A464 0021A364 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A468 0021A368 D080238C */  lw         $3, -0x7F30($at)
/* 11A46C 0021A36C 01000224 */  addiu      $2, $0, 0x1
/* 11A470 0021A370 09006210 */  beq        $3, $2, .L0021A398
/* 11A474 0021A374 00000000 */   nop
/* 11A478 0021A378 03006010 */  beqz       $3, .L0021A388
/* 11A47C 0021A37C 00000000 */   nop
/* 11A480 0021A380 20000010 */  b          .L0021A404
/* 11A484 0021A384 00000000 */   nop
.L0021A388:
/* 11A488 0021A388 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A48C 0021A38C DE8024A4 */  sh         $4, -0x7F22($at)
/* 11A490 0021A390 1C000010 */  b          .L0021A404
/* 11A494 0021A394 00000000 */   nop
.L0021A398:
/* 11A498 0021A398 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A49C 0021A39C F08024AC */  sw         $4, -0x7F10($at)
/* 11A4A0 0021A3A0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A4A4 0021A3A4 F080238C */  lw         $3, -0x7F10($at)
/* 11A4A8 0021A3A8 05000224 */  addiu      $2, $0, 0x5
/* 11A4AC 0021A3AC 1A006200 */  div        $0, $3, $2
/* 11A4B0 0021A3B0 02004014 */  bnez       $2, .L0021A3BC
/* 11A4B4 0021A3B4 00000000 */   nop
/* 11A4B8 0021A3B8 CD010000 */  break      0, 7
.L0021A3BC:
/* 11A4BC 0021A3BC 12100000 */  mflo       $2
/* 11A4C0 0021A3C0 FEFF4224 */  addiu      $2, $2, -0x2
/* 11A4C4 0021A3C4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A4C8 0021A3C8 FC8022AC */  sw         $2, -0x7F04($at)
/* 11A4CC 0021A3CC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A4D0 0021A3D0 FC80228C */  lw         $2, -0x7F04($at)
/* 11A4D4 0021A3D4 0B004104 */  bgez       $2, .L0021A404
/* 11A4D8 0021A3D8 00000000 */   nop
/* 11A4DC 0021A3DC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A4E0 0021A3E0 FC8020AC */  sw         $0, -0x7F04($at)
/* 11A4E4 0021A3E4 07000010 */  b          .L0021A404
/* 11A4E8 0021A3E8 00000000 */   nop
.L0021A3EC:
/* 11A4EC 0021A3EC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A4F0 0021A3F0 D08020AC */  sw         $0, -0x7F30($at)
/* 11A4F4 0021A3F4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A4F8 0021A3F8 DE8020A4 */  sh         $0, -0x7F22($at)
/* 11A4FC 0021A3FC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A500 0021A400 F08020AC */  sw         $0, -0x7F10($at)
.L0021A404:
/* 11A504 0021A404 2468080C */  jal        GetMenuAtraEventFlag__Fv
/* 11A508 0021A408 00000000 */   nop
/* 11A50C 0021A40C 05004010 */  beqz       $2, .L0021A424
/* 11A510 0021A410 00000000 */   nop
/* 11A514 0021A414 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A518 0021A418 68822384 */  lh         $3, -0x7D98($at)
/* 11A51C 0021A41C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A520 0021A420 DE8023A4 */  sh         $3, -0x7F22($at)
.L0021A424:
/* 11A524 0021A424 3000BF7B */  lq         $31, 0x30($sp)
/* 11A528 0021A428 2000B27B */  lq         $18, 0x20($sp)
/* 11A52C 0021A42C 1000B17B */  lq         $17, 0x10($sp)
/* 11A530 0021A430 0000B07B */  lq         $16, 0x0($sp)
/* 11A534 0021A434 5000BD27 */  addiu      $sp, $sp, 0x50
/* 11A538 0021A438 0800E003 */  jr         $31
/* 11A53C 0021A43C 00000000 */   nop
