.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndSoundLoadBG__FiPUiPi
/* 5A680 0015A580 40FFBD27 */  addiu      $sp, $sp, -0xC0
/* 5A684 0015A584 3000BF7F */  sq         $31, 0x30($sp)
/* 5A688 0015A588 2000B27F */  sq         $18, 0x20($sp)
/* 5A68C 0015A58C 1000B17F */  sq         $17, 0x10($sp)
/* 5A690 0015A590 0000B07F */  sq         $16, 0x0($sp)
/* 5A694 0015A594 28968070 */  paddub     $18, $4, $0
/* 5A698 0015A598 288EA070 */  paddub     $17, $5, $0
/* 5A69C 0015A59C 2886C070 */  paddub     $16, $6, $0
/* 5A6A0 0015A5A0 02000012 */  beqz       $16, .L0015A5AC
/* 5A6A4 0015A5A4 00000000 */   nop
/* 5A6A8 0015A5A8 000000AE */  sw         $0, 0x0($16)
.L0015A5AC:
/* 5A6AC 0015A5AC FC8D828F */  lw         $2, -0x7204($gp)
/* 5A6B0 0015A5B0 04005214 */  bne        $2, $18, .L0015A5C4
/* 5A6B4 0015A5B4 00000000 */   nop
/* 5A6B8 0015A5B8 28160070 */  paddub     $2, $0, $0
/* 5A6BC 0015A5BC 14000010 */  b          .L0015A610
/* 5A6C0 0015A5C0 00000000 */   nop
.L0015A5C4:
/* 5A6C4 0015A5C4 28264072 */  paddub     $4, $18, $0
/* 5A6C8 0015A5C8 4000A527 */  addiu      $5, $sp, 0x40
/* 5A6CC 0015A5CC D001023C */  lui        $2, %hi(snd_cfg_file)
/* 5A6D0 0015A5D0 B0B44624 */  addiu      $6, $2, %lo(snd_cfg_file)
/* 5A6D4 0015A5D4 9068050C */  jal        GetSoundFile__FiPcPc
/* 5A6D8 0015A5D8 00000000 */   nop
/* 5A6DC 0015A5DC 4000A427 */  addiu      $4, $sp, 0x40
/* 5A6E0 0015A5E0 282E2072 */  paddub     $5, $17, $0
/* 5A6E4 0015A5E4 28360072 */  paddub     $6, $16, $0
/* 5A6E8 0015A5E8 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 5A6EC 0015A5EC 00000000 */   nop
/* 5A6F0 0015A5F0 06004010 */  beqz       $2, .L0015A60C
/* 5A6F4 0015A5F4 00000000 */   nop
/* 5A6F8 0015A5F8 408E92AF */  sw         $18, -0x71C0($gp)
/* 5A6FC 0015A5FC 448E91AF */  sw         $17, -0x71BC($gp)
/* 5A700 0015A600 01000224 */  addiu      $2, $0, 0x1
/* 5A704 0015A604 02000010 */  b          .L0015A610
/* 5A708 0015A608 00000000 */   nop
.L0015A60C:
/* 5A70C 0015A60C 28160070 */  paddub     $2, $0, $0
.L0015A610:
/* 5A710 0015A610 3000BF7B */  lq         $31, 0x30($sp)
/* 5A714 0015A614 2000B27B */  lq         $18, 0x20($sp)
/* 5A718 0015A618 1000B17B */  lq         $17, 0x10($sp)
/* 5A71C 0015A61C 0000B07B */  lq         $16, 0x0($sp)
/* 5A720 0015A620 C000BD27 */  addiu      $sp, $sp, 0xC0
/* 5A724 0015A624 0800E003 */  jr         $31
/* 5A728 0015A628 00000000 */   nop
/* 5A72C 0015A62C 00000000 */  nop
