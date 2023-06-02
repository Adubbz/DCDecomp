.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_MONSTOR_LINK_MOVE__FP12RS_STACKDATAi
/* E4D00 001E4C00 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* E4D04 001E4C04 2000BF7F */  sq         $31, 0x20($sp)
/* E4D08 001E4C08 1000B17F */  sq         $17, 0x10($sp)
/* E4D0C 001E4C0C 0000B07F */  sq         $16, 0x0($sp)
/* E4D10 001E4C10 08009124 */  addiu      $17, $4, 0x8
/* E4D14 001E4C14 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E4D18 001E4C18 00000000 */   nop
/* E4D1C 001E4C1C 28864070 */  paddub     $16, $2, $0
/* E4D20 001E4C20 28262072 */  paddub     $4, $17, $0
/* E4D24 001E4C24 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E4D28 001E4C28 00000000 */   nop
/* E4D2C 001E4C2C E09C858F */  lw         $5, -0x6320($gp)
/* E4D30 001E4C30 80181000 */  sll        $3, $16, 2
/* E4D34 001E4C34 21207000 */  addu       $4, $3, $16
/* E4D38 001E4C38 80180400 */  sll        $3, $4, 2
/* E4D3C 001E4C3C 21188300 */  addu       $3, $4, $3
/* E4D40 001E4C40 00810300 */  sll        $16, $3, 4
/* E4D44 001E4C44 2120B000 */  addu       $4, $5, $16
/* E4D48 001E4C48 80180200 */  sll        $3, $2, 2
/* E4D4C 001E4C4C 21186200 */  addu       $3, $3, $2
/* E4D50 001E4C50 80100300 */  sll        $2, $3, 2
/* E4D54 001E4C54 21106200 */  addu       $2, $3, $2
/* E4D58 001E4C58 00890200 */  sll        $17, $2, 4
/* E4D5C 001E4C5C 2110B100 */  addu       $2, $5, $17
/* E4D60 001E4C60 0100013C */  lui        $at, (0x1E430 >> 16)
/* E4D64 001E4C64 30E42134 */  ori        $at, $at, (0x1E430 & 0xFFFF)
/* E4D68 001E4C68 21208100 */  addu       $4, $4, $at
/* E4D6C 001E4C6C 0100013C */  lui        $at, (0x1E430 >> 16)
/* E4D70 001E4C70 30E42134 */  ori        $at, $at, (0x1E430 & 0xFFFF)
/* E4D74 001E4C74 21284100 */  addu       $5, $2, $at
/* E4D78 001E4C78 0C86040C */  jal        sceVu0CopyVector
/* E4D7C 001E4C7C 00000000 */   nop
/* E4D80 001E4C80 E09C828F */  lw         $2, -0x6320($gp)
/* E4D84 001E4C84 0100013C */  lui        $at, (0x1E450 >> 16)
/* E4D88 001E4C88 50E42134 */  ori        $at, $at, (0x1E450 & 0xFFFF)
/* E4D8C 001E4C8C 21184100 */  addu       $3, $2, $at
/* E4D90 001E4C90 21107100 */  addu       $2, $3, $17
/* E4D94 001E4C94 000040C4 */  lwc1       $f0, 0x0($2)
/* E4D98 001E4C98 21107000 */  addu       $2, $3, $16
/* E4D9C 001E4C9C 000040E4 */  swc1       $f0, 0x0($2)
/* E4DA0 001E4CA0 01000224 */  addiu      $2, $0, 0x1
/* E4DA4 001E4CA4 2000BF7B */  lq         $31, 0x20($sp)
/* E4DA8 001E4CA8 1000B17B */  lq         $17, 0x10($sp)
/* E4DAC 001E4CAC 0000B07B */  lq         $16, 0x0($sp)
/* E4DB0 001E4CB0 3000BD27 */  addiu      $sp, $sp, 0x30
/* E4DB4 001E4CB4 0800E003 */  jr         $31
/* E4DB8 001E4CB8 00000000 */   nop
/* E4DBC 001E4CBC 00000000 */  nop
