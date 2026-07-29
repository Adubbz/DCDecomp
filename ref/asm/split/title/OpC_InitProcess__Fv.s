.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpC_InitProcess__Fv
/* 010330 01DBC030 30FCBD27 */  addiu       $29, $29, -0x3D0
/* 010334 01DBC034 5000BF7F */  sq          $31, 0x50($29)
/* 010338 01DBC038 4000B47F */  sq          $20, 0x40($29)
/* 01033C 01DBC03C 3000B37F */  sq          $19, 0x30($29)
/* 010340 01DBC040 2000B27F */  sq          $18, 0x20($29)
/* 010344 01DBC044 1000B17F */  sq          $17, 0x10($29)
/* 010348 01DBC048 0000B07F */  sq          $16, 0x0($29)
.L01DBC04C_2C184C:
/* 01034C 01DBC04C 8CFB040C */  jal         ReadBGSync__Fv
/* 010350 01DBC050 00000000 */   nop
/* 010354 01DBC054 FDFF4014 */  bnez        $2, .L01DBC04C_2C184C
/* 010358 01DBC058 00000000 */   nop
/* 01035C 01DBC05C DD01023C */  lui         $2, %hi(LIT_398__5)
/* 010360 01DBC060 607B4624 */  addiu       $6, $2, %lo(LIT_398__5)
/* 010364 01DBC064 6000A527 */  addiu       $5, $29, 0x60
/* 010368 01DBC068 09000424 */  addiu       $4, $0, 0x9
.L01DBC06C_2C186C:
/* 01036C 01DBC06C 0000C378 */  lq          $3, 0x0($6)
/* 010370 01DBC070 1000C278 */  lq          $2, 0x10($6)
/* 010374 01DBC074 2000C624 */  addiu       $6, $6, 0x20
/* 010378 01DBC078 FFFF8424 */  addiu       $4, $4, -0x1
/* 01037C 01DBC07C 0000A37C */  sq          $3, 0x0($5)
/* 010380 01DBC080 1000A27C */  sq          $2, 0x10($5)
/* 010384 01DBC084 2000A524 */  addiu       $5, $5, 0x20
/* 010388 01DBC088 F8FF801C */  bgtz        $4, .L01DBC06C_2C186C
/* 01038C 01DBC08C 00000000 */   nop
/* 010390 01DBC090 948B848F */  lw          $4, -0x746C($28)
/* 010394 01DBC094 DE01023C */  lui         $2, %hi(LIT_468__5)
/* 010398 01DBC098 08ED4524 */  addiu       $5, $2, %lo(LIT_468__5)
/* 01039C 01DBC09C 28360070 */  paddub      $6, $0, $0
/* 0103A0 01DBC0A0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0103A4 01DBC0A4 00000000 */   nop
/* 0103A8 01DBC0A8 A800B027 */  addiu       $16, $29, 0xA8
/* 0103AC 01DBC0AC 000002AE */  sw          $2, 0x0($16)
/* 0103B0 01DBC0B0 948B848F */  lw          $4, -0x746C($28)
/* 0103B4 01DBC0B4 DE01023C */  lui         $2, %hi(LIT_469__6)
/* 0103B8 01DBC0B8 18ED4524 */  addiu       $5, $2, %lo(LIT_469__6)
/* 0103BC 01DBC0BC 28360070 */  paddub      $6, $0, $0
/* 0103C0 01DBC0C0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0103C4 01DBC0C4 00000000 */   nop
/* 0103C8 01DBC0C8 B400B127 */  addiu       $17, $29, 0xB4
/* 0103CC 01DBC0CC 000022AE */  sw          $2, 0x0($17)
/* 0103D0 01DBC0D0 948B848F */  lw          $4, -0x746C($28)
/* 0103D4 01DBC0D4 DE01023C */  lui         $2, %hi(LIT_470__5)
/* 0103D8 01DBC0D8 28ED4524 */  addiu       $5, $2, %lo(LIT_470__5)
/* 0103DC 01DBC0DC 28360070 */  paddub      $6, $0, $0
/* 0103E0 01DBC0E0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0103E4 01DBC0E4 00000000 */   nop
/* 0103E8 01DBC0E8 C000B227 */  addiu       $18, $29, 0xC0
/* 0103EC 01DBC0EC 000042AE */  sw          $2, 0x0($18)
/* 0103F0 01DBC0F0 948B848F */  lw          $4, -0x746C($28)
/* 0103F4 01DBC0F4 DE01023C */  lui         $2, %hi(LIT_471__5)
/* 0103F8 01DBC0F8 38ED4524 */  addiu       $5, $2, %lo(LIT_471__5)
/* 0103FC 01DBC0FC 28360070 */  paddub      $6, $0, $0
/* 010400 01DBC100 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 010404 01DBC104 00000000 */   nop
/* 010408 01DBC108 CC00B327 */  addiu       $19, $29, 0xCC
/* 01040C 01DBC10C 000062AE */  sw          $2, 0x0($19)
/* 010410 01DBC110 948B848F */  lw          $4, -0x746C($28)
/* 010414 01DBC114 DE01023C */  lui         $2, %hi(LIT_472__3)
/* 010418 01DBC118 48ED4524 */  addiu       $5, $2, %lo(LIT_472__3)
/* 01041C 01DBC11C 28360070 */  paddub      $6, $0, $0
/* 010420 01DBC120 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 010424 01DBC124 00000000 */   nop
/* 010428 01DBC128 D800B427 */  addiu       $20, $29, 0xD8
/* 01042C 01DBC12C 000082AE */  sw          $2, 0x0($20)
/* 010430 01DBC130 948B848F */  lw          $4, -0x746C($28)
/* 010434 01DBC134 DE01023C */  lui         $2, %hi(LIT_473__3)
/* 010438 01DBC138 58ED4524 */  addiu       $5, $2, %lo(LIT_473__3)
/* 01043C 01DBC13C 28360070 */  paddub      $6, $0, $0
/* 010440 01DBC140 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 010444 01DBC144 00000000 */   nop
/* 010448 01DBC148 E400A2AF */  sw          $2, 0xE4($29)
/* 01044C 01DBC14C 948B848F */  lw          $4, -0x746C($28)
/* 010450 01DBC150 DE01023C */  lui         $2, %hi(LIT_474__2)
/* 010454 01DBC154 68ED4524 */  addiu       $5, $2, %lo(LIT_474__2)
/* 010458 01DBC158 28360070 */  paddub      $6, $0, $0
/* 01045C 01DBC15C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 010460 01DBC160 00000000 */   nop
/* 010464 01DBC164 F000A2AF */  sw          $2, 0xF0($29)
/* 010468 01DBC168 948B848F */  lw          $4, -0x746C($28)
/* 01046C 01DBC16C DE01023C */  lui         $2, %hi(LIT_475__4)
/* 010470 01DBC170 78ED4524 */  addiu       $5, $2, %lo(LIT_475__4)
/* 010474 01DBC174 28360070 */  paddub      $6, $0, $0
/* 010478 01DBC178 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 01047C 01DBC17C 00000000 */   nop
/* 010480 01DBC180 FC00A2AF */  sw          $2, 0xFC($29)
/* 010484 01DBC184 948B848F */  lw          $4, -0x746C($28)
/* 010488 01DBC188 DE01023C */  lui         $2, %hi(LIT_476__2)
/* 01048C 01DBC18C 88ED4524 */  addiu       $5, $2, %lo(LIT_476__2)
/* 010490 01DBC190 28360070 */  paddub      $6, $0, $0
/* 010494 01DBC194 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 010498 01DBC198 00000000 */   nop
/* 01049C 01DBC19C 0801A2AF */  sw          $2, 0x108($29)
/* 0104A0 01DBC1A0 948B848F */  lw          $4, -0x746C($28)
/* 0104A4 01DBC1A4 DE01023C */  lui         $2, %hi(LIT_477__2)
/* 0104A8 01DBC1A8 98ED4524 */  addiu       $5, $2, %lo(LIT_477__2)
/* 0104AC 01DBC1AC 28360070 */  paddub      $6, $0, $0
/* 0104B0 01DBC1B0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0104B4 01DBC1B4 00000000 */   nop
/* 0104B8 01DBC1B8 1401A2AF */  sw          $2, 0x114($29)
/* 0104BC 01DBC1BC 948B848F */  lw          $4, -0x746C($28)
/* 0104C0 01DBC1C0 DE01023C */  lui         $2, %hi(LIT_478__3)
/* 0104C4 01DBC1C4 A8ED4524 */  addiu       $5, $2, %lo(LIT_478__3)
/* 0104C8 01DBC1C8 28360070 */  paddub      $6, $0, $0
/* 0104CC 01DBC1CC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0104D0 01DBC1D0 00000000 */   nop
/* 0104D4 01DBC1D4 2001A2AF */  sw          $2, 0x120($29)
/* 0104D8 01DBC1D8 948B848F */  lw          $4, -0x746C($28)
/* 0104DC 01DBC1DC DE01023C */  lui         $2, %hi(LIT_479__4)
/* 0104E0 01DBC1E0 B8ED4524 */  addiu       $5, $2, %lo(LIT_479__4)
/* 0104E4 01DBC1E4 28360070 */  paddub      $6, $0, $0
/* 0104E8 01DBC1E8 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0104EC 01DBC1EC 00000000 */   nop
/* 0104F0 01DBC1F0 2C01A2AF */  sw          $2, 0x12C($29)
/* 0104F4 01DBC1F4 948B848F */  lw          $4, -0x746C($28)
/* 0104F8 01DBC1F8 DE01023C */  lui         $2, %hi(LIT_480__4)
/* 0104FC 01DBC1FC C8ED4524 */  addiu       $5, $2, %lo(LIT_480__4)
/* 010500 01DBC200 28360070 */  paddub      $6, $0, $0
/* 010504 01DBC204 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 010508 01DBC208 00000000 */   nop
/* 01050C 01DBC20C 3801A2AF */  sw          $2, 0x138($29)
/* 010510 01DBC210 948B848F */  lw          $4, -0x746C($28)
/* 010514 01DBC214 DE01023C */  lui         $2, %hi(LIT_481__4)
/* 010518 01DBC218 D8ED4524 */  addiu       $5, $2, %lo(LIT_481__4)
/* 01051C 01DBC21C 28360070 */  paddub      $6, $0, $0
/* 010520 01DBC220 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 010524 01DBC224 00000000 */   nop
/* 010528 01DBC228 4401A2AF */  sw          $2, 0x144($29)
/* 01052C 01DBC22C 948B848F */  lw          $4, -0x746C($28)
/* 010530 01DBC230 DE01023C */  lui         $2, %hi(LIT_482__5)
/* 010534 01DBC234 E8ED4524 */  addiu       $5, $2, %lo(LIT_482__5)
/* 010538 01DBC238 28360070 */  paddub      $6, $0, $0
/* 01053C 01DBC23C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 010540 01DBC240 00000000 */   nop
/* 010544 01DBC244 5001A2AF */  sw          $2, 0x150($29)
/* 010548 01DBC248 948B848F */  lw          $4, -0x746C($28)
/* 01054C 01DBC24C DE01023C */  lui         $2, %hi(LIT_483__5)
/* 010550 01DBC250 F8ED4524 */  addiu       $5, $2, %lo(LIT_483__5)
/* 010554 01DBC254 28360070 */  paddub      $6, $0, $0
/* 010558 01DBC258 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 01055C 01DBC25C 00000000 */   nop
/* 010560 01DBC260 5C01A2AF */  sw          $2, 0x15C($29)
/* 010564 01DBC264 948B848F */  lw          $4, -0x746C($28)
/* 010568 01DBC268 DE01023C */  lui         $2, %hi(LIT_484__4)
/* 01056C 01DBC26C 08EE4524 */  addiu       $5, $2, %lo(LIT_484__4)
/* 010570 01DBC270 28360070 */  paddub      $6, $0, $0
/* 010574 01DBC274 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 010578 01DBC278 00000000 */   nop
/* 01057C 01DBC27C 6801A2AF */  sw          $2, 0x168($29)
/* 010580 01DBC280 C701023C */  lui         $2, %hi(TexManager)
/* 010584 01DBC284 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 010588 01DBC288 E03F0524 */  addiu       $5, $0, 0x3FE0
/* 01058C 01DBC28C F0C3040C */  jal         Initialize__15CTextureManagerFi
/* 010590 01DBC290 00000000 */   nop
/* 010594 01DBC294 C701023C */  lui         $2, %hi(TexManager)
/* 010598 01DBC298 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01059C 01DBC29C FFFF0524 */  addiu       $5, $0, -0x1
/* 0105A0 01DBC2A0 6000A627 */  addiu       $6, $29, 0x60
/* 0105A4 01DBC2A4 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0105A8 01DBC2A8 00000000 */   nop
/* 0105AC 01DBC2AC 948B858F */  lw          $5, -0x746C($28)
/* 0105B0 01DBC2B0 DE01023C */  lui         $2, %hi(LIT_485__3)
/* 0105B4 01DBC2B4 20EE4424 */  addiu       $4, $2, %lo(LIT_485__3)
/* 0105B8 01DBC2B8 28360070 */  paddub      $6, $0, $0
/* 0105BC 01DBC2BC D8FC040C */  jal         LoadFile__FPcPvPi
/* 0105C0 01DBC2C0 00000000 */   nop
/* 0105C4 01DBC2C4 948B848F */  lw          $4, -0x746C($28)
/* 0105C8 01DBC2C8 DE01023C */  lui         $2, %hi(LIT_486__4)
/* 0105CC 01DBC2CC 38EE4524 */  addiu       $5, $2, %lo(LIT_486__4)
/* 0105D0 01DBC2D0 28360070 */  paddub      $6, $0, $0
/* 0105D4 01DBC2D4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0105D8 01DBC2D8 00000000 */   nop
/* 0105DC 01DBC2DC 6000A2AF */  sw          $2, 0x60($29)
/* 0105E0 01DBC2E0 0C000224 */  addiu       $2, $0, 0xC
/* 0105E4 01DBC2E4 6400A2AF */  sw          $2, 0x64($29)
/* 0105E8 01DBC2E8 6800A0AF */  sw          $0, 0x68($29)
/* 0105EC 01DBC2EC 948B848F */  lw          $4, -0x746C($28)
/* 0105F0 01DBC2F0 DE01023C */  lui         $2, %hi(LIT_487__4)
/* 0105F4 01DBC2F4 48EE4524 */  addiu       $5, $2, %lo(LIT_487__4)
/* 0105F8 01DBC2F8 28360070 */  paddub      $6, $0, $0
/* 0105FC 01DBC2FC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 010600 01DBC300 00000000 */   nop
/* 010604 01DBC304 6C00A2AF */  sw          $2, 0x6C($29)
/* 010608 01DBC308 0C000224 */  addiu       $2, $0, 0xC
/* 01060C 01DBC30C 7000A2AF */  sw          $2, 0x70($29)
/* 010610 01DBC310 7400A0AF */  sw          $0, 0x74($29)
/* 010614 01DBC314 948B848F */  lw          $4, -0x746C($28)
/* 010618 01DBC318 DE01023C */  lui         $2, %hi(LIT_488__4)
/* 01061C 01DBC31C 58EE4524 */  addiu       $5, $2, %lo(LIT_488__4)
/* 010620 01DBC320 28360070 */  paddub      $6, $0, $0
/* 010624 01DBC324 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 010628 01DBC328 00000000 */   nop
/* 01062C 01DBC32C 7800A2AF */  sw          $2, 0x78($29)
/* 010630 01DBC330 02000224 */  addiu       $2, $0, 0x2
/* 010634 01DBC334 7C00A2AF */  sw          $2, 0x7C($29)
/* 010638 01DBC338 8000A0AF */  sw          $0, 0x80($29)
/* 01063C 01DBC33C 948B848F */  lw          $4, -0x746C($28)
/* 010640 01DBC340 DE01023C */  lui         $2, %hi(LIT_489__4)
/* 010644 01DBC344 68EE4524 */  addiu       $5, $2, %lo(LIT_489__4)
/* 010648 01DBC348 28360070 */  paddub      $6, $0, $0
/* 01064C 01DBC34C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 010650 01DBC350 00000000 */   nop
/* 010654 01DBC354 8400A2AF */  sw          $2, 0x84($29)
/* 010658 01DBC358 02000224 */  addiu       $2, $0, 0x2
/* 01065C 01DBC35C 8800A2AF */  sw          $2, 0x88($29)
/* 010660 01DBC360 8C00A0AF */  sw          $0, 0x8C($29)
/* 010664 01DBC364 948B848F */  lw          $4, -0x746C($28)
/* 010668 01DBC368 DE01023C */  lui         $2, %hi(LIT_490__4)
/* 01066C 01DBC36C 78EE4524 */  addiu       $5, $2, %lo(LIT_490__4)
/* 010670 01DBC370 28360070 */  paddub      $6, $0, $0
/* 010674 01DBC374 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 010678 01DBC378 00000000 */   nop
/* 01067C 01DBC37C 9000A2AF */  sw          $2, 0x90($29)
/* 010680 01DBC380 0D000224 */  addiu       $2, $0, 0xD
/* 010684 01DBC384 9400A2AF */  sw          $2, 0x94($29)
/* 010688 01DBC388 9800A0AF */  sw          $0, 0x98($29)
/* 01068C 01DBC38C 948B848F */  lw          $4, -0x746C($28)
/* 010690 01DBC390 DE01023C */  lui         $2, %hi(LIT_491__5)
/* 010694 01DBC394 88EE4524 */  addiu       $5, $2, %lo(LIT_491__5)
/* 010698 01DBC398 28360070 */  paddub      $6, $0, $0
/* 01069C 01DBC39C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0106A0 01DBC3A0 00000000 */   nop
/* 0106A4 01DBC3A4 9C00A2AF */  sw          $2, 0x9C($29)
/* 0106A8 01DBC3A8 0E000224 */  addiu       $2, $0, 0xE
/* 0106AC 01DBC3AC A000A2AF */  sw          $2, 0xA0($29)
/* 0106B0 01DBC3B0 A400A0AF */  sw          $0, 0xA4($29)
/* 0106B4 01DBC3B4 948B848F */  lw          $4, -0x746C($28)
/* 0106B8 01DBC3B8 DE01023C */  lui         $2, %hi(LIT_492__3)
/* 0106BC 01DBC3BC 98EE4524 */  addiu       $5, $2, %lo(LIT_492__3)
/* 0106C0 01DBC3C0 28360070 */  paddub      $6, $0, $0
/* 0106C4 01DBC3C4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0106C8 01DBC3C8 00000000 */   nop
/* 0106CC 01DBC3CC 000002AE */  sw          $2, 0x0($16)
/* 0106D0 01DBC3D0 07000224 */  addiu       $2, $0, 0x7
/* 0106D4 01DBC3D4 AC00A2AF */  sw          $2, 0xAC($29)
/* 0106D8 01DBC3D8 B000A0AF */  sw          $0, 0xB0($29)
/* 0106DC 01DBC3DC 948B848F */  lw          $4, -0x746C($28)
/* 0106E0 01DBC3E0 DE01023C */  lui         $2, %hi(LIT_493__3)
/* 0106E4 01DBC3E4 A8EE4524 */  addiu       $5, $2, %lo(LIT_493__3)
/* 0106E8 01DBC3E8 28360070 */  paddub      $6, $0, $0
/* 0106EC 01DBC3EC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0106F0 01DBC3F0 00000000 */   nop
/* 0106F4 01DBC3F4 000022AE */  sw          $2, 0x0($17)
/* 0106F8 01DBC3F8 07000224 */  addiu       $2, $0, 0x7
/* 0106FC 01DBC3FC B800A2AF */  sw          $2, 0xB8($29)
/* 010700 01DBC400 BC00A0AF */  sw          $0, 0xBC($29)
/* 010704 01DBC404 948B848F */  lw          $4, -0x746C($28)
/* 010708 01DBC408 DE01023C */  lui         $2, %hi(LIT_494__5)
/* 01070C 01DBC40C B8EE4524 */  addiu       $5, $2, %lo(LIT_494__5)
/* 010710 01DBC410 28360070 */  paddub      $6, $0, $0
/* 010714 01DBC414 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 010718 01DBC418 00000000 */   nop
/* 01071C 01DBC41C 000042AE */  sw          $2, 0x0($18)
/* 010720 01DBC420 08000224 */  addiu       $2, $0, 0x8
/* 010724 01DBC424 C400A2AF */  sw          $2, 0xC4($29)
/* 010728 01DBC428 C800A0AF */  sw          $0, 0xC8($29)
/* 01072C 01DBC42C 948B848F */  lw          $4, -0x746C($28)
/* 010730 01DBC430 DE01023C */  lui         $2, %hi(LIT_495__5)
/* 010734 01DBC434 C8EE4524 */  addiu       $5, $2, %lo(LIT_495__5)
/* 010738 01DBC438 28360070 */  paddub      $6, $0, $0
/* 01073C 01DBC43C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 010740 01DBC440 00000000 */   nop
/* 010744 01DBC444 000062AE */  sw          $2, 0x0($19)
/* 010748 01DBC448 08000224 */  addiu       $2, $0, 0x8
/* 01074C 01DBC44C D000A2AF */  sw          $2, 0xD0($29)
/* 010750 01DBC450 D400A0AF */  sw          $0, 0xD4($29)
/* 010754 01DBC454 000080AE */  sw          $0, 0x0($20)
/* 010758 01DBC458 DC00A0AF */  sw          $0, 0xDC($29)
/* 01075C 01DBC45C E000A0AF */  sw          $0, 0xE0($29)
/* 010760 01DBC460 C701023C */  lui         $2, %hi(TexManager)
/* 010764 01DBC464 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 010768 01DBC468 FFFF0524 */  addiu       $5, $0, -0x1
/* 01076C 01DBC46C 6000A627 */  addiu       $6, $29, 0x60
/* 010770 01DBC470 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 010774 01DBC474 00000000 */   nop
/* 010778 01DBC478 02000424 */  addiu       $4, $0, 0x2
/* 01077C 01DBC47C E101013C */  lui         $1, %hi(CharaTex__2 + 0xB)
/* 010780 01DBC480 BB9524A0 */  sb          $4, %lo(CharaTex__2 + 0xB)($1)
/* 010784 01DBC484 0D000324 */  addiu       $3, $0, 0xD
/* 010788 01DBC488 E101013C */  lui         $1, %hi(CharaTex__2 + 0xC)
/* 01078C 01DBC48C BC9523A0 */  sb          $3, %lo(CharaTex__2 + 0xC)($1)
/* 010790 01DBC490 0E000224 */  addiu       $2, $0, 0xE
/* 010794 01DBC494 E101013C */  lui         $1, %hi(CharaTex__2 + 0xD)
/* 010798 01DBC498 BD9522A0 */  sb          $2, %lo(CharaTex__2 + 0xD)($1)
/* 01079C 01DBC49C 03000624 */  addiu       $6, $0, 0x3
/* 0107A0 01DBC4A0 E101013C */  lui         $1, %hi(CharaTex__2 + 0x9)
/* 0107A4 01DBC4A4 B99526A0 */  sb          $6, %lo(CharaTex__2 + 0x9)($1)
/* 0107A8 01DBC4A8 E101013C */  lui         $1, %hi(CharaTex__2 + 0xB)
/* 0107AC 01DBC4AC BB9524A0 */  sb          $4, %lo(CharaTex__2 + 0xB)($1)
/* 0107B0 01DBC4B0 E101013C */  lui         $1, %hi(CharaTex__2 + 0xC)
/* 0107B4 01DBC4B4 BC9523A0 */  sb          $3, %lo(CharaTex__2 + 0xC)($1)
/* 0107B8 01DBC4B8 E101013C */  lui         $1, %hi(CharaTex__2 + 0xD)
/* 0107BC 01DBC4BC BD9522A0 */  sb          $2, %lo(CharaTex__2 + 0xD)($1)
/* 0107C0 01DBC4C0 04000224 */  addiu       $2, $0, 0x4
/* 0107C4 01DBC4C4 E101013C */  lui         $1, %hi(CharaTex__2 + 0xE)
/* 0107C8 01DBC4C8 BE9522A0 */  sb          $2, %lo(CharaTex__2 + 0xE)($1)
/* 0107CC 01DBC4CC 05000224 */  addiu       $2, $0, 0x5
/* 0107D0 01DBC4D0 E101013C */  lui         $1, %hi(CharaTex__2 + 0xF)
/* 0107D4 01DBC4D4 BF9522A0 */  sb          $2, %lo(CharaTex__2 + 0xF)($1)
/* 0107D8 01DBC4D8 06000224 */  addiu       $2, $0, 0x6
/* 0107DC 01DBC4DC E101013C */  lui         $1, %hi(CharaTex__2 + 0x10)
/* 0107E0 01DBC4E0 C09522A0 */  sb          $2, %lo(CharaTex__2 + 0x10)($1)
/* 0107E4 01DBC4E4 07000224 */  addiu       $2, $0, 0x7
/* 0107E8 01DBC4E8 E101013C */  lui         $1, %hi(CharaTex__2 + 0x11)
/* 0107EC 01DBC4EC C19522A0 */  sb          $2, %lo(CharaTex__2 + 0x11)($1)
/* 0107F0 01DBC4F0 08000224 */  addiu       $2, $0, 0x8
/* 0107F4 01DBC4F4 E101013C */  lui         $1, %hi(CharaTex__2 + 0x12)
/* 0107F8 01DBC4F8 C29522A0 */  sb          $2, %lo(CharaTex__2 + 0x12)($1)
/* 0107FC 01DBC4FC 09000224 */  addiu       $2, $0, 0x9
/* 010800 01DBC500 E101013C */  lui         $1, %hi(CharaTex__2 + 0x13)
/* 010804 01DBC504 C39522A0 */  sb          $2, %lo(CharaTex__2 + 0x13)($1)
/* 010808 01DBC508 E101013C */  lui         $1, %hi(CharaTex__2 + 0x14)
/* 01080C 01DBC50C C49522A0 */  sb          $2, %lo(CharaTex__2 + 0x14)($1)
/* 010810 01DBC510 0F000224 */  addiu       $2, $0, 0xF
/* 010814 01DBC514 E101013C */  lui         $1, %hi(CharaTex__2 + 0x1)
/* 010818 01DBC518 B19522A0 */  sb          $2, %lo(CharaTex__2 + 0x1)($1)
/* 01081C 01DBC51C E101013C */  lui         $1, %hi(CharaTex__2 + 0x4)
/* 010820 01DBC520 B49522A0 */  sb          $2, %lo(CharaTex__2 + 0x4)($1)
/* 010824 01DBC524 10000224 */  addiu       $2, $0, 0x10
/* 010828 01DBC528 E101013C */  lui         $1, %hi(CharaTex__2 + 0x3)
/* 01082C 01DBC52C B39522A0 */  sb          $2, %lo(CharaTex__2 + 0x3)($1)
/* 010830 01DBC530 11000224 */  addiu       $2, $0, 0x11
/* 010834 01DBC534 E101013C */  lui         $1, %hi(CharaTex__2 + 0x5)
/* 010838 01DBC538 B59522A0 */  sb          $2, %lo(CharaTex__2 + 0x5)($1)
/* 01083C 01DBC53C 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 010840 01DBC540 282E0070 */  paddub      $5, $0, $0
/* 010844 01DBC544 14000724 */  addiu       $7, $0, 0x14
/* 010848 01DBC548 140F050C */  jal         SetReverb__6CSoundFiii
/* 01084C 01DBC54C 00000000 */   nop
/* 010850 01DBC550 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 010854 01DBC554 01000524 */  addiu       $5, $0, 0x1
/* 010858 01DBC558 04000624 */  addiu       $6, $0, 0x4
/* 01085C 01DBC55C 05000724 */  addiu       $7, $0, 0x5
/* 010860 01DBC560 140F050C */  jal         SetReverb__6CSoundFiii
/* 010864 01DBC564 00000000 */   nop
/* 010868 01DBC568 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 01086C 01DBC56C DE01023C */  lui         $2, %hi(LIT_496__7)
/* 010870 01DBC570 D8EE4524 */  addiu       $5, $2, %lo(LIT_496__7)
/* 010874 01DBC574 948B868F */  lw          $6, -0x746C($28)
/* 010878 01DBC578 3410050C */  jal         LoadSoundFileFromPack__6CSoundFPcPUi
/* 01087C 01DBC57C 00000000 */   nop
/* 010880 01DBC580 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 010884 01DBC584 0F000524 */  addiu       $5, $0, 0xF
/* 010888 01DBC588 00010624 */  addiu       $6, $0, 0x100
/* 01088C 01DBC58C 581A050C */  jal         SetVol__6CSoundFii
/* 010890 01DBC590 00000000 */   nop
/* 010894 01DBC594 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 010898 01DBC598 0E000524 */  addiu       $5, $0, 0xE
/* 01089C 01DBC59C 00010624 */  addiu       $6, $0, 0x100
/* 0108A0 01DBC5A0 581A050C */  jal         SetVol__6CSoundFii
/* 0108A4 01DBC5A4 00000000 */   nop
/* 0108A8 01DBC5A8 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0108AC 01DBC5AC 0D000524 */  addiu       $5, $0, 0xD
/* 0108B0 01DBC5B0 00010624 */  addiu       $6, $0, 0x100
/* 0108B4 01DBC5B4 581A050C */  jal         SetVol__6CSoundFii
/* 0108B8 01DBC5B8 00000000 */   nop
/* 0108BC 01DBC5BC 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0108C0 01DBC5C0 0C000524 */  addiu       $5, $0, 0xC
/* 0108C4 01DBC5C4 00010624 */  addiu       $6, $0, 0x100
/* 0108C8 01DBC5C8 581A050C */  jal         SetVol__6CSoundFii
/* 0108CC 01DBC5CC 00000000 */   nop
/* 0108D0 01DBC5D0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0108D4 01DBC5D4 01000524 */  addiu       $5, $0, 0x1
/* 0108D8 01DBC5D8 28360070 */  paddub      $6, $0, $0
/* 0108DC 01DBC5DC 8814050C */  jal         SQ_Play__6CSoundFii
/* 0108E0 01DBC5E0 00000000 */   nop
/* 0108E4 01DBC5E4 DD01023C */  lui         $2, %hi(LIT_399__6)
/* 0108E8 01DBC5E8 807C4224 */  addiu       $2, $2, %lo(LIT_399__6)
/* 0108EC 01DBC5EC 8001A427 */  addiu       $4, $29, 0x180
/* 0108F0 01DBC5F0 00004278 */  lq          $2, 0x0($2)
/* 0108F4 01DBC5F4 0000827C */  sq          $2, 0x0($4)
/* 0108F8 01DBC5F8 4842023C */  lui         $2, (0x42480000 >> 16)
/* 0108FC 01DBC5FC 00608244 */  mtc1        $2, $f12
/* 010900 01DBC600 FA43023C */  lui         $2, (0x43FA0000 >> 16)
/* 010904 01DBC604 00688244 */  mtc1        $2, $f13
/* 010908 01DBC608 0F000524 */  addiu       $5, $0, 0xF
/* 01090C 01DBC60C 10000624 */  addiu       $6, $0, 0x10
/* 010910 01DBC610 15000724 */  addiu       $7, $0, 0x15
/* 010914 01DBC614 D0C3760C */  jal         OpPlayVolPanSE__FPfffiii
/* 010918 01DBC618 00000000 */   nop
/* 01091C 01DBC61C DD01023C */  lui         $2, %hi(LIT_400__4)
/* 010920 01DBC620 907C4224 */  addiu       $2, $2, %lo(LIT_400__4)
/* 010924 01DBC624 9001A427 */  addiu       $4, $29, 0x190
/* 010928 01DBC628 00004278 */  lq          $2, 0x0($2)
/* 01092C 01DBC62C 0000827C */  sq          $2, 0x0($4)
/* 010930 01DBC630 4842023C */  lui         $2, (0x42480000 >> 16)
/* 010934 01DBC634 00608244 */  mtc1        $2, $f12
/* 010938 01DBC638 FA43023C */  lui         $2, (0x43FA0000 >> 16)
/* 01093C 01DBC63C 00688244 */  mtc1        $2, $f13
/* 010940 01DBC640 0F000524 */  addiu       $5, $0, 0xF
/* 010944 01DBC644 10000624 */  addiu       $6, $0, 0x10
/* 010948 01DBC648 16000724 */  addiu       $7, $0, 0x16
/* 01094C 01DBC64C D0C3760C */  jal         OpPlayVolPanSE__FPfffiii
/* 010950 01DBC650 00000000 */   nop
/* 010954 01DBC654 DD01023C */  lui         $2, %hi(LIT_401__4)
/* 010958 01DBC658 A07C4224 */  addiu       $2, $2, %lo(LIT_401__4)
/* 01095C 01DBC65C A001A427 */  addiu       $4, $29, 0x1A0
/* 010960 01DBC660 00004278 */  lq          $2, 0x0($2)
/* 010964 01DBC664 0000827C */  sq          $2, 0x0($4)
/* 010968 01DBC668 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 01096C 01DBC66C 00608244 */  mtc1        $2, $f12
/* 010970 01DBC670 9643023C */  lui         $2, (0x43960000 >> 16)
/* 010974 01DBC674 00688244 */  mtc1        $2, $f13
/* 010978 01DBC678 0F000524 */  addiu       $5, $0, 0xF
/* 01097C 01DBC67C 10000624 */  addiu       $6, $0, 0x10
/* 010980 01DBC680 18000724 */  addiu       $7, $0, 0x18
/* 010984 01DBC684 D0C3760C */  jal         OpPlayVolPanSE__FPfffiii
/* 010988 01DBC688 00000000 */   nop
/* 01098C 01DBC68C 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 010990 01DBC690 C817050C */  jal         Step__6CSoundFv
/* 010994 01DBC694 00000000 */   nop
/* 010998 01DBC698 FC9980AF */  sw          $0, -0x6604($28)
/* 01099C 01DBC69C 009A80AF */  sw          $0, -0x6600($28)
/* 0109A0 01DBC6A0 DF01013C */  lui         $1, %hi(CharaDataBuffer__2 + 0x8)
/* 0109A4 01DBC6A4 08FE20AC */  sw          $0, %lo(CharaDataBuffer__2 + 0x8)($1)
/* 0109A8 01DBC6A8 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x39A0)
/* 0109AC 01DBC6AC 70C14424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x39A0)
/* 0109B0 01DBC6B0 948B858F */  lw          $5, -0x746C($28)
/* 0109B4 01DBC6B4 DE01023C */  lui         $2, %hi(LIT_497__8)
/* 0109B8 01DBC6B8 E8EE4624 */  addiu       $6, $2, %lo(LIT_497__8)
/* 0109BC 01DBC6BC DF01023C */  lui         $2, %hi(CharaDataBuffer__2)
/* 0109C0 01DBC6C0 00FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2)
/* 0109C4 01DBC6C4 28460070 */  paddub      $8, $0, $0
/* 0109C8 01DBC6C8 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 0109CC 01DBC6CC 00000000 */   nop
/* 0109D0 01DBC6D0 B001A427 */  addiu       $4, $29, 0x1B0
/* 0109D4 01DBC6D4 509F040C */  jal         __ct__10CFrameAttrFv
/* 0109D8 01DBC6D8 00000000 */   nop
/* 0109DC 01DBC6DC B801A0A3 */  sb          $0, 0x1B8($29)
/* 0109E0 01DBC6E0 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3A5C)
/* 0109E4 01DBC6E4 2CC2248C */  lw          $4, %lo(MainMonstorUnit + 0x3A5C)($1)
/* 0109E8 01DBC6E8 B001A527 */  addiu       $5, $29, 0x1B0
/* 0109EC 01DBC6EC 01000624 */  addiu       $6, $0, 0x1
/* 0109F0 01DBC6F0 04000724 */  addiu       $7, $0, 0x4
/* 0109F4 01DBC6F4 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0109F8 01DBC6F8 00000000 */   nop
/* 0109FC 01DBC6FC 2041023C */  lui         $2, (0x41200000 >> 16)
/* 010A00 01DBC700 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3C90)
/* 010A04 01DBC704 60C422AC */  sw          $2, %lo(MainMonstorUnit + 0x3C90)($1)
/* 010A08 01DBC708 948280C7 */  lwc1        $f0, -0x7D6C($28)
/* 010A0C 01DBC70C E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3C98)
/* 010A10 01DBC710 68C420E4 */  swc1        $f0, %lo(MainMonstorUnit + 0x3C98)($1)
/* 010A14 01DBC714 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3CA4)
/* 010A18 01DBC718 74C420AC */  sw          $0, %lo(MainMonstorUnit + 0x3CA4)($1)
/* 010A1C 01DBC71C E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3CA8)
/* 010A20 01DBC720 78C420AC */  sw          $0, %lo(MainMonstorUnit + 0x3CA8)($1)
/* 010A24 01DBC724 E001023C */  lui         $2, %hi(MainMonstorUnit + 0xA3C0)
/* 010A28 01DBC728 902B4424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0xA3C0)
/* 010A2C 01DBC72C 948B858F */  lw          $5, -0x746C($28)
/* 010A30 01DBC730 DE01023C */  lui         $2, %hi(LIT_499__6)
/* 010A34 01DBC734 F8EE4624 */  addiu       $6, $2, %lo(LIT_499__6)
/* 010A38 01DBC738 DF01023C */  lui         $2, %hi(CharaDataBuffer__2)
/* 010A3C 01DBC73C 00FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2)
/* 010A40 01DBC740 28460070 */  paddub      $8, $0, $0
/* 010A44 01DBC744 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 010A48 01DBC748 00000000 */   nop
/* 010A4C 01DBC74C 1002A427 */  addiu       $4, $29, 0x210
/* 010A50 01DBC750 509F040C */  jal         __ct__10CFrameAttrFv
/* 010A54 01DBC754 00000000 */   nop
/* 010A58 01DBC758 1802A0A3 */  sb          $0, 0x218($29)
/* 010A5C 01DBC75C E001013C */  lui         $1, %hi(MainMonstorUnit + 0xA47C)
/* 010A60 01DBC760 4C2C248C */  lw          $4, %lo(MainMonstorUnit + 0xA47C)($1)
/* 010A64 01DBC764 1002A527 */  addiu       $5, $29, 0x210
/* 010A68 01DBC768 01000624 */  addiu       $6, $0, 0x1
/* 010A6C 01DBC76C 04000724 */  addiu       $7, $0, 0x4
/* 010A70 01DBC770 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 010A74 01DBC774 00000000 */   nop
/* 010A78 01DBC778 2041023C */  lui         $2, (0x41200000 >> 16)
/* 010A7C 01DBC77C E001013C */  lui         $1, %hi(MainMonstorUnit + 0xA6B0)
/* 010A80 01DBC780 802E22AC */  sw          $2, %lo(MainMonstorUnit + 0xA6B0)($1)
/* 010A84 01DBC784 948280C7 */  lwc1        $f0, -0x7D6C($28)
/* 010A88 01DBC788 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xA6B8)
/* 010A8C 01DBC78C 882E20E4 */  swc1        $f0, %lo(MainMonstorUnit + 0xA6B8)($1)
/* 010A90 01DBC790 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xA6C4)
/* 010A94 01DBC794 942E20AC */  sw          $0, %lo(MainMonstorUnit + 0xA6C4)($1)
/* 010A98 01DBC798 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xA6C8)
/* 010A9C 01DBC79C 982E20AC */  sw          $0, %lo(MainMonstorUnit + 0xA6C8)($1)
/* 010AA0 01DBC7A0 E001023C */  lui         $2, %hi(MainMonstorUnit + 0xB570)
/* 010AA4 01DBC7A4 403D4424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0xB570)
/* 010AA8 01DBC7A8 948B858F */  lw          $5, -0x746C($28)
/* 010AAC 01DBC7AC DE01023C */  lui         $2, %hi(LIT_500__5)
/* 010AB0 01DBC7B0 08EF4624 */  addiu       $6, $2, %lo(LIT_500__5)
/* 010AB4 01DBC7B4 DF01023C */  lui         $2, %hi(CharaDataBuffer__2)
/* 010AB8 01DBC7B8 00FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2)
/* 010ABC 01DBC7BC 28460070 */  paddub      $8, $0, $0
/* 010AC0 01DBC7C0 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 010AC4 01DBC7C4 00000000 */   nop
/* 010AC8 01DBC7C8 7002A427 */  addiu       $4, $29, 0x270
/* 010ACC 01DBC7CC 509F040C */  jal         __ct__10CFrameAttrFv
/* 010AD0 01DBC7D0 00000000 */   nop
/* 010AD4 01DBC7D4 7802A0A3 */  sb          $0, 0x278($29)
/* 010AD8 01DBC7D8 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xB62C)
/* 010ADC 01DBC7DC FC3D248C */  lw          $4, %lo(MainMonstorUnit + 0xB62C)($1)
/* 010AE0 01DBC7E0 7002A527 */  addiu       $5, $29, 0x270
/* 010AE4 01DBC7E4 01000624 */  addiu       $6, $0, 0x1
/* 010AE8 01DBC7E8 04000724 */  addiu       $7, $0, 0x4
/* 010AEC 01DBC7EC D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 010AF0 01DBC7F0 00000000 */   nop
/* 010AF4 01DBC7F4 2041023C */  lui         $2, (0x41200000 >> 16)
/* 010AF8 01DBC7F8 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xB860)
/* 010AFC 01DBC7FC 304022AC */  sw          $2, %lo(MainMonstorUnit + 0xB860)($1)
/* 010B00 01DBC800 948280C7 */  lwc1        $f0, -0x7D6C($28)
/* 010B04 01DBC804 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xB868)
/* 010B08 01DBC808 384020E4 */  swc1        $f0, %lo(MainMonstorUnit + 0xB868)($1)
/* 010B0C 01DBC80C E001013C */  lui         $1, %hi(MainMonstorUnit + 0xB874)
/* 010B10 01DBC810 444020AC */  sw          $0, %lo(MainMonstorUnit + 0xB874)($1)
/* 010B14 01DBC814 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xB878)
/* 010B18 01DBC818 484020AC */  sw          $0, %lo(MainMonstorUnit + 0xB878)($1)
/* 010B1C 01DBC81C E001023C */  lui         $2, %hi(MainMonstorUnit + 0x4B50)
/* 010B20 01DBC820 20D34424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x4B50)
/* 010B24 01DBC824 948B858F */  lw          $5, -0x746C($28)
/* 010B28 01DBC828 DE01023C */  lui         $2, %hi(LIT_501__5)
/* 010B2C 01DBC82C 18EF4624 */  addiu       $6, $2, %lo(LIT_501__5)
/* 010B30 01DBC830 DF01023C */  lui         $2, %hi(CharaDataBuffer__2)
/* 010B34 01DBC834 00FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2)
/* 010B38 01DBC838 28460070 */  paddub      $8, $0, $0
/* 010B3C 01DBC83C FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 010B40 01DBC840 00000000 */   nop
/* 010B44 01DBC844 D002A427 */  addiu       $4, $29, 0x2D0
/* 010B48 01DBC848 509F040C */  jal         __ct__10CFrameAttrFv
/* 010B4C 01DBC84C 00000000 */   nop
/* 010B50 01DBC850 D802A0A3 */  sb          $0, 0x2D8($29)
/* 010B54 01DBC854 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x4C0C)
/* 010B58 01DBC858 DCD3248C */  lw          $4, %lo(MainMonstorUnit + 0x4C0C)($1)
/* 010B5C 01DBC85C D002A527 */  addiu       $5, $29, 0x2D0
/* 010B60 01DBC860 01000624 */  addiu       $6, $0, 0x1
/* 010B64 01DBC864 04000724 */  addiu       $7, $0, 0x4
/* 010B68 01DBC868 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 010B6C 01DBC86C 00000000 */   nop
/* 010B70 01DBC870 2041023C */  lui         $2, (0x41200000 >> 16)
/* 010B74 01DBC874 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x4E40)
/* 010B78 01DBC878 10D622AC */  sw          $2, %lo(MainMonstorUnit + 0x4E40)($1)
/* 010B7C 01DBC87C 948280C7 */  lwc1        $f0, -0x7D6C($28)
/* 010B80 01DBC880 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x4E48)
/* 010B84 01DBC884 18D620E4 */  swc1        $f0, %lo(MainMonstorUnit + 0x4E48)($1)
/* 010B88 01DBC888 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x4E54)
/* 010B8C 01DBC88C 24D620AC */  sw          $0, %lo(MainMonstorUnit + 0x4E54)($1)
/* 010B90 01DBC890 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x4E58)
/* 010B94 01DBC894 28D620AC */  sw          $0, %lo(MainMonstorUnit + 0x4E58)($1)
/* 010B98 01DBC898 DF01013C */  lui         $1, %hi(CharaDataBuffer__2 + 0x68)
/* 010B9C 01DBC89C 68FE20AC */  sw          $0, %lo(CharaDataBuffer__2 + 0x68)($1)
/* 010BA0 01DBC8A0 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x5D00)
/* 010BA4 01DBC8A4 D0E44424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x5D00)
/* 010BA8 01DBC8A8 948B858F */  lw          $5, -0x746C($28)
/* 010BAC 01DBC8AC DE01023C */  lui         $2, %hi(LIT_502__4)
/* 010BB0 01DBC8B0 28EF4624 */  addiu       $6, $2, %lo(LIT_502__4)
/* 010BB4 01DBC8B4 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 010BB8 01DBC8B8 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 010BBC 01DBC8BC 28460070 */  paddub      $8, $0, $0
/* 010BC0 01DBC8C0 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 010BC4 01DBC8C4 00000000 */   nop
/* 010BC8 01DBC8C8 3003A427 */  addiu       $4, $29, 0x330
/* 010BCC 01DBC8CC 509F040C */  jal         __ct__10CFrameAttrFv
/* 010BD0 01DBC8D0 00000000 */   nop
/* 010BD4 01DBC8D4 3803A0A3 */  sb          $0, 0x338($29)
/* 010BD8 01DBC8D8 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x5DBC)
/* 010BDC 01DBC8DC 8CE5248C */  lw          $4, %lo(MainMonstorUnit + 0x5DBC)($1)
/* 010BE0 01DBC8E0 3003A527 */  addiu       $5, $29, 0x330
/* 010BE4 01DBC8E4 01000624 */  addiu       $6, $0, 0x1
/* 010BE8 01DBC8E8 04000724 */  addiu       $7, $0, 0x4
/* 010BEC 01DBC8EC D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 010BF0 01DBC8F0 00000000 */   nop
/* 010BF4 01DBC8F4 2041023C */  lui         $2, (0x41200000 >> 16)
/* 010BF8 01DBC8F8 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x5FF0)
/* 010BFC 01DBC8FC C0E722AC */  sw          $2, %lo(MainMonstorUnit + 0x5FF0)($1)
/* 010C00 01DBC900 948280C7 */  lwc1        $f0, -0x7D6C($28)
/* 010C04 01DBC904 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x5FF8)
/* 010C08 01DBC908 C8E720E4 */  swc1        $f0, %lo(MainMonstorUnit + 0x5FF8)($1)
/* 010C0C 01DBC90C E001013C */  lui         $1, %hi(MainMonstorUnit + 0x6004)
/* 010C10 01DBC910 D4E720AC */  sw          $0, %lo(MainMonstorUnit + 0x6004)($1)
/* 010C14 01DBC914 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x6008)
/* 010C18 01DBC918 D8E720AC */  sw          $0, %lo(MainMonstorUnit + 0x6008)($1)
/* 010C1C 01DBC91C B89880AF */  sw          $0, -0x6748($28)
/* 010C20 01DBC920 DE01023C */  lui         $2, %hi(LIT_503__4)
/* 010C24 01DBC924 40EF4424 */  addiu       $4, $2, %lo(LIT_503__4)
/* 010C28 01DBC928 00C5760C */  jal         OPAnalyz__FPc
/* 010C2C 01DBC92C 00000000 */   nop
/* 010C30 01DBC930 4CCA760C */  jal         OPMdsLoad__Fv
/* 010C34 01DBC934 00000000 */   nop
/* 010C38 01DBC938 68F9760C */  jal         MapLoad__Fv
/* 010C3C 01DBC93C 00000000 */   nop
/* 010C40 01DBC940 28860070 */  paddub      $16, $0, $0
/* 010C44 01DBC944 44000010 */  b           .L01DBCA58_2C2258
/* 010C48 01DBC948 00000000 */   nop
.L01DBC94C_2C214C:
/* 010C4C 01DBC94C C0101000 */  sll         $2, $16, 3
/* 010C50 01DBC950 21105000 */  addu        $2, $2, $16
/* 010C54 01DBC954 00890200 */  sll         $17, $2, 4
/* 010C58 01DBC958 E301023C */  lui         $2, %hi(Fuusya__2)
/* 010C5C 01DBC95C 70AB4224 */  addiu       $2, $2, %lo(Fuusya__2)
/* 010C60 01DBC960 21905100 */  addu        $18, $2, $17
/* 010C64 01DBC964 28264072 */  paddub      $4, $18, $0
/* 010C68 01DBC968 2497050C */  jal         Initialize__13OBJ_ANIME_SEQFv
/* 010C6C 01DBC96C 00000000 */   nop
/* 010C70 01DBC970 E301023C */  lui         $2, %hi(Fuusya__2 + 0x10)
/* 010C74 01DBC974 80AB4224 */  addiu       $2, $2, %lo(Fuusya__2 + 0x10)
/* 010C78 01DBC978 21105100 */  addu        $2, $2, $17
/* 010C7C 01DBC97C 000040AC */  sw          $0, 0x0($2)
/* 010C80 01DBC980 E301023C */  lui         $2, %hi(Fuusya__2 + 0x14)
/* 010C84 01DBC984 84AB4224 */  addiu       $2, $2, %lo(Fuusya__2 + 0x14)
/* 010C88 01DBC988 21105100 */  addu        $2, $2, $17
/* 010C8C 01DBC98C 000040AC */  sw          $0, 0x0($2)
/* 010C90 01DBC990 E301023C */  lui         $2, %hi(Fuusya__2 + 0x28)
/* 010C94 01DBC994 98AB4224 */  addiu       $2, $2, %lo(Fuusya__2 + 0x28)
/* 010C98 01DBC998 21105100 */  addu        $2, $2, $17
/* 010C9C 01DBC99C 000040AC */  sw          $0, 0x0($2)
/* 010CA0 01DBC9A0 E301023C */  lui         $2, %hi(Fuusya__2 + 0x24)
/* 010CA4 01DBC9A4 94AB4224 */  addiu       $2, $2, %lo(Fuusya__2 + 0x24)
/* 010CA8 01DBC9A8 21105100 */  addu        $2, $2, $17
/* 010CAC 01DBC9AC 000040AC */  sw          $0, 0x0($2)
/* 010CB0 01DBC9B0 E301023C */  lui         $2, %hi(Fuusya__2 + 0x20)
/* 010CB4 01DBC9B4 90AB4224 */  addiu       $2, $2, %lo(Fuusya__2 + 0x20)
/* 010CB8 01DBC9B8 21105100 */  addu        $2, $2, $17
/* 010CBC 01DBC9BC 000040AC */  sw          $0, 0x0($2)
/* 010CC0 01DBC9C0 E301023C */  lui         $2, %hi(Fuusya__2 + 0x38)
/* 010CC4 01DBC9C4 A8AB4224 */  addiu       $2, $2, %lo(Fuusya__2 + 0x38)
/* 010CC8 01DBC9C8 21105100 */  addu        $2, $2, $17
/* 010CCC 01DBC9CC 000040AC */  sw          $0, 0x0($2)
/* 010CD0 01DBC9D0 E301023C */  lui         $2, %hi(Fuusya__2 + 0x34)
/* 010CD4 01DBC9D4 A4AB4224 */  addiu       $2, $2, %lo(Fuusya__2 + 0x34)
/* 010CD8 01DBC9D8 21105100 */  addu        $2, $2, $17
/* 010CDC 01DBC9DC 000040AC */  sw          $0, 0x0($2)
/* 010CE0 01DBC9E0 E301023C */  lui         $2, %hi(Fuusya__2 + 0x30)
/* 010CE4 01DBC9E4 A0AB4224 */  addiu       $2, $2, %lo(Fuusya__2 + 0x30)
/* 010CE8 01DBC9E8 21105100 */  addu        $2, $2, $17
/* 010CEC 01DBC9EC 000040AC */  sw          $0, 0x0($2)
/* 010CF0 01DBC9F0 E301023C */  lui         $2, %hi(Fuusya__2 + 0x44)
/* 010CF4 01DBC9F4 B4AB4224 */  addiu       $2, $2, %lo(Fuusya__2 + 0x44)
/* 010CF8 01DBC9F8 21105100 */  addu        $2, $2, $17
/* 010CFC 01DBC9FC 000040AC */  sw          $0, 0x0($2)
/* 010D00 01DBCA00 E301023C */  lui         $2, %hi(Fuusya__2 + 0x40)
/* 010D04 01DBCA04 B0AB4224 */  addiu       $2, $2, %lo(Fuusya__2 + 0x40)
/* 010D08 01DBCA08 21105100 */  addu        $2, $2, $17
/* 010D0C 01DBCA0C 000040AC */  sw          $0, 0x0($2)
/* 010D10 01DBCA10 00BF033C */  lui         $3, (0xBF000000 >> 16)
/* 010D14 01DBCA14 E301023C */  lui         $2, %hi(Fuusya__2 + 0x48)
/* 010D18 01DBCA18 B8AB4224 */  addiu       $2, $2, %lo(Fuusya__2 + 0x48)
/* 010D1C 01DBCA1C 21105100 */  addu        $2, $2, $17
/* 010D20 01DBCA20 000043AC */  sw          $3, 0x0($2)
/* 010D24 01DBCA24 28264072 */  paddub      $4, $18, $0
/* 010D28 01DBCA28 DE01023C */  lui         $2, %hi(LIT_504__3)
/* 010D2C 01DBCA2C 50EF4524 */  addiu       $5, $2, %lo(LIT_504__3)
/* 010D30 01DBCA30 5A15040C */  jal         strcpy
/* 010D34 01DBCA34 00000000 */   nop
/* 010D38 01DBCA38 80181000 */  sll         $3, $16, 2
/* 010D3C 01DBCA3C D8998227 */  addiu       $2, $28, -0x6628
/* 010D40 01DBCA40 21104300 */  addu        $2, $2, $3
/* 010D44 01DBCA44 0000448C */  lw          $4, 0x0($2)
/* 010D48 01DBCA48 282E4072 */  paddub      $5, $18, $0
/* 010D4C 01DBCA4C 4097050C */  jal         InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ
/* 010D50 01DBCA50 00000000 */   nop
/* 010D54 01DBCA54 01001026 */  addiu       $16, $16, 0x1
.L01DBCA58_2C2258:
/* 010D58 01DBCA58 0200022A */  slti        $2, $16, 0x2
/* 010D5C 01DBCA5C BBFF4014 */  bnez        $2, .L01DBC94C_2C214C
/* 010D60 01DBCA60 00000000 */   nop
/* 010D64 01DBCA64 28860070 */  paddub      $16, $0, $0
/* 010D68 01DBCA68 3C000010 */  b           .L01DBCB5C_2C235C
/* 010D6C 01DBCA6C 00000000 */   nop
.L01DBCA70_2C2270:
/* 010D70 01DBCA70 C0101000 */  sll         $2, $16, 3
/* 010D74 01DBCA74 21105000 */  addu        $2, $2, $16
/* 010D78 01DBCA78 00890200 */  sll         $17, $2, 4
/* 010D7C 01DBCA7C E301023C */  lui         $2, %hi(Taimatsu__2)
/* 010D80 01DBCA80 F0AC4224 */  addiu       $2, $2, %lo(Taimatsu__2)
/* 010D84 01DBCA84 21905100 */  addu        $18, $2, $17
/* 010D88 01DBCA88 28264072 */  paddub      $4, $18, $0
/* 010D8C 01DBCA8C 2497050C */  jal         Initialize__13OBJ_ANIME_SEQFv
/* 010D90 01DBCA90 00000000 */   nop
/* 010D94 01DBCA94 03000324 */  addiu       $3, $0, 0x3
/* 010D98 01DBCA98 E301023C */  lui         $2, %hi(Taimatsu__2 + 0x10)
/* 010D9C 01DBCA9C 00AD4224 */  addiu       $2, $2, %lo(Taimatsu__2 + 0x10)
/* 010DA0 01DBCAA0 21105100 */  addu        $2, $2, $17
/* 010DA4 01DBCAA4 000043AC */  sw          $3, 0x0($2)
/* 010DA8 01DBCAA8 04000324 */  addiu       $3, $0, 0x4
/* 010DAC 01DBCAAC E301023C */  lui         $2, %hi(Taimatsu__2 + 0x14)
/* 010DB0 01DBCAB0 04AD4224 */  addiu       $2, $2, %lo(Taimatsu__2 + 0x14)
/* 010DB4 01DBCAB4 21105100 */  addu        $2, $2, $17
/* 010DB8 01DBCAB8 000043AC */  sw          $3, 0x0($2)
/* 010DBC 01DBCABC A042033C */  lui         $3, (0x42A00000 >> 16)
/* 010DC0 01DBCAC0 E301023C */  lui         $2, %hi(Taimatsu__2 + 0x28)
/* 010DC4 01DBCAC4 18AD4224 */  addiu       $2, $2, %lo(Taimatsu__2 + 0x28)
/* 010DC8 01DBCAC8 21105100 */  addu        $2, $2, $17
/* 010DCC 01DBCACC 000043AC */  sw          $3, 0x0($2)
/* 010DD0 01DBCAD0 E301023C */  lui         $2, %hi(Taimatsu__2 + 0x24)
/* 010DD4 01DBCAD4 14AD4224 */  addiu       $2, $2, %lo(Taimatsu__2 + 0x24)
/* 010DD8 01DBCAD8 21105100 */  addu        $2, $2, $17
/* 010DDC 01DBCADC 000043AC */  sw          $3, 0x0($2)
/* 010DE0 01DBCAE0 E301023C */  lui         $2, %hi(Taimatsu__2 + 0x20)
/* 010DE4 01DBCAE4 10AD4224 */  addiu       $2, $2, %lo(Taimatsu__2 + 0x20)
/* 010DE8 01DBCAE8 21105100 */  addu        $2, $2, $17
/* 010DEC 01DBCAEC 000043AC */  sw          $3, 0x0($2)
/* 010DF0 01DBCAF0 0043033C */  lui         $3, (0x43000000 >> 16)
/* 010DF4 01DBCAF4 E301023C */  lui         $2, %hi(Taimatsu__2 + 0x38)
/* 010DF8 01DBCAF8 28AD4224 */  addiu       $2, $2, %lo(Taimatsu__2 + 0x38)
/* 010DFC 01DBCAFC 21105100 */  addu        $2, $2, $17
/* 010E00 01DBCB00 000043AC */  sw          $3, 0x0($2)
/* 010E04 01DBCB04 E301023C */  lui         $2, %hi(Taimatsu__2 + 0x34)
/* 010E08 01DBCB08 24AD4224 */  addiu       $2, $2, %lo(Taimatsu__2 + 0x34)
/* 010E0C 01DBCB0C 21105100 */  addu        $2, $2, $17
/* 010E10 01DBCB10 000043AC */  sw          $3, 0x0($2)
/* 010E14 01DBCB14 E301023C */  lui         $2, %hi(Taimatsu__2 + 0x30)
/* 010E18 01DBCB18 20AD4224 */  addiu       $2, $2, %lo(Taimatsu__2 + 0x30)
/* 010E1C 01DBCB1C 21105100 */  addu        $2, $2, $17
/* 010E20 01DBCB20 000043AC */  sw          $3, 0x0($2)
/* 010E24 01DBCB24 28264072 */  paddub      $4, $18, $0
/* 010E28 01DBCB28 DE01023C */  lui         $2, %hi(LIT_505__6)
/* 010E2C 01DBCB2C 58EF4524 */  addiu       $5, $2, %lo(LIT_505__6)
/* 010E30 01DBCB30 5A15040C */  jal         strcpy
/* 010E34 01DBCB34 00000000 */   nop
/* 010E38 01DBCB38 80181000 */  sll         $3, $16, 2
/* 010E3C 01DBCB3C E301023C */  lui         $2, %hi(TaimatsuFrame__2)
/* 010E40 01DBCB40 C0AC4224 */  addiu       $2, $2, %lo(TaimatsuFrame__2)
/* 010E44 01DBCB44 21104300 */  addu        $2, $2, $3
/* 010E48 01DBCB48 0000448C */  lw          $4, 0x0($2)
/* 010E4C 01DBCB4C 282E4072 */  paddub      $5, $18, $0
/* 010E50 01DBCB50 4097050C */  jal         InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ
/* 010E54 01DBCB54 00000000 */   nop
/* 010E58 01DBCB58 01001026 */  addiu       $16, $16, 0x1
.L01DBCB5C_2C235C:
/* 010E5C 01DBCB5C 0800022A */  slti        $2, $16, 0x8
/* 010E60 01DBCB60 C3FF4014 */  bnez        $2, .L01DBCA70_2C2270
/* 010E64 01DBCB64 00000000 */   nop
/* 010E68 01DBCB68 E301023C */  lui         $2, %hi(Taimatsu__2 + 0x480)
/* 010E6C 01DBCB6C 70B14424 */  addiu       $4, $2, %lo(Taimatsu__2 + 0x480)
/* 010E70 01DBCB70 2497050C */  jal         Initialize__13OBJ_ANIME_SEQFv
/* 010E74 01DBCB74 00000000 */   nop
/* 010E78 01DBCB78 03000224 */  addiu       $2, $0, 0x3
/* 010E7C 01DBCB7C E301013C */  lui         $1, %hi(Taimatsu__2 + 0x490)
/* 010E80 01DBCB80 80B122AC */  sw          $2, %lo(Taimatsu__2 + 0x490)($1)
/* 010E84 01DBCB84 04000224 */  addiu       $2, $0, 0x4
/* 010E88 01DBCB88 E301013C */  lui         $1, %hi(Taimatsu__2 + 0x494)
/* 010E8C 01DBCB8C 84B122AC */  sw          $2, %lo(Taimatsu__2 + 0x494)($1)
/* 010E90 01DBCB90 DC42023C */  lui         $2, (0x42DC0000 >> 16)
/* 010E94 01DBCB94 E301013C */  lui         $1, %hi(Taimatsu__2 + 0x4A0)
/* 010E98 01DBCB98 90B122AC */  sw          $2, %lo(Taimatsu__2 + 0x4A0)($1)
/* 010E9C 01DBCB9C F042023C */  lui         $2, (0x42F00000 >> 16)
/* 010EA0 01DBCBA0 E301013C */  lui         $1, %hi(Taimatsu__2 + 0x4A8)
/* 010EA4 01DBCBA4 98B122AC */  sw          $2, %lo(Taimatsu__2 + 0x4A8)($1)
/* 010EA8 01DBCBA8 E301013C */  lui         $1, %hi(Taimatsu__2 + 0x4A4)
/* 010EAC 01DBCBAC 94B122AC */  sw          $2, %lo(Taimatsu__2 + 0x4A4)($1)
/* 010EB0 01DBCBB0 0043023C */  lui         $2, (0x43000000 >> 16)
/* 010EB4 01DBCBB4 E301013C */  lui         $1, %hi(Taimatsu__2 + 0x4B0)
/* 010EB8 01DBCBB8 A0B122AC */  sw          $2, %lo(Taimatsu__2 + 0x4B0)($1)
/* 010EBC 01DBCBBC FA42023C */  lui         $2, (0x42FA0000 >> 16)
/* 010EC0 01DBCBC0 E301013C */  lui         $1, %hi(Taimatsu__2 + 0x4B8)
/* 010EC4 01DBCBC4 A8B122AC */  sw          $2, %lo(Taimatsu__2 + 0x4B8)($1)
/* 010EC8 01DBCBC8 E301013C */  lui         $1, %hi(Taimatsu__2 + 0x4B4)
/* 010ECC 01DBCBCC A4B122AC */  sw          $2, %lo(Taimatsu__2 + 0x4B4)($1)
/* 010ED0 01DBCBD0 E301023C */  lui         $2, %hi(Taimatsu__2 + 0x480)
/* 010ED4 01DBCBD4 70B14424 */  addiu       $4, $2, %lo(Taimatsu__2 + 0x480)
/* 010ED8 01DBCBD8 DE01023C */  lui         $2, %hi(LIT_506__5)
/* 010EDC 01DBCBDC 60EF4524 */  addiu       $5, $2, %lo(LIT_506__5)
/* 010EE0 01DBCBE0 5A15040C */  jal         strcpy
/* 010EE4 01DBCBE4 00000000 */   nop
/* 010EE8 01DBCBE8 E301013C */  lui         $1, %hi(TaimatsuFrame__2 + 0x20)
/* 010EEC 01DBCBEC E0AC248C */  lw          $4, %lo(TaimatsuFrame__2 + 0x20)($1)
/* 010EF0 01DBCBF0 E301023C */  lui         $2, %hi(Taimatsu__2 + 0x480)
/* 010EF4 01DBCBF4 70B14524 */  addiu       $5, $2, %lo(Taimatsu__2 + 0x480)
/* 010EF8 01DBCBF8 4097050C */  jal         InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ
/* 010EFC 01DBCBFC 00000000 */   nop
/* 010F00 01DBCC00 DD01023C */  lui         $2, %hi(LIT_412__4)
/* 010F04 01DBCC04 B07C4224 */  addiu       $2, $2, %lo(LIT_412__4)
/* 010F08 01DBCC08 9003A527 */  addiu       $5, $29, 0x390
/* 010F0C 01DBCC0C 00004278 */  lq          $2, 0x0($2)
/* 010F10 01DBCC10 0000A27C */  sq          $2, 0x0($5)
/* 010F14 01DBCC14 DD01023C */  lui         $2, %hi(LIT_413__4)
/* 010F18 01DBCC18 C07C4224 */  addiu       $2, $2, %lo(LIT_413__4)
/* 010F1C 01DBCC1C A003A627 */  addiu       $6, $29, 0x3A0
/* 010F20 01DBCC20 00004278 */  lq          $2, 0x0($2)
/* 010F24 01DBCC24 0000C27C */  sq          $2, 0x0($6)
/* 010F28 01DBCC28 DD01023C */  lui         $2, %hi(LIT_414__8)
/* 010F2C 01DBCC2C D07C4224 */  addiu       $2, $2, %lo(LIT_414__8)
/* 010F30 01DBCC30 B003A727 */  addiu       $7, $29, 0x3B0
/* 010F34 01DBCC34 00004278 */  lq          $2, 0x0($2)
/* 010F38 01DBCC38 0000E27C */  sq          $2, 0x0($7)
/* 010F3C 01DBCC3C DD01023C */  lui         $2, %hi(LIT_415__6)
/* 010F40 01DBCC40 E07C4224 */  addiu       $2, $2, %lo(LIT_415__6)
/* 010F44 01DBCC44 C003A827 */  addiu       $8, $29, 0x3C0
/* 010F48 01DBCC48 00004278 */  lq          $2, 0x0($2)
/* 010F4C 01DBCC4C 0000027D */  sq          $2, 0x0($8)
/* 010F50 01DBCC50 E301023C */  lui         $2, %hi(Water)
/* 010F54 01DBCC54 B0B34424 */  addiu       $4, $2, %lo(Water)
/* 010F58 01DBCC58 B884050C */  jal         SetVertex__6CWaterFPfPfPfPf
/* 010F5C 01DBCC5C 00000000 */   nop
/* 010F60 01DBCC60 00608044 */  mtc1        $0, $f12
/* 010F64 01DBCC64 20C1023C */  lui         $2, (0xC1200000 >> 16)
/* 010F68 01DBCC68 00688244 */  mtc1        $2, $f13
/* 010F6C 01DBCC6C 00000000 */  nop
/* 010F70 01DBCC70 86630046 */  mov.s       $f14, $f12
/* 010F74 01DBCC74 E301023C */  lui         $2, %hi(Water + 0xB0)
/* 010F78 01DBCC78 60B44424 */  addiu       $4, $2, %lo(Water + 0xB0)
/* 010F7C 01DBCC7C A09F040C */  jal         SetPosition__6CFrameFfff
/* 010F80 01DBCC80 00000000 */   nop
/* 010F84 01DBCC84 E301023C */  lui         $2, %hi(Water)
/* 010F88 01DBCC88 B0B34424 */  addiu       $4, $2, %lo(Water)
/* 010F8C 01DBCC8C 20000524 */  addiu       $5, $0, 0x20
/* 010F90 01DBCC90 2836A070 */  paddub      $6, $5, $0
/* 010F94 01DBCC94 DF01023C */  lui         $2, %hi(WaterBuffer__2)
/* 010F98 01DBCC98 C0FE4724 */  addiu       $7, $2, %lo(WaterBuffer__2)
/* 010F9C 01DBCC9C 0485050C */  jal         SetSize__6CWaterFiiP14CDataAlloc2_1_
/* 010FA0 01DBCCA0 00000000 */   nop
/* 010FA4 01DBCCA4 00708044 */  mtc1        $0, $f14
/* 010FA8 01DBCCA8 0040023C */  lui         $2, (0x40000000 >> 16)
/* 010FAC 01DBCCAC 00788244 */  mtc1        $2, $f15
/* 010FB0 01DBCCB0 E301023C */  lui         $2, %hi(Water)
/* 010FB4 01DBCCB4 B0B34424 */  addiu       $4, $2, %lo(Water)
/* 010FB8 01DBCCB8 80808CC7 */  lwc1        $f12, -0x7F80($28)
/* 010FBC 01DBCCBC 88838DC7 */  lwc1        $f13, -0x7C78($28)
/* 010FC0 01DBCCC0 E881050C */  jal         SetParam__6CWaterFffff
/* 010FC4 01DBCCC4 00000000 */   nop
/* 010FC8 01DBCCC8 E301023C */  lui         $2, %hi(Water)
/* 010FCC 01DBCCCC B0B34424 */  addiu       $4, $2, %lo(Water)
/* 010FD0 01DBCCD0 80000524 */  addiu       $5, $0, 0x80
/* 010FD4 01DBCCD4 2836A070 */  paddub      $6, $5, $0
/* 010FD8 01DBCCD8 283EA070 */  paddub      $7, $5, $0
/* 010FDC 01DBCCDC 2846A070 */  paddub      $8, $5, $0
/* 010FE0 01DBCCE0 F081050C */  jal         SetColor__6CWaterFUcUcUcUc
/* 010FE4 01DBCCE4 00000000 */   nop
/* 010FE8 01DBCCE8 282E0070 */  paddub      $5, $0, $0
/* 010FEC 01DBCCEC 12000010 */  b           .L01DBCD38_2C2538
/* 010FF0 01DBCCF0 00000000 */   nop
.L01DBCCF4_2C24F4:
/* 010FF4 01DBCCF4 28360070 */  paddub      $6, $0, $0
/* 010FF8 01DBCCF8 0B000010 */  b           .L01DBCD28_2C2528
/* 010FFC 01DBCCFC 00000000 */   nop
.L01DBCD00_2C2500:
/* 011000 01DBCD00 C0180500 */  sll         $3, $5, 3
/* 011004 01DBCD04 21186500 */  addu        $3, $3, $5
/* 011008 01DBCD08 40210300 */  sll         $4, $3, 5
/* 01100C 01DBCD0C E301033C */  lui         $3, %hi(CBomb + 0x100)
/* 011010 01DBCD10 90BB6324 */  addiu       $3, $3, %lo(CBomb + 0x100)
/* 011014 01DBCD14 21206400 */  addu        $4, $3, $4
/* 011018 01DBCD18 80180600 */  sll         $3, $6, 2
/* 01101C 01DBCD1C 21186400 */  addu        $3, $3, $4
/* 011020 01DBCD20 000060AC */  sw          $0, 0x0($3)
/* 011024 01DBCD24 0100C624 */  addiu       $6, $6, 0x1
.L01DBCD28_2C2528:
/* 011028 01DBCD28 0800C328 */  slti        $3, $6, 0x8
/* 01102C 01DBCD2C F4FF6014 */  bnez        $3, .L01DBCD00_2C2500
/* 011030 01DBCD30 00000000 */   nop
/* 011034 01DBCD34 0100A524 */  addiu       $5, $5, 0x1
.L01DBCD38_2C2538:
/* 011038 01DBCD38 0300A328 */  slti        $3, $5, 0x3
/* 01103C 01DBCD3C EDFF6014 */  bnez        $3, .L01DBCCF4_2C24F4
/* 011040 01DBCD40 00000000 */   nop
/* 011044 01DBCD44 282E0070 */  paddub      $5, $0, $0
/* 011048 01DBCD48 0F000010 */  b           .L01DBCD88_2C2588
/* 01104C 01DBCD4C 00000000 */   nop
.L01DBCD50_2C2550:
/* 011050 01DBCD50 C0180500 */  sll         $3, $5, 3
/* 011054 01DBCD54 21206500 */  addu        $4, $3, $5
/* 011058 01DBCD58 80180400 */  sll         $3, $4, 2
/* 01105C 01DBCD5C 23186400 */  subu        $3, $3, $4
/* 011060 01DBCD60 80210300 */  sll         $4, $3, 6
/* 011064 01DBCD64 E301033C */  lui         $3, %hi(CBeem + 0x6A4)
/* 011068 01DBCD68 94C46324 */  addiu       $3, $3, %lo(CBeem + 0x6A4)
/* 01106C 01DBCD6C 21186400 */  addu        $3, $3, $4
/* 011070 01DBCD70 000060AC */  sw          $0, 0x0($3)
/* 011074 01DBCD74 E301033C */  lui         $3, %hi(CBeem + 0x6A0)
/* 011078 01DBCD78 90C46324 */  addiu       $3, $3, %lo(CBeem + 0x6A0)
/* 01107C 01DBCD7C 21186400 */  addu        $3, $3, $4
/* 011080 01DBCD80 000060AC */  sw          $0, 0x0($3)
/* 011084 01DBCD84 0100A524 */  addiu       $5, $5, 0x1
.L01DBCD88_2C2588:
/* 011088 01DBCD88 0300A328 */  slti        $3, $5, 0x3
/* 01108C 01DBCD8C F0FF6014 */  bnez        $3, .L01DBCD50_2C2550
/* 011090 01DBCD90 00000000 */   nop
/* 011094 01DBCD94 F09980AF */  sw          $0, -0x6610($28)
/* 011098 01DBCD98 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 01109C 01DBCD9C F49983AF */  sw          $3, -0x660C($28)
/* 0110A0 01DBCDA0 DE01013C */  lui         $1, %hi(CScript__2 + 0x20)
/* 0110A4 01DBCDA4 201B20AC */  sw          $0, %lo(CScript__2 + 0x20)($1)
/* 0110A8 01DBCDA8 5000BF7B */  lq          $31, 0x50($29)
/* 0110AC 01DBCDAC 4000B47B */  lq          $20, 0x40($29)
/* 0110B0 01DBCDB0 3000B37B */  lq          $19, 0x30($29)
/* 0110B4 01DBCDB4 2000B27B */  lq          $18, 0x20($29)
/* 0110B8 01DBCDB8 1000B17B */  lq          $17, 0x10($29)
/* 0110BC 01DBCDBC 0000B07B */  lq          $16, 0x0($29)
/* 0110C0 01DBCDC0 D003BD27 */  addiu       $29, $29, 0x3D0
/* 0110C4 01DBCDC4 0800E003 */  jr          $31
/* 0110C8 01DBCDC8 00000000 */   nop
/* 0110CC 01DBCDCC 00000000 */  nop
