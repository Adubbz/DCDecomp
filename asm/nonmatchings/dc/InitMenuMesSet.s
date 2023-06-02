.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitMenuMesSet__FiPs
/* 12C240 0022C140 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 12C244 0022C144 2000BF7F */  sq         $31, 0x20($sp)
/* 12C248 0022C148 1000B17F */  sq         $17, 0x10($sp)
/* 12C24C 0022C14C 0000B07F */  sq         $16, 0x0($sp)
/* 12C250 0022C150 288E8070 */  paddub     $17, $4, $0
/* 12C254 0022C154 2886A070 */  paddub     $16, $5, $0
/* 12C258 0022C158 D001023C */  lui        $2, %hi(MesWinTexBuff_01)
/* 12C25C 0022C15C 408B4224 */  addiu      $2, $2, %lo(MesWinTexBuff_01)
/* 12C260 0022C160 DA01013C */  lui        $at, (0x1DA2340 >> 16)
/* 12C264 0022C164 402322AC */  sw         $2, (0x1DA2340 & 0xFFFF)($at)
/* 12C268 0022C168 D001023C */  lui        $2, %hi(MesWinTexBuff_02)
/* 12C26C 0022C16C 408C4224 */  addiu      $2, $2, %lo(MesWinTexBuff_02)
/* 12C270 0022C170 DA01013C */  lui        $at, (0x1DA3B00 >> 16)
/* 12C274 0022C174 003B22AC */  sw         $2, (0x1DA3B00 & 0xFFFF)($at)
/* 12C278 0022C178 D001023C */  lui        $2, %hi(MesWinTexBuff_11)
/* 12C27C 0022C17C 408D4224 */  addiu      $2, $2, %lo(MesWinTexBuff_11)
/* 12C280 0022C180 DA01013C */  lui        $at, (0x1DA52C0 >> 16)
/* 12C284 0022C184 C05222AC */  sw         $2, (0x1DA52C0 & 0xFFFF)($at)
/* 12C288 0022C188 D001023C */  lui        $2, %hi(MesWinTexBuff_12)
/* 12C28C 0022C18C 408E4224 */  addiu      $2, $2, %lo(MesWinTexBuff_12)
/* 12C290 0022C190 DA01013C */  lui        $at, (0x1DA6A80 >> 16)
/* 12C294 0022C194 806A22AC */  sw         $2, (0x1DA6A80 & 0xFFFF)($at)
/* 12C298 0022C198 46000224 */  addiu      $2, $0, 0x46
/* 12C29C 0022C19C DA01013C */  lui        $at, (0x1DA0BA8 >> 16)
/* 12C2A0 0022C1A0 A80B22AC */  sw         $2, (0x1DA0BA8 & 0xFFFF)($at)
/* 12C2A4 0022C1A4 0A000224 */  addiu      $2, $0, 0xA
/* 12C2A8 0022C1A8 DA01013C */  lui        $at, (0x1DA0BAC >> 16)
/* 12C2AC 0022C1AC AC0B22AC */  sw         $2, (0x1DA0BAC & 0xFFFF)($at)
/* 12C2B0 0022C1B0 DA01013C */  lui        $at, (0x1DA0BB0 >> 16)
/* 12C2B4 0022C1B4 B00B20AC */  sw         $0, (0x1DA0BB0 & 0xFFFF)($at)
/* 12C2B8 0022C1B8 DA01013C */  lui        $at, (0x1DA0BB4 >> 16)
/* 12C2BC 0022C1BC B40B20AC */  sw         $0, (0x1DA0BB4 & 0xFFFF)($at)
/* 12C2C0 0022C1C0 DA01013C */  lui        $at, (0x1DA0BB8 >> 16)
/* 12C2C4 0022C1C4 B80B20AC */  sw         $0, (0x1DA0BB8 & 0xFFFF)($at)
/* 12C2C8 0022C1C8 DA01013C */  lui        $at, (0x1DA0C20 >> 16)
/* 12C2CC 0022C1CC 200C20AC */  sw         $0, (0x1DA0C20 & 0xFFFF)($at)
/* 12C2D0 0022C1D0 01000224 */  addiu      $2, $0, 0x1
/* 12C2D4 0022C1D4 DA01013C */  lui        $at, (0x1DA0C24 >> 16)
/* 12C2D8 0022C1D8 240C22AC */  sw         $2, (0x1DA0C24 & 0xFFFF)($at)
/* 12C2DC 0022C1DC DA01013C */  lui        $at, (0x1DA0C38 >> 16)
/* 12C2E0 0022C1E0 380C20C4 */  lwc1       $f0, (0x1DA0C38 & 0xFFFF)($at)
/* 12C2E4 0022C1E4 DA01013C */  lui        $at, (0x1DA0C34 >> 16)
/* 12C2E8 0022C1E8 340C20E4 */  swc1       $f0, (0x1DA0C34 & 0xFFFF)($at)
/* 12C2EC 0022C1EC DA01013C */  lui        $at, (0x1DA0C3C >> 16)
/* 12C2F0 0022C1F0 3C0C20AC */  sw         $0, (0x1DA0C3C & 0xFFFF)($at)
/* 12C2F4 0022C1F4 DA01013C */  lui        $at, (0x1DA0C44 >> 16)
/* 12C2F8 0022C1F8 440C20AC */  sw         $0, (0x1DA0C44 & 0xFFFF)($at)
/* 12C2FC 0022C1FC DA01013C */  lui        $at, (0x1DA0C48 >> 16)
/* 12C300 0022C200 480C20AC */  sw         $0, (0x1DA0C48 & 0xFFFF)($at)
/* 12C304 0022C204 DA01013C */  lui        $at, (0x1DA0C4C >> 16)
/* 12C308 0022C208 4C0C20AC */  sw         $0, (0x1DA0C4C & 0xFFFF)($at)
/* 12C30C 0022C20C DA01013C */  lui        $at, (0x1DA0C50 >> 16)
/* 12C310 0022C210 500C20AC */  sw         $0, (0x1DA0C50 & 0xFFFF)($at)
/* 12C314 0022C214 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* 12C318 0022C218 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* 12C31C 0022C21C 643D050C */  jal        InitMesWinTbl__6ClsMesFv
/* 12C320 0022C220 00000000 */   nop
/* 12C324 0022C224 DA01013C */  lui        $at, (0x1DA2238 >> 16)
/* 12C328 0022C228 3822228C */  lw         $2, (0x1DA2238 & 0xFFFF)($at)
/* 12C32C 0022C22C DA01013C */  lui        $at, (0x1DA223C >> 16)
/* 12C330 0022C230 3C2222AC */  sw         $2, (0x1DA223C & 0xFFFF)($at)
/* 12C334 0022C234 DA01013C */  lui        $at, (0x1DA2240 >> 16)
/* 12C338 0022C238 402220AC */  sw         $0, (0x1DA2240 & 0xFFFF)($at)
/* 12C33C 0022C23C DA01013C */  lui        $at, (0x1DA2244 >> 16)
/* 12C340 0022C240 442220AC */  sw         $0, (0x1DA2244 & 0xFFFF)($at)
/* 12C344 0022C244 DA01013C */  lui        $at, (0x1DA2248 >> 16)
/* 12C348 0022C248 482220AC */  sw         $0, (0x1DA2248 & 0xFFFF)($at)
/* 12C34C 0022C24C FFFF0224 */  addiu      $2, $0, -0x1
/* 12C350 0022C250 DA01013C */  lui        $at, (0x1DA224C >> 16)
/* 12C354 0022C254 4C2222AC */  sw         $2, (0x1DA224C & 0xFFFF)($at)
/* 12C358 0022C258 80000224 */  addiu      $2, $0, 0x80
/* 12C35C 0022C25C DA01013C */  lui        $at, (0x1DA2264 >> 16)
/* 12C360 0022C260 642222AC */  sw         $2, (0x1DA2264 & 0xFFFF)($at)
/* 12C364 0022C264 282E0070 */  paddub     $5, $0, $0
/* 12C368 0022C268 08000010 */  b          .L0022C28C
/* 12C36C 0022C26C 00000000 */   nop
.L0022C270:
/* 12C370 0022C270 FFFF0424 */  addiu      $4, $0, -0x1
/* 12C374 0022C274 80180500 */  sll        $3, $5, 2
/* 12C378 0022C278 DA01023C */  lui        $2, %hi(D_1DA2270)
/* 12C37C 0022C27C 70224224 */  addiu      $2, $2, %lo(D_1DA2270)
/* 12C380 0022C280 21104300 */  addu       $2, $2, $3
/* 12C384 0022C284 000044AC */  sw         $4, 0x0($2)
/* 12C388 0022C288 0100A524 */  addiu      $5, $5, 0x1
.L0022C28C:
/* 12C38C 0022C28C 0A00A228 */  slti       $2, $5, 0xA
/* 12C390 0022C290 F7FF4014 */  bnez       $2, .L0022C270
/* 12C394 0022C294 00000000 */   nop
/* 12C398 0022C298 28260070 */  paddub     $4, $0, $0
/* 12C39C 0022C29C 07000010 */  b          .L0022C2BC
/* 12C3A0 0022C2A0 00000000 */   nop
.L0022C2A4:
/* 12C3A4 0022C2A4 80180400 */  sll        $3, $4, 2
/* 12C3A8 0022C2A8 DA01023C */  lui        $2, %hi(D_1DA2298)
/* 12C3AC 0022C2AC 98224224 */  addiu      $2, $2, %lo(D_1DA2298)
/* 12C3B0 0022C2B0 21104300 */  addu       $2, $2, $3
/* 12C3B4 0022C2B4 000040AC */  sw         $0, 0x0($2)
/* 12C3B8 0022C2B8 01008424 */  addiu      $4, $4, 0x1
.L0022C2BC:
/* 12C3BC 0022C2BC 08008228 */  slti       $2, $4, 0x8
/* 12C3C0 0022C2C0 F8FF4014 */  bnez       $2, .L0022C2A4
/* 12C3C4 0022C2C4 00000000 */   nop
/* 12C3C8 0022C2C8 DA01013C */  lui        $at, (0x1DA22B8 >> 16)
/* 12C3CC 0022C2CC B82220AC */  sw         $0, (0x1DA22B8 & 0xFFFF)($at)
/* 12C3D0 0022C2D0 DA01013C */  lui        $at, (0x1DA22BC >> 16)
/* 12C3D4 0022C2D4 BC2220AC */  sw         $0, (0x1DA22BC & 0xFFFF)($at)
/* 12C3D8 0022C2D8 01000224 */  addiu      $2, $0, 0x1
/* 12C3DC 0022C2DC DA01013C */  lui        $at, (0x1DA22C0 >> 16)
/* 12C3E0 0022C2E0 C02222AC */  sw         $2, (0x1DA22C0 & 0xFFFF)($at)
/* 12C3E4 0022C2E4 DA01013C */  lui        $at, (0x1DA22C4 >> 16)
/* 12C3E8 0022C2E8 C42220AC */  sw         $0, (0x1DA22C4 & 0xFFFF)($at)
/* 12C3EC 0022C2EC FFFF0224 */  addiu      $2, $0, -0x1
/* 12C3F0 0022C2F0 DA01013C */  lui        $at, (0x1DA22C8 >> 16)
/* 12C3F4 0022C2F4 C82222AC */  sw         $2, (0x1DA22C8 & 0xFFFF)($at)
/* 12C3F8 0022C2F8 DA01013C */  lui        $at, (0x1DA22CC >> 16)
/* 12C3FC 0022C2FC CC2222AC */  sw         $2, (0x1DA22CC & 0xFFFF)($at)
/* 12C400 0022C300 DA01013C */  lui        $at, (0x1DA22D0 >> 16)
/* 12C404 0022C304 D02222AC */  sw         $2, (0x1DA22D0 & 0xFFFF)($at)
/* 12C408 0022C308 DA01013C */  lui        $at, (0x1DA22D4 >> 16)
/* 12C40C 0022C30C D42220AC */  sw         $0, (0x1DA22D4 & 0xFFFF)($at)
/* 12C410 0022C310 DA01013C */  lui        $at, (0x1DA22D8 >> 16)
/* 12C414 0022C314 D82220AC */  sw         $0, (0x1DA22D8 & 0xFFFF)($at)
/* 12C418 0022C318 28260070 */  paddub     $4, $0, $0
/* 12C41C 0022C31C 0C000010 */  b          .L0022C350
/* 12C420 0022C320 00000000 */   nop
.L0022C324:
/* 12C424 0022C324 FFFF0324 */  addiu      $3, $0, -0x1
/* 12C428 0022C328 C0280400 */  sll        $5, $4, 3
/* 12C42C 0022C32C DA01023C */  lui        $2, %hi(D_1DA22E0)
/* 12C430 0022C330 E0224224 */  addiu      $2, $2, %lo(D_1DA22E0)
/* 12C434 0022C334 21104500 */  addu       $2, $2, $5
/* 12C438 0022C338 000043AC */  sw         $3, 0x0($2)
/* 12C43C 0022C33C DA01023C */  lui        $2, %hi(D_1DA22E4)
/* 12C440 0022C340 E4224224 */  addiu      $2, $2, %lo(D_1DA22E4)
/* 12C444 0022C344 21104500 */  addu       $2, $2, $5
/* 12C448 0022C348 000043AC */  sw         $3, 0x0($2)
/* 12C44C 0022C34C 01008424 */  addiu      $4, $4, 0x1
.L0022C350:
/* 12C450 0022C350 0A008228 */  slti       $2, $4, 0xA
/* 12C454 0022C354 F3FF4014 */  bnez       $2, .L0022C324
/* 12C458 0022C358 00000000 */   nop
/* 12C45C 0022C35C 46000224 */  addiu      $2, $0, 0x46
/* 12C460 0022C360 DA01013C */  lui        $at, (0x1DA2368 >> 16)
/* 12C464 0022C364 682322AC */  sw         $2, (0x1DA2368 & 0xFFFF)($at)
/* 12C468 0022C368 0A000224 */  addiu      $2, $0, 0xA
/* 12C46C 0022C36C DA01013C */  lui        $at, (0x1DA236C >> 16)
/* 12C470 0022C370 6C2322AC */  sw         $2, (0x1DA236C & 0xFFFF)($at)
/* 12C474 0022C374 DA01013C */  lui        $at, (0x1DA2370 >> 16)
/* 12C478 0022C378 702320AC */  sw         $0, (0x1DA2370 & 0xFFFF)($at)
/* 12C47C 0022C37C DA01013C */  lui        $at, (0x1DA2374 >> 16)
/* 12C480 0022C380 742320AC */  sw         $0, (0x1DA2374 & 0xFFFF)($at)
/* 12C484 0022C384 DA01013C */  lui        $at, (0x1DA2378 >> 16)
/* 12C488 0022C388 782320AC */  sw         $0, (0x1DA2378 & 0xFFFF)($at)
/* 12C48C 0022C38C DA01013C */  lui        $at, (0x1DA23E0 >> 16)
/* 12C490 0022C390 E02320AC */  sw         $0, (0x1DA23E0 & 0xFFFF)($at)
/* 12C494 0022C394 01000224 */  addiu      $2, $0, 0x1
/* 12C498 0022C398 DA01013C */  lui        $at, (0x1DA23E4 >> 16)
/* 12C49C 0022C39C E42322AC */  sw         $2, (0x1DA23E4 & 0xFFFF)($at)
/* 12C4A0 0022C3A0 DA01013C */  lui        $at, (0x1DA23F8 >> 16)
/* 12C4A4 0022C3A4 F82320C4 */  lwc1       $f0, (0x1DA23F8 & 0xFFFF)($at)
/* 12C4A8 0022C3A8 DA01013C */  lui        $at, (0x1DA23F4 >> 16)
/* 12C4AC 0022C3AC F42320E4 */  swc1       $f0, (0x1DA23F4 & 0xFFFF)($at)
/* 12C4B0 0022C3B0 DA01013C */  lui        $at, (0x1DA23FC >> 16)
/* 12C4B4 0022C3B4 FC2320AC */  sw         $0, (0x1DA23FC & 0xFFFF)($at)
/* 12C4B8 0022C3B8 DA01013C */  lui        $at, (0x1DA2404 >> 16)
/* 12C4BC 0022C3BC 042420AC */  sw         $0, (0x1DA2404 & 0xFFFF)($at)
/* 12C4C0 0022C3C0 DA01013C */  lui        $at, (0x1DA2408 >> 16)
/* 12C4C4 0022C3C4 082420AC */  sw         $0, (0x1DA2408 & 0xFFFF)($at)
/* 12C4C8 0022C3C8 DA01013C */  lui        $at, (0x1DA240C >> 16)
/* 12C4CC 0022C3CC 0C2420AC */  sw         $0, (0x1DA240C & 0xFFFF)($at)
/* 12C4D0 0022C3D0 DA01013C */  lui        $at, (0x1DA2410 >> 16)
/* 12C4D4 0022C3D4 102420AC */  sw         $0, (0x1DA2410 & 0xFFFF)($at)
/* 12C4D8 0022C3D8 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 12C4DC 0022C3DC 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 12C4E0 0022C3E0 643D050C */  jal        InitMesWinTbl__6ClsMesFv
/* 12C4E4 0022C3E4 00000000 */   nop
/* 12C4E8 0022C3E8 DA01013C */  lui        $at, (0x1DA39F8 >> 16)
/* 12C4EC 0022C3EC F839228C */  lw         $2, (0x1DA39F8 & 0xFFFF)($at)
/* 12C4F0 0022C3F0 DA01013C */  lui        $at, (0x1DA39FC >> 16)
/* 12C4F4 0022C3F4 FC3922AC */  sw         $2, (0x1DA39FC & 0xFFFF)($at)
/* 12C4F8 0022C3F8 DA01013C */  lui        $at, (0x1DA3A00 >> 16)
/* 12C4FC 0022C3FC 003A20AC */  sw         $0, (0x1DA3A00 & 0xFFFF)($at)
/* 12C500 0022C400 DA01013C */  lui        $at, (0x1DA3A04 >> 16)
/* 12C504 0022C404 043A20AC */  sw         $0, (0x1DA3A04 & 0xFFFF)($at)
/* 12C508 0022C408 DA01013C */  lui        $at, (0x1DA3A08 >> 16)
/* 12C50C 0022C40C 083A20AC */  sw         $0, (0x1DA3A08 & 0xFFFF)($at)
/* 12C510 0022C410 FFFF0224 */  addiu      $2, $0, -0x1
/* 12C514 0022C414 DA01013C */  lui        $at, (0x1DA3A0C >> 16)
/* 12C518 0022C418 0C3A22AC */  sw         $2, (0x1DA3A0C & 0xFFFF)($at)
/* 12C51C 0022C41C 80000224 */  addiu      $2, $0, 0x80
/* 12C520 0022C420 DA01013C */  lui        $at, (0x1DA3A24 >> 16)
/* 12C524 0022C424 243A22AC */  sw         $2, (0x1DA3A24 & 0xFFFF)($at)
/* 12C528 0022C428 282E0070 */  paddub     $5, $0, $0
/* 12C52C 0022C42C 08000010 */  b          .L0022C450
/* 12C530 0022C430 00000000 */   nop
.L0022C434:
/* 12C534 0022C434 FFFF0424 */  addiu      $4, $0, -0x1
/* 12C538 0022C438 80180500 */  sll        $3, $5, 2
/* 12C53C 0022C43C DA01023C */  lui        $2, %hi(D_1DA3A30)
/* 12C540 0022C440 303A4224 */  addiu      $2, $2, %lo(D_1DA3A30)
/* 12C544 0022C444 21104300 */  addu       $2, $2, $3
/* 12C548 0022C448 000044AC */  sw         $4, 0x0($2)
/* 12C54C 0022C44C 0100A524 */  addiu      $5, $5, 0x1
.L0022C450:
/* 12C550 0022C450 0A00A228 */  slti       $2, $5, 0xA
/* 12C554 0022C454 F7FF4014 */  bnez       $2, .L0022C434
/* 12C558 0022C458 00000000 */   nop
/* 12C55C 0022C45C 28260070 */  paddub     $4, $0, $0
/* 12C560 0022C460 07000010 */  b          .L0022C480
/* 12C564 0022C464 00000000 */   nop
.L0022C468:
/* 12C568 0022C468 80180400 */  sll        $3, $4, 2
/* 12C56C 0022C46C DA01023C */  lui        $2, %hi(D_1DA3A58)
/* 12C570 0022C470 583A4224 */  addiu      $2, $2, %lo(D_1DA3A58)
/* 12C574 0022C474 21104300 */  addu       $2, $2, $3
/* 12C578 0022C478 000040AC */  sw         $0, 0x0($2)
/* 12C57C 0022C47C 01008424 */  addiu      $4, $4, 0x1
.L0022C480:
/* 12C580 0022C480 08008228 */  slti       $2, $4, 0x8
/* 12C584 0022C484 F8FF4014 */  bnez       $2, .L0022C468
/* 12C588 0022C488 00000000 */   nop
/* 12C58C 0022C48C DA01013C */  lui        $at, (0x1DA3A78 >> 16)
/* 12C590 0022C490 783A20AC */  sw         $0, (0x1DA3A78 & 0xFFFF)($at)
/* 12C594 0022C494 DA01013C */  lui        $at, (0x1DA3A7C >> 16)
/* 12C598 0022C498 7C3A20AC */  sw         $0, (0x1DA3A7C & 0xFFFF)($at)
/* 12C59C 0022C49C 01000224 */  addiu      $2, $0, 0x1
/* 12C5A0 0022C4A0 DA01013C */  lui        $at, (0x1DA3A80 >> 16)
/* 12C5A4 0022C4A4 803A22AC */  sw         $2, (0x1DA3A80 & 0xFFFF)($at)
/* 12C5A8 0022C4A8 DA01013C */  lui        $at, (0x1DA3A84 >> 16)
/* 12C5AC 0022C4AC 843A20AC */  sw         $0, (0x1DA3A84 & 0xFFFF)($at)
/* 12C5B0 0022C4B0 FFFF0224 */  addiu      $2, $0, -0x1
/* 12C5B4 0022C4B4 DA01013C */  lui        $at, (0x1DA3A88 >> 16)
/* 12C5B8 0022C4B8 883A22AC */  sw         $2, (0x1DA3A88 & 0xFFFF)($at)
/* 12C5BC 0022C4BC DA01013C */  lui        $at, (0x1DA3A8C >> 16)
/* 12C5C0 0022C4C0 8C3A22AC */  sw         $2, (0x1DA3A8C & 0xFFFF)($at)
/* 12C5C4 0022C4C4 DA01013C */  lui        $at, (0x1DA3A90 >> 16)
/* 12C5C8 0022C4C8 903A22AC */  sw         $2, (0x1DA3A90 & 0xFFFF)($at)
/* 12C5CC 0022C4CC DA01013C */  lui        $at, (0x1DA3A94 >> 16)
/* 12C5D0 0022C4D0 943A20AC */  sw         $0, (0x1DA3A94 & 0xFFFF)($at)
/* 12C5D4 0022C4D4 DA01013C */  lui        $at, (0x1DA3A98 >> 16)
/* 12C5D8 0022C4D8 983A20AC */  sw         $0, (0x1DA3A98 & 0xFFFF)($at)
/* 12C5DC 0022C4DC 28260070 */  paddub     $4, $0, $0
/* 12C5E0 0022C4E0 0C000010 */  b          .L0022C514
/* 12C5E4 0022C4E4 00000000 */   nop
.L0022C4E8:
/* 12C5E8 0022C4E8 FFFF0324 */  addiu      $3, $0, -0x1
/* 12C5EC 0022C4EC C0280400 */  sll        $5, $4, 3
/* 12C5F0 0022C4F0 DA01023C */  lui        $2, %hi(D_1DA3AA0)
/* 12C5F4 0022C4F4 A03A4224 */  addiu      $2, $2, %lo(D_1DA3AA0)
/* 12C5F8 0022C4F8 21104500 */  addu       $2, $2, $5
/* 12C5FC 0022C4FC 000043AC */  sw         $3, 0x0($2)
/* 12C600 0022C500 DA01023C */  lui        $2, %hi(D_1DA3AA4)
/* 12C604 0022C504 A43A4224 */  addiu      $2, $2, %lo(D_1DA3AA4)
/* 12C608 0022C508 21104500 */  addu       $2, $2, $5
/* 12C60C 0022C50C 000043AC */  sw         $3, 0x0($2)
/* 12C610 0022C510 01008424 */  addiu      $4, $4, 0x1
.L0022C514:
/* 12C614 0022C514 0A008228 */  slti       $2, $4, 0xA
/* 12C618 0022C518 F3FF4014 */  bnez       $2, .L0022C4E8
/* 12C61C 0022C51C 00000000 */   nop
/* 12C620 0022C520 46000224 */  addiu      $2, $0, 0x46
/* 12C624 0022C524 DA01013C */  lui        $at, (0x1DA3B28 >> 16)
/* 12C628 0022C528 283B22AC */  sw         $2, (0x1DA3B28 & 0xFFFF)($at)
/* 12C62C 0022C52C 0A000224 */  addiu      $2, $0, 0xA
/* 12C630 0022C530 DA01013C */  lui        $at, (0x1DA3B2C >> 16)
/* 12C634 0022C534 2C3B22AC */  sw         $2, (0x1DA3B2C & 0xFFFF)($at)
/* 12C638 0022C538 DA01013C */  lui        $at, (0x1DA3B30 >> 16)
/* 12C63C 0022C53C 303B20AC */  sw         $0, (0x1DA3B30 & 0xFFFF)($at)
/* 12C640 0022C540 DA01013C */  lui        $at, (0x1DA3B34 >> 16)
/* 12C644 0022C544 343B20AC */  sw         $0, (0x1DA3B34 & 0xFFFF)($at)
/* 12C648 0022C548 DA01013C */  lui        $at, (0x1DA3B38 >> 16)
/* 12C64C 0022C54C 383B20AC */  sw         $0, (0x1DA3B38 & 0xFFFF)($at)
/* 12C650 0022C550 DA01013C */  lui        $at, (0x1DA3BA0 >> 16)
/* 12C654 0022C554 A03B20AC */  sw         $0, (0x1DA3BA0 & 0xFFFF)($at)
/* 12C658 0022C558 01000224 */  addiu      $2, $0, 0x1
/* 12C65C 0022C55C DA01013C */  lui        $at, (0x1DA3BA4 >> 16)
/* 12C660 0022C560 A43B22AC */  sw         $2, (0x1DA3BA4 & 0xFFFF)($at)
/* 12C664 0022C564 DA01013C */  lui        $at, (0x1DA3BB8 >> 16)
/* 12C668 0022C568 B83B20C4 */  lwc1       $f0, (0x1DA3BB8 & 0xFFFF)($at)
/* 12C66C 0022C56C DA01013C */  lui        $at, (0x1DA3BB4 >> 16)
/* 12C670 0022C570 B43B20E4 */  swc1       $f0, (0x1DA3BB4 & 0xFFFF)($at)
/* 12C674 0022C574 DA01013C */  lui        $at, (0x1DA3BBC >> 16)
/* 12C678 0022C578 BC3B20AC */  sw         $0, (0x1DA3BBC & 0xFFFF)($at)
/* 12C67C 0022C57C DA01013C */  lui        $at, (0x1DA3BC4 >> 16)
/* 12C680 0022C580 C43B20AC */  sw         $0, (0x1DA3BC4 & 0xFFFF)($at)
/* 12C684 0022C584 DA01013C */  lui        $at, (0x1DA3BC8 >> 16)
/* 12C688 0022C588 C83B20AC */  sw         $0, (0x1DA3BC8 & 0xFFFF)($at)
/* 12C68C 0022C58C DA01013C */  lui        $at, (0x1DA3BCC >> 16)
/* 12C690 0022C590 CC3B20AC */  sw         $0, (0x1DA3BCC & 0xFFFF)($at)
/* 12C694 0022C594 DA01013C */  lui        $at, (0x1DA3BD0 >> 16)
/* 12C698 0022C598 D03B20AC */  sw         $0, (0x1DA3BD0 & 0xFFFF)($at)
/* 12C69C 0022C59C DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* 12C6A0 0022C5A0 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* 12C6A4 0022C5A4 643D050C */  jal        InitMesWinTbl__6ClsMesFv
/* 12C6A8 0022C5A8 00000000 */   nop
/* 12C6AC 0022C5AC DA01013C */  lui        $at, (0x1DA51B8 >> 16)
/* 12C6B0 0022C5B0 B851228C */  lw         $2, (0x1DA51B8 & 0xFFFF)($at)
/* 12C6B4 0022C5B4 DA01013C */  lui        $at, (0x1DA51BC >> 16)
/* 12C6B8 0022C5B8 BC5122AC */  sw         $2, (0x1DA51BC & 0xFFFF)($at)
/* 12C6BC 0022C5BC DA01013C */  lui        $at, (0x1DA51C0 >> 16)
/* 12C6C0 0022C5C0 C05120AC */  sw         $0, (0x1DA51C0 & 0xFFFF)($at)
/* 12C6C4 0022C5C4 DA01013C */  lui        $at, (0x1DA51C4 >> 16)
/* 12C6C8 0022C5C8 C45120AC */  sw         $0, (0x1DA51C4 & 0xFFFF)($at)
/* 12C6CC 0022C5CC DA01013C */  lui        $at, (0x1DA51C8 >> 16)
/* 12C6D0 0022C5D0 C85120AC */  sw         $0, (0x1DA51C8 & 0xFFFF)($at)
/* 12C6D4 0022C5D4 FFFF0224 */  addiu      $2, $0, -0x1
/* 12C6D8 0022C5D8 DA01013C */  lui        $at, (0x1DA51CC >> 16)
/* 12C6DC 0022C5DC CC5122AC */  sw         $2, (0x1DA51CC & 0xFFFF)($at)
/* 12C6E0 0022C5E0 80000224 */  addiu      $2, $0, 0x80
/* 12C6E4 0022C5E4 DA01013C */  lui        $at, (0x1DA51E4 >> 16)
/* 12C6E8 0022C5E8 E45122AC */  sw         $2, (0x1DA51E4 & 0xFFFF)($at)
/* 12C6EC 0022C5EC 282E0070 */  paddub     $5, $0, $0
/* 12C6F0 0022C5F0 08000010 */  b          .L0022C614
/* 12C6F4 0022C5F4 00000000 */   nop
.L0022C5F8:
/* 12C6F8 0022C5F8 FFFF0424 */  addiu      $4, $0, -0x1
/* 12C6FC 0022C5FC 80180500 */  sll        $3, $5, 2
/* 12C700 0022C600 DA01023C */  lui        $2, %hi(D_1DA51F0)
/* 12C704 0022C604 F0514224 */  addiu      $2, $2, %lo(D_1DA51F0)
/* 12C708 0022C608 21104300 */  addu       $2, $2, $3
/* 12C70C 0022C60C 000044AC */  sw         $4, 0x0($2)
/* 12C710 0022C610 0100A524 */  addiu      $5, $5, 0x1
.L0022C614:
/* 12C714 0022C614 0A00A228 */  slti       $2, $5, 0xA
/* 12C718 0022C618 F7FF4014 */  bnez       $2, .L0022C5F8
/* 12C71C 0022C61C 00000000 */   nop
/* 12C720 0022C620 28260070 */  paddub     $4, $0, $0
/* 12C724 0022C624 07000010 */  b          .L0022C644
/* 12C728 0022C628 00000000 */   nop
.L0022C62C:
/* 12C72C 0022C62C 80180400 */  sll        $3, $4, 2
/* 12C730 0022C630 DA01023C */  lui        $2, %hi(D_1DA5218)
/* 12C734 0022C634 18524224 */  addiu      $2, $2, %lo(D_1DA5218)
/* 12C738 0022C638 21104300 */  addu       $2, $2, $3
/* 12C73C 0022C63C 000040AC */  sw         $0, 0x0($2)
/* 12C740 0022C640 01008424 */  addiu      $4, $4, 0x1
.L0022C644:
/* 12C744 0022C644 08008228 */  slti       $2, $4, 0x8
/* 12C748 0022C648 F8FF4014 */  bnez       $2, .L0022C62C
/* 12C74C 0022C64C 00000000 */   nop
/* 12C750 0022C650 DA01013C */  lui        $at, (0x1DA5238 >> 16)
/* 12C754 0022C654 385220AC */  sw         $0, (0x1DA5238 & 0xFFFF)($at)
/* 12C758 0022C658 DA01013C */  lui        $at, (0x1DA523C >> 16)
/* 12C75C 0022C65C 3C5220AC */  sw         $0, (0x1DA523C & 0xFFFF)($at)
/* 12C760 0022C660 01000224 */  addiu      $2, $0, 0x1
/* 12C764 0022C664 DA01013C */  lui        $at, (0x1DA5240 >> 16)
/* 12C768 0022C668 405222AC */  sw         $2, (0x1DA5240 & 0xFFFF)($at)
/* 12C76C 0022C66C DA01013C */  lui        $at, (0x1DA5244 >> 16)
/* 12C770 0022C670 445220AC */  sw         $0, (0x1DA5244 & 0xFFFF)($at)
/* 12C774 0022C674 FFFF0224 */  addiu      $2, $0, -0x1
/* 12C778 0022C678 DA01013C */  lui        $at, (0x1DA5248 >> 16)
/* 12C77C 0022C67C 485222AC */  sw         $2, (0x1DA5248 & 0xFFFF)($at)
/* 12C780 0022C680 DA01013C */  lui        $at, (0x1DA524C >> 16)
/* 12C784 0022C684 4C5222AC */  sw         $2, (0x1DA524C & 0xFFFF)($at)
/* 12C788 0022C688 DA01013C */  lui        $at, (0x1DA5250 >> 16)
/* 12C78C 0022C68C 505222AC */  sw         $2, (0x1DA5250 & 0xFFFF)($at)
/* 12C790 0022C690 DA01013C */  lui        $at, (0x1DA5254 >> 16)
/* 12C794 0022C694 545220AC */  sw         $0, (0x1DA5254 & 0xFFFF)($at)
/* 12C798 0022C698 DA01013C */  lui        $at, (0x1DA5258 >> 16)
/* 12C79C 0022C69C 585220AC */  sw         $0, (0x1DA5258 & 0xFFFF)($at)
/* 12C7A0 0022C6A0 28260070 */  paddub     $4, $0, $0
/* 12C7A4 0022C6A4 0C000010 */  b          .L0022C6D8
/* 12C7A8 0022C6A8 00000000 */   nop
.L0022C6AC:
/* 12C7AC 0022C6AC FFFF0324 */  addiu      $3, $0, -0x1
/* 12C7B0 0022C6B0 C0280400 */  sll        $5, $4, 3
/* 12C7B4 0022C6B4 DA01023C */  lui        $2, %hi(D_1DA5260)
/* 12C7B8 0022C6B8 60524224 */  addiu      $2, $2, %lo(D_1DA5260)
/* 12C7BC 0022C6BC 21104500 */  addu       $2, $2, $5
/* 12C7C0 0022C6C0 000043AC */  sw         $3, 0x0($2)
/* 12C7C4 0022C6C4 DA01023C */  lui        $2, %hi(D_1DA5264)
/* 12C7C8 0022C6C8 64524224 */  addiu      $2, $2, %lo(D_1DA5264)
/* 12C7CC 0022C6CC 21104500 */  addu       $2, $2, $5
/* 12C7D0 0022C6D0 000043AC */  sw         $3, 0x0($2)
/* 12C7D4 0022C6D4 01008424 */  addiu      $4, $4, 0x1
.L0022C6D8:
/* 12C7D8 0022C6D8 0A008228 */  slti       $2, $4, 0xA
/* 12C7DC 0022C6DC F3FF4014 */  bnez       $2, .L0022C6AC
/* 12C7E0 0022C6E0 00000000 */   nop
/* 12C7E4 0022C6E4 46000224 */  addiu      $2, $0, 0x46
/* 12C7E8 0022C6E8 DA01013C */  lui        $at, (0x1DA52E8 >> 16)
/* 12C7EC 0022C6EC E85222AC */  sw         $2, (0x1DA52E8 & 0xFFFF)($at)
/* 12C7F0 0022C6F0 0A000224 */  addiu      $2, $0, 0xA
/* 12C7F4 0022C6F4 DA01013C */  lui        $at, (0x1DA52EC >> 16)
/* 12C7F8 0022C6F8 EC5222AC */  sw         $2, (0x1DA52EC & 0xFFFF)($at)
/* 12C7FC 0022C6FC DA01013C */  lui        $at, (0x1DA52F0 >> 16)
/* 12C800 0022C700 F05220AC */  sw         $0, (0x1DA52F0 & 0xFFFF)($at)
/* 12C804 0022C704 DA01013C */  lui        $at, (0x1DA52F4 >> 16)
/* 12C808 0022C708 F45220AC */  sw         $0, (0x1DA52F4 & 0xFFFF)($at)
/* 12C80C 0022C70C DA01013C */  lui        $at, (0x1DA52F8 >> 16)
/* 12C810 0022C710 F85220AC */  sw         $0, (0x1DA52F8 & 0xFFFF)($at)
/* 12C814 0022C714 DA01013C */  lui        $at, (0x1DA5360 >> 16)
/* 12C818 0022C718 605320AC */  sw         $0, (0x1DA5360 & 0xFFFF)($at)
/* 12C81C 0022C71C 01000224 */  addiu      $2, $0, 0x1
/* 12C820 0022C720 DA01013C */  lui        $at, (0x1DA5364 >> 16)
/* 12C824 0022C724 645322AC */  sw         $2, (0x1DA5364 & 0xFFFF)($at)
/* 12C828 0022C728 DA01013C */  lui        $at, (0x1DA5378 >> 16)
/* 12C82C 0022C72C 785320C4 */  lwc1       $f0, (0x1DA5378 & 0xFFFF)($at)
/* 12C830 0022C730 DA01013C */  lui        $at, (0x1DA5374 >> 16)
/* 12C834 0022C734 745320E4 */  swc1       $f0, (0x1DA5374 & 0xFFFF)($at)
/* 12C838 0022C738 DA01013C */  lui        $at, (0x1DA537C >> 16)
/* 12C83C 0022C73C 7C5320AC */  sw         $0, (0x1DA537C & 0xFFFF)($at)
/* 12C840 0022C740 DA01013C */  lui        $at, (0x1DA5384 >> 16)
/* 12C844 0022C744 845320AC */  sw         $0, (0x1DA5384 & 0xFFFF)($at)
/* 12C848 0022C748 DA01013C */  lui        $at, (0x1DA5388 >> 16)
/* 12C84C 0022C74C 885320AC */  sw         $0, (0x1DA5388 & 0xFFFF)($at)
/* 12C850 0022C750 DA01013C */  lui        $at, (0x1DA538C >> 16)
/* 12C854 0022C754 8C5320AC */  sw         $0, (0x1DA538C & 0xFFFF)($at)
/* 12C858 0022C758 DA01013C */  lui        $at, (0x1DA5390 >> 16)
/* 12C85C 0022C75C 905320AC */  sw         $0, (0x1DA5390 & 0xFFFF)($at)
/* 12C860 0022C760 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* 12C864 0022C764 D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* 12C868 0022C768 643D050C */  jal        InitMesWinTbl__6ClsMesFv
/* 12C86C 0022C76C 00000000 */   nop
/* 12C870 0022C770 DA01013C */  lui        $at, (0x1DA6978 >> 16)
/* 12C874 0022C774 7869228C */  lw         $2, (0x1DA6978 & 0xFFFF)($at)
/* 12C878 0022C778 DA01013C */  lui        $at, (0x1DA697C >> 16)
/* 12C87C 0022C77C 7C6922AC */  sw         $2, (0x1DA697C & 0xFFFF)($at)
/* 12C880 0022C780 DA01013C */  lui        $at, (0x1DA6980 >> 16)
/* 12C884 0022C784 806920AC */  sw         $0, (0x1DA6980 & 0xFFFF)($at)
/* 12C888 0022C788 DA01013C */  lui        $at, (0x1DA6984 >> 16)
/* 12C88C 0022C78C 846920AC */  sw         $0, (0x1DA6984 & 0xFFFF)($at)
/* 12C890 0022C790 DA01013C */  lui        $at, (0x1DA6988 >> 16)
/* 12C894 0022C794 886920AC */  sw         $0, (0x1DA6988 & 0xFFFF)($at)
/* 12C898 0022C798 FFFF0224 */  addiu      $2, $0, -0x1
/* 12C89C 0022C79C DA01013C */  lui        $at, (0x1DA698C >> 16)
/* 12C8A0 0022C7A0 8C6922AC */  sw         $2, (0x1DA698C & 0xFFFF)($at)
/* 12C8A4 0022C7A4 80000224 */  addiu      $2, $0, 0x80
/* 12C8A8 0022C7A8 DA01013C */  lui        $at, (0x1DA69A4 >> 16)
/* 12C8AC 0022C7AC A46922AC */  sw         $2, (0x1DA69A4 & 0xFFFF)($at)
/* 12C8B0 0022C7B0 282E0070 */  paddub     $5, $0, $0
/* 12C8B4 0022C7B4 08000010 */  b          .L0022C7D8
/* 12C8B8 0022C7B8 00000000 */   nop
.L0022C7BC:
/* 12C8BC 0022C7BC FFFF0424 */  addiu      $4, $0, -0x1
/* 12C8C0 0022C7C0 80180500 */  sll        $3, $5, 2
/* 12C8C4 0022C7C4 DA01023C */  lui        $2, %hi(D_1DA69B0)
/* 12C8C8 0022C7C8 B0694224 */  addiu      $2, $2, %lo(D_1DA69B0)
/* 12C8CC 0022C7CC 21104300 */  addu       $2, $2, $3
/* 12C8D0 0022C7D0 000044AC */  sw         $4, 0x0($2)
/* 12C8D4 0022C7D4 0100A524 */  addiu      $5, $5, 0x1
.L0022C7D8:
/* 12C8D8 0022C7D8 0A00A228 */  slti       $2, $5, 0xA
/* 12C8DC 0022C7DC F7FF4014 */  bnez       $2, .L0022C7BC
/* 12C8E0 0022C7E0 00000000 */   nop
/* 12C8E4 0022C7E4 28260070 */  paddub     $4, $0, $0
/* 12C8E8 0022C7E8 07000010 */  b          .L0022C808
/* 12C8EC 0022C7EC 00000000 */   nop
.L0022C7F0:
/* 12C8F0 0022C7F0 80180400 */  sll        $3, $4, 2
/* 12C8F4 0022C7F4 DA01023C */  lui        $2, %hi(D_1DA69D8)
/* 12C8F8 0022C7F8 D8694224 */  addiu      $2, $2, %lo(D_1DA69D8)
/* 12C8FC 0022C7FC 21104300 */  addu       $2, $2, $3
/* 12C900 0022C800 000040AC */  sw         $0, 0x0($2)
/* 12C904 0022C804 01008424 */  addiu      $4, $4, 0x1
.L0022C808:
/* 12C908 0022C808 08008228 */  slti       $2, $4, 0x8
/* 12C90C 0022C80C F8FF4014 */  bnez       $2, .L0022C7F0
/* 12C910 0022C810 00000000 */   nop
/* 12C914 0022C814 DA01013C */  lui        $at, (0x1DA69F8 >> 16)
/* 12C918 0022C818 F86920AC */  sw         $0, (0x1DA69F8 & 0xFFFF)($at)
/* 12C91C 0022C81C DA01013C */  lui        $at, (0x1DA69FC >> 16)
/* 12C920 0022C820 FC6920AC */  sw         $0, (0x1DA69FC & 0xFFFF)($at)
/* 12C924 0022C824 01000224 */  addiu      $2, $0, 0x1
/* 12C928 0022C828 DA01013C */  lui        $at, (0x1DA6A00 >> 16)
/* 12C92C 0022C82C 006A22AC */  sw         $2, (0x1DA6A00 & 0xFFFF)($at)
/* 12C930 0022C830 DA01013C */  lui        $at, (0x1DA6A04 >> 16)
/* 12C934 0022C834 046A20AC */  sw         $0, (0x1DA6A04 & 0xFFFF)($at)
/* 12C938 0022C838 FFFF0224 */  addiu      $2, $0, -0x1
/* 12C93C 0022C83C DA01013C */  lui        $at, (0x1DA6A08 >> 16)
/* 12C940 0022C840 086A22AC */  sw         $2, (0x1DA6A08 & 0xFFFF)($at)
/* 12C944 0022C844 DA01013C */  lui        $at, (0x1DA6A0C >> 16)
/* 12C948 0022C848 0C6A22AC */  sw         $2, (0x1DA6A0C & 0xFFFF)($at)
/* 12C94C 0022C84C DA01013C */  lui        $at, (0x1DA6A10 >> 16)
/* 12C950 0022C850 106A22AC */  sw         $2, (0x1DA6A10 & 0xFFFF)($at)
/* 12C954 0022C854 DA01013C */  lui        $at, (0x1DA6A14 >> 16)
/* 12C958 0022C858 146A20AC */  sw         $0, (0x1DA6A14 & 0xFFFF)($at)
/* 12C95C 0022C85C DA01013C */  lui        $at, (0x1DA6A18 >> 16)
/* 12C960 0022C860 186A20AC */  sw         $0, (0x1DA6A18 & 0xFFFF)($at)
/* 12C964 0022C864 28260070 */  paddub     $4, $0, $0
/* 12C968 0022C868 0C000010 */  b          .L0022C89C
/* 12C96C 0022C86C 00000000 */   nop
.L0022C870:
/* 12C970 0022C870 FFFF0324 */  addiu      $3, $0, -0x1
/* 12C974 0022C874 C0280400 */  sll        $5, $4, 3
/* 12C978 0022C878 DA01023C */  lui        $2, %hi(D_1DA6A20)
/* 12C97C 0022C87C 206A4224 */  addiu      $2, $2, %lo(D_1DA6A20)
/* 12C980 0022C880 21104500 */  addu       $2, $2, $5
/* 12C984 0022C884 000043AC */  sw         $3, 0x0($2)
/* 12C988 0022C888 DA01023C */  lui        $2, %hi(D_1DA6A24)
/* 12C98C 0022C88C 246A4224 */  addiu      $2, $2, %lo(D_1DA6A24)
/* 12C990 0022C890 21104500 */  addu       $2, $2, $5
/* 12C994 0022C894 000043AC */  sw         $3, 0x0($2)
/* 12C998 0022C898 01008424 */  addiu      $4, $4, 0x1
.L0022C89C:
/* 12C99C 0022C89C 0A008228 */  slti       $2, $4, 0xA
/* 12C9A0 0022C8A0 F3FF4014 */  bnez       $2, .L0022C870
/* 12C9A4 0022C8A4 00000000 */   nop
/* 12C9A8 0022C8A8 1A000224 */  addiu      $2, $0, 0x1A
/* 12C9AC 0022C8AC DA01013C */  lui        $at, (0x1DA22DC >> 16)
/* 12C9B0 0022C8B0 DC2222AC */  sw         $2, (0x1DA22DC & 0xFFFF)($at)
/* 12C9B4 0022C8B4 DA01013C */  lui        $at, (0x1DA3A9C >> 16)
/* 12C9B8 0022C8B8 9C3A22AC */  sw         $2, (0x1DA3A9C & 0xFFFF)($at)
/* 12C9BC 0022C8BC DA01013C */  lui        $at, (0x1DA525C >> 16)
/* 12C9C0 0022C8C0 5C5222AC */  sw         $2, (0x1DA525C & 0xFFFF)($at)
/* 12C9C4 0022C8C4 DA01013C */  lui        $at, (0x1DA6A1C >> 16)
/* 12C9C8 0022C8C8 1C6A22AC */  sw         $2, (0x1DA6A1C & 0xFFFF)($at)
/* 12C9CC 0022C8CC DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* 12C9D0 0022C8D0 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* 12C9D4 0022C8D4 282E0072 */  paddub     $5, $16, $0
/* 12C9D8 0022C8D8 8036050C */  jal        SetBuff__6ClsMesFPs
/* 12C9DC 0022C8DC 00000000 */   nop
/* 12C9E0 0022C8E0 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 12C9E4 0022C8E4 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 12C9E8 0022C8E8 282E0072 */  paddub     $5, $16, $0
/* 12C9EC 0022C8EC 8036050C */  jal        SetBuff__6ClsMesFPs
/* 12C9F0 0022C8F0 00000000 */   nop
/* 12C9F4 0022C8F4 DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* 12C9F8 0022C8F8 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* 12C9FC 0022C8FC 282E0072 */  paddub     $5, $16, $0
/* 12CA00 0022C900 8036050C */  jal        SetBuff__6ClsMesFPs
/* 12CA04 0022C904 00000000 */   nop
/* 12CA08 0022C908 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* 12CA0C 0022C90C D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* 12CA10 0022C910 282E0072 */  paddub     $5, $16, $0
/* 12CA14 0022C914 8036050C */  jal        SetBuff__6ClsMesFPs
/* 12CA18 0022C918 00000000 */   nop
/* 12CA1C 0022C91C DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* 12CA20 0022C920 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* 12CA24 0022C924 388D858F */  lw         $5, -0x72C8($gp)
/* 12CA28 0022C928 8C36050C */  jal        SetBuff_system__6ClsMesFPs
/* 12CA2C 0022C92C 00000000 */   nop
/* 12CA30 0022C930 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 12CA34 0022C934 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 12CA38 0022C938 388D858F */  lw         $5, -0x72C8($gp)
/* 12CA3C 0022C93C 8C36050C */  jal        SetBuff_system__6ClsMesFPs
/* 12CA40 0022C940 00000000 */   nop
/* 12CA44 0022C944 DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* 12CA48 0022C948 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* 12CA4C 0022C94C 388D858F */  lw         $5, -0x72C8($gp)
/* 12CA50 0022C950 8C36050C */  jal        SetBuff_system__6ClsMesFPs
/* 12CA54 0022C954 00000000 */   nop
/* 12CA58 0022C958 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* 12CA5C 0022C95C D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* 12CA60 0022C960 388D858F */  lw         $5, -0x72C8($gp)
/* 12CA64 0022C964 8C36050C */  jal        SetBuff_system__6ClsMesFPs
/* 12CA68 0022C968 00000000 */   nop
/* 12CA6C 0022C96C FFFF0224 */  addiu      $2, $0, -0x1
/* 12CA70 0022C970 DA01013C */  lui        $at, (0x1DA224C >> 16)
/* 12CA74 0022C974 4C2222AC */  sw         $2, (0x1DA224C & 0xFFFF)($at)
/* 12CA78 0022C978 DA01013C */  lui        $at, (0x1DA3A0C >> 16)
/* 12CA7C 0022C97C 0C3A22AC */  sw         $2, (0x1DA3A0C & 0xFFFF)($at)
/* 12CA80 0022C980 DA01013C */  lui        $at, (0x1DA51CC >> 16)
/* 12CA84 0022C984 CC5122AC */  sw         $2, (0x1DA51CC & 0xFFFF)($at)
/* 12CA88 0022C988 DA01013C */  lui        $at, (0x1DA698C >> 16)
/* 12CA8C 0022C98C 8C6922AC */  sw         $2, (0x1DA698C & 0xFFFF)($at)
/* 12CA90 0022C990 80AE080C */  jal        GetMenuLangFlag__Fv
/* 12CA94 0022C994 00000000 */   nop
/* 12CA98 0022C998 01000324 */  addiu      $3, $0, 0x1
/* 12CA9C 0022C99C 29004310 */  beq        $2, $3, .L0022CA44
/* 12CAA0 0022C9A0 00000000 */   nop
/* 12CAA4 0022C9A4 03004010 */  beqz       $2, .L0022C9B4
/* 12CAA8 0022C9A8 00000000 */   nop
/* 12CAAC 0022C9AC 25000010 */  b          .L0022CA44
/* 12CAB0 0022C9B0 00000000 */   nop
.L0022C9B4:
/* 12CAB4 0022C9B4 0F000624 */  addiu      $6, $0, 0xF
/* 12CAB8 0022C9B8 DA01013C */  lui        $at, (0x1DA0BA0 >> 16)
/* 12CABC 0022C9BC A00B26AC */  sw         $6, (0x1DA0BA0 & 0xFFFF)($at)
/* 12CAC0 0022C9C0 03000324 */  addiu      $3, $0, 0x3
/* 12CAC4 0022C9C4 DA01013C */  lui        $at, (0x1DA0BA4 >> 16)
/* 12CAC8 0022C9C8 A40B23AC */  sw         $3, (0x1DA0BA4 & 0xFFFF)($at)
/* 12CACC 0022C9CC 10000524 */  addiu      $5, $0, 0x10
/* 12CAD0 0022C9D0 DA01013C */  lui        $at, (0x1DA0B98 >> 16)
/* 12CAD4 0022C9D4 980B25AC */  sw         $5, (0x1DA0B98 & 0xFFFF)($at)
/* 12CAD8 0022C9D8 16000424 */  addiu      $4, $0, 0x16
/* 12CADC 0022C9DC DA01013C */  lui        $at, (0x1DA0B9C >> 16)
/* 12CAE0 0022C9E0 9C0B24AC */  sw         $4, (0x1DA0B9C & 0xFFFF)($at)
/* 12CAE4 0022C9E4 DA01013C */  lui        $at, (0x1DA2360 >> 16)
/* 12CAE8 0022C9E8 602326AC */  sw         $6, (0x1DA2360 & 0xFFFF)($at)
/* 12CAEC 0022C9EC DA01013C */  lui        $at, (0x1DA2364 >> 16)
/* 12CAF0 0022C9F0 642323AC */  sw         $3, (0x1DA2364 & 0xFFFF)($at)
/* 12CAF4 0022C9F4 DA01013C */  lui        $at, (0x1DA2358 >> 16)
/* 12CAF8 0022C9F8 582325AC */  sw         $5, (0x1DA2358 & 0xFFFF)($at)
/* 12CAFC 0022C9FC DA01013C */  lui        $at, (0x1DA235C >> 16)
/* 12CB00 0022CA00 5C2324AC */  sw         $4, (0x1DA235C & 0xFFFF)($at)
/* 12CB04 0022CA04 1D000324 */  addiu      $3, $0, 0x1D
/* 12CB08 0022CA08 DA01013C */  lui        $at, (0x1DA3B20 >> 16)
/* 12CB0C 0022CA0C 203B23AC */  sw         $3, (0x1DA3B20 & 0xFFFF)($at)
/* 12CB10 0022CA10 04000324 */  addiu      $3, $0, 0x4
/* 12CB14 0022CA14 DA01013C */  lui        $at, (0x1DA3B24 >> 16)
/* 12CB18 0022CA18 243B23AC */  sw         $3, (0x1DA3B24 & 0xFFFF)($at)
/* 12CB1C 0022CA1C DA01013C */  lui        $at, (0x1DA3B18 >> 16)
/* 12CB20 0022CA20 183B25AC */  sw         $5, (0x1DA3B18 & 0xFFFF)($at)
/* 12CB24 0022CA24 DA01013C */  lui        $at, (0x1DA3B1C >> 16)
/* 12CB28 0022CA28 1C3B24AC */  sw         $4, (0x1DA3B1C & 0xFFFF)($at)
/* 12CB2C 0022CA2C DA01013C */  lui        $at, (0x1DA52D8 >> 16)
/* 12CB30 0022CA30 D85225AC */  sw         $5, (0x1DA52D8 & 0xFFFF)($at)
/* 12CB34 0022CA34 DA01013C */  lui        $at, (0x1DA52DC >> 16)
/* 12CB38 0022CA38 DC5224AC */  sw         $4, (0x1DA52DC & 0xFFFF)($at)
/* 12CB3C 0022CA3C 25000010 */  b          .L0022CAD4
/* 12CB40 0022CA40 00000000 */   nop
.L0022CA44:
/* 12CB44 0022CA44 03000324 */  addiu      $3, $0, 0x3
/* 12CB48 0022CA48 DA01013C */  lui        $at, (0x1DA0BA4 >> 16)
/* 12CB4C 0022CA4C A40B23AC */  sw         $3, (0x1DA0BA4 & 0xFFFF)($at)
/* 12CB50 0022CA50 0B000724 */  addiu      $7, $0, 0xB
/* 12CB54 0022CA54 DA01013C */  lui        $at, (0x1DA0B98 >> 16)
/* 12CB58 0022CA58 980B27AC */  sw         $7, (0x1DA0B98 & 0xFFFF)($at)
/* 12CB5C 0022CA5C 14000624 */  addiu      $6, $0, 0x14
/* 12CB60 0022CA60 DA01013C */  lui        $at, (0x1DA0B9C >> 16)
/* 12CB64 0022CA64 9C0B26AC */  sw         $6, (0x1DA0B9C & 0xFFFF)($at)
/* 12CB68 0022CA68 02000524 */  addiu      $5, $0, 0x2
/* 12CB6C 0022CA6C DA01013C */  lui        $at, (0x1DA2268 >> 16)
/* 12CB70 0022CA70 682225AC */  sw         $5, (0x1DA2268 & 0xFFFF)($at)
/* 12CB74 0022CA74 04000424 */  addiu      $4, $0, 0x4
/* 12CB78 0022CA78 DA01013C */  lui        $at, (0x1DA2364 >> 16)
/* 12CB7C 0022CA7C 642324AC */  sw         $4, (0x1DA2364 & 0xFFFF)($at)
/* 12CB80 0022CA80 DA01013C */  lui        $at, (0x1DA2358 >> 16)
/* 12CB84 0022CA84 582327AC */  sw         $7, (0x1DA2358 & 0xFFFF)($at)
/* 12CB88 0022CA88 DA01013C */  lui        $at, (0x1DA235C >> 16)
/* 12CB8C 0022CA8C 5C2326AC */  sw         $6, (0x1DA235C & 0xFFFF)($at)
/* 12CB90 0022CA90 DA01013C */  lui        $at, (0x1DA3A28 >> 16)
/* 12CB94 0022CA94 283A25AC */  sw         $5, (0x1DA3A28 & 0xFFFF)($at)
/* 12CB98 0022CA98 1D000324 */  addiu      $3, $0, 0x1D
/* 12CB9C 0022CA9C DA01013C */  lui        $at, (0x1DA3B20 >> 16)
/* 12CBA0 0022CAA0 203B23AC */  sw         $3, (0x1DA3B20 & 0xFFFF)($at)
/* 12CBA4 0022CAA4 DA01013C */  lui        $at, (0x1DA3B24 >> 16)
/* 12CBA8 0022CAA8 243B24AC */  sw         $4, (0x1DA3B24 & 0xFFFF)($at)
/* 12CBAC 0022CAAC DA01013C */  lui        $at, (0x1DA3B18 >> 16)
/* 12CBB0 0022CAB0 183B27AC */  sw         $7, (0x1DA3B18 & 0xFFFF)($at)
/* 12CBB4 0022CAB4 DA01013C */  lui        $at, (0x1DA3B1C >> 16)
/* 12CBB8 0022CAB8 1C3B26AC */  sw         $6, (0x1DA3B1C & 0xFFFF)($at)
/* 12CBBC 0022CABC DA01013C */  lui        $at, (0x1DA51E8 >> 16)
/* 12CBC0 0022CAC0 E85125AC */  sw         $5, (0x1DA51E8 & 0xFFFF)($at)
/* 12CBC4 0022CAC4 DA01013C */  lui        $at, (0x1DA52D8 >> 16)
/* 12CBC8 0022CAC8 D85227AC */  sw         $7, (0x1DA52D8 & 0xFFFF)($at)
/* 12CBCC 0022CACC DA01013C */  lui        $at, (0x1DA69A8 >> 16)
/* 12CBD0 0022CAD0 A86925AC */  sw         $5, (0x1DA69A8 & 0xFFFF)($at)
.L0022CAD4:
/* 12CBD4 0022CAD4 DA01013C */  lui        $at, (0x1DA0C28 >> 16)
/* 12CBD8 0022CAD8 280C20AC */  sw         $0, (0x1DA0C28 & 0xFFFF)($at)
/* 12CBDC 0022CADC DA01013C */  lui        $at, (0x1DA23E8 >> 16)
/* 12CBE0 0022CAE0 E82320AC */  sw         $0, (0x1DA23E8 & 0xFFFF)($at)
/* 12CBE4 0022CAE4 DA01013C */  lui        $at, (0x1DA3BA8 >> 16)
/* 12CBE8 0022CAE8 A83B20AC */  sw         $0, (0x1DA3BA8 & 0xFFFF)($at)
/* 12CBEC 0022CAEC DA01013C */  lui        $at, (0x1DA5368 >> 16)
/* 12CBF0 0022CAF0 685320AC */  sw         $0, (0x1DA5368 & 0xFFFF)($at)
/* 12CBF4 0022CAF4 FFFF0324 */  addiu      $3, $0, -0x1
/* 12CBF8 0022CAF8 DA01013C */  lui        $at, (0x1DA0BE4 >> 16)
/* 12CBFC 0022CAFC E40B23AC */  sw         $3, (0x1DA0BE4 & 0xFFFF)($at)
/* 12CC00 0022CB00 DA01013C */  lui        $at, (0x1DA23A4 >> 16)
/* 12CC04 0022CB04 A42323AC */  sw         $3, (0x1DA23A4 & 0xFFFF)($at)
/* 12CC08 0022CB08 DA01013C */  lui        $at, (0x1DA3B64 >> 16)
/* 12CC0C 0022CB0C 643B23AC */  sw         $3, (0x1DA3B64 & 0xFFFF)($at)
/* 12CC10 0022CB10 DA01013C */  lui        $at, (0x1DA5324 >> 16)
/* 12CC14 0022CB14 245323AC */  sw         $3, (0x1DA5324 & 0xFFFF)($at)
/* 12CC18 0022CB18 DA01013C */  lui        $at, (0x1DA2250 >> 16)
/* 12CC1C 0022CB1C 502220AC */  sw         $0, (0x1DA2250 & 0xFFFF)($at)
/* 12CC20 0022CB20 DA01013C */  lui        $at, (0x1DA3A10 >> 16)
/* 12CC24 0022CB24 103A20AC */  sw         $0, (0x1DA3A10 & 0xFFFF)($at)
/* 12CC28 0022CB28 DA01013C */  lui        $at, (0x1DA51D0 >> 16)
/* 12CC2C 0022CB2C D05120AC */  sw         $0, (0x1DA51D0 & 0xFFFF)($at)
/* 12CC30 0022CB30 DA01013C */  lui        $at, (0x1DA6990 >> 16)
/* 12CC34 0022CB34 906920AC */  sw         $0, (0x1DA6990 & 0xFFFF)($at)
/* 12CC38 0022CB38 0800212E */  sltiu      $at, $17, 0x8
/* 12CC3C 0022CB3C D0002010 */  beqz       $at, .L0022CE80
/* 12CC40 0022CB40 00000000 */   nop
/* 12CC44 0022CB44 2A00033C */  lui        $3, %hi(_692_3)
/* 12CC48 0022CB48 60F16424 */  addiu      $4, $3, %lo(_692_3)
/* 12CC4C 0022CB4C 80181100 */  sll        $3, $17, 2
/* 12CC50 0022CB50 21186400 */  addu       $3, $3, $4
/* 12CC54 0022CB54 0000638C */  lw         $3, 0x0($3)
/* 12CC58 0022CB58 08006000 */  jr         $3
/* 12CC5C 0022CB5C 00000000 */   nop
/* 12CC60 0022CB60 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* 12CC64 0022CB64 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* 12CC68 0022CB68 01000524 */  addiu      $5, $0, 0x1
/* 12CC6C 0022CB6C 9836050C */  jal        Preset__6ClsMesFi
/* 12CC70 0022CB70 00000000 */   nop
/* 12CC74 0022CB74 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 12CC78 0022CB78 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 12CC7C 0022CB7C 01000524 */  addiu      $5, $0, 0x1
/* 12CC80 0022CB80 9836050C */  jal        Preset__6ClsMesFi
/* 12CC84 0022CB84 00000000 */   nop
/* 12CC88 0022CB88 DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* 12CC8C 0022CB8C 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* 12CC90 0022CB90 04000524 */  addiu      $5, $0, 0x4
/* 12CC94 0022CB94 9836050C */  jal        Preset__6ClsMesFi
/* 12CC98 0022CB98 00000000 */   nop
/* 12CC9C 0022CB9C DA01023C */  lui        $2, %hi(AtoraNameMes)
/* 12CCA0 0022CBA0 D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* 12CCA4 0022CBA4 04000524 */  addiu      $5, $0, 0x4
/* 12CCA8 0022CBA8 9836050C */  jal        Preset__6ClsMesFi
/* 12CCAC 0022CBAC 00000000 */   nop
/* 12CCB0 0022CBB0 DA01013C */  lui        $at, (0x1DA22C0 >> 16)
/* 12CCB4 0022CBB4 C02220AC */  sw         $0, (0x1DA22C0 & 0xFFFF)($at)
/* 12CCB8 0022CBB8 DA01013C */  lui        $at, (0x1DA3A80 >> 16)
/* 12CCBC 0022CBBC 803A20AC */  sw         $0, (0x1DA3A80 & 0xFFFF)($at)
/* 12CCC0 0022CBC0 DA01013C */  lui        $at, (0x1DA5240 >> 16)
/* 12CCC4 0022CBC4 405220AC */  sw         $0, (0x1DA5240 & 0xFFFF)($at)
/* 12CCC8 0022CBC8 01000324 */  addiu      $3, $0, 0x1
/* 12CCCC 0022CBCC DA01013C */  lui        $at, (0x1DA6A00 >> 16)
/* 12CCD0 0022CBD0 006A23AC */  sw         $3, (0x1DA6A00 & 0xFFFF)($at)
/* 12CCD4 0022CBD4 AA000010 */  b          .L0022CE80
/* 12CCD8 0022CBD8 00000000 */   nop
/* 12CCDC 0022CBDC DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 12CCE0 0022CBE0 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 12CCE4 0022CBE4 01000524 */  addiu      $5, $0, 0x1
/* 12CCE8 0022CBE8 9836050C */  jal        Preset__6ClsMesFi
/* 12CCEC 0022CBEC 00000000 */   nop
/* 12CCF0 0022CBF0 01000524 */  addiu      $5, $0, 0x1
/* 12CCF4 0022CBF4 DA01013C */  lui        $at, (0x1DA3A1C >> 16)
/* 12CCF8 0022CBF8 1C3A25AC */  sw         $5, (0x1DA3A1C & 0xFFFF)($at)
/* 12CCFC 0022CBFC 19000224 */  addiu      $2, $0, 0x19
/* 12CD00 0022CC00 DA01013C */  lui        $at, (0x1DA2360 >> 16)
/* 12CD04 0022CC04 602322AC */  sw         $2, (0x1DA2360 & 0xFFFF)($at)
/* 12CD08 0022CC08 04000224 */  addiu      $2, $0, 0x4
/* 12CD0C 0022CC0C DA01013C */  lui        $at, (0x1DA2364 >> 16)
/* 12CD10 0022CC10 642322AC */  sw         $2, (0x1DA2364 & 0xFFFF)($at)
/* 12CD14 0022CC14 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* 12CD18 0022CC18 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* 12CD1C 0022CC1C 9836050C */  jal        Preset__6ClsMesFi
/* 12CD20 0022CC20 00000000 */   nop
/* 12CD24 0022CC24 01000324 */  addiu      $3, $0, 0x1
/* 12CD28 0022CC28 DA01013C */  lui        $at, (0x1DA225C >> 16)
/* 12CD2C 0022CC2C 5C2223AC */  sw         $3, (0x1DA225C & 0xFFFF)($at)
/* 12CD30 0022CC30 93000010 */  b          .L0022CE80
/* 12CD34 0022CC34 00000000 */   nop
/* 12CD38 0022CC38 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* 12CD3C 0022CC3C 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* 12CD40 0022CC40 01000524 */  addiu      $5, $0, 0x1
/* 12CD44 0022CC44 9836050C */  jal        Preset__6ClsMesFi
/* 12CD48 0022CC48 00000000 */   nop
/* 12CD4C 0022CC4C DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 12CD50 0022CC50 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 12CD54 0022CC54 01000524 */  addiu      $5, $0, 0x1
/* 12CD58 0022CC58 9836050C */  jal        Preset__6ClsMesFi
/* 12CD5C 0022CC5C 00000000 */   nop
/* 12CD60 0022CC60 DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* 12CD64 0022CC64 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* 12CD68 0022CC68 282E0070 */  paddub     $5, $0, $0
/* 12CD6C 0022CC6C 9836050C */  jal        Preset__6ClsMesFi
/* 12CD70 0022CC70 00000000 */   nop
/* 12CD74 0022CC74 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* 12CD78 0022CC78 D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* 12CD7C 0022CC7C 01000524 */  addiu      $5, $0, 0x1
/* 12CD80 0022CC80 9836050C */  jal        Preset__6ClsMesFi
/* 12CD84 0022CC84 00000000 */   nop
/* 12CD88 0022CC88 0F000224 */  addiu      $2, $0, 0xF
/* 12CD8C 0022CC8C DA01013C */  lui        $at, (0x1DA0BA0 >> 16)
/* 12CD90 0022CC90 A00B22AC */  sw         $2, (0x1DA0BA0 & 0xFFFF)($at)
/* 12CD94 0022CC94 03000424 */  addiu      $4, $0, 0x3
/* 12CD98 0022CC98 DA01013C */  lui        $at, (0x1DA0BA4 >> 16)
/* 12CD9C 0022CC9C A40B24AC */  sw         $4, (0x1DA0BA4 & 0xFFFF)($at)
/* 12CDA0 0022CCA0 DA01013C */  lui        $at, (0x1DA23E8 >> 16)
/* 12CDA4 0022CCA4 E82320AC */  sw         $0, (0x1DA23E8 & 0xFFFF)($at)
/* 12CDA8 0022CCA8 01000324 */  addiu      $3, $0, 0x1
/* 12CDAC 0022CCAC DA01013C */  lui        $at, (0x1DA3A7C >> 16)
/* 12CDB0 0022CCB0 7C3A23AC */  sw         $3, (0x1DA3A7C & 0xFFFF)($at)
/* 12CDB4 0022CCB4 DA01013C */  lui        $at, (0x1DA3A80 >> 16)
/* 12CDB8 0022CCB8 803A20AC */  sw         $0, (0x1DA3A80 & 0xFFFF)($at)
/* 12CDBC 0022CCBC 1E000224 */  addiu      $2, $0, 0x1E
/* 12CDC0 0022CCC0 DA01013C */  lui        $at, (0x1DA3B20 >> 16)
/* 12CDC4 0022CCC4 203B22AC */  sw         $2, (0x1DA3B20 & 0xFFFF)($at)
/* 12CDC8 0022CCC8 DA01013C */  lui        $at, (0x1DA3B24 >> 16)
/* 12CDCC 0022CCCC 243B24AC */  sw         $4, (0x1DA3B24 & 0xFFFF)($at)
/* 12CDD0 0022CCD0 DA01013C */  lui        $at, (0x1DA51D4 >> 16)
/* 12CDD4 0022CCD4 D45123AC */  sw         $3, (0x1DA51D4 & 0xFFFF)($at)
/* 12CDD8 0022CCD8 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* 12CDDC 0022CCDC DA01013C */  lui        $at, (0x1DA3B9C >> 16)
/* 12CDE0 0022CCE0 9C3B20E4 */  swc1       $f0, (0x1DA3B9C & 0xFFFF)($at)
/* 12CDE4 0022CCE4 DA01013C */  lui        $at, (0x1DA5368 >> 16)
/* 12CDE8 0022CCE8 685323AC */  sw         $3, (0x1DA5368 & 0xFFFF)($at)
/* 12CDEC 0022CCEC DA01013C */  lui        $at, (0x1DA52E4 >> 16)
/* 12CDF0 0022CCF0 E45223AC */  sw         $3, (0x1DA52E4 & 0xFFFF)($at)
/* 12CDF4 0022CCF4 80AE080C */  jal        GetMenuLangFlag__Fv
/* 12CDF8 0022CCF8 00000000 */   nop
/* 12CDFC 0022CCFC 01000324 */  addiu      $3, $0, 0x1
/* 12CE00 0022CD00 0D004310 */  beq        $2, $3, .L0022CD38
/* 12CE04 0022CD04 00000000 */   nop
/* 12CE08 0022CD08 03004010 */  beqz       $2, .L0022CD18
/* 12CE0C 0022CD0C 00000000 */   nop
/* 12CE10 0022CD10 09000010 */  b          .L0022CD38
/* 12CE14 0022CD14 00000000 */   nop
.L0022CD18:
/* 12CE18 0022CD18 10000324 */  addiu      $3, $0, 0x10
/* 12CE1C 0022CD1C DA01013C */  lui        $at, (0x1DA3B18 >> 16)
/* 12CE20 0022CD20 183B23AC */  sw         $3, (0x1DA3B18 & 0xFFFF)($at)
/* 12CE24 0022CD24 16000324 */  addiu      $3, $0, 0x16
/* 12CE28 0022CD28 DA01013C */  lui        $at, (0x1DA3B1C >> 16)
/* 12CE2C 0022CD2C 1C3B23AC */  sw         $3, (0x1DA3B1C & 0xFFFF)($at)
/* 12CE30 0022CD30 53000010 */  b          .L0022CE80
/* 12CE34 0022CD34 00000000 */   nop
.L0022CD38:
/* 12CE38 0022CD38 DA01013C */  lui        $at, (0x1DA51E8 >> 16)
/* 12CE3C 0022CD3C E85120AC */  sw         $0, (0x1DA51E8 & 0xFFFF)($at)
/* 12CE40 0022CD40 0C000324 */  addiu      $3, $0, 0xC
/* 12CE44 0022CD44 DA01013C */  lui        $at, (0x1DA3B18 >> 16)
/* 12CE48 0022CD48 183B23AC */  sw         $3, (0x1DA3B18 & 0xFFFF)($at)
/* 12CE4C 0022CD4C 14000324 */  addiu      $3, $0, 0x14
/* 12CE50 0022CD50 DA01013C */  lui        $at, (0x1DA3B1C >> 16)
/* 12CE54 0022CD54 1C3B23AC */  sw         $3, (0x1DA3B1C & 0xFFFF)($at)
/* 12CE58 0022CD58 49000010 */  b          .L0022CE80
/* 12CE5C 0022CD5C 00000000 */   nop
/* 12CE60 0022CD60 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 12CE64 0022CD64 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 12CE68 0022CD68 01000524 */  addiu      $5, $0, 0x1
/* 12CE6C 0022CD6C 9836050C */  jal        Preset__6ClsMesFi
/* 12CE70 0022CD70 00000000 */   nop
/* 12CE74 0022CD74 DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* 12CE78 0022CD78 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* 12CE7C 0022CD7C 01000524 */  addiu      $5, $0, 0x1
/* 12CE80 0022CD80 9836050C */  jal        Preset__6ClsMesFi
/* 12CE84 0022CD84 00000000 */   nop
/* 12CE88 0022CD88 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* 12CE8C 0022CD8C D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* 12CE90 0022CD90 01000524 */  addiu      $5, $0, 0x1
/* 12CE94 0022CD94 9836050C */  jal        Preset__6ClsMesFi
/* 12CE98 0022CD98 00000000 */   nop
/* 12CE9C 0022CD9C 04000324 */  addiu      $3, $0, 0x4
/* 12CEA0 0022CDA0 DA01013C */  lui        $at, (0x1DA3A10 >> 16)
/* 12CEA4 0022CDA4 103A23AC */  sw         $3, (0x1DA3A10 & 0xFFFF)($at)
/* 12CEA8 0022CDA8 DA01013C */  lui        $at, (0x1DA51D0 >> 16)
/* 12CEAC 0022CDAC D05123AC */  sw         $3, (0x1DA51D0 & 0xFFFF)($at)
/* 12CEB0 0022CDB0 DA01013C */  lui        $at, (0x1DA6990 >> 16)
/* 12CEB4 0022CDB4 906923AC */  sw         $3, (0x1DA6990 & 0xFFFF)($at)
/* 12CEB8 0022CDB8 03000324 */  addiu      $3, $0, 0x3
/* 12CEBC 0022CDBC DA01013C */  lui        $at, (0x1DA2364 >> 16)
/* 12CEC0 0022CDC0 642323AC */  sw         $3, (0x1DA2364 & 0xFFFF)($at)
/* 12CEC4 0022CDC4 02000324 */  addiu      $3, $0, 0x2
/* 12CEC8 0022CDC8 DA01013C */  lui        $at, (0x1DA3B24 >> 16)
/* 12CECC 0022CDCC 243B23AC */  sw         $3, (0x1DA3B24 & 0xFFFF)($at)
/* 12CED0 0022CDD0 01000324 */  addiu      $3, $0, 0x1
/* 12CED4 0022CDD4 DA01013C */  lui        $at, (0x1DA52E4 >> 16)
/* 12CED8 0022CDD8 E45223AC */  sw         $3, (0x1DA52E4 & 0xFFFF)($at)
/* 12CEDC 0022CDDC 28000010 */  b          .L0022CE80
/* 12CEE0 0022CDE0 00000000 */   nop
/* 12CEE4 0022CDE4 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* 12CEE8 0022CDE8 D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* 12CEEC 0022CDEC 04000524 */  addiu      $5, $0, 0x4
/* 12CEF0 0022CDF0 9836050C */  jal        Preset__6ClsMesFi
/* 12CEF4 0022CDF4 00000000 */   nop
/* 12CEF8 0022CDF8 01000324 */  addiu      $3, $0, 0x1
/* 12CEFC 0022CDFC DA01013C */  lui        $at, (0x1DA52E4 >> 16)
/* 12CF00 0022CE00 E45223AC */  sw         $3, (0x1DA52E4 & 0xFFFF)($at)
/* 12CF04 0022CE04 1E000010 */  b          .L0022CE80
/* 12CF08 0022CE08 00000000 */   nop
/* 12CF0C 0022CE0C DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 12CF10 0022CE10 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 12CF14 0022CE14 01000524 */  addiu      $5, $0, 0x1
/* 12CF18 0022CE18 9836050C */  jal        Preset__6ClsMesFi
/* 12CF1C 0022CE1C 00000000 */   nop
/* 12CF20 0022CE20 DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* 12CF24 0022CE24 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* 12CF28 0022CE28 04000524 */  addiu      $5, $0, 0x4
/* 12CF2C 0022CE2C 9836050C */  jal        Preset__6ClsMesFi
/* 12CF30 0022CE30 00000000 */   nop
/* 12CF34 0022CE34 01000324 */  addiu      $3, $0, 0x1
/* 12CF38 0022CE38 DA01013C */  lui        $at, (0x1DA3B24 >> 16)
/* 12CF3C 0022CE3C 243B23AC */  sw         $3, (0x1DA3B24 & 0xFFFF)($at)
/* 12CF40 0022CE40 0F000010 */  b          .L0022CE80
/* 12CF44 0022CE44 00000000 */   nop
/* 12CF48 0022CE48 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 12CF4C 0022CE4C 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 12CF50 0022CE50 01000524 */  addiu      $5, $0, 0x1
/* 12CF54 0022CE54 9836050C */  jal        Preset__6ClsMesFi
/* 12CF58 0022CE58 00000000 */   nop
/* 12CF5C 0022CE5C 0C000324 */  addiu      $3, $0, 0xC
/* 12CF60 0022CE60 DA01013C */  lui        $at, (0x1DA2358 >> 16)
/* 12CF64 0022CE64 582323AC */  sw         $3, (0x1DA2358 & 0xFFFF)($at)
/* 12CF68 0022CE68 02000324 */  addiu      $3, $0, 0x2
/* 12CF6C 0022CE6C DA01013C */  lui        $at, (0x1DA2364 >> 16)
/* 12CF70 0022CE70 642323AC */  sw         $3, (0x1DA2364 & 0xFFFF)($at)
/* 12CF74 0022CE74 0F000324 */  addiu      $3, $0, 0xF
/* 12CF78 0022CE78 DA01013C */  lui        $at, (0x1DA2360 >> 16)
/* 12CF7C 0022CE7C 602323AC */  sw         $3, (0x1DA2360 & 0xFFFF)($at)
.L0022CE80:
/* 12CF80 0022CE80 2000BF7B */  lq         $31, 0x20($sp)
/* 12CF84 0022CE84 1000B17B */  lq         $17, 0x10($sp)
/* 12CF88 0022CE88 0000B07B */  lq         $16, 0x0($sp)
/* 12CF8C 0022CE8C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 12CF90 0022CE90 0800E003 */  jr         $31
/* 12CF94 0022CE94 00000000 */   nop
/* 12CF98 0022CE98 00000000 */  nop
/* 12CF9C 0022CE9C 00000000 */  nop
