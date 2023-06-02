.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_RES_LIMMIT_ZONE__FP12RS_STACKDATAi
/* BD190 001BD090 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BD194 001BD094 0000BF7F */  sq         $31, 0x0($sp)
/* BD198 001BD098 789C848F */  lw         $4, -0x6388($gp)
/* BD19C 001BD09C C4FB060C */  jal        SetResLimmitZone__14CDngStatusDataFv
/* BD1A0 001BD0A0 00000000 */   nop
/* BD1A4 001BD0A4 789C828F */  lw         $2, -0x6388($gp)
/* BD1A8 001BD0A8 0100013C */  lui        $at, (0x10000 >> 16)
/* BD1AC 001BD0AC 21084100 */  addu       $at, $2, $at
/* BD1B0 001BD0B0 108B238C */  lw         $3, -0x74F0($at)
/* BD1B4 001BD0B4 FFFF0224 */  addiu      $2, $0, -0x1
/* BD1B8 001BD0B8 04006210 */  beq        $3, $2, .L001BD0CC
/* BD1BC 001BD0BC 00000000 */   nop
/* BD1C0 001BD0C0 1B000424 */  addiu      $4, $0, 0x1B
/* BD1C4 001BD0C4 B46D050C */  jal        SndSPSeLoad__Fi
/* BD1C8 001BD0C8 00000000 */   nop
.L001BD0CC:
/* BD1CC 001BD0CC 01000224 */  addiu      $2, $0, 0x1
/* BD1D0 001BD0D0 0000BF7B */  lq         $31, 0x0($sp)
/* BD1D4 001BD0D4 1000BD27 */  addiu      $sp, $sp, 0x10
/* BD1D8 001BD0D8 0800E003 */  jr         $31
/* BD1DC 001BD0DC 00000000 */   nop
