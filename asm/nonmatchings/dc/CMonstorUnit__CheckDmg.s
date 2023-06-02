.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckDmg__12CMonstorUnitFv
/* DA010 001D9F10 90FDBD27 */  addiu      $sp, $sp, -0x270
/* DA014 001D9F14 A000BF7F */  sq         $31, 0xA0($sp)
/* DA018 001D9F18 9000BE7F */  sq         $fp, 0x90($sp)
/* DA01C 001D9F1C 8000B77F */  sq         $23, 0x80($sp)
/* DA020 001D9F20 7000B67F */  sq         $22, 0x70($sp)
/* DA024 001D9F24 6000B57F */  sq         $21, 0x60($sp)
/* DA028 001D9F28 5000B47F */  sq         $20, 0x50($sp)
/* DA02C 001D9F2C 4000B37F */  sq         $19, 0x40($sp)
/* DA030 001D9F30 3000B27F */  sq         $18, 0x30($sp)
/* DA034 001D9F34 2000B17F */  sq         $17, 0x20($sp)
/* DA038 001D9F38 1000B07F */  sq         $16, 0x10($sp)
/* DA03C 001D9F3C 0400B5E7 */  swc1       $f21, 0x4($sp)
/* DA040 001D9F40 0000B4E7 */  swc1       $f20, 0x0($sp)
/* DA044 001D9F44 28AE8070 */  paddub     $21, $4, $0
/* DA048 001D9F48 28860070 */  paddub     $16, $0, $0
/* DA04C 001D9F4C 28BE0070 */  paddub     $23, $0, $0
/* DA050 001D9F50 9000838C */  lw         $3, 0x90($4)
/* DA054 001D9F54 80100300 */  sll        $2, $3, 2
/* DA058 001D9F58 21184300 */  addu       $3, $2, $3
/* DA05C 001D9F5C 80100300 */  sll        $2, $3, 2
/* DA060 001D9F60 21106200 */  addu       $2, $3, $2
/* DA064 001D9F64 00110200 */  sll        $2, $2, 4
/* DA068 001D9F68 21104400 */  addu       $2, $2, $4
/* DA06C 001D9F6C 0200013C */  lui        $at, (0x20000 >> 16)
/* DA070 001D9F70 21084100 */  addu       $at, $2, $at
/* DA074 001D9F74 D8E3228C */  lw         $2, -0x1C28($at)
/* DA078 001D9F78 EB00401C */  bgtz       $2, .L001DA328
/* DA07C 001D9F7C 00000000 */   nop
/* DA080 001D9F80 288E0070 */  paddub     $17, $0, $0
/* DA084 001D9F84 E5000010 */  b          .L001DA31C
/* DA088 001D9F88 00000000 */   nop
.L001D9F8C:
/* DA08C 001D9F8C 9000A78E */  lw         $7, 0x90($21)
/* DA090 001D9F90 50030224 */  addiu      $2, $0, 0x350
/* DA094 001D9F94 1840E200 */  mult       $8, $7, $2
/* DA098 001D9F98 21101501 */  addu       $2, $8, $21
/* DA09C 001D9F9C 80981100 */  sll        $19, $17, 2
/* DA0A0 001D9FA0 21186202 */  addu       $3, $19, $2
/* DA0A4 001D9FA4 0600013C */  lui        $at, (0x60000 >> 16)
/* DA0A8 001D9FA8 21086100 */  addu       $at, $3, $at
/* DA0AC 001D9FAC 50A6228C */  lw         $2, -0x59B0($at)
/* DA0B0 001D9FB0 D9004010 */  beqz       $2, .L001DA318
/* DA0B4 001D9FB4 00000000 */   nop
/* DA0B8 001D9FB8 10350224 */  addiu      $2, $0, 0x3510
/* DA0BC 001D9FBC 1810E200 */  mult       $2, $7, $2
/* DA0C0 001D9FC0 21105500 */  addu       $2, $2, $21
/* DA0C4 001D9FC4 0200013C */  lui        $at, (0x20000 >> 16)
/* DA0C8 001D9FC8 21084100 */  addu       $at, $2, $at
/* DA0CC 001D9FCC C0FF21C4 */  lwc1       $f1, -0x40($at)
/* DA0D0 001D9FD0 0600013C */  lui        $at, (0x60000 >> 16)
/* DA0D4 001D9FD4 21086100 */  addu       $at, $3, $at
/* DA0D8 001D9FD8 D0A520C4 */  lwc1       $f0, -0x5A30($at)
/* DA0DC 001D9FDC 34000146 */  c.lt.s     $f0, $f1
/* DA0E0 001D9FE0 00000000 */  nop
/* DA0E4 001D9FE4 CC000045 */  bc1f       .L001DA318
/* DA0E8 001D9FE8 00000000 */   nop
/* DA0EC 001D9FEC 0600013C */  lui        $at, (0x60000 >> 16)
/* DA0F0 001D9FF0 21086100 */  addu       $at, $3, $at
/* DA0F4 001D9FF4 10A620C4 */  lwc1       $f0, -0x59F0($at)
/* DA0F8 001D9FF8 36000146 */  c.le.s     $f0, $f1
/* DA0FC 001D9FFC 00000000 */  nop
/* DA100 001DA000 C5000145 */  bc1t       .L001DA318
/* DA104 001DA004 00000000 */   nop
/* DA108 001DA008 0600013C */  lui        $at, (0x60000 >> 16)
/* DA10C 001DA00C 21086100 */  addu       $at, $3, $at
/* DA110 001DA010 D0A4268C */  lw         $6, -0x5B30($at)
/* DA114 001DA014 80100700 */  sll        $2, $7, 2
/* DA118 001DA018 21184700 */  addu       $3, $2, $7
/* DA11C 001DA01C 80100300 */  sll        $2, $3, 2
/* DA120 001DA020 21106200 */  addu       $2, $3, $2
/* DA124 001DA024 00110200 */  sll        $2, $2, 4
/* DA128 001DA028 21105500 */  addu       $2, $2, $21
/* DA12C 001DA02C 0200013C */  lui        $at, (0x20000 >> 16)
/* DA130 001DA030 21084100 */  addu       $at, $2, $at
/* DA134 001DA034 E0E3228C */  lw         $2, -0x1C20($at)
/* DA138 001DA038 02004018 */  blez       $2, .L001DA044
/* DA13C 001DA03C 00000000 */   nop
/* DA140 001DA040 40300600 */  sll        $6, $6, 1
.L001DA044:
/* DA144 001DA044 2120A802 */  addu       $4, $21, $8
/* DA148 001DA048 00111100 */  sll        $2, $17, 4
/* DA14C 001DA04C 21188200 */  addu       $3, $4, $2
/* DA150 001DA050 21106402 */  addu       $2, $19, $4
/* DA154 001DA054 00688044 */  mtc1       $0, $f13
/* DA158 001DA058 F09D848F */  lw         $4, -0x6210($gp)
/* DA15C 001DA05C 0500013C */  lui        $at, (0x5A350 >> 16)
/* DA160 001DA060 50A32134 */  ori        $at, $at, (0x5A350 & 0xFFFF)
/* DA164 001DA064 21286100 */  addu       $5, $3, $at
/* DA168 001DA068 02000724 */  addiu      $7, $0, 0x2
/* DA16C 001DA06C 0600013C */  lui        $at, (0x60000 >> 16)
/* DA170 001DA070 21084100 */  addu       $at, $2, $at
/* DA174 001DA074 90A42CC4 */  lwc1       $f12, -0x5B70($at)
/* DA178 001DA078 01000824 */  addiu      $8, $0, 0x1
/* DA17C 001DA07C 0600013C */  lui        $at, (0x60000 >> 16)
/* DA180 001DA080 21084100 */  addu       $at, $2, $at
/* DA184 001DA084 10A5298C */  lw         $9, -0x5AF0($at)
/* DA188 001DA088 0600013C */  lui        $at, (0x60000 >> 16)
/* DA18C 001DA08C 21084100 */  addu       $at, $2, $at
/* DA190 001DA090 90A52A8C */  lw         $10, -0x5A70($at)
/* DA194 001DA094 285E0070 */  paddub     $11, $0, $0
/* DA198 001DA098 E8D5060C */  jal        Set__14CCollisionDataFPfiiffiiii
/* DA19C 001DA09C 00000000 */   nop
/* DA1A0 001DA0A0 28964070 */  paddub     $18, $2, $0
/* DA1A4 001DA0A4 9000A38E */  lw         $3, 0x90($21)
/* DA1A8 001DA0A8 80100300 */  sll        $2, $3, 2
/* DA1AC 001DA0AC 21104300 */  addu       $2, $2, $3
/* DA1B0 001DA0B0 C8004624 */  addiu      $6, $2, 0xC8
/* DA1B4 001DA0B4 F09D878F */  lw         $7, -0x6210($gp)
/* DA1B8 001DA0B8 803DE38C */  lw         $3, 0x3D80($7)
/* DA1BC 001DA0BC 80100300 */  sll        $2, $3, 2
/* DA1C0 001DA0C0 21104300 */  addu       $2, $2, $3
/* DA1C4 001DA0C4 40110200 */  sll        $2, $2, 5
/* DA1C8 001DA0C8 21104700 */  addu       $2, $2, $7
/* DA1CC 001DA0CC 580046AC */  sw         $6, 0x58($2)
/* DA1D0 001DA0D0 803DE38C */  lw         $3, 0x3D80($7)
/* DA1D4 001DA0D4 80100300 */  sll        $2, $3, 2
/* DA1D8 001DA0D8 21104300 */  addu       $2, $2, $3
/* DA1DC 001DA0DC 40110200 */  sll        $2, $2, 5
/* DA1E0 001DA0E0 21104700 */  addu       $2, $2, $7
/* DA1E4 001DA0E4 600051AC */  sw         $17, 0x60($2)
/* DA1E8 001DA0E8 9000A78E */  lw         $7, 0x90($21)
/* DA1EC 001DA0EC 50030224 */  addiu      $2, $0, 0x350
/* DA1F0 001DA0F0 1810E200 */  mult       $2, $7, $2
/* DA1F4 001DA0F4 21105500 */  addu       $2, $2, $21
/* DA1F8 001DA0F8 21306202 */  addu       $6, $19, $2
/* DA1FC 001DA0FC 0600013C */  lui        $at, (0x60000 >> 16)
/* DA200 001DA100 2108C100 */  addu       $at, $6, $at
/* DA204 001DA104 10A5238C */  lw         $3, -0x5AF0($at)
/* DA208 001DA108 03000224 */  addiu      $2, $0, 0x3
/* DA20C 001DA10C 82006214 */  bne        $3, $2, .L001DA318
/* DA210 001DA110 00000000 */   nop
/* DA214 001DA114 0600013C */  lui        $at, (0x60000 >> 16)
/* DA218 001DA118 2108C100 */  addu       $at, $6, $at
/* DA21C 001DA11C 50A534C4 */  lwc1       $f20, -0x5AB0($at)
/* DA220 001DA120 00008044 */  mtc1       $0, $f0
/* DA224 001DA124 00000000 */  nop
/* DA228 001DA128 32001446 */  c.eq.s     $f0, $f20
/* DA22C 001DA12C 00000000 */  nop
/* DA230 001DA130 32000045 */  bc1f       .L001DA1FC
/* DA234 001DA134 00000000 */   nop
/* DA238 001DA138 1001A427 */  addiu      $4, $sp, 0x110
/* DA23C 001DA13C EA01023C */  lui        $2, %hi(D_1EA1D30)
/* DA240 001DA140 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* DA244 001DA144 0C86040C */  jal        sceVu0CopyVector
/* DA248 001DA148 00000000 */   nop
/* DA24C 001DA14C 9000A38E */  lw         $3, 0x90($21)
/* DA250 001DA150 10350224 */  addiu      $2, $0, 0x3510
/* DA254 001DA154 18106200 */  mult       $2, $3, $2
/* DA258 001DA158 2110A202 */  addu       $2, $21, $2
/* DA25C 001DA15C 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DA260 001DA160 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DA264 001DA164 21204100 */  addu       $4, $2, $at
/* DA268 001DA168 2001A527 */  addiu      $5, $sp, 0x120
/* DA26C 001DA16C A000998C */  lw         $25, 0xA0($4)
/* DA270 001DA170 A000398F */  lw         $25, 0xA0($25)
/* DA274 001DA174 09F82003 */  jalr       $25
/* DA278 001DA178 00000000 */   nop
/* DA27C 001DA17C 1001A1C7 */  lwc1       $f1, 0x110($sp)
/* DA280 001DA180 2001A0C7 */  lwc1       $f0, 0x120($sp)
/* DA284 001DA184 01080046 */  sub.s      $f0, $f1, $f0
/* DA288 001DA188 1001A0E7 */  swc1       $f0, 0x110($sp)
/* DA28C 001DA18C 1401A0AF */  sw         $0, 0x114($sp)
/* DA290 001DA190 1801A1C7 */  lwc1       $f1, 0x118($sp)
/* DA294 001DA194 2801A0C7 */  lwc1       $f0, 0x128($sp)
/* DA298 001DA198 01080046 */  sub.s      $f0, $f1, $f0
/* DA29C 001DA19C 1801A0E7 */  swc1       $f0, 0x118($sp)
/* DA2A0 001DA1A0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* DA2A4 001DA1A4 1C01A2AF */  sw         $2, 0x11C($sp)
/* DA2A8 001DA1A8 1001A427 */  addiu      $4, $sp, 0x110
/* DA2AC 001DA1AC 282E8070 */  paddub     $5, $4, $0
/* DA2B0 001DA1B0 9285040C */  jal        sceVu0Normalize
/* DA2B4 001DA1B4 00000000 */   nop
/* DA2B8 001DA1B8 F09D938F */  lw         $19, -0x6210($gp)
/* DA2BC 001DA1BC 5002A427 */  addiu      $4, $sp, 0x250
/* DA2C0 001DA1C0 1001A527 */  addiu      $5, $sp, 0x110
/* DA2C4 001DA1C4 9285040C */  jal        sceVu0Normalize
/* DA2C8 001DA1C8 00000000 */   nop
/* DA2CC 001DA1CC 80101200 */  sll        $2, $18, 2
/* DA2D0 001DA1D0 21105200 */  addu       $2, $2, $18
/* DA2D4 001DA1D4 40110200 */  sll        $2, $2, 5
/* DA2D8 001DA1D8 21186202 */  addu       $3, $19, $2
/* DA2DC 001DA1DC 803F023C */  lui        $2, (0x3F800000 >> 16)
/* DA2E0 001DA1E0 00608244 */  mtc1       $2, $f12
/* DA2E4 001DA1E4 20006424 */  addiu      $4, $3, 0x20
/* DA2E8 001DA1E8 5002A527 */  addiu      $5, $sp, 0x250
/* DA2EC 001DA1EC 4688040C */  jal        sceVu0ScaleVectorXYZ
/* DA2F0 001DA1F0 00000000 */   nop
/* DA2F4 001DA1F4 48000010 */  b          .L001DA318
/* DA2F8 001DA1F8 00000000 */   nop
.L001DA1FC:
/* DA2FC 001DA1FC 3443023C */  lui        $2, (0x43340000 >> 16)
/* DA300 001DA200 00008244 */  mtc1       $2, $f0
/* DA304 001DA204 00000000 */  nop
/* DA308 001DA208 34A00046 */  c.lt.s     $f20, $f0
/* DA30C 001DA20C 00000000 */  nop
/* DA310 001DA210 05000145 */  bc1t       .L001DA228
/* DA314 001DA214 00000000 */   nop
/* DA318 001DA218 B443023C */  lui        $2, (0x43B40000 >> 16)
/* DA31C 001DA21C 00008244 */  mtc1       $2, $f0
/* DA320 001DA220 00000000 */  nop
/* DA324 001DA224 01A50046 */  sub.s      $f20, $f20, $f0
.L001DA228:
/* DA328 001DA228 788180C7 */  lwc1       $f0, -0x7E88($gp)
/* DA32C 001DA22C 02051446 */  mul.s      $f20, $f0, $f20
/* DA330 001DA230 10350224 */  addiu      $2, $0, 0x3510
/* DA334 001DA234 1810E200 */  mult       $2, $7, $2
/* DA338 001DA238 2110A202 */  addu       $2, $21, $2
/* DA33C 001DA23C 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DA340 001DA240 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DA344 001DA244 21204100 */  addu       $4, $2, $at
/* DA348 001DA248 A000998C */  lw         $25, 0xA0($4)
/* DA34C 001DA24C 7800398F */  lw         $25, 0x78($25)
/* DA350 001DA250 09F82003 */  jalr       $25
/* DA354 001DA254 00000000 */   nop
/* DA358 001DA258 040040C4 */  lwc1       $f0, 0x4($2)
/* DA35C 001DA25C 00A50046 */  add.s      $f20, $f20, $f0
/* DA360 001DA260 788580C7 */  lwc1       $f0, -0x7A88($gp)
/* DA364 001DA264 36A00046 */  c.le.s     $f20, $f0
/* DA368 001DA268 00000000 */  nop
/* DA36C 001DA26C 02000145 */  bc1t       .L001DA278
/* DA370 001DA270 00000000 */   nop
/* DA374 001DA274 01A50046 */  sub.s      $f20, $f20, $f0
.L001DA278:
/* DA378 001DA278 7C8580C7 */  lwc1       $f0, -0x7A84($gp)
/* DA37C 001DA27C 34A00046 */  c.lt.s     $f20, $f0
/* DA380 001DA280 00000000 */  nop
/* DA384 001DA284 03000045 */  bc1f       .L001DA294
/* DA388 001DA288 00000000 */   nop
/* DA38C 001DA28C 808580C7 */  lwc1       $f0, -0x7A80($gp)
/* DA390 001DA290 00A50046 */  add.s      $f20, $f20, $f0
.L001DA294:
/* DA394 001DA294 2900023C */  lui        $2, %hi(_1076)
/* DA398 001DA298 20184224 */  addiu      $2, $2, %lo(_1076)
/* DA39C 001DA29C 3001A327 */  addiu      $3, $sp, 0x130
/* DA3A0 001DA2A0 00004278 */  lq         $2, 0x0($2)
/* DA3A4 001DA2A4 0000627C */  sq         $2, 0x0($3)
/* DA3A8 001DA2A8 8001A427 */  addiu      $4, $sp, 0x180
/* DA3AC 001DA2AC 2A86040C */  jal        sceVu0UnitMatrix
/* DA3B0 001DA2B0 00000000 */   nop
/* DA3B4 001DA2B4 4001A427 */  addiu      $4, $sp, 0x140
/* DA3B8 001DA2B8 8001A527 */  addiu      $5, $sp, 0x180
/* DA3BC 001DA2BC 06A30046 */  mov.s      $f12, $f20
/* DA3C0 001DA2C0 A686040C */  jal        sceVu0RotMatrixY
/* DA3C4 001DA2C4 00000000 */   nop
/* DA3C8 001DA2C8 3001A427 */  addiu      $4, $sp, 0x130
/* DA3CC 001DA2CC 4001A527 */  addiu      $5, $sp, 0x140
/* DA3D0 001DA2D0 28368070 */  paddub     $6, $4, $0
/* DA3D4 001DA2D4 6285040C */  jal        sceVu0ApplyMatrix
/* DA3D8 001DA2D8 00000000 */   nop
/* DA3DC 001DA2DC F09D938F */  lw         $19, -0x6210($gp)
/* DA3E0 001DA2E0 6002A427 */  addiu      $4, $sp, 0x260
/* DA3E4 001DA2E4 3001A527 */  addiu      $5, $sp, 0x130
/* DA3E8 001DA2E8 9285040C */  jal        sceVu0Normalize
/* DA3EC 001DA2EC 00000000 */   nop
/* DA3F0 001DA2F0 80101200 */  sll        $2, $18, 2
/* DA3F4 001DA2F4 21105200 */  addu       $2, $2, $18
/* DA3F8 001DA2F8 40110200 */  sll        $2, $2, 5
/* DA3FC 001DA2FC 21186202 */  addu       $3, $19, $2
/* DA400 001DA300 803F023C */  lui        $2, (0x3F800000 >> 16)
/* DA404 001DA304 00608244 */  mtc1       $2, $f12
/* DA408 001DA308 20006424 */  addiu      $4, $3, 0x20
/* DA40C 001DA30C 6002A527 */  addiu      $5, $sp, 0x260
/* DA410 001DA310 4688040C */  jal        sceVu0ScaleVectorXYZ
/* DA414 001DA314 00000000 */   nop
.L001DA318:
/* DA418 001DA318 01003126 */  addiu      $17, $17, 0x1
.L001DA31C:
/* DA41C 001DA31C 1000222A */  slti       $2, $17, 0x10
/* DA420 001DA320 1AFF4014 */  bnez       $2, .L001D9F8C
/* DA424 001DA324 00000000 */   nop
.L001DA328:
/* DA428 001DA328 9000A38E */  lw         $3, 0x90($21)
/* DA42C 001DA32C 80100300 */  sll        $2, $3, 2
/* DA430 001DA330 21184300 */  addu       $3, $2, $3
/* DA434 001DA334 80100300 */  sll        $2, $3, 2
/* DA438 001DA338 21106200 */  addu       $2, $3, $2
/* DA43C 001DA33C 00110200 */  sll        $2, $2, 4
/* DA440 001DA340 21185500 */  addu       $3, $2, $21
/* DA444 001DA344 0200013C */  lui        $at, (0x20000 >> 16)
/* DA448 001DA348 21086100 */  addu       $at, $3, $at
/* DA44C 001DA34C F4E3228C */  lw         $2, -0x1C0C($at)
/* DA450 001DA350 1600401C */  bgtz       $2, .L001DA3AC
/* DA454 001DA354 00000000 */   nop
/* DA458 001DA358 0100013C */  lui        $at, (0x1E3D8 >> 16)
/* DA45C 001DA35C D8E32134 */  ori        $at, $at, (0x1E3D8 & 0xFFFF)
/* DA460 001DA360 21186100 */  addu       $3, $3, $at
/* DA464 001DA364 0000628C */  lw         $2, 0x0($3)
/* DA468 001DA368 0D004018 */  blez       $2, .L001DA3A0
/* DA46C 001DA36C 00000000 */   nop
/* DA470 001DA370 000060AC */  sw         $0, 0x0($3)
/* DA474 001DA374 01000424 */  addiu      $4, $0, 0x1
/* DA478 001DA378 9000A38E */  lw         $3, 0x90($21)
/* DA47C 001DA37C 80100300 */  sll        $2, $3, 2
/* DA480 001DA380 21184300 */  addu       $3, $2, $3
/* DA484 001DA384 80100300 */  sll        $2, $3, 2
/* DA488 001DA388 21106200 */  addu       $2, $3, $2
/* DA48C 001DA38C 00110200 */  sll        $2, $2, 4
/* DA490 001DA390 21105500 */  addu       $2, $2, $21
/* DA494 001DA394 0200013C */  lui        $at, (0x20000 >> 16)
/* DA498 001DA398 21084100 */  addu       $at, $2, $at
/* DA49C 001DA39C C4E424A4 */  sh         $4, -0x1B3C($at)
.L001DA3A0:
/* DA4A0 001DA3A0 28160070 */  paddub     $2, $0, $0
/* DA4A4 001DA3A4 0C090010 */  b          .L001DC7D8
/* DA4A8 001DA3A8 00000000 */   nop
.L001DA3AC:
/* DA4AC 001DA3AC FFFF0224 */  addiu      $2, $0, -0x1
/* DA4B0 001DA3B0 0200013C */  lui        $at, (0x20000 >> 16)
/* DA4B4 001DA3B4 21086100 */  addu       $at, $3, $at
/* DA4B8 001DA3B8 94E422AC */  sw         $2, -0x1B6C($at)
/* DA4BC 001DA3BC 9000A38E */  lw         $3, 0x90($21)
/* DA4C0 001DA3C0 80100300 */  sll        $2, $3, 2
/* DA4C4 001DA3C4 21184300 */  addu       $3, $2, $3
/* DA4C8 001DA3C8 80100300 */  sll        $2, $3, 2
/* DA4CC 001DA3CC 21106200 */  addu       $2, $3, $2
/* DA4D0 001DA3D0 00110200 */  sll        $2, $2, 4
/* DA4D4 001DA3D4 21185500 */  addu       $3, $2, $21
/* DA4D8 001DA3D8 0200013C */  lui        $at, (0x20000 >> 16)
/* DA4DC 001DA3DC 21086100 */  addu       $at, $3, $at
/* DA4E0 001DA3E0 D8E3228C */  lw         $2, -0x1C28($at)
/* DA4E4 001DA3E4 41004018 */  blez       $2, .L001DA4EC
/* DA4E8 001DA3E8 00000000 */   nop
/* DA4EC 001DA3EC 2043063C */  lui        $6, (0x43200000 >> 16)
/* DA4F0 001DA3F0 0200013C */  lui        $at, (0x20000 >> 16)
/* DA4F4 001DA3F4 21086100 */  addu       $at, $3, $at
/* DA4F8 001DA3F8 20E526AC */  sw         $6, -0x1AE0($at)
/* DA4FC 001DA3FC 9000A38E */  lw         $3, 0x90($21)
/* DA500 001DA400 80100300 */  sll        $2, $3, 2
/* DA504 001DA404 21184300 */  addu       $3, $2, $3
/* DA508 001DA408 80100300 */  sll        $2, $3, 2
/* DA50C 001DA40C 21106200 */  addu       $2, $3, $2
/* DA510 001DA410 00110200 */  sll        $2, $2, 4
/* DA514 001DA414 21105500 */  addu       $2, $2, $21
/* DA518 001DA418 0200013C */  lui        $at, (0x20000 >> 16)
/* DA51C 001DA41C 21084100 */  addu       $at, $2, $at
/* DA520 001DA420 24E526AC */  sw         $6, -0x1ADC($at)
/* DA524 001DA424 9000A38E */  lw         $3, 0x90($21)
/* DA528 001DA428 80100300 */  sll        $2, $3, 2
/* DA52C 001DA42C 21184300 */  addu       $3, $2, $3
/* DA530 001DA430 80100300 */  sll        $2, $3, 2
/* DA534 001DA434 21106200 */  addu       $2, $3, $2
/* DA538 001DA438 00110200 */  sll        $2, $2, 4
/* DA53C 001DA43C 21105500 */  addu       $2, $2, $21
/* DA540 001DA440 0200013C */  lui        $at, (0x20000 >> 16)
/* DA544 001DA444 21084100 */  addu       $at, $2, $at
/* DA548 001DA448 28E526AC */  sw         $6, -0x1AD8($at)
/* DA54C 001DA44C 01000224 */  addiu      $2, $0, 0x1
/* DA550 001DA450 9000A68E */  lw         $6, 0x90($21)
/* DA554 001DA454 80180600 */  sll        $3, $6, 2
/* DA558 001DA458 21306600 */  addu       $6, $3, $6
/* DA55C 001DA45C 80180600 */  sll        $3, $6, 2
/* DA560 001DA460 2118C300 */  addu       $3, $6, $3
/* DA564 001DA464 00190300 */  sll        $3, $3, 4
/* DA568 001DA468 21187500 */  addu       $3, $3, $21
/* DA56C 001DA46C 0200013C */  lui        $at, (0x20000 >> 16)
/* DA570 001DA470 21086100 */  addu       $at, $3, $at
/* DA574 001DA474 30E522AC */  sw         $2, -0x1AD0($at)
/* DA578 001DA478 9000A68E */  lw         $6, 0x90($21)
/* DA57C 001DA47C 80180600 */  sll        $3, $6, 2
/* DA580 001DA480 21306600 */  addu       $6, $3, $6
/* DA584 001DA484 80180600 */  sll        $3, $6, 2
/* DA588 001DA488 2118C300 */  addu       $3, $6, $3
/* DA58C 001DA48C 00190300 */  sll        $3, $3, 4
/* DA590 001DA490 21307500 */  addu       $6, $3, $21
/* DA594 001DA494 0200013C */  lui        $at, (0x20000 >> 16)
/* DA598 001DA498 2108C100 */  addu       $at, $6, $at
/* DA59C 001DA49C D8E3238C */  lw         $3, -0x1C28($at)
/* DA5A0 001DA4A0 FFFF6324 */  addiu      $3, $3, -0x1
/* DA5A4 001DA4A4 0200013C */  lui        $at, (0x20000 >> 16)
/* DA5A8 001DA4A8 2108C100 */  addu       $at, $6, $at
/* DA5AC 001DA4AC D8E323AC */  sw         $3, -0x1C28($at)
/* DA5B0 001DA4B0 9000A68E */  lw         $6, 0x90($21)
/* DA5B4 001DA4B4 80180600 */  sll        $3, $6, 2
/* DA5B8 001DA4B8 21306600 */  addu       $6, $3, $6
/* DA5BC 001DA4BC 80180600 */  sll        $3, $6, 2
/* DA5C0 001DA4C0 2118C300 */  addu       $3, $6, $3
/* DA5C4 001DA4C4 00190300 */  sll        $3, $3, 4
/* DA5C8 001DA4C8 21307500 */  addu       $6, $3, $21
/* DA5CC 001DA4CC 0200013C */  lui        $at, (0x20000 >> 16)
/* DA5D0 001DA4D0 2108C100 */  addu       $at, $6, $at
/* DA5D4 001DA4D4 D8E3238C */  lw         $3, -0x1C28($at)
/* DA5D8 001DA4D8 04006014 */  bnez       $3, .L001DA4EC
/* DA5DC 001DA4DC 00000000 */   nop
/* DA5E0 001DA4E0 0200013C */  lui        $at, (0x20000 >> 16)
/* DA5E4 001DA4E4 2108C100 */  addu       $at, $6, $at
/* DA5E8 001DA4E8 C4E422A4 */  sh         $2, -0x1B3C($at)
.L001DA4EC:
/* DA5EC 001DA4EC 9000A38E */  lw         $3, 0x90($21)
/* DA5F0 001DA4F0 80100300 */  sll        $2, $3, 2
/* DA5F4 001DA4F4 21184300 */  addu       $3, $2, $3
/* DA5F8 001DA4F8 80100300 */  sll        $2, $3, 2
/* DA5FC 001DA4FC 21106200 */  addu       $2, $3, $2
/* DA600 001DA500 00110200 */  sll        $2, $2, 4
/* DA604 001DA504 21185500 */  addu       $3, $2, $21
/* DA608 001DA508 0200013C */  lui        $at, (0x20000 >> 16)
/* DA60C 001DA50C 21086100 */  addu       $at, $3, $at
/* DA610 001DA510 E4E3228C */  lw         $2, -0x1C1C($at)
/* DA614 001DA514 26004018 */  blez       $2, .L001DA5B0
/* DA618 001DA518 00000000 */   nop
/* DA61C 001DA51C C841023C */  lui        $2, (0x41C80000 >> 16)
/* DA620 001DA520 0200013C */  lui        $at, (0x20000 >> 16)
/* DA624 001DA524 21086100 */  addu       $at, $3, $at
/* DA628 001DA528 20E522AC */  sw         $2, -0x1AE0($at)
/* DA62C 001DA52C 1642063C */  lui        $6, (0x42160000 >> 16)
/* DA630 001DA530 9000A38E */  lw         $3, 0x90($21)
/* DA634 001DA534 80100300 */  sll        $2, $3, 2
/* DA638 001DA538 21184300 */  addu       $3, $2, $3
/* DA63C 001DA53C 80100300 */  sll        $2, $3, 2
/* DA640 001DA540 21106200 */  addu       $2, $3, $2
/* DA644 001DA544 00110200 */  sll        $2, $2, 4
/* DA648 001DA548 21105500 */  addu       $2, $2, $21
/* DA64C 001DA54C 0200013C */  lui        $at, (0x20000 >> 16)
/* DA650 001DA550 21084100 */  addu       $at, $2, $at
/* DA654 001DA554 24E526AC */  sw         $6, -0x1ADC($at)
/* DA658 001DA558 7F42063C */  lui        $6, (0x427F0000 >> 16)
/* DA65C 001DA55C 9000A38E */  lw         $3, 0x90($21)
/* DA660 001DA560 80100300 */  sll        $2, $3, 2
/* DA664 001DA564 21184300 */  addu       $3, $2, $3
/* DA668 001DA568 80100300 */  sll        $2, $3, 2
/* DA66C 001DA56C 21106200 */  addu       $2, $3, $2
/* DA670 001DA570 00110200 */  sll        $2, $2, 4
/* DA674 001DA574 21105500 */  addu       $2, $2, $21
/* DA678 001DA578 0200013C */  lui        $at, (0x20000 >> 16)
/* DA67C 001DA57C 21084100 */  addu       $at, $2, $at
/* DA680 001DA580 28E526AC */  sw         $6, -0x1AD8($at)
/* DA684 001DA584 01000624 */  addiu      $6, $0, 0x1
/* DA688 001DA588 9000A38E */  lw         $3, 0x90($21)
/* DA68C 001DA58C 80100300 */  sll        $2, $3, 2
/* DA690 001DA590 21184300 */  addu       $3, $2, $3
/* DA694 001DA594 80100300 */  sll        $2, $3, 2
/* DA698 001DA598 21106200 */  addu       $2, $3, $2
/* DA69C 001DA59C 00110200 */  sll        $2, $2, 4
/* DA6A0 001DA5A0 21105500 */  addu       $2, $2, $21
/* DA6A4 001DA5A4 0200013C */  lui        $at, (0x20000 >> 16)
/* DA6A8 001DA5A8 21084100 */  addu       $at, $2, $at
/* DA6AC 001DA5AC 30E526AC */  sw         $6, -0x1AD0($at)
.L001DA5B0:
/* DA6B0 001DA5B0 9000A38E */  lw         $3, 0x90($21)
/* DA6B4 001DA5B4 80100300 */  sll        $2, $3, 2
/* DA6B8 001DA5B8 21184300 */  addu       $3, $2, $3
/* DA6BC 001DA5BC 80100300 */  sll        $2, $3, 2
/* DA6C0 001DA5C0 21106200 */  addu       $2, $3, $2
/* DA6C4 001DA5C4 00110200 */  sll        $2, $2, 4
/* DA6C8 001DA5C8 21185500 */  addu       $3, $2, $21
/* DA6CC 001DA5CC 0200013C */  lui        $at, (0x20000 >> 16)
/* DA6D0 001DA5D0 21086100 */  addu       $at, $3, $at
/* DA6D4 001DA5D4 E0E3228C */  lw         $2, -0x1C20($at)
/* DA6D8 001DA5D8 34004018 */  blez       $2, .L001DA6AC
/* DA6DC 001DA5DC 00000000 */   nop
/* DA6E0 001DA5E0 FF42023C */  lui        $2, (0x42FF0000 >> 16)
/* DA6E4 001DA5E4 0200013C */  lui        $at, (0x20000 >> 16)
/* DA6E8 001DA5E8 21086100 */  addu       $at, $3, $at
/* DA6EC 001DA5EC 20E522AC */  sw         $2, -0x1AE0($at)
/* DA6F0 001DA5F0 A042063C */  lui        $6, (0x42A00000 >> 16)
/* DA6F4 001DA5F4 9000A38E */  lw         $3, 0x90($21)
/* DA6F8 001DA5F8 80100300 */  sll        $2, $3, 2
/* DA6FC 001DA5FC 21184300 */  addu       $3, $2, $3
/* DA700 001DA600 80100300 */  sll        $2, $3, 2
/* DA704 001DA604 21106200 */  addu       $2, $3, $2
/* DA708 001DA608 00110200 */  sll        $2, $2, 4
/* DA70C 001DA60C 21105500 */  addu       $2, $2, $21
/* DA710 001DA610 0200013C */  lui        $at, (0x20000 >> 16)
/* DA714 001DA614 21084100 */  addu       $at, $2, $at
/* DA718 001DA618 24E526AC */  sw         $6, -0x1ADC($at)
/* DA71C 001DA61C 7041063C */  lui        $6, (0x41700000 >> 16)
/* DA720 001DA620 9000A38E */  lw         $3, 0x90($21)
/* DA724 001DA624 80100300 */  sll        $2, $3, 2
/* DA728 001DA628 21184300 */  addu       $3, $2, $3
/* DA72C 001DA62C 80100300 */  sll        $2, $3, 2
/* DA730 001DA630 21106200 */  addu       $2, $3, $2
/* DA734 001DA634 00110200 */  sll        $2, $2, 4
/* DA738 001DA638 21105500 */  addu       $2, $2, $21
/* DA73C 001DA63C 0200013C */  lui        $at, (0x20000 >> 16)
/* DA740 001DA640 21084100 */  addu       $at, $2, $at
/* DA744 001DA644 28E526AC */  sw         $6, -0x1AD8($at)
/* DA748 001DA648 01000624 */  addiu      $6, $0, 0x1
/* DA74C 001DA64C 9000A38E */  lw         $3, 0x90($21)
/* DA750 001DA650 80100300 */  sll        $2, $3, 2
/* DA754 001DA654 21184300 */  addu       $3, $2, $3
/* DA758 001DA658 80100300 */  sll        $2, $3, 2
/* DA75C 001DA65C 21106200 */  addu       $2, $3, $2
/* DA760 001DA660 00110200 */  sll        $2, $2, 4
/* DA764 001DA664 21105500 */  addu       $2, $2, $21
/* DA768 001DA668 0200013C */  lui        $at, (0x20000 >> 16)
/* DA76C 001DA66C 21084100 */  addu       $at, $2, $at
/* DA770 001DA670 30E526AC */  sw         $6, -0x1AD0($at)
/* DA774 001DA674 9000A38E */  lw         $3, 0x90($21)
/* DA778 001DA678 80100300 */  sll        $2, $3, 2
/* DA77C 001DA67C 21184300 */  addu       $3, $2, $3
/* DA780 001DA680 80100300 */  sll        $2, $3, 2
/* DA784 001DA684 21106200 */  addu       $2, $3, $2
/* DA788 001DA688 00110200 */  sll        $2, $2, 4
/* DA78C 001DA68C 21185500 */  addu       $3, $2, $21
/* DA790 001DA690 0200013C */  lui        $at, (0x20000 >> 16)
/* DA794 001DA694 21086100 */  addu       $at, $3, $at
/* DA798 001DA698 E0E3228C */  lw         $2, -0x1C20($at)
/* DA79C 001DA69C FFFF4224 */  addiu      $2, $2, -0x1
/* DA7A0 001DA6A0 0200013C */  lui        $at, (0x20000 >> 16)
/* DA7A4 001DA6A4 21086100 */  addu       $at, $3, $at
/* DA7A8 001DA6A8 E0E322AC */  sw         $2, -0x1C20($at)
.L001DA6AC:
/* DA7AC 001DA6AC 9000A38E */  lw         $3, 0x90($21)
/* DA7B0 001DA6B0 80100300 */  sll        $2, $3, 2
/* DA7B4 001DA6B4 21184300 */  addu       $3, $2, $3
/* DA7B8 001DA6B8 80100300 */  sll        $2, $3, 2
/* DA7BC 001DA6BC 21106200 */  addu       $2, $3, $2
/* DA7C0 001DA6C0 00110200 */  sll        $2, $2, 4
/* DA7C4 001DA6C4 21185500 */  addu       $3, $2, $21
/* DA7C8 001DA6C8 0200013C */  lui        $at, (0x20000 >> 16)
/* DA7CC 001DA6CC 21086100 */  addu       $at, $3, $at
/* DA7D0 001DA6D0 DCE3228C */  lw         $2, -0x1C24($at)
/* DA7D4 001DA6D4 90004018 */  blez       $2, .L001DA918
/* DA7D8 001DA6D8 00000000 */   nop
/* DA7DC 001DA6DC 3C42023C */  lui        $2, (0x423C0000 >> 16)
/* DA7E0 001DA6E0 0200013C */  lui        $at, (0x20000 >> 16)
/* DA7E4 001DA6E4 21086100 */  addu       $at, $3, $at
/* DA7E8 001DA6E8 20E522AC */  sw         $2, -0x1AE0($at)
/* DA7EC 001DA6EC 003F063C */  lui        $6, (0x3F000000 >> 16)
/* DA7F0 001DA6F0 9000A38E */  lw         $3, 0x90($21)
/* DA7F4 001DA6F4 80100300 */  sll        $2, $3, 2
/* DA7F8 001DA6F8 21184300 */  addu       $3, $2, $3
/* DA7FC 001DA6FC 80100300 */  sll        $2, $3, 2
/* DA800 001DA700 21106200 */  addu       $2, $3, $2
/* DA804 001DA704 00110200 */  sll        $2, $2, 4
/* DA808 001DA708 21105500 */  addu       $2, $2, $21
/* DA80C 001DA70C 0200013C */  lui        $at, (0x20000 >> 16)
/* DA810 001DA710 21084100 */  addu       $at, $2, $at
/* DA814 001DA714 24E526AC */  sw         $6, -0x1ADC($at)
/* DA818 001DA718 7F42063C */  lui        $6, (0x427F0000 >> 16)
/* DA81C 001DA71C 9000A38E */  lw         $3, 0x90($21)
/* DA820 001DA720 80100300 */  sll        $2, $3, 2
/* DA824 001DA724 21184300 */  addu       $3, $2, $3
/* DA828 001DA728 80100300 */  sll        $2, $3, 2
/* DA82C 001DA72C 21106200 */  addu       $2, $3, $2
/* DA830 001DA730 00110200 */  sll        $2, $2, 4
/* DA834 001DA734 21105500 */  addu       $2, $2, $21
/* DA838 001DA738 0200013C */  lui        $at, (0x20000 >> 16)
/* DA83C 001DA73C 21084100 */  addu       $at, $2, $at
/* DA840 001DA740 28E526AC */  sw         $6, -0x1AD8($at)
/* DA844 001DA744 01000624 */  addiu      $6, $0, 0x1
/* DA848 001DA748 9000A38E */  lw         $3, 0x90($21)
/* DA84C 001DA74C 80100300 */  sll        $2, $3, 2
/* DA850 001DA750 21184300 */  addu       $3, $2, $3
/* DA854 001DA754 80100300 */  sll        $2, $3, 2
/* DA858 001DA758 21106200 */  addu       $2, $3, $2
/* DA85C 001DA75C 00110200 */  sll        $2, $2, 4
/* DA860 001DA760 21105500 */  addu       $2, $2, $21
/* DA864 001DA764 0200013C */  lui        $at, (0x20000 >> 16)
/* DA868 001DA768 21084100 */  addu       $at, $2, $at
/* DA86C 001DA76C 30E526AC */  sw         $6, -0x1AD0($at)
/* DA870 001DA770 9000A38E */  lw         $3, 0x90($21)
/* DA874 001DA774 80100300 */  sll        $2, $3, 2
/* DA878 001DA778 21184300 */  addu       $3, $2, $3
/* DA87C 001DA77C 80100300 */  sll        $2, $3, 2
/* DA880 001DA780 21106200 */  addu       $2, $3, $2
/* DA884 001DA784 00110200 */  sll        $2, $2, 4
/* DA888 001DA788 21185500 */  addu       $3, $2, $21
/* DA88C 001DA78C 0200013C */  lui        $at, (0x20000 >> 16)
/* DA890 001DA790 21086100 */  addu       $at, $3, $at
/* DA894 001DA794 DCE3228C */  lw         $2, -0x1C24($at)
/* DA898 001DA798 FFFF4224 */  addiu      $2, $2, -0x1
/* DA89C 001DA79C 0200013C */  lui        $at, (0x20000 >> 16)
/* DA8A0 001DA7A0 21086100 */  addu       $at, $3, $at
/* DA8A4 001DA7A4 DCE322AC */  sw         $2, -0x1C24($at)
/* DA8A8 001DA7A8 9000A38E */  lw         $3, 0x90($21)
/* DA8AC 001DA7AC 80100300 */  sll        $2, $3, 2
/* DA8B0 001DA7B0 21184300 */  addu       $3, $2, $3
/* DA8B4 001DA7B4 80100300 */  sll        $2, $3, 2
/* DA8B8 001DA7B8 21106200 */  addu       $2, $3, $2
/* DA8BC 001DA7BC 00110200 */  sll        $2, $2, 4
/* DA8C0 001DA7C0 21105500 */  addu       $2, $2, $21
/* DA8C4 001DA7C4 0100013C */  lui        $at, (0x1E3DC >> 16)
/* DA8C8 001DA7C8 DCE32134 */  ori        $at, $at, (0x1E3DC & 0xFFFF)
/* DA8CC 001DA7CC 21184100 */  addu       $3, $2, $at
/* DA8D0 001DA7D0 0000628C */  lw         $2, 0x0($3)
/* DA8D4 001DA7D4 50004014 */  bnez       $2, .L001DA918
/* DA8D8 001DA7D8 00000000 */   nop
/* DA8DC 001DA7DC B4000224 */  addiu      $2, $0, 0xB4
/* DA8E0 001DA7E0 000062AC */  sw         $2, 0x0($3)
/* DA8E4 001DA7E4 9000A38E */  lw         $3, 0x90($21)
/* DA8E8 001DA7E8 80100300 */  sll        $2, $3, 2
/* DA8EC 001DA7EC 21184300 */  addu       $3, $2, $3
/* DA8F0 001DA7F0 80100300 */  sll        $2, $3, 2
/* DA8F4 001DA7F4 21106200 */  addu       $2, $3, $2
/* DA8F8 001DA7F8 00110200 */  sll        $2, $2, 4
/* DA8FC 001DA7FC 21885500 */  addu       $17, $2, $21
/* DA900 001DA800 0200013C */  lui        $at, (0x20000 >> 16)
/* DA904 001DA804 21082102 */  addu       $at, $17, $at
/* DA908 001DA808 F0E320C4 */  lwc1       $f0, -0x1C10($at)
/* DA90C 001DA80C 60008046 */  cvt.s.w    $f1, $f0
/* DA910 001DA810 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* DA914 001DA814 02050146 */  mul.s      $f20, $f0, $f1
/* DA918 001DA818 0200013C */  lui        $at, (0x20000 >> 16)
/* DA91C 001DA81C 21082102 */  addu       $at, $17, $at
/* DA920 001DA820 F4E3308C */  lw         $16, -0x1C0C($at)
/* DA924 001DA824 06A30046 */  mov.s      $f12, $f20
/* DA928 001DA828 2C44040C */  jal        fptosi
/* DA92C 001DA82C 00000000 */   nop
/* DA930 001DA830 23100202 */  subu       $2, $16, $2
/* DA934 001DA834 0200013C */  lui        $at, (0x20000 >> 16)
/* DA938 001DA838 21082102 */  addu       $at, $17, $at
/* DA93C 001DA83C F4E322AC */  sw         $2, -0x1C0C($at)
/* DA940 001DA840 01001024 */  addiu      $16, $0, 0x1
/* DA944 001DA844 9000A38E */  lw         $3, 0x90($21)
/* DA948 001DA848 80100300 */  sll        $2, $3, 2
/* DA94C 001DA84C 21184300 */  addu       $3, $2, $3
/* DA950 001DA850 80100300 */  sll        $2, $3, 2
/* DA954 001DA854 21106200 */  addu       $2, $3, $2
/* DA958 001DA858 00110200 */  sll        $2, $2, 4
/* DA95C 001DA85C 21105500 */  addu       $2, $2, $21
/* DA960 001DA860 0100013C */  lui        $at, (0x1E3F4 >> 16)
/* DA964 001DA864 F4E32134 */  ori        $at, $at, (0x1E3F4 & 0xFFFF)
/* DA968 001DA868 21184100 */  addu       $3, $2, $at
/* DA96C 001DA86C 0000628C */  lw         $2, 0x0($3)
/* DA970 001DA870 0900401C */  bgtz       $2, .L001DA898
/* DA974 001DA874 00000000 */   nop
/* DA978 001DA878 000060AC */  sw         $0, 0x0($3)
/* DA97C 001DA87C 4C00A28E */  lw         $2, 0x4C($21)
/* DA980 001DA880 FFFF4224 */  addiu      $2, $2, -0x1
/* DA984 001DA884 4C00A2AE */  sw         $2, 0x4C($21)
/* DA988 001DA888 02001024 */  addiu      $16, $0, 0x2
/* DA98C 001DA88C 789C848F */  lw         $4, -0x6388($gp)
/* DA990 001DA890 C0FD060C */  jal        AddKills__14CDngStatusDataFv
/* DA994 001DA894 00000000 */   nop
.L001DA898:
/* DA998 001DA898 9000A38E */  lw         $3, 0x90($21)
/* DA99C 001DA89C 10350224 */  addiu      $2, $0, 0x3510
/* DA9A0 001DA8A0 18106200 */  mult       $2, $3, $2
/* DA9A4 001DA8A4 2110A202 */  addu       $2, $21, $2
/* DA9A8 001DA8A8 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DA9AC 001DA8AC D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DA9B0 001DA8B0 21204100 */  addu       $4, $2, $at
/* DA9B4 001DA8B4 C001A527 */  addiu      $5, $sp, 0x1C0
/* DA9B8 001DA8B8 A000998C */  lw         $25, 0xA0($4)
/* DA9BC 001DA8BC A000398F */  lw         $25, 0xA0($25)
/* DA9C0 001DA8C0 09F82003 */  jalr       $25
/* DA9C4 001DA8C4 00000000 */   nop
/* DA9C8 001DA8C8 9000A38E */  lw         $3, 0x90($21)
/* DA9CC 001DA8CC 10350224 */  addiu      $2, $0, 0x3510
/* DA9D0 001DA8D0 18106200 */  mult       $2, $3, $2
/* DA9D4 001DA8D4 21105500 */  addu       $2, $2, $21
/* DA9D8 001DA8D8 0200013C */  lui        $at, (0x20000 >> 16)
/* DA9DC 001DA8DC 21084100 */  addu       $at, $2, $at
/* DA9E0 001DA8E0 84FD21C4 */  lwc1       $f1, -0x27C($at)
/* DA9E4 001DA8E4 C401A0C7 */  lwc1       $f0, 0x1C4($sp)
/* DA9E8 001DA8E8 00000146 */  add.s      $f0, $f0, $f1
/* DA9EC 001DA8EC C401A0E7 */  swc1       $f0, 0x1C4($sp)
/* DA9F0 001DA8F0 06A30046 */  mov.s      $f12, $f20
/* DA9F4 001DA8F4 2C44040C */  jal        fptosi
/* DA9F8 001DA8F8 00000000 */   nop
/* DA9FC 001DA8FC E09D848F */  lw         $4, -0x6220($gp)
/* DAA00 001DA900 C001A527 */  addiu      $5, $sp, 0x1C0
/* DAA04 001DA904 28364070 */  paddub     $6, $2, $0
/* DAA08 001DA908 283E0070 */  paddub     $7, $0, $0
/* DAA0C 001DA90C 28460070 */  paddub     $8, $0, $0
/* DAA10 001DA910 C0D8060C */  jal        HitValueEntry__FP9CHitValuePfiiP6CFrame
/* DAA14 001DA914 00000000 */   nop
.L001DA918:
/* DAA18 001DA918 9000A38E */  lw         $3, 0x90($21)
/* DAA1C 001DA91C 80100300 */  sll        $2, $3, 2
/* DAA20 001DA920 21184300 */  addu       $3, $2, $3
/* DAA24 001DA924 80100300 */  sll        $2, $3, 2
/* DAA28 001DA928 21106200 */  addu       $2, $3, $2
/* DAA2C 001DA92C 00110200 */  sll        $2, $2, 4
/* DAA30 001DA930 21185500 */  addu       $3, $2, $21
/* DAA34 001DA934 0200013C */  lui        $at, (0x20000 >> 16)
/* DAA38 001DA938 21086100 */  addu       $at, $3, $at
/* DAA3C 001DA93C 68E4228C */  lw         $2, -0x1B98($at)
/* DAA40 001DA940 04004018 */  blez       $2, .L001DA954
/* DAA44 001DA944 00000000 */   nop
/* DAA48 001DA948 28160072 */  paddub     $2, $16, $0
/* DAA4C 001DA94C A2070010 */  b          .L001DC7D8
/* DAA50 001DA950 00000000 */   nop
.L001DA954:
/* DAA54 001DA954 0200013C */  lui        $at, (0x20000 >> 16)
/* DAA58 001DA958 21086100 */  addu       $at, $3, $at
/* DAA5C 001DA95C B4E420AC */  sw         $0, -0x1B4C($at)
/* DAA60 001DA960 B000A0AF */  sw         $0, 0xB0($sp)
/* DAA64 001DA964 97070010 */  b          .L001DC7C4
/* DAA68 001DA968 00000000 */   nop
.L001DA96C:
/* DAA6C 001DA96C 9000A78E */  lw         $7, 0x90($21)
/* DAA70 001DA970 C0100700 */  sll        $2, $7, 3
/* DAA74 001DA974 21184700 */  addu       $3, $2, $7
/* DAA78 001DA978 C0100300 */  sll        $2, $3, 3
/* DAA7C 001DA97C 21106200 */  addu       $2, $3, $2
/* DAA80 001DA980 00310200 */  sll        $6, $2, 4
/* DAA84 001DA984 2118D500 */  addu       $3, $6, $21
/* DAA88 001DA988 B000A28F */  lw         $2, 0xB0($sp)
/* DAA8C 001DA98C 80280200 */  sll        $5, $2, 2
/* DAA90 001DA990 2118A300 */  addu       $3, $5, $3
/* DAA94 001DA994 0500013C */  lui        $at, (0x55450 >> 16)
/* DAA98 001DA998 21086100 */  addu       $at, $3, $at
/* DAA9C 001DA99C 5054228C */  lw         $2, (0x55450 & 0xFFFF)($at)
/* DAAA0 001DA9A0 85074010 */  beqz       $2, .L001DC7B8
/* DAAA4 001DA9A4 00000000 */   nop
/* DAAA8 001DA9A8 01000424 */  addiu      $4, $0, 0x1
/* DAAAC 001DA9AC 0500013C */  lui        $at, (0x553D0 >> 16)
/* DAAB0 001DA9B0 21086100 */  addu       $at, $3, $at
/* DAAB4 001DA9B4 D05322C4 */  lwc1       $f2, (0x553D0 & 0xFFFF)($at)
/* DAAB8 001DA9B8 00008044 */  mtc1       $0, $f0
/* DAABC 001DA9BC 00000000 */  nop
/* DAAC0 001DA9C0 32000246 */  c.eq.s     $f0, $f2
/* DAAC4 001DA9C4 00000000 */  nop
/* DAAC8 001DA9C8 13000145 */  bc1t       .L001DAA18
/* DAACC 001DA9CC 00000000 */   nop
/* DAAD0 001DA9D0 10350224 */  addiu      $2, $0, 0x3510
/* DAAD4 001DA9D4 1810E200 */  mult       $2, $7, $2
/* DAAD8 001DA9D8 21105500 */  addu       $2, $2, $21
/* DAADC 001DA9DC 0200013C */  lui        $at, (0x20000 >> 16)
/* DAAE0 001DA9E0 21084100 */  addu       $at, $2, $at
/* DAAE4 001DA9E4 C0FF21C4 */  lwc1       $f1, -0x40($at)
/* DAAE8 001DA9E8 34100146 */  c.lt.s     $f2, $f1
/* DAAEC 001DA9EC 00000000 */  nop
/* DAAF0 001DA9F0 08000045 */  bc1f       .L001DAA14
/* DAAF4 001DA9F4 00000000 */   nop
/* DAAF8 001DA9F8 0500013C */  lui        $at, (0x55410 >> 16)
/* DAAFC 001DA9FC 21086100 */  addu       $at, $3, $at
/* DAB00 001DAA00 105420C4 */  lwc1       $f0, (0x55410 & 0xFFFF)($at)
/* DAB04 001DAA04 34000146 */  c.lt.s     $f0, $f1
/* DAB08 001DAA08 00000000 */  nop
/* DAB0C 001DAA0C 02000045 */  bc1f       .L001DAA18
/* DAB10 001DAA10 00000000 */   nop
.L001DAA14:
/* DAB14 001DAA14 28260070 */  paddub     $4, $0, $0
.L001DAA18:
/* DAB18 001DAA18 67078010 */  beqz       $4, .L001DC7B8
/* DAB1C 001DAA1C 00000000 */   nop
/* DAB20 001DAA20 2118D500 */  addu       $3, $6, $21
/* DAB24 001DAA24 2110A300 */  addu       $2, $5, $3
/* DAB28 001DAA28 0500013C */  lui        $at, (0x55390 >> 16)
/* DAB2C 001DAA2C 21084100 */  addu       $at, $2, $at
/* DAB30 001DAA30 905334C4 */  lwc1       $f20, (0x55390 & 0xFFFF)($at)
/* DAB34 001DAA34 B000A28F */  lw         $2, 0xB0($sp)
/* DAB38 001DAA38 00F10200 */  sll        $fp, $2, 4
/* DAB3C 001DAA3C 21107E00 */  addu       $2, $3, $fp
/* DAB40 001DAA40 0500013C */  lui        $at, (0x55250 >> 16)
/* DAB44 001DAA44 50522134 */  ori        $at, $at, (0x55250 & 0xFFFF)
/* DAB48 001DAA48 21A04100 */  addu       $20, $2, $at
/* DAB4C 001DAA4C F09D918F */  lw         $17, -0x6210($gp)
/* DAB50 001DAA50 28960070 */  paddub     $18, $0, $0
/* DAB54 001DAA54 1E000010 */  b          .L001DAAD0
/* DAB58 001DAA58 00000000 */   nop
.L001DAA5C:
/* DAB5C 001DAA5C 80181200 */  sll        $3, $18, 2
/* DAB60 001DAA60 21107100 */  addu       $2, $3, $17
/* DAB64 001DAA64 003C428C */  lw         $2, 0x3C00($2)
/* DAB68 001DAA68 18004010 */  beqz       $2, .L001DAACC
/* DAB6C 001DAA6C 00000000 */   nop
/* DAB70 001DAA70 21107200 */  addu       $2, $3, $18
/* DAB74 001DAA74 40990200 */  sll        $19, $2, 5
/* DAB78 001DAA78 21287102 */  addu       $5, $19, $17
/* DAB7C 001DAA7C 4800A28C */  lw         $2, 0x48($5)
/* DAB80 001DAA80 02004230 */  andi       $2, $2, 0x2
/* DAB84 001DAA84 11004010 */  beqz       $2, .L001DAACC
/* DAB88 001DAA88 00000000 */   nop
/* DAB8C 001DAA8C 7000A38C */  lw         $3, 0x70($5)
/* DAB90 001DAA90 7400A28C */  lw         $2, 0x74($5)
/* DAB94 001DAA94 0D006214 */  bne        $3, $2, .L001DAACC
/* DAB98 001DAA98 00000000 */   nop
/* DAB9C 001DAA9C 28268072 */  paddub     $4, $20, $0
/* DABA0 001DAAA0 648D040C */  jal        DistVector__FPfPf
/* DABA4 001DAAA4 00000000 */   nop
/* DABA8 001DAAA8 21107102 */  addu       $2, $19, $17
/* DABAC 001DAAAC 3C0041C4 */  lwc1       $f1, 0x3C($2)
/* DABB0 001DAAB0 40A00146 */  add.s      $f1, $f20, $f1
/* DABB4 001DAAB4 36000146 */  c.le.s     $f0, $f1
/* DABB8 001DAAB8 00000000 */  nop
/* DABBC 001DAABC 03000045 */  bc1f       .L001DAACC
/* DABC0 001DAAC0 00000000 */   nop
/* DABC4 001DAAC4 06000010 */  b          .L001DAAE0
/* DABC8 001DAAC8 00000000 */   nop
.L001DAACC:
/* DABCC 001DAACC 01005226 */  addiu      $18, $18, 0x1
.L001DAAD0:
/* DABD0 001DAAD0 6000422A */  slti       $2, $18, 0x60
/* DABD4 001DAAD4 E1FF4014 */  bnez       $2, .L001DAA5C
/* DABD8 001DAAD8 00000000 */   nop
/* DABDC 001DAADC FFFF1224 */  addiu      $18, $0, -0x1
.L001DAAE0:
/* DABE0 001DAAE0 282E0070 */  paddub     $5, $0, $0
/* DABE4 001DAAE4 FFFF0224 */  addiu      $2, $0, -0x1
/* DABE8 001DAAE8 55004212 */  beq        $18, $2, .L001DAC40
/* DABEC 001DAAEC 00000000 */   nop
/* DABF0 001DAAF0 F09D848F */  lw         $4, -0x6210($gp)
/* DABF4 001DAAF4 80101200 */  sll        $2, $18, 2
/* DABF8 001DAAF8 21105200 */  addu       $2, $2, $18
/* DABFC 001DAAFC 40390200 */  sll        $7, $2, 5
/* DAC00 001DAB00 2110E400 */  addu       $2, $7, $4
/* DAC04 001DAB04 5C00438C */  lw         $3, 0x5C($2)
/* DAC08 001DAB08 9000A68E */  lw         $6, 0x90($21)
/* DAC0C 001DAB0C 02006614 */  bne        $3, $6, .L001DAB18
/* DAC10 001DAB10 00000000 */   nop
/* DAC14 001DAB14 01000524 */  addiu      $5, $0, 0x1
.L001DAB18:
/* DAC18 001DAB18 FFFF0224 */  addiu      $2, $0, -0x1
/* DAC1C 001DAB1C 48006210 */  beq        $3, $2, .L001DAC40
/* DAC20 001DAB20 00000000 */   nop
/* DAC24 001DAB24 46006610 */  beq        $3, $6, .L001DAC40
/* DAC28 001DAB28 00000000 */   nop
/* DAC2C 001DAB2C 21888700 */  addu       $17, $4, $7
/* DAC30 001DAB30 BE11040C */  jal        rand
/* DAC34 001DAB34 00000000 */   nop
/* DAC38 001DAB38 00008244 */  mtc1       $2, $f0
/* DAC3C 001DAB3C 00000000 */  nop
/* DAC40 001DAB40 60008046 */  cvt.s.w    $f1, $f0
/* DAC44 001DAB44 C842023C */  lui        $2, (0x42C80000 >> 16)
/* DAC48 001DAB48 00008244 */  mtc1       $2, $f0
/* DAC4C 001DAB4C 00000000 */  nop
/* DAC50 001DAB50 42000146 */  mul.s      $f1, $f0, $f1
/* DAC54 001DAB54 004F023C */  lui        $2, (0x4F000000 >> 16)
/* DAC58 001DAB58 00008244 */  mtc1       $2, $f0
/* DAC5C 001DAB5C 00000000 */  nop
/* DAC60 001DAB60 43080046 */  div.s      $f1, $f1, $f0
/* DAC64 001DAB64 5000228E */  lw         $2, 0x50($17)
/* DAC68 001DAB68 00104230 */  andi       $2, $2, 0x1000
/* DAC6C 001DAB6C 33004010 */  beqz       $2, .L001DAC3C
/* DAC70 001DAB70 00000000 */   nop
/* DAC74 001DAB74 9000A38E */  lw         $3, 0x90($21)
/* DAC78 001DAB78 80100300 */  sll        $2, $3, 2
/* DAC7C 001DAB7C 21184300 */  addu       $3, $2, $3
/* DAC80 001DAB80 80100300 */  sll        $2, $3, 2
/* DAC84 001DAB84 21106200 */  addu       $2, $3, $2
/* DAC88 001DAB88 00110200 */  sll        $2, $2, 4
/* DAC8C 001DAB8C 21185500 */  addu       $3, $2, $21
/* DAC90 001DAB90 0200013C */  lui        $at, (0x20000 >> 16)
/* DAC94 001DAB94 21086100 */  addu       $at, $3, $at
/* DAC98 001DAB98 AEE42284 */  lh         $2, -0x1B52($at)
/* DAC9C 001DAB9C 00008244 */  mtc1       $2, $f0
/* DACA0 001DABA0 00000000 */  nop
/* DACA4 001DABA4 20008046 */  cvt.s.w    $f0, $f0
/* DACA8 001DABA8 34080046 */  c.lt.s     $f1, $f0
/* DACAC 001DABAC 00000000 */  nop
/* DACB0 001DABB0 22000045 */  bc1f       .L001DAC3C
/* DACB4 001DABB4 00000000 */   nop
/* DACB8 001DABB8 0100013C */  lui        $at, (0x1E3E0 >> 16)
/* DACBC 001DABBC E0E32134 */  ori        $at, $at, (0x1E3E0 & 0xFFFF)
/* DACC0 001DABC0 21186100 */  addu       $3, $3, $at
/* DACC4 001DABC4 0000628C */  lw         $2, 0x0($3)
/* DACC8 001DABC8 1C004014 */  bnez       $2, .L001DAC3C
/* DACCC 001DABCC 00000000 */   nop
/* DACD0 001DABD0 08070224 */  addiu      $2, $0, 0x708
/* DACD4 001DABD4 000062AC */  sw         $2, 0x0($3)
/* DACD8 001DABD8 9000A38E */  lw         $3, 0x90($21)
/* DACDC 001DABDC 80100300 */  sll        $2, $3, 2
/* DACE0 001DABE0 21184300 */  addu       $3, $2, $3
/* DACE4 001DABE4 80100300 */  sll        $2, $3, 2
/* DACE8 001DABE8 21106200 */  addu       $2, $3, $2
/* DACEC 001DABEC 00110200 */  sll        $2, $2, 4
/* DACF0 001DABF0 21105500 */  addu       $2, $2, $21
/* DACF4 001DABF4 0200013C */  lui        $at, (0x20000 >> 16)
/* DACF8 001DABF8 21084100 */  addu       $at, $2, $at
/* DACFC 001DABFC DCE320AC */  sw         $0, -0x1C24($at)
/* DAD00 001DAC00 9000A38E */  lw         $3, 0x90($21)
/* DAD04 001DAC04 80100300 */  sll        $2, $3, 2
/* DAD08 001DAC08 21184300 */  addu       $3, $2, $3
/* DAD0C 001DAC0C 80100300 */  sll        $2, $3, 2
/* DAD10 001DAC10 21106200 */  addu       $2, $3, $2
/* DAD14 001DAC14 00110200 */  sll        $2, $2, 4
/* DAD18 001DAC18 21105500 */  addu       $2, $2, $21
/* DAD1C 001DAC1C 0200013C */  lui        $at, (0x20000 >> 16)
/* DAD20 001DAC20 21084100 */  addu       $at, $2, $at
/* DAD24 001DAC24 E4E320AC */  sw         $0, -0x1C1C($at)
/* DAD28 001DAC28 6F000424 */  addiu      $4, $0, 0x6F
/* DAD2C 001DAC2C FFFF0524 */  addiu      $5, $0, -0x1
/* DAD30 001DAC30 28360070 */  paddub     $6, $0, $0
/* DAD34 001DAC34 AC69050C */  jal        SndSePlay__Fiii
/* DAD38 001DAC38 00000000 */   nop
.L001DAC3C:
/* DAD3C 001DAC3C 01000524 */  addiu      $5, $0, 0x1
.L001DAC40:
/* DAD40 001DAC40 FFFF0224 */  addiu      $2, $0, -0x1
/* DAD44 001DAC44 E4004212 */  beq        $18, $2, .L001DAFD8
/* DAD48 001DAC48 00000000 */   nop
/* DAD4C 001DAC4C E200A014 */  bnez       $5, .L001DAFD8
/* DAD50 001DAC50 00000000 */   nop
/* DAD54 001DAC54 28360070 */  paddub     $6, $0, $0
/* DAD58 001DAC58 DC000010 */  b          .L001DAFCC
/* DAD5C 001DAC5C 00000000 */   nop
.L001DAC60:
/* DAD60 001DAC60 9000A48E */  lw         $4, 0x90($21)
/* DAD64 001DAC64 40110400 */  sll        $2, $4, 5
/* DAD68 001DAC68 21185500 */  addu       $3, $2, $21
/* DAD6C 001DAC6C 40100600 */  sll        $2, $6, 1
/* DAD70 001DAC70 21104300 */  addu       $2, $2, $3
/* DAD74 001DAC74 0600013C */  lui        $at, (0x60550 >> 16)
/* DAD78 001DAC78 21084100 */  addu       $at, $2, $at
/* DAD7C 001DAC7C 50052284 */  lh         $2, (0x60550 & 0xFFFF)($at)
/* DAD80 001DAC80 D1004010 */  beqz       $2, .L001DAFC8
/* DAD84 001DAC84 00000000 */   nop
/* DAD88 001DAC88 10350224 */  addiu      $2, $0, 0x3510
/* DAD8C 001DAC8C 18108200 */  mult       $2, $4, $2
/* DAD90 001DAC90 21205500 */  addu       $4, $2, $21
/* DAD94 001DAC94 0200013C */  lui        $at, (0x20000 >> 16)
/* DAD98 001DAC98 21088100 */  addu       $at, $4, $at
/* DAD9C 001DAC9C C0FF21C4 */  lwc1       $f1, -0x40($at)
/* DADA0 001DACA0 80100600 */  sll        $2, $6, 2
/* DADA4 001DACA4 21104300 */  addu       $2, $2, $3
/* DADA8 001DACA8 0600013C */  lui        $at, (0x60558 >> 16)
/* DADAC 001DACAC 21084100 */  addu       $at, $2, $at
/* DADB0 001DACB0 580520C4 */  lwc1       $f0, (0x60558 & 0xFFFF)($at)
/* DADB4 001DACB4 36000146 */  c.le.s     $f0, $f1
/* DADB8 001DACB8 00000000 */  nop
/* DADBC 001DACBC C2000045 */  bc1f       .L001DAFC8
/* DADC0 001DACC0 00000000 */   nop
/* DADC4 001DACC4 0600013C */  lui        $at, (0x60564 >> 16)
/* DADC8 001DACC8 21084100 */  addu       $at, $2, $at
/* DADCC 001DACCC 640520C4 */  lwc1       $f0, (0x60564 & 0xFFFF)($at)
/* DADD0 001DACD0 34000146 */  c.lt.s     $f0, $f1
/* DADD4 001DACD4 00000000 */  nop
/* DADD8 001DACD8 BB000145 */  bc1t       .L001DAFC8
/* DADDC 001DACDC 00000000 */   nop
/* DADE0 001DACE0 F09D838F */  lw         $3, -0x6210($gp)
/* DADE4 001DACE4 80101200 */  sll        $2, $18, 2
/* DADE8 001DACE8 21105200 */  addu       $2, $2, $18
/* DADEC 001DACEC 40890200 */  sll        $17, $2, 5
/* DADF0 001DACF0 21A07100 */  addu       $20, $3, $17
/* DADF4 001DACF4 9800838E */  lw         $3, 0x98($20)
/* DADF8 001DACF8 02000224 */  addiu      $2, $0, 0x2
/* DADFC 001DACFC 4C006214 */  bne        $3, $2, .L001DAE30
/* DAE00 001DAD00 00000000 */   nop
/* DAE04 001DAD04 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DAE08 001DAD08 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DAE0C 001DAD0C 21208100 */  addu       $4, $4, $at
/* DAE10 001DAD10 D001A527 */  addiu      $5, $sp, 0x1D0
/* DAE14 001DAD14 A000998C */  lw         $25, 0xA0($4)
/* DAE18 001DAD18 A000398F */  lw         $25, 0xA0($25)
/* DAE1C 001DAD1C 09F82003 */  jalr       $25
/* DAE20 001DAD20 00000000 */   nop
/* DAE24 001DAD24 E001A427 */  addiu      $4, $sp, 0x1E0
/* DAE28 001DAD28 80008526 */  addiu      $5, $20, 0x80
/* DAE2C 001DAD2C 0C86040C */  jal        sceVu0CopyVector
/* DAE30 001DAD30 00000000 */   nop
/* DAE34 001DAD34 D401A0AF */  sw         $0, 0x1D4($sp)
/* DAE38 001DAD38 E401A0AF */  sw         $0, 0x1E4($sp)
/* DAE3C 001DAD3C 9000A38E */  lw         $3, 0x90($21)
/* DAE40 001DAD40 80100300 */  sll        $2, $3, 2
/* DAE44 001DAD44 21184300 */  addu       $3, $2, $3
/* DAE48 001DAD48 80100300 */  sll        $2, $3, 2
/* DAE4C 001DAD4C 21106200 */  addu       $2, $3, $2
/* DAE50 001DAD50 00110200 */  sll        $2, $2, 4
/* DAE54 001DAD54 2110A202 */  addu       $2, $21, $2
/* DAE58 001DAD58 0100013C */  lui        $at, (0x1E540 >> 16)
/* DAE5C 001DAD5C 40E52134 */  ori        $at, $at, (0x1E540 & 0xFFFF)
/* DAE60 001DAD60 21204100 */  addu       $4, $2, $at
/* DAE64 001DAD64 D001A527 */  addiu      $5, $sp, 0x1D0
/* DAE68 001DAD68 E001A627 */  addiu      $6, $sp, 0x1E0
/* DAE6C 001DAD6C EE85040C */  jal        sceVu0SubVector
/* DAE70 001DAD70 00000000 */   nop
/* DAE74 001DAD74 9000A38E */  lw         $3, 0x90($21)
/* DAE78 001DAD78 80100300 */  sll        $2, $3, 2
/* DAE7C 001DAD7C 21184300 */  addu       $3, $2, $3
/* DAE80 001DAD80 80100300 */  sll        $2, $3, 2
/* DAE84 001DAD84 21106200 */  addu       $2, $3, $2
/* DAE88 001DAD88 00110200 */  sll        $2, $2, 4
/* DAE8C 001DAD8C 2110A202 */  addu       $2, $21, $2
/* DAE90 001DAD90 0100013C */  lui        $at, (0x1E540 >> 16)
/* DAE94 001DAD94 40E52134 */  ori        $at, $at, (0x1E540 & 0xFFFF)
/* DAE98 001DAD98 21204100 */  addu       $4, $2, $at
/* DAE9C 001DAD9C 282E8070 */  paddub     $5, $4, $0
/* DAEA0 001DADA0 9285040C */  jal        sceVu0Normalize
/* DAEA4 001DADA4 00000000 */   nop
/* DAEA8 001DADA8 9000A38E */  lw         $3, 0x90($21)
/* DAEAC 001DADAC 80100300 */  sll        $2, $3, 2
/* DAEB0 001DADB0 21184300 */  addu       $3, $2, $3
/* DAEB4 001DADB4 80100300 */  sll        $2, $3, 2
/* DAEB8 001DADB8 21106200 */  addu       $2, $3, $2
/* DAEBC 001DADBC 00190200 */  sll        $3, $2, 4
/* DAEC0 001DADC0 C03F023C */  lui        $2, (0x3FC00000 >> 16)
/* DAEC4 001DADC4 00108244 */  mtc1       $2, $f2
/* DAEC8 001DADC8 900080C6 */  lwc1       $f0, 0x90($20)
/* DAECC 001DADCC 42100046 */  mul.s      $f1, $f2, $f0
/* DAED0 001DADD0 21107500 */  addu       $2, $3, $21
/* DAED4 001DADD4 0200013C */  lui        $at, (0x20000 >> 16)
/* DAED8 001DADD8 21084100 */  addu       $at, $2, $at
/* DAEDC 001DADDC 58E520C4 */  lwc1       $f0, -0x1AA8($at)
/* DAEE0 001DADE0 02080046 */  mul.s      $f0, $f1, $f0
/* DAEE4 001DADE4 0200013C */  lui        $at, (0x20000 >> 16)
/* DAEE8 001DADE8 21084100 */  addu       $at, $2, $at
/* DAEEC 001DADEC 50E520E4 */  swc1       $f0, -0x1AB0($at)
/* DAEF0 001DADF0 9000A38E */  lw         $3, 0x90($21)
/* DAEF4 001DADF4 80100300 */  sll        $2, $3, 2
/* DAEF8 001DADF8 21184300 */  addu       $3, $2, $3
/* DAEFC 001DADFC 80100300 */  sll        $2, $3, 2
/* DAF00 001DAE00 21106200 */  addu       $2, $3, $2
/* DAF04 001DAE04 00110200 */  sll        $2, $2, 4
/* DAF08 001DAE08 940080C6 */  lwc1       $f0, 0x94($20)
/* DAF0C 001DAE0C 42100046 */  mul.s      $f1, $f2, $f0
/* DAF10 001DAE10 21105500 */  addu       $2, $2, $21
/* DAF14 001DAE14 0200013C */  lui        $at, (0x20000 >> 16)
/* DAF18 001DAE18 21084100 */  addu       $at, $2, $at
/* DAF1C 001DAE1C 58E520C4 */  lwc1       $f0, -0x1AA8($at)
/* DAF20 001DAE20 02080046 */  mul.s      $f0, $f1, $f0
/* DAF24 001DAE24 0200013C */  lui        $at, (0x20000 >> 16)
/* DAF28 001DAE28 21084100 */  addu       $at, $2, $at
/* DAF2C 001DAE2C 54E520E4 */  swc1       $f0, -0x1AAC($at)
.L001DAE30:
/* DAF30 001DAE30 F09D828F */  lw         $2, -0x6210($gp)
/* DAF34 001DAE34 21102202 */  addu       $2, $17, $2
/* DAF38 001DAE38 5800438C */  lw         $3, 0x58($2)
/* DAF3C 001DAE3C 6000428C */  lw         $2, 0x60($2)
/* DAF40 001DAE40 16004014 */  bnez       $2, .L001DAE9C
/* DAF44 001DAE44 00000000 */   nop
/* DAF48 001DAE48 07006010 */  beqz       $3, .L001DAE68
/* DAF4C 001DAE4C 00000000 */   nop
/* DAF50 001DAE50 02000224 */  addiu      $2, $0, 0x2
/* DAF54 001DAE54 04006210 */  beq        $3, $2, .L001DAE68
/* DAF58 001DAE58 00000000 */   nop
/* DAF5C 001DAE5C 04000224 */  addiu      $2, $0, 0x4
/* DAF60 001DAE60 0E006214 */  bne        $3, $2, .L001DAE9C
/* DAF64 001DAE64 00000000 */   nop
.L001DAE68:
/* DAF68 001DAE68 9000A38E */  lw         $3, 0x90($21)
/* DAF6C 001DAE6C 80100300 */  sll        $2, $3, 2
/* DAF70 001DAE70 21184300 */  addu       $3, $2, $3
/* DAF74 001DAE74 80100300 */  sll        $2, $3, 2
/* DAF78 001DAE78 21106200 */  addu       $2, $3, $2
/* DAF7C 001DAE7C 00110200 */  sll        $2, $2, 4
/* DAF80 001DAE80 21105500 */  addu       $2, $2, $21
/* DAF84 001DAE84 0200013C */  lui        $at, (0x20000 >> 16)
/* DAF88 001DAE88 21084100 */  addu       $at, $2, $at
/* DAF8C 001DAE8C 62E42484 */  lh         $4, -0x1B9E($at)
/* DAF90 001DAE90 80808CC7 */  lwc1       $f12, -0x7F80($gp)
/* DAF94 001DAE94 CCE6760C */  jal        func_1DB9B30
/* DAF98 001DAE98 00000000 */   nop
.L001DAE9C:
/* DAF9C 001DAE9C F001A0AF */  sw         $0, 0x1F0($sp)
/* DAFA0 001DAEA0 2040023C */  lui        $2, (0x40200000 >> 16)
/* DAFA4 001DAEA4 F401A2AF */  sw         $2, 0x1F4($sp)
/* DAFA8 001DAEA8 F801A0AF */  sw         $0, 0x1F8($sp)
/* DAFAC 001DAEAC 803F023C */  lui        $2, (0x3F800000 >> 16)
/* DAFB0 001DAEB0 FC01A2AF */  sw         $2, 0x1FC($sp)
/* DAFB4 001DAEB4 9000A68E */  lw         $6, 0x90($21)
/* DAFB8 001DAEB8 7494838F */  lw         $3, -0x6B8C($gp)
/* DAFBC 001DAEBC 00110300 */  sll        $2, $3, 4
/* DAFC0 001DAEC0 21184300 */  addu       $3, $2, $3
/* DAFC4 001DAEC4 80100300 */  sll        $2, $3, 2
/* DAFC8 001DAEC8 23104300 */  subu       $2, $2, $3
/* DAFCC 001DAECC 40190200 */  sll        $3, $2, 5
/* DAFD0 001DAED0 EC01023C */  lui        $2, %hi(D_1EBE140)
/* DAFD4 001DAED4 40E14224 */  addiu      $2, $2, %lo(D_1EBE140)
/* DAFD8 001DAED8 21204300 */  addu       $4, $2, $3
/* DAFDC 001DAEDC C0100600 */  sll        $2, $6, 3
/* DAFE0 001DAEE0 21184600 */  addu       $3, $2, $6
/* DAFE4 001DAEE4 C0100300 */  sll        $2, $3, 3
/* DAFE8 001DAEE8 21106200 */  addu       $2, $3, $2
/* DAFEC 001DAEEC 00110200 */  sll        $2, $2, 4
/* DAFF0 001DAEF0 2110A202 */  addu       $2, $21, $2
/* DAFF4 001DAEF4 21285E00 */  addu       $5, $2, $fp
/* DAFF8 001DAEF8 80100600 */  sll        $2, $6, 2
/* DAFFC 001DAEFC 21184600 */  addu       $3, $2, $6
/* DB000 001DAF00 80100300 */  sll        $2, $3, 2
/* DB004 001DAF04 21106200 */  addu       $2, $3, $2
/* DB008 001DAF08 00110200 */  sll        $2, $2, 4
/* DB00C 001DAF0C 21105500 */  addu       $2, $2, $21
/* DB010 001DAF10 0500013C */  lui        $at, (0x55250 >> 16)
/* DB014 001DAF14 50522134 */  ori        $at, $at, (0x55250 & 0xFFFF)
/* DB018 001DAF18 2128A100 */  addu       $5, $5, $at
/* DB01C 001DAF1C F001A627 */  addiu      $6, $sp, 0x1F0
/* DB020 001DAF20 02000724 */  addiu      $7, $0, 0x2
/* DB024 001DAF24 DC838CC7 */  lwc1       $f12, -0x7C24($gp)
/* DB028 001DAF28 84858DC7 */  lwc1       $f13, -0x7A7C($gp)
/* DB02C 001DAF2C 4C858EC7 */  lwc1       $f14, -0x7AB4($gp)
/* DB030 001DAF30 88858FC7 */  lwc1       $f15, -0x7A78($gp)
/* DB034 001DAF34 20000824 */  addiu      $8, $0, 0x20
/* DB038 001DAF38 0200013C */  lui        $at, (0x20000 >> 16)
/* DB03C 001DAF3C 21084100 */  addu       $at, $2, $at
/* DB040 001DAF40 8CE430C4 */  lwc1       $f16, -0x1B74($at)
/* DB044 001DAF44 A4CB060C */  jal        Set__8CHitMarkFPfPfiffffif
/* DB048 001DAF48 00000000 */   nop
/* DB04C 001DAF4C 9000A38E */  lw         $3, 0x90($21)
/* DB050 001DAF50 C0100300 */  sll        $2, $3, 3
/* DB054 001DAF54 21184300 */  addu       $3, $2, $3
/* DB058 001DAF58 C0100300 */  sll        $2, $3, 3
/* DB05C 001DAF5C 21106200 */  addu       $2, $3, $2
/* DB060 001DAF60 00110200 */  sll        $2, $2, 4
/* DB064 001DAF64 2110A202 */  addu       $2, $21, $2
/* DB068 001DAF68 21105E00 */  addu       $2, $2, $fp
/* DB06C 001DAF6C 0500013C */  lui        $at, (0x55250 >> 16)
/* DB070 001DAF70 50522134 */  ori        $at, $at, (0x55250 & 0xFFFF)
/* DB074 001DAF74 21284100 */  addu       $5, $2, $at
/* DB078 001DAF78 7494828F */  lw         $2, -0x6B8C($gp)
/* DB07C 001DAF7C 40190200 */  sll        $3, $2, 5
/* DB080 001DAF80 EC01023C */  lui        $2, %hi(D_1EC4740)
/* DB084 001DAF84 40474224 */  addiu      $2, $2, %lo(D_1EC4740)
/* DB088 001DAF88 21884300 */  addu       $17, $2, $3
/* DB08C 001DAF8C 28262072 */  paddub     $4, $17, $0
/* DB090 001DAF90 0C86040C */  jal        sceVu0CopyVector
/* DB094 001DAF94 00000000 */   nop
/* DB098 001DAF98 01000224 */  addiu      $2, $0, 0x1
/* DB09C 001DAF9C 180022AE */  sw         $2, 0x18($17)
/* DB0A0 001DAFA0 140020AE */  sw         $0, 0x14($17)
/* DB0A4 001DAFA4 10000224 */  addiu      $2, $0, 0x10
/* DB0A8 001DAFA8 100022AE */  sw         $2, 0x10($17)
/* DB0AC 001DAFAC A2000424 */  addiu      $4, $0, 0xA2
/* DB0B0 001DAFB0 FFFF0524 */  addiu      $5, $0, -0x1
/* DB0B4 001DAFB4 28360070 */  paddub     $6, $0, $0
/* DB0B8 001DAFB8 AC69050C */  jal        SndSePlay__Fiii
/* DB0BC 001DAFBC 00000000 */   nop
/* DB0C0 001DAFC0 01000524 */  addiu      $5, $0, 0x1
/* DB0C4 001DAFC4 03000624 */  addiu      $6, $0, 0x3
.L001DAFC8:
/* DB0C8 001DAFC8 0100C624 */  addiu      $6, $6, 0x1
.L001DAFCC:
/* DB0CC 001DAFCC 0300C228 */  slti       $2, $6, 0x3
/* DB0D0 001DAFD0 23FF4014 */  bnez       $2, .L001DAC60
/* DB0D4 001DAFD4 00000000 */   nop
.L001DAFD8:
/* DB0D8 001DAFD8 FFFF0224 */  addiu      $2, $0, -0x1
/* DB0DC 001DAFDC F6054212 */  beq        $18, $2, .L001DC7B8
/* DB0E0 001DAFE0 00000000 */   nop
/* DB0E4 001DAFE4 F405A014 */  bnez       $5, .L001DC7B8
/* DB0E8 001DAFE8 00000000 */   nop
/* DB0EC 001DAFEC F09D848F */  lw         $4, -0x6210($gp)
/* DB0F0 001DAFF0 80181200 */  sll        $3, $18, 2
/* DB0F4 001DAFF4 21187200 */  addu       $3, $3, $18
/* DB0F8 001DAFF8 40B10300 */  sll        $22, $3, 5
/* DB0FC 001DAFFC 21189600 */  addu       $3, $4, $22
/* DB100 001DB000 D000A3AF */  sw         $3, 0xD0($sp)
/* DB104 001DB004 9000A48E */  lw         $4, 0x90($21)
/* DB108 001DB008 C0180400 */  sll        $3, $4, 3
/* DB10C 001DB00C 21206400 */  addu       $4, $3, $4
/* DB110 001DB010 C0180400 */  sll        $3, $4, 3
/* DB114 001DB014 21188300 */  addu       $3, $4, $3
/* DB118 001DB018 00190300 */  sll        $3, $3, 4
/* DB11C 001DB01C 21207500 */  addu       $4, $3, $21
/* DB120 001DB020 B000A38F */  lw         $3, 0xB0($sp)
/* DB124 001DB024 0500013C */  lui        $at, (0x55750 >> 16)
/* DB128 001DB028 21088100 */  addu       $at, $4, $at
/* DB12C 001DB02C 505723AC */  sw         $3, (0x55750 & 0xFFFF)($at)
/* DB130 001DB030 F09D838F */  lw         $3, -0x6210($gp)
/* DB134 001DB034 2118C302 */  addu       $3, $22, $3
/* DB138 001DB038 6000648C */  lw         $4, 0x60($3)
/* DB13C 001DB03C 5800738C */  lw         $19, 0x58($3)
/* DB140 001DB040 04006212 */  beq        $19, $2, .L001DB054
/* DB144 001DB044 00000000 */   nop
/* DB148 001DB048 80101300 */  sll        $2, $19, 2
/* DB14C 001DB04C 21105300 */  addu       $2, $2, $19
/* DB150 001DB050 40100200 */  sll        $2, $2, 1
.L001DB054:
/* DB154 001DB054 FFFF0324 */  addiu      $3, $0, -0x1
/* DB158 001DB058 02008310 */  beq        $4, $3, .L001DB064
/* DB15C 001DB05C 00000000 */   nop
/* DB160 001DB060 21104400 */  addu       $2, $2, $4
.L001DB064:
/* DB164 001DB064 9000A48E */  lw         $4, 0x90($21)
/* DB168 001DB068 80180400 */  sll        $3, $4, 2
/* DB16C 001DB06C 21206400 */  addu       $4, $3, $4
/* DB170 001DB070 80180400 */  sll        $3, $4, 2
/* DB174 001DB074 21188300 */  addu       $3, $4, $3
/* DB178 001DB078 00190300 */  sll        $3, $3, 4
/* DB17C 001DB07C 21187500 */  addu       $3, $3, $21
/* DB180 001DB080 0200013C */  lui        $at, (0x20000 >> 16)
/* DB184 001DB084 21086100 */  addu       $at, $3, $at
/* DB188 001DB088 94E422AC */  sw         $2, -0x1B6C($at)
/* DB18C 001DB08C F09D828F */  lw         $2, -0x6210($gp)
/* DB190 001DB090 2110C202 */  addu       $2, $22, $2
/* DB194 001DB094 6C00448C */  lw         $4, 0x6C($2)
/* DB198 001DB098 9000A38E */  lw         $3, 0x90($21)
/* DB19C 001DB09C C0100300 */  sll        $2, $3, 3
/* DB1A0 001DB0A0 21184300 */  addu       $3, $2, $3
/* DB1A4 001DB0A4 C0100300 */  sll        $2, $3, 3
/* DB1A8 001DB0A8 21106200 */  addu       $2, $3, $2
/* DB1AC 001DB0AC 00110200 */  sll        $2, $2, 4
/* DB1B0 001DB0B0 21105500 */  addu       $2, $2, $21
/* DB1B4 001DB0B4 0500013C */  lui        $at, (0x55754 >> 16)
/* DB1B8 001DB0B8 21084100 */  addu       $at, $2, $at
/* DB1BC 001DB0BC 545724AC */  sw         $4, (0x55754 & 0xFFFF)($at)
/* DB1C0 001DB0C0 F09D828F */  lw         $2, -0x6210($gp)
/* DB1C4 001DB0C4 2110C202 */  addu       $2, $22, $2
/* DB1C8 001DB0C8 5000428C */  lw         $2, 0x50($2)
/* DB1CC 001DB0CC E000A2AF */  sw         $2, 0xE0($sp)
/* DB1D0 001DB0D0 2A00023C */  lui        $2, %hi(_1518)
/* DB1D4 001DB0D4 68CF4424 */  addiu      $4, $2, %lo(_1518)
/* DB1D8 001DB0D8 E000A58F */  lw         $5, 0xE0($sp)
/* DB1DC 001DB0DC A611040C */  jal        printf
/* DB1E0 001DB0E0 00000000 */   nop
/* DB1E4 001DB0E4 10000324 */  addiu      $3, $0, 0x10
/* DB1E8 001DB0E8 E000A28F */  lw         $2, 0xE0($sp)
/* DB1EC 001DB0EC 1B004310 */  beq        $2, $3, .L001DB15C
/* DB1F0 001DB0F0 00000000 */   nop
/* DB1F4 001DB0F4 08000324 */  addiu      $3, $0, 0x8
/* DB1F8 001DB0F8 15004310 */  beq        $2, $3, .L001DB150
/* DB1FC 001DB0FC 00000000 */   nop
/* DB200 001DB100 04000324 */  addiu      $3, $0, 0x4
/* DB204 001DB104 0F004310 */  beq        $2, $3, .L001DB144
/* DB208 001DB108 00000000 */   nop
/* DB20C 001DB10C 02000324 */  addiu      $3, $0, 0x2
/* DB210 001DB110 09004310 */  beq        $2, $3, .L001DB138
/* DB214 001DB114 00000000 */   nop
/* DB218 001DB118 01000324 */  addiu      $3, $0, 0x1
/* DB21C 001DB11C 03004310 */  beq        $2, $3, .L001DB12C
/* DB220 001DB120 00000000 */   nop
/* DB224 001DB124 10000010 */  b          .L001DB168
/* DB228 001DB128 00000000 */   nop
.L001DB12C:
/* DB22C 001DB12C 288E0070 */  paddub     $17, $0, $0
/* DB230 001DB130 0E000010 */  b          .L001DB16C
/* DB234 001DB134 00000000 */   nop
.L001DB138:
/* DB238 001DB138 01001124 */  addiu      $17, $0, 0x1
/* DB23C 001DB13C 0B000010 */  b          .L001DB16C
/* DB240 001DB140 00000000 */   nop
.L001DB144:
/* DB244 001DB144 02001124 */  addiu      $17, $0, 0x2
/* DB248 001DB148 08000010 */  b          .L001DB16C
/* DB24C 001DB14C 00000000 */   nop
.L001DB150:
/* DB250 001DB150 03001124 */  addiu      $17, $0, 0x3
/* DB254 001DB154 05000010 */  b          .L001DB16C
/* DB258 001DB158 00000000 */   nop
.L001DB15C:
/* DB25C 001DB15C 04001124 */  addiu      $17, $0, 0x4
/* DB260 001DB160 02000010 */  b          .L001DB16C
/* DB264 001DB164 00000000 */   nop
.L001DB168:
/* DB268 001DB168 05001124 */  addiu      $17, $0, 0x5
.L001DB16C:
/* DB26C 001DB16C 9000A38E */  lw         $3, 0x90($21)
/* DB270 001DB170 80100300 */  sll        $2, $3, 2
/* DB274 001DB174 21184300 */  addu       $3, $2, $3
/* DB278 001DB178 80100300 */  sll        $2, $3, 2
/* DB27C 001DB17C 21106200 */  addu       $2, $3, $2
/* DB280 001DB180 00110200 */  sll        $2, $2, 4
/* DB284 001DB184 21105500 */  addu       $2, $2, $21
/* DB288 001DB188 0200013C */  lui        $at, (0x20000 >> 16)
/* DB28C 001DB18C 21084100 */  addu       $at, $2, $at
/* DB290 001DB190 98E431AC */  sw         $17, -0x1B68($at)
/* DB294 001DB194 9000A48E */  lw         $4, 0x90($21)
/* DB298 001DB198 80100400 */  sll        $2, $4, 2
/* DB29C 001DB19C 21184400 */  addu       $3, $2, $4
/* DB2A0 001DB1A0 80100300 */  sll        $2, $3, 2
/* DB2A4 001DB1A4 21106200 */  addu       $2, $3, $2
/* DB2A8 001DB1A8 00110200 */  sll        $2, $2, 4
/* DB2AC 001DB1AC 21105500 */  addu       $2, $2, $21
/* DB2B0 001DB1B0 0200013C */  lui        $at, (0x20000 >> 16)
/* DB2B4 001DB1B4 21084100 */  addu       $at, $2, $at
/* DB2B8 001DB1B8 A8E42384 */  lh         $3, -0x1B58($at)
/* DB2BC 001DB1BC FFFF0224 */  addiu      $2, $0, -0x1
/* DB2C0 001DB1C0 5A006210 */  beq        $3, $2, .L001DB32C
/* DB2C4 001DB1C4 00000000 */   nop
/* DB2C8 001DB1C8 C0100400 */  sll        $2, $4, 3
/* DB2CC 001DB1CC 21184400 */  addu       $3, $2, $4
/* DB2D0 001DB1D0 C0100300 */  sll        $2, $3, 3
/* DB2D4 001DB1D4 21106200 */  addu       $2, $3, $2
/* DB2D8 001DB1D8 00110200 */  sll        $2, $2, 4
/* DB2DC 001DB1DC 21105500 */  addu       $2, $2, $21
/* DB2E0 001DB1E0 0500013C */  lui        $at, (0x55754 >> 16)
/* DB2E4 001DB1E4 21084100 */  addu       $at, $2, $at
/* DB2E8 001DB1E8 5457228C */  lw         $2, (0x55754 & 0xFFFF)($at)
/* DB2EC 001DB1EC 80004230 */  andi       $2, $2, 0x80
/* DB2F0 001DB1F0 4E004010 */  beqz       $2, .L001DB32C
/* DB2F4 001DB1F4 00000000 */   nop
/* DB2F8 001DB1F8 BE11040C */  jal        rand
/* DB2FC 001DB1FC 00000000 */   nop
/* DB300 001DB200 00008244 */  mtc1       $2, $f0
/* DB304 001DB204 00000000 */  nop
/* DB308 001DB208 60008046 */  cvt.s.w    $f1, $f0
/* DB30C 001DB20C C842023C */  lui        $2, (0x42C80000 >> 16)
/* DB310 001DB210 00008244 */  mtc1       $2, $f0
/* DB314 001DB214 00000000 */  nop
/* DB318 001DB218 42000146 */  mul.s      $f1, $f0, $f1
/* DB31C 001DB21C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* DB320 001DB220 00008244 */  mtc1       $2, $f0
/* DB324 001DB224 00000000 */  nop
/* DB328 001DB228 030B0046 */  div.s      $f12, $f1, $f0
/* DB32C 001DB22C 2C44040C */  jal        fptosi
/* DB330 001DB230 00000000 */   nop
/* DB334 001DB234 0A004128 */  slti       $at, $2, 0xA
/* DB338 001DB238 3C002010 */  beqz       $at, .L001DB32C
/* DB33C 001DB23C 00000000 */   nop
/* DB340 001DB240 9000A38E */  lw         $3, 0x90($21)
/* DB344 001DB244 80100300 */  sll        $2, $3, 2
/* DB348 001DB248 21184300 */  addu       $3, $2, $3
/* DB34C 001DB24C 80100300 */  sll        $2, $3, 2
/* DB350 001DB250 21106200 */  addu       $2, $3, $2
/* DB354 001DB254 00110200 */  sll        $2, $2, 4
/* DB358 001DB258 21105500 */  addu       $2, $2, $21
/* DB35C 001DB25C 0200013C */  lui        $at, (0x20000 >> 16)
/* DB360 001DB260 21084100 */  addu       $at, $2, $at
/* DB364 001DB264 A8E42584 */  lh         $5, -0x1B58($at)
/* DB368 001DB268 789C848F */  lw         $4, -0x6388($gp)
/* DB36C 001DB26C 50F7060C */  jal        CheckItemGet__14CDngStatusDataFi
/* DB370 001DB270 00000000 */   nop
/* DB374 001DB274 2D004014 */  bnez       $2, .L001DB32C
/* DB378 001DB278 00000000 */   nop
/* DB37C 001DB27C 9000A38E */  lw         $3, 0x90($21)
/* DB380 001DB280 10350224 */  addiu      $2, $0, 0x3510
/* DB384 001DB284 18106200 */  mult       $2, $3, $2
/* DB388 001DB288 2110A202 */  addu       $2, $21, $2
/* DB38C 001DB28C 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DB390 001DB290 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DB394 001DB294 21204100 */  addu       $4, $2, $at
/* DB398 001DB298 0002A527 */  addiu      $5, $sp, 0x200
/* DB39C 001DB29C A000998C */  lw         $25, 0xA0($4)
/* DB3A0 001DB2A0 A000398F */  lw         $25, 0xA0($25)
/* DB3A4 001DB2A4 09F82003 */  jalr       $25
/* DB3A8 001DB2A8 00000000 */   nop
/* DB3AC 001DB2AC 0402A1C7 */  lwc1       $f1, 0x204($sp)
/* DB3B0 001DB2B0 4041023C */  lui        $2, (0x41400000 >> 16)
/* DB3B4 001DB2B4 00008244 */  mtc1       $2, $f0
/* DB3B8 001DB2B8 00000000 */  nop
/* DB3BC 001DB2BC 00080046 */  add.s      $f0, $f1, $f0
/* DB3C0 001DB2C0 0402A0E7 */  swc1       $f0, 0x204($sp)
/* DB3C4 001DB2C4 9000A38E */  lw         $3, 0x90($21)
/* DB3C8 001DB2C8 80100300 */  sll        $2, $3, 2
/* DB3CC 001DB2CC 21184300 */  addu       $3, $2, $3
/* DB3D0 001DB2D0 80100300 */  sll        $2, $3, 2
/* DB3D4 001DB2D4 21106200 */  addu       $2, $3, $2
/* DB3D8 001DB2D8 00110200 */  sll        $2, $2, 4
/* DB3DC 001DB2DC 21105500 */  addu       $2, $2, $21
/* DB3E0 001DB2E0 0200013C */  lui        $at, (0x20000 >> 16)
/* DB3E4 001DB2E4 21084100 */  addu       $at, $2, $at
/* DB3E8 001DB2E8 A8E42684 */  lh         $6, -0x1B58($at)
/* DB3EC 001DB2EC EB01023C */  lui        $2, %hi(D_1EA8300)
/* DB3F0 001DB2F0 00834424 */  addiu      $4, $2, %lo(D_1EA8300)
/* DB3F4 001DB2F4 0002A527 */  addiu      $5, $sp, 0x200
/* DB3F8 001DB2F8 485D070C */  jal        Set__10CStealItemFPfi
/* DB3FC 001DB2FC 00000000 */   nop
/* DB400 001DB300 FFFF0424 */  addiu      $4, $0, -0x1
/* DB404 001DB304 9000A38E */  lw         $3, 0x90($21)
/* DB408 001DB308 80100300 */  sll        $2, $3, 2
/* DB40C 001DB30C 21184300 */  addu       $3, $2, $3
/* DB410 001DB310 80100300 */  sll        $2, $3, 2
/* DB414 001DB314 21106200 */  addu       $2, $3, $2
/* DB418 001DB318 00110200 */  sll        $2, $2, 4
/* DB41C 001DB31C 21105500 */  addu       $2, $2, $21
/* DB420 001DB320 0200013C */  lui        $at, (0x20000 >> 16)
/* DB424 001DB324 21084100 */  addu       $at, $2, $at
/* DB428 001DB328 A8E424A4 */  sh         $4, -0x1B58($at)
.L001DB32C:
/* DB42C 001DB32C F09D828F */  lw         $2, -0x6210($gp)
/* DB430 001DB330 2110C202 */  addu       $2, $22, $2
/* DB434 001DB334 5800438C */  lw         $3, 0x58($2)
/* DB438 001DB338 07006010 */  beqz       $3, .L001DB358
/* DB43C 001DB33C 00000000 */   nop
/* DB440 001DB340 02000224 */  addiu      $2, $0, 0x2
/* DB444 001DB344 04006210 */  beq        $3, $2, .L001DB358
/* DB448 001DB348 00000000 */   nop
/* DB44C 001DB34C 04000224 */  addiu      $2, $0, 0x4
/* DB450 001DB350 0F006214 */  bne        $3, $2, .L001DB390
/* DB454 001DB354 00000000 */   nop
.L001DB358:
/* DB458 001DB358 803F023C */  lui        $2, (0x3F800000 >> 16)
/* DB45C 001DB35C 00608244 */  mtc1       $2, $f12
/* DB460 001DB360 9000A38E */  lw         $3, 0x90($21)
/* DB464 001DB364 80100300 */  sll        $2, $3, 2
/* DB468 001DB368 21184300 */  addu       $3, $2, $3
/* DB46C 001DB36C 80100300 */  sll        $2, $3, 2
/* DB470 001DB370 21106200 */  addu       $2, $3, $2
/* DB474 001DB374 00110200 */  sll        $2, $2, 4
/* DB478 001DB378 21105500 */  addu       $2, $2, $21
/* DB47C 001DB37C 0200013C */  lui        $at, (0x20000 >> 16)
/* DB480 001DB380 21084100 */  addu       $at, $2, $at
/* DB484 001DB384 62E42484 */  lh         $4, -0x1B9E($at)
/* DB488 001DB388 CCE6760C */  jal        func_1DB9B30
/* DB48C 001DB38C 00000000 */   nop
.L001DB390:
/* DB490 001DB390 01001024 */  addiu      $16, $0, 0x1
/* DB494 001DB394 28260070 */  paddub     $4, $0, $0
/* DB498 001DB398 A49D858F */  lw         $5, -0x625C($gp)
/* DB49C 001DB39C 0700A014 */  bnez       $5, .L001DB3BC
/* DB4A0 001DB3A0 00000000 */   nop
/* DB4A4 001DB3A4 789C828F */  lw         $2, -0x6388($gp)
/* DB4A8 001DB3A8 02004380 */  lb         $3, 0x2($2)
/* DB4AC 001DB3AC 0E000224 */  addiu      $2, $0, 0xE
/* DB4B0 001DB3B0 02006214 */  bne        $3, $2, .L001DB3BC
/* DB4B4 001DB3B4 00000000 */   nop
/* DB4B8 001DB3B8 28260072 */  paddub     $4, $16, $0
.L001DB3BC:
/* DB4BC 001DB3BC 05000224 */  addiu      $2, $0, 0x5
/* DB4C0 001DB3C0 0700A214 */  bne        $5, $2, .L001DB3E0
/* DB4C4 001DB3C4 00000000 */   nop
/* DB4C8 001DB3C8 789C828F */  lw         $2, -0x6388($gp)
/* DB4CC 001DB3CC 02004380 */  lb         $3, 0x2($2)
/* DB4D0 001DB3D0 18000224 */  addiu      $2, $0, 0x18
/* DB4D4 001DB3D4 02006214 */  bne        $3, $2, .L001DB3E0
/* DB4D8 001DB3D8 00000000 */   nop
/* DB4DC 001DB3DC 01000424 */  addiu      $4, $0, 0x1
.L001DB3E0:
/* DB4E0 001DB3E0 0F008014 */  bnez       $4, .L001DB420
/* DB4E4 001DB3E4 00000000 */   nop
/* DB4E8 001DB3E8 05000224 */  addiu      $2, $0, 0x5
/* DB4EC 001DB3EC 08006216 */  bne        $19, $2, .L001DB410
/* DB4F0 001DB3F0 00000000 */   nop
/* DB4F4 001DB3F4 F09D828F */  lw         $2, -0x6210($gp)
/* DB4F8 001DB3F8 2110C202 */  addu       $2, $22, $2
/* DB4FC 001DB3FC 6000438C */  lw         $3, 0x60($2)
/* DB500 001DB400 06000224 */  addiu      $2, $0, 0x6
/* DB504 001DB404 02006214 */  bne        $3, $2, .L001DB410
/* DB508 001DB408 00000000 */   nop
/* DB50C 001DB40C 28860070 */  paddub     $16, $0, $0
.L001DB410:
/* DB510 001DB410 01000224 */  addiu      $2, $0, 0x1
/* DB514 001DB414 02006216 */  bne        $19, $2, .L001DB420
/* DB518 001DB418 00000000 */   nop
/* DB51C 001DB41C 28860070 */  paddub     $16, $0, $0
.L001DB420:
/* DB520 001DB420 F09D828F */  lw         $2, -0x6210($gp)
/* DB524 001DB424 21A05600 */  addu       $20, $2, $22
/* DB528 001DB428 9800838E */  lw         $3, 0x98($20)
/* DB52C 001DB42C 02000224 */  addiu      $2, $0, 0x2
/* DB530 001DB430 4C006214 */  bne        $3, $2, .L001DB564
/* DB534 001DB434 00000000 */   nop
/* DB538 001DB438 9000A38E */  lw         $3, 0x90($21)
/* DB53C 001DB43C 10350224 */  addiu      $2, $0, 0x3510
/* DB540 001DB440 18106200 */  mult       $2, $3, $2
/* DB544 001DB444 2110A202 */  addu       $2, $21, $2
/* DB548 001DB448 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DB54C 001DB44C D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DB550 001DB450 21204100 */  addu       $4, $2, $at
/* DB554 001DB454 1002A527 */  addiu      $5, $sp, 0x210
/* DB558 001DB458 A000998C */  lw         $25, 0xA0($4)
/* DB55C 001DB45C A000398F */  lw         $25, 0xA0($25)
/* DB560 001DB460 09F82003 */  jalr       $25
/* DB564 001DB464 00000000 */   nop
/* DB568 001DB468 2002A427 */  addiu      $4, $sp, 0x220
/* DB56C 001DB46C 80008526 */  addiu      $5, $20, 0x80
/* DB570 001DB470 0C86040C */  jal        sceVu0CopyVector
/* DB574 001DB474 00000000 */   nop
/* DB578 001DB478 1402A0AF */  sw         $0, 0x214($sp)
/* DB57C 001DB47C 2402A0AF */  sw         $0, 0x224($sp)
/* DB580 001DB480 9000A38E */  lw         $3, 0x90($21)
/* DB584 001DB484 80100300 */  sll        $2, $3, 2
/* DB588 001DB488 21184300 */  addu       $3, $2, $3
/* DB58C 001DB48C 80100300 */  sll        $2, $3, 2
/* DB590 001DB490 21106200 */  addu       $2, $3, $2
/* DB594 001DB494 00110200 */  sll        $2, $2, 4
/* DB598 001DB498 2110A202 */  addu       $2, $21, $2
/* DB59C 001DB49C 0100013C */  lui        $at, (0x1E540 >> 16)
/* DB5A0 001DB4A0 40E52134 */  ori        $at, $at, (0x1E540 & 0xFFFF)
/* DB5A4 001DB4A4 21204100 */  addu       $4, $2, $at
/* DB5A8 001DB4A8 1002A527 */  addiu      $5, $sp, 0x210
/* DB5AC 001DB4AC 2002A627 */  addiu      $6, $sp, 0x220
/* DB5B0 001DB4B0 EE85040C */  jal        sceVu0SubVector
/* DB5B4 001DB4B4 00000000 */   nop
/* DB5B8 001DB4B8 9000A38E */  lw         $3, 0x90($21)
/* DB5BC 001DB4BC 80100300 */  sll        $2, $3, 2
/* DB5C0 001DB4C0 21184300 */  addu       $3, $2, $3
/* DB5C4 001DB4C4 80100300 */  sll        $2, $3, 2
/* DB5C8 001DB4C8 21106200 */  addu       $2, $3, $2
/* DB5CC 001DB4CC 00110200 */  sll        $2, $2, 4
/* DB5D0 001DB4D0 2110A202 */  addu       $2, $21, $2
/* DB5D4 001DB4D4 0100013C */  lui        $at, (0x1E540 >> 16)
/* DB5D8 001DB4D8 40E52134 */  ori        $at, $at, (0x1E540 & 0xFFFF)
/* DB5DC 001DB4DC 21204100 */  addu       $4, $2, $at
/* DB5E0 001DB4E0 282E8070 */  paddub     $5, $4, $0
/* DB5E4 001DB4E4 9285040C */  jal        sceVu0Normalize
/* DB5E8 001DB4E8 00000000 */   nop
/* DB5EC 001DB4EC 9000A38E */  lw         $3, 0x90($21)
/* DB5F0 001DB4F0 80100300 */  sll        $2, $3, 2
/* DB5F4 001DB4F4 21184300 */  addu       $3, $2, $3
/* DB5F8 001DB4F8 80100300 */  sll        $2, $3, 2
/* DB5FC 001DB4FC 21106200 */  addu       $2, $3, $2
/* DB600 001DB500 00110200 */  sll        $2, $2, 4
/* DB604 001DB504 21105500 */  addu       $2, $2, $21
/* DB608 001DB508 900081C6 */  lwc1       $f1, 0x90($20)
/* DB60C 001DB50C 0200013C */  lui        $at, (0x20000 >> 16)
/* DB610 001DB510 21084100 */  addu       $at, $2, $at
/* DB614 001DB514 58E520C4 */  lwc1       $f0, -0x1AA8($at)
/* DB618 001DB518 02080046 */  mul.s      $f0, $f1, $f0
/* DB61C 001DB51C 0200013C */  lui        $at, (0x20000 >> 16)
/* DB620 001DB520 21084100 */  addu       $at, $2, $at
/* DB624 001DB524 50E520E4 */  swc1       $f0, -0x1AB0($at)
/* DB628 001DB528 9000A38E */  lw         $3, 0x90($21)
/* DB62C 001DB52C 80100300 */  sll        $2, $3, 2
/* DB630 001DB530 21184300 */  addu       $3, $2, $3
/* DB634 001DB534 80100300 */  sll        $2, $3, 2
/* DB638 001DB538 21106200 */  addu       $2, $3, $2
/* DB63C 001DB53C 00110200 */  sll        $2, $2, 4
/* DB640 001DB540 21105500 */  addu       $2, $2, $21
/* DB644 001DB544 940081C6 */  lwc1       $f1, 0x94($20)
/* DB648 001DB548 0200013C */  lui        $at, (0x20000 >> 16)
/* DB64C 001DB54C 21084100 */  addu       $at, $2, $at
/* DB650 001DB550 58E520C4 */  lwc1       $f0, -0x1AA8($at)
/* DB654 001DB554 02080046 */  mul.s      $f0, $f1, $f0
/* DB658 001DB558 0200013C */  lui        $at, (0x20000 >> 16)
/* DB65C 001DB55C 21084100 */  addu       $at, $2, $at
/* DB660 001DB560 54E520E4 */  swc1       $f0, -0x1AAC($at)
.L001DB564:
/* DB664 001DB564 3002A0AF */  sw         $0, 0x230($sp)
/* DB668 001DB568 F48080C7 */  lwc1       $f0, -0x7F0C($gp)
/* DB66C 001DB56C 3402A0E7 */  swc1       $f0, 0x234($sp)
/* DB670 001DB570 3802A0AF */  sw         $0, 0x238($sp)
/* DB674 001DB574 803F023C */  lui        $2, (0x3F800000 >> 16)
/* DB678 001DB578 3C02A2AF */  sw         $2, 0x23C($sp)
/* DB67C 001DB57C 9000A38E */  lw         $3, 0x90($21)
/* DB680 001DB580 7494858F */  lw         $5, -0x6B8C($gp)
/* DB684 001DB584 00210500 */  sll        $4, $5, 4
/* DB688 001DB588 21288500 */  addu       $5, $4, $5
/* DB68C 001DB58C 80200500 */  sll        $4, $5, 2
/* DB690 001DB590 23208500 */  subu       $4, $4, $5
/* DB694 001DB594 40290400 */  sll        $5, $4, 5
/* DB698 001DB598 EC01043C */  lui        $4, %hi(D_1EBE140)
/* DB69C 001DB59C 40E18424 */  addiu      $4, $4, %lo(D_1EBE140)
/* DB6A0 001DB5A0 21208500 */  addu       $4, $4, $5
/* DB6A4 001DB5A4 C0280300 */  sll        $5, $3, 3
/* DB6A8 001DB5A8 2130A300 */  addu       $6, $5, $3
/* DB6AC 001DB5AC C0280600 */  sll        $5, $6, 3
/* DB6B0 001DB5B0 2128C500 */  addu       $5, $6, $5
/* DB6B4 001DB5B4 00290500 */  sll        $5, $5, 4
/* DB6B8 001DB5B8 2128A502 */  addu       $5, $21, $5
/* DB6BC 001DB5BC 2130BE00 */  addu       $6, $5, $fp
/* DB6C0 001DB5C0 003F053C */  lui        $5, (0x3F000000 >> 16)
/* DB6C4 001DB5C4 00608544 */  mtc1       $5, $f12
/* DB6C8 001DB5C8 00788244 */  mtc1       $2, $f15
/* DB6CC 001DB5CC 80100300 */  sll        $2, $3, 2
/* DB6D0 001DB5D0 21184300 */  addu       $3, $2, $3
/* DB6D4 001DB5D4 80100300 */  sll        $2, $3, 2
/* DB6D8 001DB5D8 21106200 */  addu       $2, $3, $2
/* DB6DC 001DB5DC 00110200 */  sll        $2, $2, 4
/* DB6E0 001DB5E0 21105500 */  addu       $2, $2, $21
/* DB6E4 001DB5E4 0500013C */  lui        $at, (0x55250 >> 16)
/* DB6E8 001DB5E8 50522134 */  ori        $at, $at, (0x55250 & 0xFFFF)
/* DB6EC 001DB5EC 2128C100 */  addu       $5, $6, $at
/* DB6F0 001DB5F0 3002A627 */  addiu      $6, $sp, 0x230
/* DB6F4 001DB5F4 283E0070 */  paddub     $7, $0, $0
/* DB6F8 001DB5F8 14848DC7 */  lwc1       $f13, -0x7BEC($gp)
/* DB6FC 001DB5FC 4C858EC7 */  lwc1       $f14, -0x7AB4($gp)
/* DB700 001DB600 20000824 */  addiu      $8, $0, 0x20
/* DB704 001DB604 0200013C */  lui        $at, (0x20000 >> 16)
/* DB708 001DB608 21084100 */  addu       $at, $2, $at
/* DB70C 001DB60C 8CE430C4 */  lwc1       $f16, -0x1B74($at)
/* DB710 001DB610 A4CB060C */  jal        Set__8CHitMarkFPfPfiffffif
/* DB714 001DB614 00000000 */   nop
/* DB718 001DB618 9000A38E */  lw         $3, 0x90($21)
/* DB71C 001DB61C C0100300 */  sll        $2, $3, 3
/* DB720 001DB620 21184300 */  addu       $3, $2, $3
/* DB724 001DB624 C0100300 */  sll        $2, $3, 3
/* DB728 001DB628 21106200 */  addu       $2, $3, $2
/* DB72C 001DB62C 00110200 */  sll        $2, $2, 4
/* DB730 001DB630 2110A202 */  addu       $2, $21, $2
/* DB734 001DB634 21105E00 */  addu       $2, $2, $fp
/* DB738 001DB638 0500013C */  lui        $at, (0x55250 >> 16)
/* DB73C 001DB63C 50522134 */  ori        $at, $at, (0x55250 & 0xFFFF)
/* DB740 001DB640 21284100 */  addu       $5, $2, $at
/* DB744 001DB644 7494828F */  lw         $2, -0x6B8C($gp)
/* DB748 001DB648 40190200 */  sll        $3, $2, 5
/* DB74C 001DB64C EC01023C */  lui        $2, %hi(D_1EC4740)
/* DB750 001DB650 40474224 */  addiu      $2, $2, %lo(D_1EC4740)
/* DB754 001DB654 21104300 */  addu       $2, $2, $3
/* DB758 001DB658 C000A2AF */  sw         $2, 0xC0($sp)
/* DB75C 001DB65C C000A48F */  lw         $4, 0xC0($sp)
/* DB760 001DB660 0C86040C */  jal        sceVu0CopyVector
/* DB764 001DB664 00000000 */   nop
/* DB768 001DB668 01000324 */  addiu      $3, $0, 0x1
/* DB76C 001DB66C C000A28F */  lw         $2, 0xC0($sp)
/* DB770 001DB670 180043AC */  sw         $3, 0x18($2)
/* DB774 001DB674 140040AC */  sw         $0, 0x14($2)
/* DB778 001DB678 10000324 */  addiu      $3, $0, 0x10
/* DB77C 001DB67C 100043AC */  sw         $3, 0x10($2)
/* DB780 001DB680 7494838F */  lw         $3, -0x6B8C($gp)
/* DB784 001DB684 0F000224 */  addiu      $2, $0, 0xF
/* DB788 001DB688 04006214 */  bne        $3, $2, .L001DB69C
/* DB78C 001DB68C 00000000 */   nop
/* DB790 001DB690 749480AF */  sw         $0, -0x6B8C($gp)
/* DB794 001DB694 03000010 */  b          .L001DB6A4
/* DB798 001DB698 00000000 */   nop
.L001DB69C:
/* DB79C 001DB69C 01006224 */  addiu      $2, $3, 0x1
/* DB7A0 001DB6A0 749482AF */  sw         $2, -0x6B8C($gp)
.L001DB6A4:
/* DB7A4 001DB6A4 0500212A */  slti       $at, $17, 0x5
/* DB7A8 001DB6A8 40002010 */  beqz       $at, .L001DB7AC
/* DB7AC 001DB6AC 00000000 */   nop
/* DB7B0 001DB6B0 789C848F */  lw         $4, -0x6388($gp)
/* DB7B4 001DB6B4 21106402 */  addu       $2, $19, $4
/* DB7B8 001DB6B8 40434380 */  lb         $3, 0x4340($2)
/* DB7BC 001DB6BC 40110300 */  sll        $2, $3, 5
/* DB7C0 001DB6C0 23104300 */  subu       $2, $2, $3
/* DB7C4 001DB6C4 C0180200 */  sll        $3, $2, 3
/* DB7C8 001DB6C8 A80A0224 */  addiu      $2, $0, 0xAA8
/* DB7CC 001DB6CC 18106202 */  mult       $2, $19, $2
/* DB7D0 001DB6D0 21108200 */  addu       $2, $4, $2
/* DB7D4 001DB6D4 21104300 */  addu       $2, $2, $3
/* DB7D8 001DB6D8 0C454324 */  addiu      $3, $2, 0x450C
/* DB7DC 001DB6DC 22454280 */  lb         $2, 0x4522($2)
/* DB7E0 001DB6E0 21104300 */  addu       $2, $2, $3
/* DB7E4 001DB6E4 17004280 */  lb         $2, 0x17($2)
/* DB7E8 001DB6E8 00008244 */  mtc1       $2, $f0
/* DB7EC 001DB6EC 00000000 */  nop
/* DB7F0 001DB6F0 20038046 */  cvt.s.w    $f12, $f0
/* DB7F4 001DB6F4 7C948283 */  lb         $2, -0x6B84($gp)
/* DB7F8 001DB6F8 04004014 */  bnez       $2, .L001DB70C
/* DB7FC 001DB6FC 00000000 */   nop
/* DB800 001DB700 789480AF */  sw         $0, -0x6B88($gp)
/* DB804 001DB704 01000224 */  addiu      $2, $0, 0x1
/* DB808 001DB708 7C9482A3 */  sb         $2, -0x6B84($gp)
.L001DB70C:
/* DB80C 001DB70C 9000A28E */  lw         $2, 0x90($21)
/* DB810 001DB710 C0180200 */  sll        $3, $2, 3
/* DB814 001DB714 21206200 */  addu       $4, $3, $2
/* DB818 001DB718 C0180400 */  sll        $3, $4, 3
/* DB81C 001DB71C 21188300 */  addu       $3, $4, $3
/* DB820 001DB720 00190300 */  sll        $3, $3, 4
/* DB824 001DB724 2118A302 */  addu       $3, $21, $3
/* DB828 001DB728 21187E00 */  addu       $3, $3, $fp
/* DB82C 001DB72C 0500013C */  lui        $at, (0x55250 >> 16)
/* DB830 001DB730 50522134 */  ori        $at, $at, (0x55250 & 0xFFFF)
/* DB834 001DB734 21286100 */  addu       $5, $3, $at
/* DB838 001DB738 7894848F */  lw         $4, -0x6B88($gp)
/* DB83C 001DB73C 40190400 */  sll        $3, $4, 5
/* DB840 001DB740 23186400 */  subu       $3, $3, $4
/* DB844 001DB744 80210300 */  sll        $4, $3, 6
/* DB848 001DB748 E601033C */  lui        $3, %hi(D_1E59480)
/* DB84C 001DB74C 80946324 */  addiu      $3, $3, %lo(D_1E59480)
/* DB850 001DB750 21206400 */  addu       $4, $3, $4
/* DB854 001DB754 80180200 */  sll        $3, $2, 2
/* DB858 001DB758 21186200 */  addu       $3, $3, $2
/* DB85C 001DB75C 80100300 */  sll        $2, $3, 2
/* DB860 001DB760 21106200 */  addu       $2, $3, $2
/* DB864 001DB764 00110200 */  sll        $2, $2, 4
/* DB868 001DB768 21105500 */  addu       $2, $2, $21
/* DB86C 001DB76C 2836A070 */  paddub     $6, $5, $0
/* DB870 001DB770 283E2072 */  paddub     $7, $17, $0
/* DB874 001DB774 0200013C */  lui        $at, (0x20000 >> 16)
/* DB878 001DB778 21084100 */  addu       $at, $2, $at
/* DB87C 001DB77C 14E42DC4 */  lwc1       $f13, -0x1BEC($at)
/* DB880 001DB780 10DE060C */  jal        Set__14CWeaponElementFPA4_fPffif
/* DB884 001DB784 00000000 */   nop
/* DB888 001DB788 7894838F */  lw         $3, -0x6B88($gp)
/* DB88C 001DB78C 03006228 */  slti       $2, $3, 0x3
/* DB890 001DB790 04004014 */  bnez       $2, .L001DB7A4
/* DB894 001DB794 00000000 */   nop
/* DB898 001DB798 789480AF */  sw         $0, -0x6B88($gp)
/* DB89C 001DB79C 03000010 */  b          .L001DB7AC
/* DB8A0 001DB7A0 00000000 */   nop
.L001DB7A4:
/* DB8A4 001DB7A4 01006224 */  addiu      $2, $3, 0x1
/* DB8A8 001DB7A8 789482AF */  sw         $2, -0x6B88($gp)
.L001DB7AC:
/* DB8AC 001DB7AC BE11040C */  jal        rand
/* DB8B0 001DB7B0 00000000 */   nop
/* DB8B4 001DB7B4 00008244 */  mtc1       $2, $f0
/* DB8B8 001DB7B8 00000000 */  nop
/* DB8BC 001DB7BC 60008046 */  cvt.s.w    $f1, $f0
/* DB8C0 001DB7C0 C842023C */  lui        $2, (0x42C80000 >> 16)
/* DB8C4 001DB7C4 00008244 */  mtc1       $2, $f0
/* DB8C8 001DB7C8 00000000 */  nop
/* DB8CC 001DB7CC 42000146 */  mul.s      $f1, $f0, $f1
/* DB8D0 001DB7D0 004F023C */  lui        $2, (0x4F000000 >> 16)
/* DB8D4 001DB7D4 00008244 */  mtc1       $2, $f0
/* DB8D8 001DB7D8 00000000 */  nop
/* DB8DC 001DB7DC 030D0046 */  div.s      $f20, $f1, $f0
/* DB8E0 001DB7E0 9000A38E */  lw         $3, 0x90($21)
/* DB8E4 001DB7E4 C0100300 */  sll        $2, $3, 3
/* DB8E8 001DB7E8 21184300 */  addu       $3, $2, $3
/* DB8EC 001DB7EC C0100300 */  sll        $2, $3, 3
/* DB8F0 001DB7F0 21106200 */  addu       $2, $3, $2
/* DB8F4 001DB7F4 00110200 */  sll        $2, $2, 4
/* DB8F8 001DB7F8 21105500 */  addu       $2, $2, $21
/* DB8FC 001DB7FC 0500013C */  lui        $at, (0x55754 >> 16)
/* DB900 001DB800 21084100 */  addu       $at, $2, $at
/* DB904 001DB804 5457228C */  lw         $2, (0x55754 & 0xFFFF)($at)
/* DB908 001DB808 20004230 */  andi       $2, $2, 0x20
/* DB90C 001DB80C 3A004010 */  beqz       $2, .L001DB8F8
/* DB910 001DB810 00000000 */   nop
/* DB914 001DB814 BE11040C */  jal        rand
/* DB918 001DB818 00000000 */   nop
/* DB91C 001DB81C 00008244 */  mtc1       $2, $f0
/* DB920 001DB820 00000000 */  nop
/* DB924 001DB824 60008046 */  cvt.s.w    $f1, $f0
/* DB928 001DB828 C842023C */  lui        $2, (0x42C80000 >> 16)
/* DB92C 001DB82C 00008244 */  mtc1       $2, $f0
/* DB930 001DB830 00000000 */  nop
/* DB934 001DB834 42000146 */  mul.s      $f1, $f0, $f1
/* DB938 001DB838 004F023C */  lui        $2, (0x4F000000 >> 16)
/* DB93C 001DB83C 00008244 */  mtc1       $2, $f0
/* DB940 001DB840 00000000 */  nop
/* DB944 001DB844 43080046 */  div.s      $f1, $f1, $f0
/* DB948 001DB848 2041023C */  lui        $2, (0x41200000 >> 16)
/* DB94C 001DB84C 00008244 */  mtc1       $2, $f0
/* DB950 001DB850 00000000 */  nop
/* DB954 001DB854 36080046 */  c.le.s     $f1, $f0
/* DB958 001DB858 00000000 */  nop
/* DB95C 001DB85C 22000045 */  bc1f       .L001DB8E8
/* DB960 001DB860 00000000 */   nop
/* DB964 001DB864 9000A38E */  lw         $3, 0x90($21)
/* DB968 001DB868 80100300 */  sll        $2, $3, 2
/* DB96C 001DB86C 21184300 */  addu       $3, $2, $3
/* DB970 001DB870 80100300 */  sll        $2, $3, 2
/* DB974 001DB874 21106200 */  addu       $2, $3, $2
/* DB978 001DB878 00110200 */  sll        $2, $2, 4
/* DB97C 001DB87C 21185500 */  addu       $3, $2, $21
/* DB980 001DB880 0200013C */  lui        $at, (0x20000 >> 16)
/* DB984 001DB884 21086100 */  addu       $at, $3, $at
/* DB988 001DB888 AEE42284 */  lh         $2, -0x1B52($at)
/* DB98C 001DB88C 00008244 */  mtc1       $2, $f0
/* DB990 001DB890 00000000 */  nop
/* DB994 001DB894 20008046 */  cvt.s.w    $f0, $f0
/* DB998 001DB898 34A00046 */  c.lt.s     $f20, $f0
/* DB99C 001DB89C 00000000 */  nop
/* DB9A0 001DB8A0 11000045 */  bc1f       .L001DB8E8
/* DB9A4 001DB8A4 00000000 */   nop
/* DB9A8 001DB8A8 B4000224 */  addiu      $2, $0, 0xB4
/* DB9AC 001DB8AC 0200013C */  lui        $at, (0x20000 >> 16)
/* DB9B0 001DB8B0 21086100 */  addu       $at, $3, $at
/* DB9B4 001DB8B4 DCE322AC */  sw         $2, -0x1C24($at)
/* DB9B8 001DB8B8 9000A38E */  lw         $3, 0x90($21)
/* DB9BC 001DB8BC 80100300 */  sll        $2, $3, 2
/* DB9C0 001DB8C0 21184300 */  addu       $3, $2, $3
/* DB9C4 001DB8C4 80100300 */  sll        $2, $3, 2
/* DB9C8 001DB8C8 21106200 */  addu       $2, $3, $2
/* DB9CC 001DB8CC 00110200 */  sll        $2, $2, 4
/* DB9D0 001DB8D0 21105500 */  addu       $2, $2, $21
/* DB9D4 001DB8D4 0200013C */  lui        $at, (0x20000 >> 16)
/* DB9D8 001DB8D8 21084100 */  addu       $at, $2, $at
/* DB9DC 001DB8DC E4E320AC */  sw         $0, -0x1C1C($at)
/* DB9E0 001DB8E0 05000010 */  b          .L001DB8F8
/* DB9E4 001DB8E4 00000000 */   nop
.L001DB8E8:
/* DB9E8 001DB8E8 FFFF0224 */  addiu      $2, $0, -0x1
/* DB9EC 001DB8EC 02006216 */  bne        $19, $2, .L001DB8F8
/* DB9F0 001DB8F0 00000000 */   nop
/* DB9F4 001DB8F4 01001724 */  addiu      $23, $0, 0x1
.L001DB8F8:
/* DB9F8 001DB8F8 9000A38E */  lw         $3, 0x90($21)
/* DB9FC 001DB8FC C0100300 */  sll        $2, $3, 3
/* DBA00 001DB900 21184300 */  addu       $3, $2, $3
/* DBA04 001DB904 C0100300 */  sll        $2, $3, 3
/* DBA08 001DB908 21106200 */  addu       $2, $3, $2
/* DBA0C 001DB90C 00110200 */  sll        $2, $2, 4
/* DBA10 001DB910 21105500 */  addu       $2, $2, $21
/* DBA14 001DB914 0500013C */  lui        $at, (0x55754 >> 16)
/* DBA18 001DB918 21084100 */  addu       $at, $2, $at
/* DBA1C 001DB91C 5457228C */  lw         $2, (0x55754 & 0xFFFF)($at)
/* DBA20 001DB920 40004230 */  andi       $2, $2, 0x40
/* DBA24 001DB924 5F004010 */  beqz       $2, .L001DBAA4
/* DBA28 001DB928 00000000 */   nop
/* DBA2C 001DB92C BE11040C */  jal        rand
/* DBA30 001DB930 00000000 */   nop
/* DBA34 001DB934 00008244 */  mtc1       $2, $f0
/* DBA38 001DB938 00000000 */  nop
/* DBA3C 001DB93C 60008046 */  cvt.s.w    $f1, $f0
/* DBA40 001DB940 C842023C */  lui        $2, (0x42C80000 >> 16)
/* DBA44 001DB944 00008244 */  mtc1       $2, $f0
/* DBA48 001DB948 00000000 */  nop
/* DBA4C 001DB94C 42000146 */  mul.s      $f1, $f0, $f1
/* DBA50 001DB950 004F023C */  lui        $2, (0x4F000000 >> 16)
/* DBA54 001DB954 00008244 */  mtc1       $2, $f0
/* DBA58 001DB958 00000000 */  nop
/* DBA5C 001DB95C 43080046 */  div.s      $f1, $f1, $f0
/* DBA60 001DB960 8040023C */  lui        $2, (0x40800000 >> 16)
/* DBA64 001DB964 00008244 */  mtc1       $2, $f0
/* DBA68 001DB968 00000000 */  nop
/* DBA6C 001DB96C 36080046 */  c.le.s     $f1, $f0
/* DBA70 001DB970 00000000 */  nop
/* DBA74 001DB974 47000045 */  bc1f       .L001DBA94
/* DBA78 001DB978 00000000 */   nop
/* DBA7C 001DB97C 9000A38E */  lw         $3, 0x90($21)
/* DBA80 001DB980 80100300 */  sll        $2, $3, 2
/* DBA84 001DB984 21184300 */  addu       $3, $2, $3
/* DBA88 001DB988 80100300 */  sll        $2, $3, 2
/* DBA8C 001DB98C 21106200 */  addu       $2, $3, $2
/* DBA90 001DB990 00110200 */  sll        $2, $2, 4
/* DBA94 001DB994 21185500 */  addu       $3, $2, $21
/* DBA98 001DB998 0200013C */  lui        $at, (0x20000 >> 16)
/* DBA9C 001DB99C 21086100 */  addu       $at, $3, $at
/* DBAA0 001DB9A0 AEE42284 */  lh         $2, -0x1B52($at)
/* DBAA4 001DB9A4 00008244 */  mtc1       $2, $f0
/* DBAA8 001DB9A8 00000000 */  nop
/* DBAAC 001DB9AC 20008046 */  cvt.s.w    $f0, $f0
/* DBAB0 001DB9B0 34A00046 */  c.lt.s     $f20, $f0
/* DBAB4 001DB9B4 00000000 */  nop
/* DBAB8 001DB9B8 36000045 */  bc1f       .L001DBA94
/* DBABC 001DB9BC 00000000 */   nop
/* DBAC0 001DB9C0 0100013C */  lui        $at, (0x1E3D8 >> 16)
/* DBAC4 001DB9C4 D8E32134 */  ori        $at, $at, (0x1E3D8 & 0xFFFF)
/* DBAC8 001DB9C8 21186100 */  addu       $3, $3, $at
/* DBACC 001DB9CC 0000628C */  lw         $2, 0x0($3)
/* DBAD0 001DB9D0 2D00401C */  bgtz       $2, .L001DBA88
/* DBAD4 001DB9D4 00000000 */   nop
/* DBAD8 001DB9D8 2C010224 */  addiu      $2, $0, 0x12C
/* DBADC 001DB9DC 000062AC */  sw         $2, 0x0($3)
/* DBAE0 001DB9E0 9000A38E */  lw         $3, 0x90($21)
/* DBAE4 001DB9E4 80100300 */  sll        $2, $3, 2
/* DBAE8 001DB9E8 21184300 */  addu       $3, $2, $3
/* DBAEC 001DB9EC 80100300 */  sll        $2, $3, 2
/* DBAF0 001DB9F0 21106200 */  addu       $2, $3, $2
/* DBAF4 001DB9F4 00110200 */  sll        $2, $2, 4
/* DBAF8 001DB9F8 21105500 */  addu       $2, $2, $21
/* DBAFC 001DB9FC 0200013C */  lui        $at, (0x20000 >> 16)
/* DBB00 001DBA00 21084100 */  addu       $at, $2, $at
/* DBB04 001DBA04 DCE320AC */  sw         $0, -0x1C24($at)
/* DBB08 001DBA08 9000A38E */  lw         $3, 0x90($21)
/* DBB0C 001DBA0C 80100300 */  sll        $2, $3, 2
/* DBB10 001DBA10 21184300 */  addu       $3, $2, $3
/* DBB14 001DBA14 80100300 */  sll        $2, $3, 2
/* DBB18 001DBA18 21106200 */  addu       $2, $3, $2
/* DBB1C 001DBA1C 00110200 */  sll        $2, $2, 4
/* DBB20 001DBA20 21105500 */  addu       $2, $2, $21
/* DBB24 001DBA24 0200013C */  lui        $at, (0x20000 >> 16)
/* DBB28 001DBA28 21084100 */  addu       $at, $2, $at
/* DBB2C 001DBA2C E4E320AC */  sw         $0, -0x1C1C($at)
/* DBB30 001DBA30 9000A38E */  lw         $3, 0x90($21)
/* DBB34 001DBA34 80100300 */  sll        $2, $3, 2
/* DBB38 001DBA38 21184300 */  addu       $3, $2, $3
/* DBB3C 001DBA3C 80100300 */  sll        $2, $3, 2
/* DBB40 001DBA40 21106200 */  addu       $2, $3, $2
/* DBB44 001DBA44 00110200 */  sll        $2, $2, 4
/* DBB48 001DBA48 21105500 */  addu       $2, $2, $21
/* DBB4C 001DBA4C 0200013C */  lui        $at, (0x20000 >> 16)
/* DBB50 001DBA50 21084100 */  addu       $at, $2, $at
/* DBB54 001DBA54 E0E320AC */  sw         $0, -0x1C20($at)
/* DBB58 001DBA58 9000A38E */  lw         $3, 0x90($21)
/* DBB5C 001DBA5C 80100300 */  sll        $2, $3, 2
/* DBB60 001DBA60 21184300 */  addu       $3, $2, $3
/* DBB64 001DBA64 80100300 */  sll        $2, $3, 2
/* DBB68 001DBA68 21106200 */  addu       $2, $3, $2
/* DBB6C 001DBA6C 00110200 */  sll        $2, $2, 4
/* DBB70 001DBA70 21105500 */  addu       $2, $2, $21
/* DBB74 001DBA74 0200013C */  lui        $at, (0x20000 >> 16)
/* DBB78 001DBA78 21084100 */  addu       $at, $2, $at
/* DBB7C 001DBA7C 50E420AC */  sw         $0, -0x1BB0($at)
/* DBB80 001DBA80 08000010 */  b          .L001DBAA4
/* DBB84 001DBA84 00000000 */   nop
.L001DBA88:
/* DBB88 001DBA88 000060AC */  sw         $0, 0x0($3)
/* DBB8C 001DBA8C 05000010 */  b          .L001DBAA4
/* DBB90 001DBA90 00000000 */   nop
.L001DBA94:
/* DBB94 001DBA94 FFFF0224 */  addiu      $2, $0, -0x1
/* DBB98 001DBA98 02006216 */  bne        $19, $2, .L001DBAA4
/* DBB9C 001DBA9C 00000000 */   nop
/* DBBA0 001DBAA0 01001724 */  addiu      $23, $0, 0x1
.L001DBAA4:
/* DBBA4 001DBAA4 9000A38E */  lw         $3, 0x90($21)
/* DBBA8 001DBAA8 80100300 */  sll        $2, $3, 2
/* DBBAC 001DBAAC 21184300 */  addu       $3, $2, $3
/* DBBB0 001DBAB0 80100300 */  sll        $2, $3, 2
/* DBBB4 001DBAB4 21106200 */  addu       $2, $3, $2
/* DBBB8 001DBAB8 00310200 */  sll        $6, $2, 4
/* DBBBC 001DBABC 2110D500 */  addu       $2, $6, $21
/* DBBC0 001DBAC0 0200013C */  lui        $at, (0x20000 >> 16)
/* DBBC4 001DBAC4 21084100 */  addu       $at, $2, $at
/* DBBC8 001DBAC8 AEE42384 */  lh         $3, -0x1B52($at)
/* DBBCC 001DBACC 05006014 */  bnez       $3, .L001DBAE4
/* DBBD0 001DBAD0 00000000 */   nop
/* DBBD4 001DBAD4 C842023C */  lui        $2, (0x42C80000 >> 16)
/* DBBD8 001DBAD8 00A08244 */  mtc1       $2, $f20
/* DBBDC 001DBADC 02000010 */  b          .L001DBAE8
/* DBBE0 001DBAE0 00000000 */   nop
.L001DBAE4:
/* DBBE4 001DBAE4 00A08044 */  mtc1       $0, $f20
.L001DBAE8:
/* DBBE8 001DBAE8 D000A28F */  lw         $2, 0xD0($sp)
/* DBBEC 001DBAEC 5000428C */  lw         $2, 0x50($2)
/* DBBF0 001DBAF0 00024230 */  andi       $2, $2, 0x200
/* DBBF4 001DBAF4 27004010 */  beqz       $2, .L001DBB94
/* DBBF8 001DBAF8 00000000 */   nop
/* DBBFC 001DBAFC 00008344 */  mtc1       $3, $f0
/* DBC00 001DBB00 00000000 */  nop
/* DBC04 001DBB04 20008046 */  cvt.s.w    $f0, $f0
/* DBC08 001DBB08 34A00046 */  c.lt.s     $f20, $f0
/* DBC0C 001DBB0C 00000000 */  nop
/* DBC10 001DBB10 1C000045 */  bc1f       .L001DBB84
/* DBC14 001DBB14 00000000 */   nop
/* DBC18 001DBB18 2118D500 */  addu       $3, $6, $21
/* DBC1C 001DBB1C 0200013C */  lui        $at, (0x20000 >> 16)
/* DBC20 001DBB20 21086100 */  addu       $at, $3, $at
/* DBC24 001DBB24 D8E3228C */  lw         $2, -0x1C28($at)
/* DBC28 001DBB28 1A004014 */  bnez       $2, .L001DBB94
/* DBC2C 001DBB2C 00000000 */   nop
/* DBC30 001DBB30 0200013C */  lui        $at, (0x20000 >> 16)
/* DBC34 001DBB34 21086100 */  addu       $at, $3, $at
/* DBC38 001DBB38 E0E3228C */  lw         $2, -0x1C20($at)
/* DBC3C 001DBB3C 15004014 */  bnez       $2, .L001DBB94
/* DBC40 001DBB40 00000000 */   nop
/* DBC44 001DBB44 B4000224 */  addiu      $2, $0, 0xB4
/* DBC48 001DBB48 0200013C */  lui        $at, (0x20000 >> 16)
/* DBC4C 001DBB4C 21086100 */  addu       $at, $3, $at
/* DBC50 001DBB50 DCE322AC */  sw         $2, -0x1C24($at)
/* DBC54 001DBB54 9000A38E */  lw         $3, 0x90($21)
/* DBC58 001DBB58 80100300 */  sll        $2, $3, 2
/* DBC5C 001DBB5C 21184300 */  addu       $3, $2, $3
/* DBC60 001DBB60 80100300 */  sll        $2, $3, 2
/* DBC64 001DBB64 21106200 */  addu       $2, $3, $2
/* DBC68 001DBB68 00110200 */  sll        $2, $2, 4
/* DBC6C 001DBB6C 21105500 */  addu       $2, $2, $21
/* DBC70 001DBB70 0200013C */  lui        $at, (0x20000 >> 16)
/* DBC74 001DBB74 21084100 */  addu       $at, $2, $at
/* DBC78 001DBB78 E4E320AC */  sw         $0, -0x1C1C($at)
/* DBC7C 001DBB7C 05000010 */  b          .L001DBB94
/* DBC80 001DBB80 00000000 */   nop
.L001DBB84:
/* DBC84 001DBB84 FFFF0224 */  addiu      $2, $0, -0x1
/* DBC88 001DBB88 02006216 */  bne        $19, $2, .L001DBB94
/* DBC8C 001DBB8C 00000000 */   nop
/* DBC90 001DBB90 01001724 */  addiu      $23, $0, 0x1
.L001DBB94:
/* DBC94 001DBB94 D000A28F */  lw         $2, 0xD0($sp)
/* DBC98 001DBB98 5000428C */  lw         $2, 0x50($2)
/* DBC9C 001DBB9C 00014230 */  andi       $2, $2, 0x100
/* DBCA0 001DBBA0 4B004010 */  beqz       $2, .L001DBCD0
/* DBCA4 001DBBA4 00000000 */   nop
/* DBCA8 001DBBA8 9000A38E */  lw         $3, 0x90($21)
/* DBCAC 001DBBAC 80100300 */  sll        $2, $3, 2
/* DBCB0 001DBBB0 21184300 */  addu       $3, $2, $3
/* DBCB4 001DBBB4 80100300 */  sll        $2, $3, 2
/* DBCB8 001DBBB8 21106200 */  addu       $2, $3, $2
/* DBCBC 001DBBBC 00110200 */  sll        $2, $2, 4
/* DBCC0 001DBBC0 21185500 */  addu       $3, $2, $21
/* DBCC4 001DBBC4 0200013C */  lui        $at, (0x20000 >> 16)
/* DBCC8 001DBBC8 21086100 */  addu       $at, $3, $at
/* DBCCC 001DBBCC AEE42284 */  lh         $2, -0x1B52($at)
/* DBCD0 001DBBD0 00008244 */  mtc1       $2, $f0
/* DBCD4 001DBBD4 00000000 */  nop
/* DBCD8 001DBBD8 20008046 */  cvt.s.w    $f0, $f0
/* DBCDC 001DBBDC 34A00046 */  c.lt.s     $f20, $f0
/* DBCE0 001DBBE0 00000000 */  nop
/* DBCE4 001DBBE4 36000045 */  bc1f       .L001DBCC0
/* DBCE8 001DBBE8 00000000 */   nop
/* DBCEC 001DBBEC 0100013C */  lui        $at, (0x1E3D8 >> 16)
/* DBCF0 001DBBF0 D8E32134 */  ori        $at, $at, (0x1E3D8 & 0xFFFF)
/* DBCF4 001DBBF4 21186100 */  addu       $3, $3, $at
/* DBCF8 001DBBF8 0000628C */  lw         $2, 0x0($3)
/* DBCFC 001DBBFC 2D00401C */  bgtz       $2, .L001DBCB4
/* DBD00 001DBC00 00000000 */   nop
/* DBD04 001DBC04 2C010224 */  addiu      $2, $0, 0x12C
/* DBD08 001DBC08 000062AC */  sw         $2, 0x0($3)
/* DBD0C 001DBC0C 9000A38E */  lw         $3, 0x90($21)
/* DBD10 001DBC10 80100300 */  sll        $2, $3, 2
/* DBD14 001DBC14 21184300 */  addu       $3, $2, $3
/* DBD18 001DBC18 80100300 */  sll        $2, $3, 2
/* DBD1C 001DBC1C 21106200 */  addu       $2, $3, $2
/* DBD20 001DBC20 00110200 */  sll        $2, $2, 4
/* DBD24 001DBC24 21105500 */  addu       $2, $2, $21
/* DBD28 001DBC28 0200013C */  lui        $at, (0x20000 >> 16)
/* DBD2C 001DBC2C 21084100 */  addu       $at, $2, $at
/* DBD30 001DBC30 DCE320AC */  sw         $0, -0x1C24($at)
/* DBD34 001DBC34 9000A38E */  lw         $3, 0x90($21)
/* DBD38 001DBC38 80100300 */  sll        $2, $3, 2
/* DBD3C 001DBC3C 21184300 */  addu       $3, $2, $3
/* DBD40 001DBC40 80100300 */  sll        $2, $3, 2
/* DBD44 001DBC44 21106200 */  addu       $2, $3, $2
/* DBD48 001DBC48 00110200 */  sll        $2, $2, 4
/* DBD4C 001DBC4C 21105500 */  addu       $2, $2, $21
/* DBD50 001DBC50 0200013C */  lui        $at, (0x20000 >> 16)
/* DBD54 001DBC54 21084100 */  addu       $at, $2, $at
/* DBD58 001DBC58 E4E320AC */  sw         $0, -0x1C1C($at)
/* DBD5C 001DBC5C 9000A38E */  lw         $3, 0x90($21)
/* DBD60 001DBC60 80100300 */  sll        $2, $3, 2
/* DBD64 001DBC64 21184300 */  addu       $3, $2, $3
/* DBD68 001DBC68 80100300 */  sll        $2, $3, 2
/* DBD6C 001DBC6C 21106200 */  addu       $2, $3, $2
/* DBD70 001DBC70 00110200 */  sll        $2, $2, 4
/* DBD74 001DBC74 21105500 */  addu       $2, $2, $21
/* DBD78 001DBC78 0200013C */  lui        $at, (0x20000 >> 16)
/* DBD7C 001DBC7C 21084100 */  addu       $at, $2, $at
/* DBD80 001DBC80 E0E320AC */  sw         $0, -0x1C20($at)
/* DBD84 001DBC84 9000A38E */  lw         $3, 0x90($21)
/* DBD88 001DBC88 80100300 */  sll        $2, $3, 2
/* DBD8C 001DBC8C 21184300 */  addu       $3, $2, $3
/* DBD90 001DBC90 80100300 */  sll        $2, $3, 2
/* DBD94 001DBC94 21106200 */  addu       $2, $3, $2
/* DBD98 001DBC98 00110200 */  sll        $2, $2, 4
/* DBD9C 001DBC9C 21105500 */  addu       $2, $2, $21
/* DBDA0 001DBCA0 0200013C */  lui        $at, (0x20000 >> 16)
/* DBDA4 001DBCA4 21084100 */  addu       $at, $2, $at
/* DBDA8 001DBCA8 50E420AC */  sw         $0, -0x1BB0($at)
/* DBDAC 001DBCAC 08000010 */  b          .L001DBCD0
/* DBDB0 001DBCB0 00000000 */   nop
.L001DBCB4:
/* DBDB4 001DBCB4 000060AC */  sw         $0, 0x0($3)
/* DBDB8 001DBCB8 05000010 */  b          .L001DBCD0
/* DBDBC 001DBCBC 00000000 */   nop
.L001DBCC0:
/* DBDC0 001DBCC0 FFFF0224 */  addiu      $2, $0, -0x1
/* DBDC4 001DBCC4 02006216 */  bne        $19, $2, .L001DBCD0
/* DBDC8 001DBCC8 00000000 */   nop
/* DBDCC 001DBCCC 01001724 */  addiu      $23, $0, 0x1
.L001DBCD0:
/* DBDD0 001DBCD0 D000A28F */  lw         $2, 0xD0($sp)
/* DBDD4 001DBCD4 5000428C */  lw         $2, 0x50($2)
/* DBDD8 001DBCD8 00084230 */  andi       $2, $2, 0x800
/* DBDDC 001DBCDC 2B004010 */  beqz       $2, .L001DBD8C
/* DBDE0 001DBCE0 00000000 */   nop
/* DBDE4 001DBCE4 9000A38E */  lw         $3, 0x90($21)
/* DBDE8 001DBCE8 80100300 */  sll        $2, $3, 2
/* DBDEC 001DBCEC 21184300 */  addu       $3, $2, $3
/* DBDF0 001DBCF0 80100300 */  sll        $2, $3, 2
/* DBDF4 001DBCF4 21106200 */  addu       $2, $3, $2
/* DBDF8 001DBCF8 00110200 */  sll        $2, $2, 4
/* DBDFC 001DBCFC 21185500 */  addu       $3, $2, $21
/* DBE00 001DBD00 0200013C */  lui        $at, (0x20000 >> 16)
/* DBE04 001DBD04 21086100 */  addu       $at, $3, $at
/* DBE08 001DBD08 AEE42284 */  lh         $2, -0x1B52($at)
/* DBE0C 001DBD0C 00008244 */  mtc1       $2, $f0
/* DBE10 001DBD10 00000000 */  nop
/* DBE14 001DBD14 20008046 */  cvt.s.w    $f0, $f0
/* DBE18 001DBD18 34A00046 */  c.lt.s     $f20, $f0
/* DBE1C 001DBD1C 00000000 */  nop
/* DBE20 001DBD20 16000045 */  bc1f       .L001DBD7C
/* DBE24 001DBD24 00000000 */   nop
/* DBE28 001DBD28 0200013C */  lui        $at, (0x20000 >> 16)
/* DBE2C 001DBD2C 21086100 */  addu       $at, $3, $at
/* DBE30 001DBD30 D8E3228C */  lw         $2, -0x1C28($at)
/* DBE34 001DBD34 15004014 */  bnez       $2, .L001DBD8C
/* DBE38 001DBD38 00000000 */   nop
/* DBE3C 001DBD3C 0200013C */  lui        $at, (0x20000 >> 16)
/* DBE40 001DBD40 21086100 */  addu       $at, $3, $at
/* DBE44 001DBD44 DCE3228C */  lw         $2, -0x1C24($at)
/* DBE48 001DBD48 10004014 */  bnez       $2, .L001DBD8C
/* DBE4C 001DBD4C 00000000 */   nop
/* DBE50 001DBD50 0200013C */  lui        $at, (0x20000 >> 16)
/* DBE54 001DBD54 21086100 */  addu       $at, $3, $at
/* DBE58 001DBD58 E0E3228C */  lw         $2, -0x1C20($at)
/* DBE5C 001DBD5C 0B004014 */  bnez       $2, .L001DBD8C
/* DBE60 001DBD60 00000000 */   nop
/* DBE64 001DBD64 B4000224 */  addiu      $2, $0, 0xB4
/* DBE68 001DBD68 0200013C */  lui        $at, (0x20000 >> 16)
/* DBE6C 001DBD6C 21086100 */  addu       $at, $3, $at
/* DBE70 001DBD70 E4E322AC */  sw         $2, -0x1C1C($at)
/* DBE74 001DBD74 05000010 */  b          .L001DBD8C
/* DBE78 001DBD78 00000000 */   nop
.L001DBD7C:
/* DBE7C 001DBD7C FFFF0224 */  addiu      $2, $0, -0x1
/* DBE80 001DBD80 02006216 */  bne        $19, $2, .L001DBD8C
/* DBE84 001DBD84 00000000 */   nop
/* DBE88 001DBD88 01001724 */  addiu      $23, $0, 0x1
.L001DBD8C:
/* DBE8C 001DBD8C 340080C6 */  lwc1       $f0, 0x34($20)
/* DBE90 001DBD90 20058046 */  cvt.s.w    $f20, $f0
/* DBE94 001DBD94 01000224 */  addiu      $2, $0, 0x1
/* DBE98 001DBD98 07006212 */  beq        $19, $2, .L001DBDB8
/* DBE9C 001DBD9C 00000000 */   nop
/* DBEA0 001DBDA0 03000224 */  addiu      $2, $0, 0x3
/* DBEA4 001DBDA4 04006212 */  beq        $19, $2, .L001DBDB8
/* DBEA8 001DBDA8 00000000 */   nop
/* DBEAC 001DBDAC 05000224 */  addiu      $2, $0, 0x5
/* DBEB0 001DBDB0 3A006216 */  bne        $19, $2, .L001DBE9C
/* DBEB4 001DBDB4 00000000 */   nop
.L001DBDB8:
/* DBEB8 001DBDB8 4002A427 */  addiu      $4, $sp, 0x240
/* DBEBC 001DBDBC EA01023C */  lui        $2, %hi(D_1EA1D30)
/* DBEC0 001DBDC0 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* DBEC4 001DBDC4 0C86040C */  jal        sceVu0CopyVector
/* DBEC8 001DBDC8 00000000 */   nop
/* DBECC 001DBDCC 4002A427 */  addiu      $4, $sp, 0x240
/* DBED0 001DBDD0 282E8072 */  paddub     $5, $20, $0
/* DBED4 001DBDD4 648D040C */  jal        DistVector__FPfPf
/* DBED8 001DBDD8 00000000 */   nop
/* DBEDC 001DBDDC 46050046 */  mov.s      $f21, $f0
/* DBEE0 001DBDE0 A041023C */  lui        $2, (0x41A00000 >> 16)
/* DBEE4 001DBDE4 00008244 */  mtc1       $2, $f0
/* DBEE8 001DBDE8 00000000 */  nop
/* DBEEC 001DBDEC 36A80046 */  c.le.s     $f21, $f0
/* DBEF0 001DBDF0 00000000 */  nop
/* DBEF4 001DBDF4 0B000045 */  bc1f       .L001DBE24
/* DBEF8 001DBDF8 00000000 */   nop
/* DBEFC 001DBDFC C03F023C */  lui        $2, (0x3FC00000 >> 16)
/* DBF00 001DBE00 00008244 */  mtc1       $2, $f0
/* DBF04 001DBE04 00000000 */  nop
/* DBF08 001DBE08 02A50046 */  mul.s      $f20, $f20, $f0
/* DBF0C 001DBE0C F83F023C */  lui        $2, (0x3FF80000 >> 16)
/* DBF10 001DBE10 3C280200 */  dsll32     $5, $2, 0
/* DBF14 001DBE14 2A00023C */  lui        $2, %hi(_1521)
/* DBF18 001DBE18 78CF4424 */  addiu      $4, $2, %lo(_1521)
/* DBF1C 001DBE1C A611040C */  jal        printf
/* DBF20 001DBE20 00000000 */   nop
.L001DBE24:
/* DBF24 001DBE24 4842023C */  lui        $2, (0x42480000 >> 16)
/* DBF28 001DBE28 00008244 */  mtc1       $2, $f0
/* DBF2C 001DBE2C 00000000 */  nop
/* DBF30 001DBE30 34A80046 */  c.lt.s     $f21, $f0
/* DBF34 001DBE34 00000000 */  nop
/* DBF38 001DBE38 18000145 */  bc1t       .L001DBE9C
/* DBF3C 001DBE3C 00000000 */   nop
/* DBF40 001DBE40 41AD0046 */  sub.s      $f21, $f21, $f0
/* DBF44 001DBE44 C842023C */  lui        $2, (0x42C80000 >> 16)
/* DBF48 001DBE48 00088244 */  mtc1       $2, $f1
/* DBF4C 001DBE4C 00000000 */  nop
/* DBF50 001DBE50 01081546 */  sub.s      $f0, $f1, $f21
/* DBF54 001DBE54 43050146 */  div.s      $f21, $f0, $f1
/* DBF58 001DBE58 003F023C */  lui        $2, (0x3F000000 >> 16)
/* DBF5C 001DBE5C 00008244 */  mtc1       $2, $f0
/* DBF60 001DBE60 00000000 */  nop
/* DBF64 001DBE64 34A80046 */  c.lt.s     $f21, $f0
/* DBF68 001DBE68 00000000 */  nop
/* DBF6C 001DBE6C 02000045 */  bc1f       .L001DBE78
/* DBF70 001DBE70 00000000 */   nop
/* DBF74 001DBE74 46050046 */  mov.s      $f21, $f0
.L001DBE78:
/* DBF78 001DBE78 02A51546 */  mul.s      $f20, $f20, $f21
/* DBF7C 001DBE7C 06AB0046 */  mov.s      $f12, $f21
/* DBF80 001DBE80 9044040C */  jal        fptodp
/* DBF84 001DBE84 00000000 */   nop
/* DBF88 001DBE88 2A00033C */  lui        $3, %hi(_1521)
/* DBF8C 001DBE8C 78CF6424 */  addiu      $4, $3, %lo(_1521)
/* DBF90 001DBE90 282E4070 */  paddub     $5, $2, $0
/* DBF94 001DBE94 A611040C */  jal        printf
/* DBF98 001DBE98 00000000 */   nop
.L001DBE9C:
/* DBF9C 001DBE9C 9000A28E */  lw         $2, 0x90($21)
/* DBFA0 001DBEA0 F000A2AF */  sw         $2, 0xF0($sp)
/* DBFA4 001DBEA4 F000A28F */  lw         $2, 0xF0($sp)
/* DBFA8 001DBEA8 80180200 */  sll        $3, $2, 2
/* DBFAC 001DBEAC 21186200 */  addu       $3, $3, $2
/* DBFB0 001DBEB0 80100300 */  sll        $2, $3, 2
/* DBFB4 001DBEB4 21106200 */  addu       $2, $3, $2
/* DBFB8 001DBEB8 00110200 */  sll        $2, $2, 4
/* DBFBC 001DBEBC 21185500 */  addu       $3, $2, $21
/* DBFC0 001DBEC0 0200013C */  lui        $at, (0x20000 >> 16)
/* DBFC4 001DBEC4 21086100 */  addu       $at, $3, $at
/* DBFC8 001DBEC8 60E42384 */  lh         $3, -0x1BA0($at)
/* DBFCC 001DBECC 00008344 */  mtc1       $3, $f0
/* DBFD0 001DBED0 00000000 */  nop
/* DBFD4 001DBED4 60008046 */  cvt.s.w    $f1, $f0
/* DBFD8 001DBED8 03000324 */  addiu      $3, $0, 0x3
/* DBFDC 001DBEDC 05006316 */  bne        $19, $3, .L001DBEF4
/* DBFE0 001DBEE0 00000000 */   nop
/* DBFE4 001DBEE4 0040033C */  lui        $3, (0x40000000 >> 16)
/* DBFE8 001DBEE8 00008344 */  mtc1       $3, $f0
/* DBFEC 001DBEEC 00000000 */  nop
/* DBFF0 001DBEF0 43080046 */  div.s      $f1, $f1, $f0
.L001DBEF4:
/* DBFF4 001DBEF4 01A50146 */  sub.s      $f20, $f20, $f1
/* DBFF8 001DBEF8 00008044 */  mtc1       $0, $f0
/* DBFFC 001DBEFC 00000000 */  nop
/* DC000 001DBF00 36A00046 */  c.le.s     $f20, $f0
/* DC004 001DBF04 00000000 */  nop
/* DC008 001DBF08 03000045 */  bc1f       .L001DBF18
/* DC00C 001DBF0C 00000000 */   nop
/* DC010 001DBF10 803F033C */  lui        $3, (0x3F800000 >> 16)
/* DC014 001DBF14 00A08344 */  mtc1       $3, $f20
.L001DBF18:
/* DC018 001DBF18 E000A38F */  lw         $3, 0xE0($sp)
/* DC01C 001DBF1C 37006010 */  beqz       $3, .L001DBFFC
/* DC020 001DBF20 00000000 */   nop
/* DC024 001DBF24 86A00046 */  mov.s      $f2, $f20
/* DC028 001DBF28 00008044 */  mtc1       $0, $f0
/* DC02C 001DBF2C FFFF0324 */  addiu      $3, $0, -0x1
/* DC030 001DBF30 1A006312 */  beq        $19, $3, .L001DBF9C
/* DC034 001DBF34 00000000 */   nop
/* DC038 001DBF38 789C878F */  lw         $7, -0x6388($gp)
/* DC03C 001DBF3C 21186702 */  addu       $3, $19, $7
/* DC040 001DBF40 40436680 */  lb         $6, 0x4340($3)
/* DC044 001DBF44 40190600 */  sll        $3, $6, 5
/* DC048 001DBF48 23186600 */  subu       $3, $3, $6
/* DC04C 001DBF4C C0300300 */  sll        $6, $3, 3
/* DC050 001DBF50 A80A0324 */  addiu      $3, $0, 0xAA8
/* DC054 001DBF54 18186302 */  mult       $3, $19, $3
/* DC058 001DBF58 2118E300 */  addu       $3, $7, $3
/* DC05C 001DBF5C 21186600 */  addu       $3, $3, $6
/* DC060 001DBF60 0C456624 */  addiu      $6, $3, 0x450C
/* DC064 001DBF64 16456384 */  lh         $3, 0x4516($3)
/* DC068 001DBF68 00008344 */  mtc1       $3, $f0
/* DC06C 001DBF6C 00000000 */  nop
/* DC070 001DBF70 60008046 */  cvt.s.w    $f1, $f0
/* DC074 001DBF74 848580C7 */  lwc1       $f0, -0x7A7C($gp)
/* DC078 001DBF78 1A000146 */  mula.s     $f0, $f1
/* DC07C 001DBF7C 21182602 */  addu       $3, $17, $6
/* DC080 001DBF80 17006380 */  lb         $3, 0x17($3)
/* DC084 001DBF84 00008344 */  mtc1       $3, $f0
/* DC088 001DBF88 00000000 */  nop
/* DC08C 001DBF8C 60008046 */  cvt.s.w    $f1, $f0
/* DC090 001DBF90 948580C7 */  lwc1       $f0, -0x7A6C($gp)
/* DC094 001DBF94 1C000146 */  madd.s     $f0, $f0, $f1
/* DC098 001DBF98 02A00046 */  mul.s      $f0, $f20, $f0
.L001DBF9C:
/* DC09C 001DBF9C 00A50046 */  add.s      $f20, $f20, $f0
/* DC0A0 001DBFA0 21305500 */  addu       $6, $2, $21
/* DC0A4 001DBFA4 40181100 */  sll        $3, $17, 1
/* DC0A8 001DBFA8 21186600 */  addu       $3, $3, $6
/* DC0AC 001DBFAC 0200013C */  lui        $at, (0x20000 >> 16)
/* DC0B0 001DBFB0 21086100 */  addu       $at, $3, $at
/* DC0B4 001DBFB4 FAE32384 */  lh         $3, -0x1C06($at)
/* DC0B8 001DBFB8 00008344 */  mtc1       $3, $f0
/* DC0BC 001DBFBC 00000000 */  nop
/* DC0C0 001DBFC0 60008046 */  cvt.s.w    $f1, $f0
/* DC0C4 001DBFC4 148480C7 */  lwc1       $f0, -0x7BEC($gp)
/* DC0C8 001DBFC8 02000146 */  mul.s      $f0, $f0, $f1
/* DC0CC 001DBFCC 02A50046 */  mul.s      $f20, $f20, $f0
/* DC0D0 001DBFD0 00008044 */  mtc1       $0, $f0
/* DC0D4 001DBFD4 00000000 */  nop
/* DC0D8 001DBFD8 36A00046 */  c.le.s     $f20, $f0
/* DC0DC 001DBFDC 00000000 */  nop
/* DC0E0 001DBFE0 06000045 */  bc1f       .L001DBFFC
/* DC0E4 001DBFE4 00000000 */   nop
/* DC0E8 001DBFE8 36100046 */  c.le.s     $f2, $f0
/* DC0EC 001DBFEC 00000000 */  nop
/* DC0F0 001DBFF0 02000145 */  bc1t       .L001DBFFC
/* DC0F4 001DBFF4 00000000 */   nop
/* DC0F8 001DBFF8 01001724 */  addiu      $23, $0, 0x1
.L001DBFFC:
/* DC0FC 001DBFFC 6400868E */  lw         $6, 0x64($20)
/* DC100 001DC000 0E00C010 */  beqz       $6, .L001DC03C
/* DC104 001DC004 00000000 */   nop
/* DC108 001DC008 21185500 */  addu       $3, $2, $21
/* DC10C 001DC00C 0200013C */  lui        $at, (0x20000 >> 16)
/* DC110 001DC010 21086100 */  addu       $at, $3, $at
/* DC114 001DC014 F8E32384 */  lh         $3, -0x1C08($at)
/* DC118 001DC018 2118C300 */  addu       $3, $6, $3
/* DC11C 001DC01C 00006380 */  lb         $3, 0x0($3)
/* DC120 001DC020 00008344 */  mtc1       $3, $f0
/* DC124 001DC024 00000000 */  nop
/* DC128 001DC028 60008046 */  cvt.s.w    $f1, $f0
/* DC12C 001DC02C 888380C7 */  lwc1       $f0, -0x7C78($gp)
/* DC130 001DC030 02000146 */  mul.s      $f0, $f0, $f1
/* DC134 001DC034 02A00046 */  mul.s      $f0, $f20, $f0
/* DC138 001DC038 00A50046 */  add.s      $f20, $f20, $f0
.L001DC03C:
/* DC13C 001DC03C FFFF0324 */  addiu      $3, $0, -0x1
/* DC140 001DC040 2D006312 */  beq        $19, $3, .L001DC0F8
/* DC144 001DC044 00000000 */   nop
/* DC148 001DC048 86A00046 */  mov.s      $f2, $f20
/* DC14C 001DC04C F000A38F */  lw         $3, 0xF0($sp)
/* DC150 001DC050 C0300300 */  sll        $6, $3, 3
/* DC154 001DC054 2130C300 */  addu       $6, $6, $3
/* DC158 001DC058 C0180600 */  sll        $3, $6, 3
/* DC15C 001DC05C 2118C300 */  addu       $3, $6, $3
/* DC160 001DC060 00190300 */  sll        $3, $3, 4
/* DC164 001DC064 21387500 */  addu       $7, $3, $21
/* DC168 001DC068 B000A38F */  lw         $3, 0xB0($sp)
/* DC16C 001DC06C 40300300 */  sll        $6, $3, 1
/* DC170 001DC070 2118C300 */  addu       $3, $6, $3
/* DC174 001DC074 C0180300 */  sll        $3, $3, 3
/* DC178 001DC078 21306700 */  addu       $6, $3, $7
/* DC17C 001DC07C 80181300 */  sll        $3, $19, 2
/* DC180 001DC080 21186600 */  addu       $3, $3, $6
/* DC184 001DC084 0500013C */  lui        $at, (0x555D0 >> 16)
/* DC188 001DC088 21086100 */  addu       $at, $3, $at
/* DC18C 001DC08C D055268C */  lw         $6, (0x555D0 & 0xFFFF)($at)
/* DC190 001DC090 C842033C */  lui        $3, (0x42C80000 >> 16)
/* DC194 001DC094 00008344 */  mtc1       $3, $f0
/* DC198 001DC098 00000000 */  nop
/* DC19C 001DC09C 43A00046 */  div.s      $f1, $f20, $f0
/* DC1A0 001DC0A0 00008644 */  mtc1       $6, $f0
/* DC1A4 001DC0A4 00000000 */  nop
/* DC1A8 001DC0A8 20008046 */  cvt.s.w    $f0, $f0
/* DC1AC 001DC0AC 020D0046 */  mul.s      $f20, $f1, $f0
/* DC1B0 001DC0B0 00008044 */  mtc1       $0, $f0
/* DC1B4 001DC0B4 00000000 */  nop
/* DC1B8 001DC0B8 36A00046 */  c.le.s     $f20, $f0
/* DC1BC 001DC0BC 00000000 */  nop
/* DC1C0 001DC0C0 02000045 */  bc1f       .L001DC0CC
/* DC1C4 001DC0C4 00000000 */   nop
/* DC1C8 001DC0C8 06050046 */  mov.s      $f20, $f0
.L001DC0CC:
/* DC1CC 001DC0CC 00008044 */  mtc1       $0, $f0
/* DC1D0 001DC0D0 00000000 */  nop
/* DC1D4 001DC0D4 36A00046 */  c.le.s     $f20, $f0
/* DC1D8 001DC0D8 00000000 */  nop
/* DC1DC 001DC0DC 06000045 */  bc1f       .L001DC0F8
/* DC1E0 001DC0E0 00000000 */   nop
/* DC1E4 001DC0E4 36100046 */  c.le.s     $f2, $f0
/* DC1E8 001DC0E8 00000000 */  nop
/* DC1EC 001DC0EC 02000145 */  bc1t       .L001DC0F8
/* DC1F0 001DC0F0 00000000 */   nop
/* DC1F4 001DC0F4 01001724 */  addiu      $23, $0, 0x1
.L001DC0F8:
/* DC1F8 001DC0F8 F09D838F */  lw         $3, -0x6210($gp)
/* DC1FC 001DC0FC 2118C302 */  addu       $3, $22, $3
/* DC200 001DC100 6800668C */  lw         $6, 0x68($3)
/* DC204 001DC104 FFFF0324 */  addiu      $3, $0, -0x1
/* DC208 001DC108 0900C310 */  beq        $6, $3, .L001DC130
/* DC20C 001DC10C 00000000 */   nop
/* DC210 001DC110 21185500 */  addu       $3, $2, $21
/* DC214 001DC114 0200013C */  lui        $at, (0x20000 >> 16)
/* DC218 001DC118 21086100 */  addu       $at, $3, $at
/* DC21C 001DC11C F8E32384 */  lh         $3, -0x1C08($at)
/* DC220 001DC120 03006610 */  beq        $3, $6, .L001DC130
/* DC224 001DC124 00000000 */   nop
/* DC228 001DC128 00A08044 */  mtc1       $0, $f20
/* DC22C 001DC12C 01001724 */  addiu      $23, $0, 0x1
.L001DC130:
/* DC230 001DC130 21185500 */  addu       $3, $2, $21
/* DC234 001DC134 0200013C */  lui        $at, (0x20000 >> 16)
/* DC238 001DC138 21086100 */  addu       $at, $3, $at
/* DC23C 001DC13C E0E3238C */  lw         $3, -0x1C20($at)
/* DC240 001DC140 05006018 */  blez       $3, .L001DC158
/* DC244 001DC144 00000000 */   nop
/* DC248 001DC148 0040033C */  lui        $3, (0x40000000 >> 16)
/* DC24C 001DC14C 00008344 */  mtc1       $3, $f0
/* DC250 001DC150 00000000 */  nop
/* DC254 001DC154 03A50046 */  div.s      $f20, $f20, $f0
.L001DC158:
/* DC258 001DC158 FFFF0324 */  addiu      $3, $0, -0x1
/* DC25C 001DC15C 0B006316 */  bne        $19, $3, .L001DC18C
/* DC260 001DC160 00000000 */   nop
/* DC264 001DC164 21105500 */  addu       $2, $2, $21
/* DC268 001DC168 0200013C */  lui        $at, (0x20000 >> 16)
/* DC26C 001DC16C 21084100 */  addu       $at, $2, $at
/* DC270 001DC170 ACE42284 */  lh         $2, -0x1B54($at)
/* DC274 001DC174 00008244 */  mtc1       $2, $f0
/* DC278 001DC178 00000000 */  nop
/* DC27C 001DC17C 60008046 */  cvt.s.w    $f1, $f0
/* DC280 001DC180 148480C7 */  lwc1       $f0, -0x7BEC($gp)
/* DC284 001DC184 02000146 */  mul.s      $f0, $f0, $f1
/* DC288 001DC188 02A50046 */  mul.s      $f20, $f20, $f0
.L001DC18C:
/* DC28C 001DC18C 00008044 */  mtc1       $0, $f0
/* DC290 001DC190 00000000 */  nop
/* DC294 001DC194 36A00046 */  c.le.s     $f20, $f0
/* DC298 001DC198 00000000 */  nop
/* DC29C 001DC19C 02000045 */  bc1f       .L001DC1A8
/* DC2A0 001DC1A0 00000000 */   nop
/* DC2A4 001DC1A4 06050046 */  mov.s      $f20, $f0
.L001DC1A8:
/* DC2A8 001DC1A8 06A30046 */  mov.s      $f12, $f20
/* DC2AC 001DC1AC 2C44040C */  jal        fptosi
/* DC2B0 001DC1B0 00000000 */   nop
/* DC2B4 001DC1B4 28A64070 */  paddub     $20, $2, $0
/* DC2B8 001DC1B8 00008244 */  mtc1       $2, $f0
/* DC2BC 001DC1BC 00000000 */  nop
/* DC2C0 001DC1C0 20008046 */  cvt.s.w    $f0, $f0
/* DC2C4 001DC1C4 41A00046 */  sub.s      $f1, $f20, $f0
/* DC2C8 001DC1C8 00008044 */  mtc1       $0, $f0
/* DC2CC 001DC1CC 00000000 */  nop
/* DC2D0 001DC1D0 36080046 */  c.le.s     $f1, $f0
/* DC2D4 001DC1D4 00000000 */  nop
/* DC2D8 001DC1D8 02000145 */  bc1t       .L001DC1E4
/* DC2DC 001DC1DC 00000000 */   nop
/* DC2E0 001DC1E0 01009426 */  addiu      $20, $20, 0x1
.L001DC1E4:
/* DC2E4 001DC1E4 F000A28F */  lw         $2, 0xF0($sp)
/* DC2E8 001DC1E8 C0180200 */  sll        $3, $2, 3
/* DC2EC 001DC1EC 21186200 */  addu       $3, $3, $2
/* DC2F0 001DC1F0 C0100300 */  sll        $2, $3, 3
/* DC2F4 001DC1F4 21106200 */  addu       $2, $3, $2
/* DC2F8 001DC1F8 00110200 */  sll        $2, $2, 4
/* DC2FC 001DC1FC 21105500 */  addu       $2, $2, $21
/* DC300 001DC200 0500013C */  lui        $at, (0x55754 >> 16)
/* DC304 001DC204 21084100 */  addu       $at, $2, $at
/* DC308 001DC208 5457228C */  lw         $2, (0x55754 & 0xFFFF)($at)
/* DC30C 001DC20C 00044230 */  andi       $2, $2, 0x400
/* DC310 001DC210 20004010 */  beqz       $2, .L001DC294
/* DC314 001DC214 00000000 */   nop
/* DC318 001DC218 C842023C */  lui        $2, (0x42C80000 >> 16)
/* DC31C 001DC21C 00008244 */  mtc1       $2, $f0
/* DC320 001DC220 00000000 */  nop
/* DC324 001DC224 34A00046 */  c.lt.s     $f20, $f0
/* DC328 001DC228 00000000 */  nop
/* DC32C 001DC22C 19000145 */  bc1t       .L001DC294
/* DC330 001DC230 00000000 */   nop
/* DC334 001DC234 789C828F */  lw         $2, -0x6388($gp)
/* DC338 001DC238 0001A2AF */  sw         $2, 0x100($sp)
/* DC33C 001DC23C 40181300 */  sll        $3, $19, 1
/* DC340 001DC240 0001A28F */  lw         $2, 0x100($sp)
/* DC344 001DC244 21106200 */  addu       $2, $3, $2
/* DC348 001DC248 12004284 */  lh         $2, 0x12($2)
/* DC34C 001DC24C 11004018 */  blez       $2, .L001DC294
/* DC350 001DC250 00000000 */   nop
/* DC354 001DC254 148480C7 */  lwc1       $f0, -0x7BEC($gp)
/* DC358 001DC258 02051446 */  mul.s      $f20, $f0, $f20
/* DC35C 001DC25C 06A30046 */  mov.s      $f12, $f20
/* DC360 001DC260 2C44040C */  jal        fptosi
/* DC364 001DC264 00000000 */   nop
/* DC368 001DC268 06A30046 */  mov.s      $f12, $f20
/* DC36C 001DC26C 2C44040C */  jal        fptosi
/* DC370 001DC270 00000000 */   nop
/* DC374 001DC274 3C340200 */  dsll32     $6, $2, 16
/* DC378 001DC278 3F340600 */  dsra32     $6, $6, 16
/* DC37C 001DC27C 7F43023C */  lui        $2, (0x437F0000 >> 16)
/* DC380 001DC280 00608244 */  mtc1       $2, $f12
/* DC384 001DC284 0001A48F */  lw         $4, 0x100($sp)
/* DC388 001DC288 282E6072 */  paddub     $5, $19, $0
/* DC38C 001DC28C C4F9060C */  jal        AddNowLife__11CUserStatusFisf
/* DC390 001DC290 00000000 */   nop
.L001DC294:
/* DC394 001DC294 9000A48E */  lw         $4, 0x90($21)
/* DC398 001DC298 C0100400 */  sll        $2, $4, 3
/* DC39C 001DC29C 21184400 */  addu       $3, $2, $4
/* DC3A0 001DC2A0 C0100300 */  sll        $2, $3, 3
/* DC3A4 001DC2A4 21106200 */  addu       $2, $3, $2
/* DC3A8 001DC2A8 00110200 */  sll        $2, $2, 4
/* DC3AC 001DC2AC 21105500 */  addu       $2, $2, $21
/* DC3B0 001DC2B0 0500013C */  lui        $at, (0x55754 >> 16)
/* DC3B4 001DC2B4 21084100 */  addu       $at, $2, $at
/* DC3B8 001DC2B8 5457228C */  lw         $2, (0x55754 & 0xFFFF)($at)
/* DC3BC 001DC2BC 00104230 */  andi       $2, $2, 0x1000
/* DC3C0 001DC2C0 2C004010 */  beqz       $2, .L001DC374
/* DC3C4 001DC2C4 00000000 */   nop
/* DC3C8 001DC2C8 80100400 */  sll        $2, $4, 2
/* DC3CC 001DC2CC 21184400 */  addu       $3, $2, $4
/* DC3D0 001DC2D0 80100300 */  sll        $2, $3, 2
/* DC3D4 001DC2D4 21106200 */  addu       $2, $3, $2
/* DC3D8 001DC2D8 00110200 */  sll        $2, $2, 4
/* DC3DC 001DC2DC 21105500 */  addu       $2, $2, $21
/* DC3E0 001DC2E0 0200013C */  lui        $at, (0x20000 >> 16)
/* DC3E4 001DC2E4 21084100 */  addu       $at, $2, $at
/* DC3E8 001DC2E8 10E42384 */  lh         $3, -0x1BF0($at)
/* DC3EC 001DC2EC 02000224 */  addiu      $2, $0, 0x2
/* DC3F0 001DC2F0 20006210 */  beq        $3, $2, .L001DC374
/* DC3F4 001DC2F4 00000000 */   nop
/* DC3F8 001DC2F8 BE11040C */  jal        rand
/* DC3FC 001DC2FC 00000000 */   nop
/* DC400 001DC300 00008244 */  mtc1       $2, $f0
/* DC404 001DC304 00000000 */  nop
/* DC408 001DC308 60008046 */  cvt.s.w    $f1, $f0
/* DC40C 001DC30C C842023C */  lui        $2, (0x42C80000 >> 16)
/* DC410 001DC310 00008244 */  mtc1       $2, $f0
/* DC414 001DC314 00000000 */  nop
/* DC418 001DC318 42000146 */  mul.s      $f1, $f0, $f1
/* DC41C 001DC31C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* DC420 001DC320 00008244 */  mtc1       $2, $f0
/* DC424 001DC324 00000000 */  nop
/* DC428 001DC328 43080046 */  div.s      $f1, $f1, $f0
/* DC42C 001DC32C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* DC430 001DC330 00008244 */  mtc1       $2, $f0
/* DC434 001DC334 00000000 */  nop
/* DC438 001DC338 34080046 */  c.lt.s     $f1, $f0
/* DC43C 001DC33C 00000000 */  nop
/* DC440 001DC340 0C000045 */  bc1f       .L001DC374
/* DC444 001DC344 00000000 */   nop
/* DC448 001DC348 9000A38E */  lw         $3, 0x90($21)
/* DC44C 001DC34C 80100300 */  sll        $2, $3, 2
/* DC450 001DC350 21184300 */  addu       $3, $2, $3
/* DC454 001DC354 80100300 */  sll        $2, $3, 2
/* DC458 001DC358 21106200 */  addu       $2, $3, $2
/* DC45C 001DC35C 00110200 */  sll        $2, $2, 4
/* DC460 001DC360 21105500 */  addu       $2, $2, $21
/* DC464 001DC364 0200013C */  lui        $at, (0x20000 >> 16)
/* DC468 001DC368 21084100 */  addu       $at, $2, $at
/* DC46C 001DC36C F4E3348C */  lw         $20, -0x1C0C($at)
/* DC470 001DC370 00000000 */  nop
.L001DC374:
/* DC474 001DC374 1300801A */  blez       $20, .L001DC3C4
/* DC478 001DC378 00000000 */   nop
/* DC47C 001DC37C 07006012 */  beqz       $19, .L001DC39C
/* DC480 001DC380 00000000 */   nop
/* DC484 001DC384 02000224 */  addiu      $2, $0, 0x2
/* DC488 001DC388 04006212 */  beq        $19, $2, .L001DC39C
/* DC48C 001DC38C 00000000 */   nop
/* DC490 001DC390 04000224 */  addiu      $2, $0, 0x4
/* DC494 001DC394 0B006216 */  bne        $19, $2, .L001DC3C4
/* DC498 001DC398 00000000 */   nop
.L001DC39C:
/* DC49C 001DC39C 09002006 */  bltz       $17, .L001DC3C4
/* DC4A0 001DC3A0 00000000 */   nop
/* DC4A4 001DC3A4 0500212A */  slti       $at, $17, 0x5
/* DC4A8 001DC3A8 06002010 */  beqz       $at, .L001DC3C4
/* DC4AC 001DC3AC 00000000 */   nop
/* DC4B0 001DC3B0 65002426 */  addiu      $4, $17, 0x65
/* DC4B4 001DC3B4 FFFF0524 */  addiu      $5, $0, -0x1
/* DC4B8 001DC3B8 28360070 */  paddub     $6, $0, $0
/* DC4BC 001DC3BC AC69050C */  jal        SndSePlay__Fiii
/* DC4C0 001DC3C0 00000000 */   nop
.L001DC3C4:
/* DC4C4 001DC3C4 DC01013C */  lui        $at, (0x1DC4528 >> 16)
/* DC4C8 001DC3C8 284533AC */  sw         $19, (0x1DC4528 & 0xFFFF)($at)
/* DC4CC 001DC3CC 9000A38E */  lw         $3, 0x90($21)
/* DC4D0 001DC3D0 80100300 */  sll        $2, $3, 2
/* DC4D4 001DC3D4 21184300 */  addu       $3, $2, $3
/* DC4D8 001DC3D8 80100300 */  sll        $2, $3, 2
/* DC4DC 001DC3DC 21106200 */  addu       $2, $3, $2
/* DC4E0 001DC3E0 00110200 */  sll        $2, $2, 4
/* DC4E4 001DC3E4 21185500 */  addu       $3, $2, $21
/* DC4E8 001DC3E8 0200013C */  lui        $at, (0x20000 >> 16)
/* DC4EC 001DC3EC 21086100 */  addu       $at, $3, $at
/* DC4F0 001DC3F0 F4E3228C */  lw         $2, -0x1C0C($at)
/* DC4F4 001DC3F4 23105400 */  subu       $2, $2, $20
/* DC4F8 001DC3F8 0200013C */  lui        $at, (0x20000 >> 16)
/* DC4FC 001DC3FC 21086100 */  addu       $at, $3, $at
/* DC500 001DC400 F4E322AC */  sw         $2, -0x1C0C($at)
/* DC504 001DC404 9000A38E */  lw         $3, 0x90($21)
/* DC508 001DC408 80100300 */  sll        $2, $3, 2
/* DC50C 001DC40C 21184300 */  addu       $3, $2, $3
/* DC510 001DC410 80100300 */  sll        $2, $3, 2
/* DC514 001DC414 21106200 */  addu       $2, $3, $2
/* DC518 001DC418 00110200 */  sll        $2, $2, 4
/* DC51C 001DC41C 21185500 */  addu       $3, $2, $21
/* DC520 001DC420 0200013C */  lui        $at, (0x20000 >> 16)
/* DC524 001DC424 21086100 */  addu       $at, $3, $at
/* DC528 001DC428 F4E3228C */  lw         $2, -0x1C0C($at)
/* DC52C 001DC42C 2600401C */  bgtz       $2, .L001DC4C8
/* DC530 001DC430 00000000 */   nop
/* DC534 001DC434 0200013C */  lui        $at, (0x20000 >> 16)
/* DC538 001DC438 21086100 */  addu       $at, $3, $at
/* DC53C 001DC43C D4E333AC */  sw         $19, -0x1C2C($at)
/* DC540 001DC440 9000A38E */  lw         $3, 0x90($21)
/* DC544 001DC444 80100300 */  sll        $2, $3, 2
/* DC548 001DC448 21184300 */  addu       $3, $2, $3
/* DC54C 001DC44C 80100300 */  sll        $2, $3, 2
/* DC550 001DC450 21106200 */  addu       $2, $3, $2
/* DC554 001DC454 00110200 */  sll        $2, $2, 4
/* DC558 001DC458 21105500 */  addu       $2, $2, $21
/* DC55C 001DC45C 0200013C */  lui        $at, (0x20000 >> 16)
/* DC560 001DC460 21084100 */  addu       $at, $2, $at
/* DC564 001DC464 F4E320AC */  sw         $0, -0x1C0C($at)
/* DC568 001DC468 4C00A28E */  lw         $2, 0x4C($21)
/* DC56C 001DC46C FFFF4224 */  addiu      $2, $2, -0x1
/* DC570 001DC470 4C00A2AE */  sw         $2, 0x4C($21)
/* DC574 001DC474 02001024 */  addiu      $16, $0, 0x2
/* DC578 001DC478 789C848F */  lw         $4, -0x6388($gp)
/* DC57C 001DC47C C0FD060C */  jal        AddKills__14CDngStatusDataFv
/* DC580 001DC480 00000000 */   nop
/* DC584 001DC484 9000A38E */  lw         $3, 0x90($21)
/* DC588 001DC488 80100300 */  sll        $2, $3, 2
/* DC58C 001DC48C 21184300 */  addu       $3, $2, $3
/* DC590 001DC490 80100300 */  sll        $2, $3, 2
/* DC594 001DC494 21106200 */  addu       $2, $3, $2
/* DC598 001DC498 00110200 */  sll        $2, $2, 4
/* DC59C 001DC49C 21205500 */  addu       $4, $2, $21
/* DC5A0 001DC4A0 0200013C */  lui        $at, (0x20000 >> 16)
/* DC5A4 001DC4A4 21088100 */  addu       $at, $4, $at
/* DC5A8 001DC4A8 C6E42384 */  lh         $3, -0x1B3A($at)
/* DC5AC 001DC4AC FFFF0224 */  addiu      $2, $0, -0x1
/* DC5B0 001DC4B0 05006210 */  beq        $3, $2, .L001DC4C8
/* DC5B4 001DC4B4 00000000 */   nop
/* DC5B8 001DC4B8 01000224 */  addiu      $2, $0, 0x1
/* DC5BC 001DC4BC 0200013C */  lui        $at, (0x20000 >> 16)
/* DC5C0 001DC4C0 21088100 */  addu       $at, $4, $at
/* DC5C4 001DC4C4 C8E422A4 */  sh         $2, -0x1B38($at)
.L001DC4C8:
/* DC5C8 001DC4C8 5800E016 */  bnez       $23, .L001DC62C
/* DC5CC 001DC4CC 00000000 */   nop
/* DC5D0 001DC4D0 7F43043C */  lui        $4, (0x437F0000 >> 16)
/* DC5D4 001DC4D4 9000A38E */  lw         $3, 0x90($21)
/* DC5D8 001DC4D8 80100300 */  sll        $2, $3, 2
/* DC5DC 001DC4DC 21184300 */  addu       $3, $2, $3
/* DC5E0 001DC4E0 80100300 */  sll        $2, $3, 2
/* DC5E4 001DC4E4 21106200 */  addu       $2, $3, $2
/* DC5E8 001DC4E8 00110200 */  sll        $2, $2, 4
/* DC5EC 001DC4EC 21105500 */  addu       $2, $2, $21
/* DC5F0 001DC4F0 0200013C */  lui        $at, (0x20000 >> 16)
/* DC5F4 001DC4F4 21084100 */  addu       $at, $2, $at
/* DC5F8 001DC4F8 00E524AC */  sw         $4, -0x1B00($at)
/* DC5FC 001DC4FC 9000A38E */  lw         $3, 0x90($21)
/* DC600 001DC500 80100300 */  sll        $2, $3, 2
/* DC604 001DC504 21184300 */  addu       $3, $2, $3
/* DC608 001DC508 80100300 */  sll        $2, $3, 2
/* DC60C 001DC50C 21106200 */  addu       $2, $3, $2
/* DC610 001DC510 00110200 */  sll        $2, $2, 4
/* DC614 001DC514 21105500 */  addu       $2, $2, $21
/* DC618 001DC518 0200013C */  lui        $at, (0x20000 >> 16)
/* DC61C 001DC51C 21084100 */  addu       $at, $2, $at
/* DC620 001DC520 04E520AC */  sw         $0, -0x1AFC($at)
/* DC624 001DC524 9000A38E */  lw         $3, 0x90($21)
/* DC628 001DC528 80100300 */  sll        $2, $3, 2
/* DC62C 001DC52C 21184300 */  addu       $3, $2, $3
/* DC630 001DC530 80100300 */  sll        $2, $3, 2
/* DC634 001DC534 21106200 */  addu       $2, $3, $2
/* DC638 001DC538 00110200 */  sll        $2, $2, 4
/* DC63C 001DC53C 21105500 */  addu       $2, $2, $21
/* DC640 001DC540 0200013C */  lui        $at, (0x20000 >> 16)
/* DC644 001DC544 21084100 */  addu       $at, $2, $at
/* DC648 001DC548 08E520AC */  sw         $0, -0x1AF8($at)
/* DC64C 001DC54C 01000424 */  addiu      $4, $0, 0x1
/* DC650 001DC550 9000A38E */  lw         $3, 0x90($21)
/* DC654 001DC554 80100300 */  sll        $2, $3, 2
/* DC658 001DC558 21184300 */  addu       $3, $2, $3
/* DC65C 001DC55C 80100300 */  sll        $2, $3, 2
/* DC660 001DC560 21106200 */  addu       $2, $3, $2
/* DC664 001DC564 00110200 */  sll        $2, $2, 4
/* DC668 001DC568 21105500 */  addu       $2, $2, $21
/* DC66C 001DC56C 0200013C */  lui        $at, (0x20000 >> 16)
/* DC670 001DC570 21084100 */  addu       $at, $2, $at
/* DC674 001DC574 34E524AC */  sw         $4, -0x1ACC($at)
/* DC678 001DC578 988580C7 */  lwc1       $f0, -0x7A68($gp)
/* DC67C 001DC57C 9000A38E */  lw         $3, 0x90($21)
/* DC680 001DC580 80100300 */  sll        $2, $3, 2
/* DC684 001DC584 21184300 */  addu       $3, $2, $3
/* DC688 001DC588 80100300 */  sll        $2, $3, 2
/* DC68C 001DC58C 21106200 */  addu       $2, $3, $2
/* DC690 001DC590 00110200 */  sll        $2, $2, 4
/* DC694 001DC594 21105500 */  addu       $2, $2, $21
/* DC698 001DC598 0200013C */  lui        $at, (0x20000 >> 16)
/* DC69C 001DC59C 21084100 */  addu       $at, $2, $at
/* DC6A0 001DC5A0 38E520E4 */  swc1       $f0, -0x1AC8($at)
/* DC6A4 001DC5A4 9000A38E */  lw         $3, 0x90($21)
/* DC6A8 001DC5A8 80100300 */  sll        $2, $3, 2
/* DC6AC 001DC5AC 21184300 */  addu       $3, $2, $3
/* DC6B0 001DC5B0 80100300 */  sll        $2, $3, 2
/* DC6B4 001DC5B4 21106200 */  addu       $2, $3, $2
/* DC6B8 001DC5B8 00110200 */  sll        $2, $2, 4
/* DC6BC 001DC5BC 21105500 */  addu       $2, $2, $21
/* DC6C0 001DC5C0 0200013C */  lui        $at, (0x20000 >> 16)
/* DC6C4 001DC5C4 21084100 */  addu       $at, $2, $at
/* DC6C8 001DC5C8 3CE520AC */  sw         $0, -0x1AC4($at)
/* DC6CC 001DC5CC 9000A38E */  lw         $3, 0x90($21)
/* DC6D0 001DC5D0 C0100300 */  sll        $2, $3, 3
/* DC6D4 001DC5D4 21184300 */  addu       $3, $2, $3
/* DC6D8 001DC5D8 C0100300 */  sll        $2, $3, 3
/* DC6DC 001DC5DC 21106200 */  addu       $2, $3, $2
/* DC6E0 001DC5E0 00110200 */  sll        $2, $2, 4
/* DC6E4 001DC5E4 2110A202 */  addu       $2, $21, $2
/* DC6E8 001DC5E8 21105E00 */  addu       $2, $2, $fp
/* DC6EC 001DC5EC E09D848F */  lw         $4, -0x6220($gp)
/* DC6F0 001DC5F0 0500013C */  lui        $at, (0x55250 >> 16)
/* DC6F4 001DC5F4 50522134 */  ori        $at, $at, (0x55250 & 0xFFFF)
/* DC6F8 001DC5F8 21284100 */  addu       $5, $2, $at
/* DC6FC 001DC5FC 28368072 */  paddub     $6, $20, $0
/* DC700 001DC600 283E0070 */  paddub     $7, $0, $0
/* DC704 001DC604 28460070 */  paddub     $8, $0, $0
/* DC708 001DC608 C0D8060C */  jal        HitValueEntry__FP9CHitValuePfiiP6CFrame
/* DC70C 001DC60C 00000000 */   nop
/* DC710 001DC610 A0000424 */  addiu      $4, $0, 0xA0
/* DC714 001DC614 FFFF0524 */  addiu      $5, $0, -0x1
/* DC718 001DC618 28360070 */  paddub     $6, $0, $0
/* DC71C 001DC61C AC69050C */  jal        SndSePlay__Fiii
/* DC720 001DC620 00000000 */   nop
/* DC724 001DC624 56000010 */  b          .L001DC780
/* DC728 001DC628 00000000 */   nop
.L001DC62C:
/* DC72C 001DC62C 9000A38E */  lw         $3, 0x90($21)
/* DC730 001DC630 C0100300 */  sll        $2, $3, 3
/* DC734 001DC634 21184300 */  addu       $3, $2, $3
/* DC738 001DC638 C0100300 */  sll        $2, $3, 3
/* DC73C 001DC63C 21106200 */  addu       $2, $3, $2
/* DC740 001DC640 00110200 */  sll        $2, $2, 4
/* DC744 001DC644 2110A202 */  addu       $2, $21, $2
/* DC748 001DC648 21105E00 */  addu       $2, $2, $fp
/* DC74C 001DC64C E09D848F */  lw         $4, -0x6220($gp)
/* DC750 001DC650 0500013C */  lui        $at, (0x55250 >> 16)
/* DC754 001DC654 50522134 */  ori        $at, $at, (0x55250 & 0xFFFF)
/* DC758 001DC658 21284100 */  addu       $5, $2, $at
/* DC75C 001DC65C 28360070 */  paddub     $6, $0, $0
/* DC760 001DC660 FFFF0724 */  addiu      $7, $0, -0x1
/* DC764 001DC664 28460070 */  paddub     $8, $0, $0
/* DC768 001DC668 C0D8060C */  jal        HitValueEntry__FP9CHitValuePfiiP6CFrame
/* DC76C 001DC66C 00000000 */   nop
/* DC770 001DC670 7F43023C */  lui        $2, (0x437F0000 >> 16)
/* DC774 001DC674 9000A48E */  lw         $4, 0x90($21)
/* DC778 001DC678 80180400 */  sll        $3, $4, 2
/* DC77C 001DC67C 21206400 */  addu       $4, $3, $4
/* DC780 001DC680 80180400 */  sll        $3, $4, 2
/* DC784 001DC684 21188300 */  addu       $3, $4, $3
/* DC788 001DC688 00190300 */  sll        $3, $3, 4
/* DC78C 001DC68C 21187500 */  addu       $3, $3, $21
/* DC790 001DC690 0200013C */  lui        $at, (0x20000 >> 16)
/* DC794 001DC694 21086100 */  addu       $at, $3, $at
/* DC798 001DC698 00E522AC */  sw         $2, -0x1B00($at)
/* DC79C 001DC69C 9000A48E */  lw         $4, 0x90($21)
/* DC7A0 001DC6A0 80180400 */  sll        $3, $4, 2
/* DC7A4 001DC6A4 21206400 */  addu       $4, $3, $4
/* DC7A8 001DC6A8 80180400 */  sll        $3, $4, 2
/* DC7AC 001DC6AC 21188300 */  addu       $3, $4, $3
/* DC7B0 001DC6B0 00190300 */  sll        $3, $3, 4
/* DC7B4 001DC6B4 21187500 */  addu       $3, $3, $21
/* DC7B8 001DC6B8 0200013C */  lui        $at, (0x20000 >> 16)
/* DC7BC 001DC6BC 21086100 */  addu       $at, $3, $at
/* DC7C0 001DC6C0 04E522AC */  sw         $2, -0x1AFC($at)
/* DC7C4 001DC6C4 9000A48E */  lw         $4, 0x90($21)
/* DC7C8 001DC6C8 80180400 */  sll        $3, $4, 2
/* DC7CC 001DC6CC 21206400 */  addu       $4, $3, $4
/* DC7D0 001DC6D0 80180400 */  sll        $3, $4, 2
/* DC7D4 001DC6D4 21188300 */  addu       $3, $4, $3
/* DC7D8 001DC6D8 00190300 */  sll        $3, $3, 4
/* DC7DC 001DC6DC 21187500 */  addu       $3, $3, $21
/* DC7E0 001DC6E0 0200013C */  lui        $at, (0x20000 >> 16)
/* DC7E4 001DC6E4 21086100 */  addu       $at, $3, $at
/* DC7E8 001DC6E8 08E522AC */  sw         $2, -0x1AF8($at)
/* DC7EC 001DC6EC 01000424 */  addiu      $4, $0, 0x1
/* DC7F0 001DC6F0 9000A38E */  lw         $3, 0x90($21)
/* DC7F4 001DC6F4 80100300 */  sll        $2, $3, 2
/* DC7F8 001DC6F8 21184300 */  addu       $3, $2, $3
/* DC7FC 001DC6FC 80100300 */  sll        $2, $3, 2
/* DC800 001DC700 21106200 */  addu       $2, $3, $2
/* DC804 001DC704 00110200 */  sll        $2, $2, 4
/* DC808 001DC708 21105500 */  addu       $2, $2, $21
/* DC80C 001DC70C 0200013C */  lui        $at, (0x20000 >> 16)
/* DC810 001DC710 21084100 */  addu       $at, $2, $at
/* DC814 001DC714 34E524AC */  sw         $4, -0x1ACC($at)
/* DC818 001DC718 988580C7 */  lwc1       $f0, -0x7A68($gp)
/* DC81C 001DC71C 9000A38E */  lw         $3, 0x90($21)
/* DC820 001DC720 80100300 */  sll        $2, $3, 2
/* DC824 001DC724 21184300 */  addu       $3, $2, $3
/* DC828 001DC728 80100300 */  sll        $2, $3, 2
/* DC82C 001DC72C 21106200 */  addu       $2, $3, $2
/* DC830 001DC730 00110200 */  sll        $2, $2, 4
/* DC834 001DC734 21105500 */  addu       $2, $2, $21
/* DC838 001DC738 0200013C */  lui        $at, (0x20000 >> 16)
/* DC83C 001DC73C 21084100 */  addu       $at, $2, $at
/* DC840 001DC740 38E520E4 */  swc1       $f0, -0x1AC8($at)
/* DC844 001DC744 9000A38E */  lw         $3, 0x90($21)
/* DC848 001DC748 80100300 */  sll        $2, $3, 2
/* DC84C 001DC74C 21184300 */  addu       $3, $2, $3
/* DC850 001DC750 80100300 */  sll        $2, $3, 2
/* DC854 001DC754 21106200 */  addu       $2, $3, $2
/* DC858 001DC758 00110200 */  sll        $2, $2, 4
/* DC85C 001DC75C 21105500 */  addu       $2, $2, $21
/* DC860 001DC760 0200013C */  lui        $at, (0x20000 >> 16)
/* DC864 001DC764 21084100 */  addu       $at, $2, $at
/* DC868 001DC768 3CE520AC */  sw         $0, -0x1AC4($at)
/* DC86C 001DC76C 9F000424 */  addiu      $4, $0, 0x9F
/* DC870 001DC770 FFFF0524 */  addiu      $5, $0, -0x1
/* DC874 001DC774 28360070 */  paddub     $6, $0, $0
/* DC878 001DC778 AC69050C */  jal        SndSePlay__Fiii
/* DC87C 001DC77C 00000000 */   nop
.L001DC780:
/* DC880 001DC780 F09D848F */  lw         $4, -0x6210($gp)
/* DC884 001DC784 2110C402 */  addu       $2, $22, $4
/* DC888 001DC788 4800438C */  lw         $3, 0x48($2)
/* DC88C 001DC78C 03000224 */  addiu      $2, $0, 0x3
/* DC890 001DC790 04006210 */  beq        $3, $2, .L001DC7A4
/* DC894 001DC794 00000000 */   nop
/* DC898 001DC798 80101200 */  sll        $2, $18, 2
/* DC89C 001DC79C 21104400 */  addu       $2, $2, $4
/* DC8A0 001DC7A0 003C40AC */  sw         $0, 0x3C00($2)
.L001DC7A4:
/* DC8A4 001DC7A4 02000224 */  addiu      $2, $0, 0x2
/* DC8A8 001DC7A8 0A000216 */  bne        $16, $2, .L001DC7D4
/* DC8AC 001DC7AC 00000000 */   nop
/* DC8B0 001DC7B0 09000010 */  b          .L001DC7D8
/* DC8B4 001DC7B4 00000000 */   nop
.L001DC7B8:
/* DC8B8 001DC7B8 B000A28F */  lw         $2, 0xB0($sp)
/* DC8BC 001DC7BC 01004224 */  addiu      $2, $2, 0x1
/* DC8C0 001DC7C0 B000A2AF */  sw         $2, 0xB0($sp)
.L001DC7C4:
/* DC8C4 001DC7C4 B000A28F */  lw         $2, 0xB0($sp)
/* DC8C8 001DC7C8 10004228 */  slti       $2, $2, 0x10
/* DC8CC 001DC7CC 67F84014 */  bnez       $2, .L001DA96C
/* DC8D0 001DC7D0 00000000 */   nop
.L001DC7D4:
/* DC8D4 001DC7D4 28160072 */  paddub     $2, $16, $0
.L001DC7D8:
/* DC8D8 001DC7D8 A000BF7B */  lq         $31, 0xA0($sp)
/* DC8DC 001DC7DC 9000BE7B */  lq         $fp, 0x90($sp)
/* DC8E0 001DC7E0 8000B77B */  lq         $23, 0x80($sp)
/* DC8E4 001DC7E4 7000B67B */  lq         $22, 0x70($sp)
/* DC8E8 001DC7E8 6000B57B */  lq         $21, 0x60($sp)
/* DC8EC 001DC7EC 5000B47B */  lq         $20, 0x50($sp)
/* DC8F0 001DC7F0 4000B37B */  lq         $19, 0x40($sp)
/* DC8F4 001DC7F4 3000B27B */  lq         $18, 0x30($sp)
/* DC8F8 001DC7F8 2000B17B */  lq         $17, 0x20($sp)
/* DC8FC 001DC7FC 1000B07B */  lq         $16, 0x10($sp)
/* DC900 001DC800 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* DC904 001DC804 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* DC908 001DC808 7002BD27 */  addiu      $sp, $sp, 0x270
/* DC90C 001DC80C 0800E003 */  jr         $31
/* DC910 001DC810 00000000 */   nop
/* DC914 001DC814 00000000 */  nop
/* DC918 001DC818 00000000 */  nop
/* DC91C 001DC81C 00000000 */  nop
