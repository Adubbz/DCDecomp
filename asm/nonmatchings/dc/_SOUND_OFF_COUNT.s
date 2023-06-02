.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SOUND_OFF_COUNT__FP12RS_STACKDATAi
/* 96510 00196410 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 96514 00196414 0000BF7F */  sq         $31, 0x0($sp)
/* 96518 00196418 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 9651C 0019641C 00000000 */   nop
/* 96520 00196420 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 96524 00196424 08D222AC */  sw         $2, -0x2DF8($at)
/* 96528 00196428 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 9652C 0019642C 08D2228C */  lw         $2, -0x2DF8($at)
/* 96530 00196430 0B004128 */  slti       $at, $2, 0xB
/* 96534 00196434 04002014 */  bnez       $at, .L00196448
/* 96538 00196438 00000000 */   nop
/* 9653C 0019643C 0A000224 */  addiu      $2, $0, 0xA
/* 96540 00196440 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 96544 00196444 08D222AC */  sw         $2, -0x2DF8($at)
.L00196448:
/* 96548 00196448 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 9654C 0019644C 08D2248C */  lw         $4, -0x2DF8($at)
/* 96550 00196450 D8DD050C */  jal        EdSetSoundOffCount__Fi
/* 96554 00196454 00000000 */   nop
/* 96558 00196458 01000224 */  addiu      $2, $0, 0x1
/* 9655C 0019645C 0000BF7B */  lq         $31, 0x0($sp)
/* 96560 00196460 1000BD27 */  addiu      $sp, $sp, 0x10
/* 96564 00196464 0800E003 */  jr         $31
/* 96568 00196468 00000000 */   nop
/* 9656C 0019646C 00000000 */  nop
