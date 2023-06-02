.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_MONSTOR_FRM__FP12RS_STACKDATAi
/* E4AC0 001E49C0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* E4AC4 001E49C4 1000BF7F */  sq         $31, 0x10($sp)
/* E4AC8 001E49C8 0000B07F */  sq         $16, 0x0($sp)
/* E4ACC 001E49CC 08009024 */  addiu      $16, $4, 0x8
/* E4AD0 001E49D0 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E4AD4 001E49D4 00000000 */   nop
/* E4AD8 001E49D8 E09C848F */  lw         $4, -0x6320($gp)
/* E4ADC 001E49DC 10350324 */  addiu      $3, $0, 0x3510
/* E4AE0 001E49E0 18104300 */  mult       $2, $2, $3
/* E4AE4 001E49E4 21104400 */  addu       $2, $2, $4
/* E4AE8 001E49E8 0200013C */  lui        $at, (0x20000 >> 16)
/* E4AEC 001E49EC 21084100 */  addu       $at, $2, $at
/* E4AF0 001E49F0 C0FF2CC4 */  lwc1       $f12, -0x40($at)
/* E4AF4 001E49F4 28260072 */  paddub     $4, $16, $0
/* E4AF8 001E49F8 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E4AFC 001E49FC 00000000 */   nop
/* E4B00 001E4A00 01000224 */  addiu      $2, $0, 0x1
/* E4B04 001E4A04 1000BF7B */  lq         $31, 0x10($sp)
/* E4B08 001E4A08 0000B07B */  lq         $16, 0x0($sp)
/* E4B0C 001E4A0C 2000BD27 */  addiu      $sp, $sp, 0x20
/* E4B10 001E4A10 0800E003 */  jr         $31
/* E4B14 001E4A14 00000000 */   nop
/* E4B18 001E4A18 00000000 */  nop
/* E4B1C 001E4A1C 00000000 */  nop
