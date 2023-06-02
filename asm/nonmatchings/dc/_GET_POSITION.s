.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_POSITION__FP12RS_STACKDATAi
/* E1EF0 001E1DF0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* E1EF4 001E1DF4 3000BF7F */  sq         $31, 0x30($sp)
/* E1EF8 001E1DF8 2000B27F */  sq         $18, 0x20($sp)
/* E1EFC 001E1DFC 1000B17F */  sq         $17, 0x10($sp)
/* E1F00 001E1E00 0000B07F */  sq         $16, 0x0($sp)
/* E1F04 001E1E04 E09C828F */  lw         $2, -0x6320($gp)
/* E1F08 001E1E08 9000528C */  lw         $18, 0x90($2)
/* E1F0C 001E1E0C 08009124 */  addiu      $17, $4, 0x8
/* E1F10 001E1E10 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E1F14 001E1E14 00000000 */   nop
/* E1F18 001E1E18 06030046 */  mov.s      $f12, $f0
/* E1F1C 001E1E1C 2C44040C */  jal        fptosi
/* E1F20 001E1E20 00000000 */   nop
/* E1F24 001E1E24 28864070 */  paddub     $16, $2, $0
/* E1F28 001E1E28 FFFF0224 */  addiu      $2, $0, -0x1
/* E1F2C 001E1E2C 0D000216 */  bne        $16, $2, .L001E1E64
/* E1F30 001E1E30 00000000 */   nop
/* E1F34 001E1E34 10350224 */  addiu      $2, $0, 0x3510
/* E1F38 001E1E38 18184202 */  mult       $3, $18, $2
/* E1F3C 001E1E3C E09C828F */  lw         $2, -0x6320($gp)
/* E1F40 001E1E40 21104300 */  addu       $2, $2, $3
/* E1F44 001E1E44 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E1F48 001E1E48 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E1F4C 001E1E4C 21204100 */  addu       $4, $2, $at
/* E1F50 001E1E50 4000A527 */  addiu      $5, $sp, 0x40
/* E1F54 001E1E54 A000998C */  lw         $25, 0xA0($4)
/* E1F58 001E1E58 A000398F */  lw         $25, 0xA0($25)
/* E1F5C 001E1E5C 09F82003 */  jalr       $25
/* E1F60 001E1E60 00000000 */   nop
.L001E1E64:
/* E1F64 001E1E64 FEFF0224 */  addiu      $2, $0, -0x2
/* E1F68 001E1E68 06000216 */  bne        $16, $2, .L001E1E84
/* E1F6C 001E1E6C 00000000 */   nop
/* E1F70 001E1E70 4000A427 */  addiu      $4, $sp, 0x40
/* E1F74 001E1E74 EA01023C */  lui        $2, %hi(D_1EA1D30)
/* E1F78 001E1E78 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* E1F7C 001E1E7C 0C86040C */  jal        sceVu0CopyVector
/* E1F80 001E1E80 00000000 */   nop
.L001E1E84:
/* E1F84 001E1E84 28262072 */  paddub     $4, $17, $0
/* E1F88 001E1E88 08009124 */  addiu      $17, $4, 0x8
/* E1F8C 001E1E8C 4000ACC7 */  lwc1       $f12, 0x40($sp)
/* E1F90 001E1E90 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E1F94 001E1E94 00000000 */   nop
/* E1F98 001E1E98 28262072 */  paddub     $4, $17, $0
/* E1F9C 001E1E9C 08009124 */  addiu      $17, $4, 0x8
/* E1FA0 001E1EA0 4400ACC7 */  lwc1       $f12, 0x44($sp)
/* E1FA4 001E1EA4 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E1FA8 001E1EA8 00000000 */   nop
/* E1FAC 001E1EAC 28262072 */  paddub     $4, $17, $0
/* E1FB0 001E1EB0 4800ACC7 */  lwc1       $f12, 0x48($sp)
/* E1FB4 001E1EB4 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E1FB8 001E1EB8 00000000 */   nop
/* E1FBC 001E1EBC 01000224 */  addiu      $2, $0, 0x1
/* E1FC0 001E1EC0 3000BF7B */  lq         $31, 0x30($sp)
/* E1FC4 001E1EC4 2000B27B */  lq         $18, 0x20($sp)
/* E1FC8 001E1EC8 1000B17B */  lq         $17, 0x10($sp)
/* E1FCC 001E1ECC 0000B07B */  lq         $16, 0x0($sp)
/* E1FD0 001E1ED0 5000BD27 */  addiu      $sp, $sp, 0x50
/* E1FD4 001E1ED4 0800E003 */  jr         $31
/* E1FD8 001E1ED8 00000000 */   nop
/* E1FDC 001E1EDC 00000000 */  nop
