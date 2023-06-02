.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_DISTANCE__FP12RS_STACKDATAi
/* E1E00 001E1D00 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* E1E04 001E1D04 2000BF7F */  sq         $31, 0x20($sp)
/* E1E08 001E1D08 1000B17F */  sq         $17, 0x10($sp)
/* E1E0C 001E1D0C 0000B07F */  sq         $16, 0x0($sp)
/* E1E10 001E1D10 288E8070 */  paddub     $17, $4, $0
/* E1E14 001E1D14 2886A070 */  paddub     $16, $5, $0
/* E1E18 001E1D18 E09C848F */  lw         $4, -0x6320($gp)
/* E1E1C 001E1D1C 9000838C */  lw         $3, 0x90($4)
/* E1E20 001E1D20 10350224 */  addiu      $2, $0, 0x3510
/* E1E24 001E1D24 18106200 */  mult       $2, $3, $2
/* E1E28 001E1D28 21108200 */  addu       $2, $4, $2
/* E1E2C 001E1D2C 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E1E30 001E1D30 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E1E34 001E1D34 21204100 */  addu       $4, $2, $at
/* E1E38 001E1D38 3000A527 */  addiu      $5, $sp, 0x30
/* E1E3C 001E1D3C A000998C */  lw         $25, 0xA0($4)
/* E1E40 001E1D40 A000398F */  lw         $25, 0xA0($25)
/* E1E44 001E1D44 09F82003 */  jalr       $25
/* E1E48 001E1D48 00000000 */   nop
/* E1E4C 001E1D4C 01000224 */  addiu      $2, $0, 0x1
/* E1E50 001E1D50 08000216 */  bne        $16, $2, .L001E1D74
/* E1E54 001E1D54 00000000 */   nop
/* E1E58 001E1D58 4000A427 */  addiu      $4, $sp, 0x40
/* E1E5C 001E1D5C EA01023C */  lui        $2, %hi(D_1EA1D30)
/* E1E60 001E1D60 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* E1E64 001E1D64 0C86040C */  jal        sceVu0CopyVector
/* E1E68 001E1D68 00000000 */   nop
/* E1E6C 001E1D6C 10000010 */  b          .L001E1DB0
/* E1E70 001E1D70 00000000 */   nop
.L001E1D74:
/* E1E74 001E1D74 28262072 */  paddub     $4, $17, $0
/* E1E78 001E1D78 08009124 */  addiu      $17, $4, 0x8
/* E1E7C 001E1D7C A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E1E80 001E1D80 00000000 */   nop
/* E1E84 001E1D84 4000A0E7 */  swc1       $f0, 0x40($sp)
/* E1E88 001E1D88 28262072 */  paddub     $4, $17, $0
/* E1E8C 001E1D8C 08009124 */  addiu      $17, $4, 0x8
/* E1E90 001E1D90 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E1E94 001E1D94 00000000 */   nop
/* E1E98 001E1D98 4400A0E7 */  swc1       $f0, 0x44($sp)
/* E1E9C 001E1D9C 28262072 */  paddub     $4, $17, $0
/* E1EA0 001E1DA0 08009124 */  addiu      $17, $4, 0x8
/* E1EA4 001E1DA4 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E1EA8 001E1DA8 00000000 */   nop
/* E1EAC 001E1DAC 4800A0E7 */  swc1       $f0, 0x48($sp)
.L001E1DB0:
/* E1EB0 001E1DB0 3000A427 */  addiu      $4, $sp, 0x30
/* E1EB4 001E1DB4 4000A527 */  addiu      $5, $sp, 0x40
/* E1EB8 001E1DB8 648D040C */  jal        DistVector__FPfPf
/* E1EBC 001E1DBC 00000000 */   nop
/* E1EC0 001E1DC0 28262072 */  paddub     $4, $17, $0
/* E1EC4 001E1DC4 06030046 */  mov.s      $f12, $f0
/* E1EC8 001E1DC8 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E1ECC 001E1DCC 00000000 */   nop
/* E1ED0 001E1DD0 01000224 */  addiu      $2, $0, 0x1
/* E1ED4 001E1DD4 2000BF7B */  lq         $31, 0x20($sp)
/* E1ED8 001E1DD8 1000B17B */  lq         $17, 0x10($sp)
/* E1EDC 001E1DDC 0000B07B */  lq         $16, 0x0($sp)
/* E1EE0 001E1DE0 5000BD27 */  addiu      $sp, $sp, 0x50
/* E1EE4 001E1DE4 0800E003 */  jr         $31
/* E1EE8 001E1DE8 00000000 */   nop
/* E1EEC 001E1DEC 00000000 */  nop
