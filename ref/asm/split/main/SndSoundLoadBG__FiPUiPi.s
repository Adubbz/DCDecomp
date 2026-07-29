.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndSoundLoadBG__FiPUiPi
/* 05A680 0015A580 40FFBD27 */  addiu       $29, $29, -0xC0
/* 05A684 0015A584 3000BF7F */  sq          $31, 0x30($29)
/* 05A688 0015A588 2000B27F */  sq          $18, 0x20($29)
/* 05A68C 0015A58C 1000B17F */  sq          $17, 0x10($29)
/* 05A690 0015A590 0000B07F */  sq          $16, 0x0($29)
/* 05A694 0015A594 28968070 */  paddub      $18, $4, $0
/* 05A698 0015A598 288EA070 */  paddub      $17, $5, $0
/* 05A69C 0015A59C 2886C070 */  paddub      $16, $6, $0
/* 05A6A0 0015A5A0 02000012 */  beqz        $16, .L0015A5AC
/* 05A6A4 0015A5A4 00000000 */   nop
/* 05A6A8 0015A5A8 000000AE */  sw          $0, 0x0($16)
.L0015A5AC:
/* 05A6AC 0015A5AC FC8D828F */  lw          $2, -0x7204($28)
/* 05A6B0 0015A5B0 04005214 */  bne         $2, $18, .L0015A5C4
/* 05A6B4 0015A5B4 00000000 */   nop
/* 05A6B8 0015A5B8 28160070 */  paddub      $2, $0, $0
/* 05A6BC 0015A5BC 14000010 */  b           .L0015A610
/* 05A6C0 0015A5C0 00000000 */   nop
.L0015A5C4:
/* 05A6C4 0015A5C4 28264072 */  paddub      $4, $18, $0
/* 05A6C8 0015A5C8 4000A527 */  addiu       $5, $29, 0x40
/* 05A6CC 0015A5CC D001023C */  lui         $2, %hi(snd_cfg_file)
/* 05A6D0 0015A5D0 B0B44624 */  addiu       $6, $2, %lo(snd_cfg_file)
/* 05A6D4 0015A5D4 9068050C */  jal         GetSoundFile__FiPcPc
/* 05A6D8 0015A5D8 00000000 */   nop
/* 05A6DC 0015A5DC 4000A427 */  addiu       $4, $29, 0x40
/* 05A6E0 0015A5E0 282E2072 */  paddub      $5, $17, $0
/* 05A6E4 0015A5E4 28360072 */  paddub      $6, $16, $0
/* 05A6E8 0015A5E8 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 05A6EC 0015A5EC 00000000 */   nop
/* 05A6F0 0015A5F0 06004010 */  beqz        $2, .L0015A60C
/* 05A6F4 0015A5F4 00000000 */   nop
/* 05A6F8 0015A5F8 408E92AF */  sw          $18, -0x71C0($28)
/* 05A6FC 0015A5FC 448E91AF */  sw          $17, -0x71BC($28)
/* 05A700 0015A600 01000224 */  addiu       $2, $0, 0x1
/* 05A704 0015A604 02000010 */  b           .L0015A610
/* 05A708 0015A608 00000000 */   nop
.L0015A60C:
/* 05A70C 0015A60C 28160070 */  paddub      $2, $0, $0
.L0015A610:
/* 05A710 0015A610 3000BF7B */  lq          $31, 0x30($29)
/* 05A714 0015A614 2000B27B */  lq          $18, 0x20($29)
/* 05A718 0015A618 1000B17B */  lq          $17, 0x10($29)
/* 05A71C 0015A61C 0000B07B */  lq          $16, 0x0($29)
/* 05A720 0015A620 C000BD27 */  addiu       $29, $29, 0xC0
/* 05A724 0015A624 0800E003 */  jr          $31
/* 05A728 0015A628 00000000 */   nop
/* 05A72C 0015A62C 00000000 */  nop
