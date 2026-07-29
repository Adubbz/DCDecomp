.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdLoadMainChara__FPcPcP14CDataAlloc2_1_
/* 081580 00181480 60FFBD27 */  addiu       $29, $29, -0xA0
/* 081584 00181484 3000BF7F */  sq          $31, 0x30($29)
/* 081588 00181488 2000B27F */  sq          $18, 0x20($29)
/* 08158C 0018148C 1000B17F */  sq          $17, 0x10($29)
/* 081590 00181490 0000B07F */  sq          $16, 0x0($29)
/* 081594 00181494 2896A070 */  paddub      $18, $5, $0
/* 081598 00181498 288EC070 */  paddub      $17, $6, $0
/* 08159C 0018149C 05002016 */  bnez        $17, .L001814B4
/* 0815A0 001814A0 00000000 */   nop
/* 0815A4 001814A4 D401023C */  lui         $2, %hi(CharaBuffer)
/* 0815A8 001814A8 60A05124 */  addiu       $17, $2, %lo(CharaBuffer)
/* 0815AC 001814AC D401013C */  lui         $1, %hi(CharaBuffer + 0x8)
/* 0815B0 001814B0 68A020AC */  sw          $0, %lo(CharaBuffer + 0x8)($1)
.L001814B4:
/* 0815B4 001814B4 948B858F */  lw          $5, -0x746C($28)
/* 0815B8 001814B8 28360070 */  paddub      $6, $0, $0
/* 0815BC 001814BC D8FC040C */  jal         LoadFile__FPcPvPi
/* 0815C0 001814C0 00000000 */   nop
/* 0815C4 001814C4 D301023C */  lui         $2, %hi(MainChara)
/* 0815C8 001814C8 C0314424 */  addiu       $4, $2, %lo(MainChara)
/* 0815CC 001814CC 30E7040C */  jal         Initialize__10CMainCharaFv
/* 0815D0 001814D0 00000000 */   nop
/* 0815D4 001814D4 28860070 */  paddub      $16, $0, $0
/* 0815D8 001814D8 0C000010 */  b           .L0018150C
/* 0815DC 001814DC 00000000 */   nop
.L001814E0:
/* 0815E0 001814E0 80101000 */  sll         $2, $16, 2
/* 0815E4 001814E4 21105000 */  addu        $2, $2, $16
/* 0815E8 001814E8 40100200 */  sll         $2, $2, 1
/* 0815EC 001814EC 21105000 */  addu        $2, $2, $16
/* 0815F0 001814F0 C0180200 */  sll         $3, $2, 3
/* 0815F4 001814F4 D301023C */  lui         $2, %hi(CharaTexAnimeData)
/* 0815F8 001814F8 50744224 */  addiu       $2, $2, %lo(CharaTexAnimeData)
/* 0815FC 001814FC 21204300 */  addu        $4, $2, $3
/* 081600 00181500 349C050C */  jal         Initialize__13CTexAnimeDataFv
/* 081604 00181504 00000000 */   nop
/* 081608 00181508 01001026 */  addiu       $16, $16, 0x1
.L0018150C:
/* 08160C 0018150C 8000022A */  slti        $2, $16, 0x80
/* 081610 00181510 F3FF4014 */  bnez        $2, .L001814E0
/* 081614 00181514 00000000 */   nop
/* 081618 00181518 D301023C */  lui         $2, %hi(MainChara)
/* 08161C 0018151C C0314424 */  addiu       $4, $2, %lo(MainChara)
/* 081620 00181520 D301023C */  lui         $2, %hi(CharaTexAnimeData)
/* 081624 00181524 50744524 */  addiu       $5, $2, %lo(CharaTexAnimeData)
/* 081628 00181528 80000624 */  addiu       $6, $0, 0x80
/* 08162C 0018152C FCDF040C */  jal         InitializeTexAnime__10CCharacterFP13CTexAnimeDatai
/* 081630 00181530 00000000 */   nop
/* 081634 00181534 D301023C */  lui         $2, %hi(MainChara)
/* 081638 00181538 C0314424 */  addiu       $4, $2, %lo(MainChara)
/* 08163C 0018153C 948B858F */  lw          $5, -0x746C($28)
/* 081640 00181540 28364072 */  paddub      $6, $18, $0
/* 081644 00181544 283E2072 */  paddub      $7, $17, $0
/* 081648 00181548 08000824 */  addiu       $8, $0, 0x8
/* 08164C 0018154C 284E2072 */  paddub      $9, $17, $0
/* 081650 00181550 28560070 */  paddub      $10, $0, $0
/* 081654 00181554 14E6040C */  jal         LoadPackData2__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_i
/* 081658 00181558 00000000 */   nop
/* 08165C 0018155C 4000A427 */  addiu       $4, $29, 0x40
/* 081660 00181560 509F040C */  jal         __ct__10CFrameAttrFv
/* 081664 00181564 00000000 */   nop
/* 081668 00181568 4800A0A3 */  sb          $0, 0x48($29)
/* 08166C 0018156C 01000624 */  addiu       $6, $0, 0x1
/* 081670 00181570 4C00A6A3 */  sb          $6, 0x4C($29)
/* 081674 00181574 D301013C */  lui         $1, %hi(MainChara + 0xBC)
/* 081678 00181578 7C32248C */  lw          $4, %lo(MainChara + 0xBC)($1)
/* 08167C 0018157C 4000A527 */  addiu       $5, $29, 0x40
/* 081680 00181580 04000724 */  addiu       $7, $0, 0x4
/* 081684 00181584 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 081688 00181588 00000000 */   nop
/* 08168C 0018158C 00608044 */  mtc1        $0, $f12
/* 081690 00181590 00000000 */  nop
/* 081694 00181594 46630046 */  mov.s       $f13, $f12
/* 081698 00181598 86630046 */  mov.s       $f14, $f12
/* 08169C 0018159C D301023C */  lui         $2, %hi(MainChara)
/* 0816A0 001815A0 C0314424 */  addiu       $4, $2, %lo(MainChara)
/* 0816A4 001815A4 ECE3040C */  jal         SetPosition__10CCharacterFfff
/* 0816A8 001815A8 00000000 */   nop
/* 0816AC 001815AC D301033C */  lui         $3, %hi(MainChara)
/* 0816B0 001815B0 C0316324 */  addiu       $3, $3, %lo(MainChara)
/* 0816B4 001815B4 648783AF */  sw          $3, -0x789C($28)
/* 0816B8 001815B8 3000BF7B */  lq          $31, 0x30($29)
/* 0816BC 001815BC 2000B27B */  lq          $18, 0x20($29)
/* 0816C0 001815C0 1000B17B */  lq          $17, 0x10($29)
/* 0816C4 001815C4 0000B07B */  lq          $16, 0x0($29)
/* 0816C8 001815C8 A000BD27 */  addiu       $29, $29, 0xA0
/* 0816CC 001815CC 0800E003 */  jr          $31
/* 0816D0 001815D0 00000000 */   nop
/* 0816D4 001815D4 00000000 */  nop
/* 0816D8 001815D8 00000000 */  nop
/* 0816DC 001815DC 00000000 */  nop
