.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_OBJ_POS__FP12RS_STACKDATAi_2
/* E5340 001E5240 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* E5344 001E5244 2000BF7F */  sq         $31, 0x20($sp)
/* E5348 001E5248 1000B17F */  sq         $17, 0x10($sp)
/* E534C 001E524C 0000B07F */  sq         $16, 0x0($sp)
/* E5350 001E5250 E09C828F */  lw         $2, -0x6320($gp)
/* E5354 001E5254 9000458C */  lw         $5, 0x90($2)
/* E5358 001E5258 08009024 */  addiu      $16, $4, 0x8
/* E535C 001E525C B085070C */  jal        GetStackString__FP12RS_STACKDATA_3
/* E5360 001E5260 00000000 */   nop
/* E5364 001E5264 E09C848F */  lw         $4, -0x6320($gp)
/* E5368 001E5268 10350324 */  addiu      $3, $0, 0x3510
/* E536C 001E526C 1818A300 */  mult       $3, $5, $3
/* E5370 001E5270 21186400 */  addu       $3, $3, $4
/* E5374 001E5274 0200013C */  lui        $at, (0x20000 >> 16)
/* E5378 001E5278 21086100 */  addu       $at, $3, $at
/* E537C 001E527C 8CFD248C */  lw         $4, -0x274($at)
/* E5380 001E5280 282E4070 */  paddub     $5, $2, $0
/* E5384 001E5284 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* E5388 001E5288 00000000 */   nop
/* E538C 001E528C 288E4070 */  paddub     $17, $2, $0
/* E5390 001E5290 3000A427 */  addiu      $4, $sp, 0x30
/* E5394 001E5294 20022526 */  addiu      $5, $17, 0x220
/* E5398 001E5298 0C86040C */  jal        sceVu0CopyVector
/* E539C 001E529C 00000000 */   nop
/* E53A0 001E52A0 28262072 */  paddub     $4, $17, $0
/* E53A4 001E52A4 4000A527 */  addiu      $5, $sp, 0x40
/* E53A8 001E52A8 3000A627 */  addiu      $6, $sp, 0x30
/* E53AC 001E52AC 58A3040C */  jal        GetWorldPosition__6CFrameFPfPf
/* E53B0 001E52B0 00000000 */   nop
/* E53B4 001E52B4 28260072 */  paddub     $4, $16, $0
/* E53B8 001E52B8 08009024 */  addiu      $16, $4, 0x8
/* E53BC 001E52BC 4000ACC7 */  lwc1       $f12, 0x40($sp)
/* E53C0 001E52C0 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E53C4 001E52C4 00000000 */   nop
/* E53C8 001E52C8 28260072 */  paddub     $4, $16, $0
/* E53CC 001E52CC 08009024 */  addiu      $16, $4, 0x8
/* E53D0 001E52D0 4400ACC7 */  lwc1       $f12, 0x44($sp)
/* E53D4 001E52D4 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E53D8 001E52D8 00000000 */   nop
/* E53DC 001E52DC 28260072 */  paddub     $4, $16, $0
/* E53E0 001E52E0 4800ACC7 */  lwc1       $f12, 0x48($sp)
/* E53E4 001E52E4 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E53E8 001E52E8 00000000 */   nop
/* E53EC 001E52EC 01000224 */  addiu      $2, $0, 0x1
/* E53F0 001E52F0 2000BF7B */  lq         $31, 0x20($sp)
/* E53F4 001E52F4 1000B17B */  lq         $17, 0x10($sp)
/* E53F8 001E52F8 0000B07B */  lq         $16, 0x0($sp)
/* E53FC 001E52FC 5000BD27 */  addiu      $sp, $sp, 0x50
/* E5400 001E5300 0800E003 */  jr         $31
/* E5404 001E5304 00000000 */   nop
/* E5408 001E5308 00000000 */  nop
/* E540C 001E530C 00000000 */  nop
