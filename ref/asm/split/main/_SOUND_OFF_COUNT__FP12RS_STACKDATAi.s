.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SOUND_OFF_COUNT__FP12RS_STACKDATAi
/* 096510 00196410 F0FFBD27 */  addiu       $29, $29, -0x10
/* 096514 00196414 0000BF7F */  sq          $31, 0x0($29)
/* 096518 00196418 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 09651C 0019641C 00000000 */   nop
/* 096520 00196420 D401013C */  lui         $1, %hi(EdEventInfo + 0x38)
/* 096524 00196424 08D222AC */  sw          $2, %lo(EdEventInfo + 0x38)($1)
/* 096528 00196428 D401013C */  lui         $1, %hi(EdEventInfo + 0x38)
/* 09652C 0019642C 08D2228C */  lw          $2, %lo(EdEventInfo + 0x38)($1)
/* 096530 00196430 0B004128 */  slti        $1, $2, 0xB
/* 096534 00196434 04002014 */  bnez        $1, .L00196448
/* 096538 00196438 00000000 */   nop
/* 09653C 0019643C 0A000224 */  addiu       $2, $0, 0xA
/* 096540 00196440 D401013C */  lui         $1, %hi(EdEventInfo + 0x38)
/* 096544 00196444 08D222AC */  sw          $2, %lo(EdEventInfo + 0x38)($1)
.L00196448:
/* 096548 00196448 D401013C */  lui         $1, %hi(EdEventInfo + 0x38)
/* 09654C 0019644C 08D2248C */  lw          $4, %lo(EdEventInfo + 0x38)($1)
/* 096550 00196450 D8DD050C */  jal         EdSetSoundOffCount__Fi
/* 096554 00196454 00000000 */   nop
/* 096558 00196458 01000224 */  addiu       $2, $0, 0x1
/* 09655C 0019645C 0000BF7B */  lq          $31, 0x0($29)
/* 096560 00196460 1000BD27 */  addiu       $29, $29, 0x10
/* 096564 00196464 0800E003 */  jr          $31
/* 096568 00196468 00000000 */   nop
/* 09656C 0019646C 00000000 */  nop
