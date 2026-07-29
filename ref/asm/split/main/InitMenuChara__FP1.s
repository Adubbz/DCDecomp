.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitMenuChara__FP1
/* 0F73E0 001F72E0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0F73E4 001F72E4 1000BF7F */  sq          $31, 0x10($29)
/* 0F73E8 001F72E8 0000B07F */  sq          $16, 0x0($29)
/* 0F73EC 001F72EC 28868070 */  paddub      $16, $4, $0
/* 0F73F0 001F72F0 30FB040C */  jal         StartReadBG__Fv
/* 0F73F4 001F72F4 00000000 */   nop
/* 0F73F8 001F72F8 2A00023C */  lui         $2, %hi(LIT_1348)
/* 0F73FC 001F72FC 48D74424 */  addiu       $4, $2, %lo(LIT_1348)
/* 0F7400 001F7300 282E0072 */  paddub      $5, $16, $0
/* 0F7404 001F7304 ACAE080C */  jal         LoadFileBGMenuData__FPcP1
/* 0F7408 001F7308 00000000 */   nop
/* 0F740C 001F730C 38FB040C */  jal         ReadBG__Fv
/* 0F7410 001F7310 00000000 */   nop
/* 0F7414 001F7314 FC9480AF */  sw          $0, -0x6B04($28)
/* 0F7418 001F7318 01000224 */  addiu       $2, $0, 0x1
/* 0F741C 001F731C D901013C */  lui         $1, %hi(MenuChara + 0x3)
/* 0F7420 001F7320 730422A0 */  sb          $2, %lo(MenuChara + 0x3)($1)
/* 0F7424 001F7324 D901013C */  lui         $1, %hi(MenuChara + 0x4)
/* 0F7428 001F7328 740420AC */  sw          $0, %lo(MenuChara + 0x4)($1)
/* 0F742C 001F732C EC42023C */  lui         $2, (0x42EC0000 >> 16)
/* 0F7430 001F7330 248882AF */  sw          $2, -0x77DC($28)
/* 0F7434 001F7334 849580AF */  sw          $0, -0x6A7C($28)
/* 0F7438 001F7338 6C9580AF */  sw          $0, -0x6A94($28)
/* 0F743C 001F733C 7042023C */  lui         $2, (0x42700000 >> 16)
/* 0F7440 001F7340 D901013C */  lui         $1, %hi(SysCur)
/* 0F7444 001F7344 600422AC */  sw          $2, %lo(SysCur)($1)
/* 0F7448 001F7348 2043023C */  lui         $2, (0x43200000 >> 16)
/* 0F744C 001F734C D901013C */  lui         $1, %hi(SysCur + 0x4)
/* 0F7450 001F7350 640422AC */  sw          $2, %lo(SysCur + 0x4)($1)
/* 0F7454 001F7354 D494868F */  lw          $6, -0x6B2C($28)
/* 0F7458 001F7358 0400C480 */  lb          $4, 0x4($6)
/* 0F745C 001F735C D901013C */  lui         $1, %hi(MenuChara)
/* 0F7460 001F7360 700424A4 */  sh          $4, %lo(MenuChara)($1)
/* 0F7464 001F7364 282E0070 */  paddub      $5, $0, $0
/* 0F7468 001F7368 1B000010 */  b           .L001F73D8
/* 0F746C 001F736C 00000000 */   nop
.L001F7370:
/* 0F7470 001F7370 2318A400 */  subu        $3, $5, $4
/* 0F7474 001F7374 40100500 */  sll         $2, $5, 1
/* 0F7478 001F7378 21104500 */  addu        $2, $2, $5
/* 0F747C 001F737C 80380200 */  sll         $7, $2, 2
/* 0F7480 001F7380 2900023C */  lui         $2, %hi(SysChara + 0x1)
/* 0F7484 001F7384 512B4224 */  addiu       $2, $2, %lo(SysChara + 0x1)
/* 0F7488 001F7388 21404700 */  addu        $8, $2, $7
/* 0F748C 001F738C 000003A1 */  sb          $3, 0x0($8)
/* 0F7490 001F7390 2900023C */  lui         $2, %hi(SysChara)
/* 0F7494 001F7394 502B4224 */  addiu       $2, $2, %lo(SysChara)
/* 0F7498 001F7398 21104700 */  addu        $2, $2, $7
/* 0F749C 001F739C 000045A0 */  sb          $5, 0x0($2)
/* 0F74A0 001F73A0 2900023C */  lui         $2, %hi(SysChara + 0x4)
/* 0F74A4 001F73A4 542B4224 */  addiu       $2, $2, %lo(SysChara + 0x4)
/* 0F74A8 001F73A8 21104700 */  addu        $2, $2, $7
/* 0F74AC 001F73AC 000040AC */  sw          $0, 0x0($2)
/* 0F74B0 001F73B0 2900023C */  lui         $2, %hi(SysChara + 0x8)
/* 0F74B4 001F73B4 582B4224 */  addiu       $2, $2, %lo(SysChara + 0x8)
/* 0F74B8 001F73B8 21104700 */  addu        $2, $2, $7
/* 0F74BC 001F73BC 000040AC */  sw          $0, 0x0($2)
/* 0F74C0 001F73C0 00000281 */  lb          $2, 0x0($8)
/* 0F74C4 001F73C4 03004104 */  bgez        $2, .L001F73D4
/* 0F74C8 001F73C8 00000000 */   nop
/* 0F74CC 001F73CC 21102201 */  addu        $2, $9, $2
/* 0F74D0 001F73D0 000002A1 */  sb          $2, 0x0($8)
.L001F73D4:
/* 0F74D4 001F73D4 0100A524 */  addiu       $5, $5, 0x1
.L001F73D8:
/* 0F74D8 001F73D8 D901013C */  lui         $1, %hi(MenuChara + 0x2)
/* 0F74DC 001F73DC 72042980 */  lb          $9, %lo(MenuChara + 0x2)($1)
/* 0F74E0 001F73E0 2A10A900 */  slt         $2, $5, $9
/* 0F74E4 001F73E4 E2FF4014 */  bnez        $2, .L001F7370
/* 0F74E8 001F73E8 00000000 */   nop
/* 0F74EC 001F73EC 1E008524 */  addiu       $5, $4, 0x1E
/* 0F74F0 001F73F0 0500C280 */  lb          $2, 0x5($6)
/* 0F74F4 001F73F4 FFFF4224 */  addiu       $2, $2, -0x1
/* 0F74F8 001F73F8 2A084400 */  slt         $1, $2, $4
/* 0F74FC 001F73FC 02002010 */  beqz        $1, .L001F7408
/* 0F7500 001F7400 00000000 */   nop
/* 0F7504 001F7404 27000524 */  addiu       $5, $0, 0x27
.L001F7408:
/* 0F7508 001F7408 FFFF0224 */  addiu       $2, $0, -0x1
/* 0F750C 001F740C DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x16BC)
/* 0F7510 001F7410 0C3A22AC */  sw          $2, %lo(CommonMenuMes2 + 0x16BC)($1)
/* 0F7514 001F7414 DA01023C */  lui         $2, %hi(CommonMenuMes2)
/* 0F7518 001F7418 50234424 */  addiu       $4, $2, %lo(CommonMenuMes2)
/* 0F751C 001F741C 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0F7520 001F7420 00000000 */   nop
/* 0F7524 001F7424 1000BF7B */  lq          $31, 0x10($29)
/* 0F7528 001F7428 0000B07B */  lq          $16, 0x0($29)
/* 0F752C 001F742C 2000BD27 */  addiu       $29, $29, 0x20
/* 0F7530 001F7430 0800E003 */  jr          $31
/* 0F7534 001F7434 00000000 */   nop
/* 0F7538 001F7438 00000000 */  nop
/* 0F753C 001F743C 00000000 */  nop
