.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_MONSTOR_MOVE__FP12RS_STACKDATAi
/* E4BC0 001E4AC0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* E4BC4 001E4AC4 2000BF7F */  sq         $31, 0x20($sp)
/* E4BC8 001E4AC8 1000B17F */  sq         $17, 0x10($sp)
/* E4BCC 001E4ACC 0000B07F */  sq         $16, 0x0($sp)
/* E4BD0 001E4AD0 08009124 */  addiu      $17, $4, 0x8
/* E4BD4 001E4AD4 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E4BD8 001E4AD8 00000000 */   nop
/* E4BDC 001E4ADC 28864070 */  paddub     $16, $2, $0
/* E4BE0 001E4AE0 10350224 */  addiu      $2, $0, 0x3510
/* E4BE4 001E4AE4 18180202 */  mult       $3, $16, $2
/* E4BE8 001E4AE8 E09C828F */  lw         $2, -0x6320($gp)
/* E4BEC 001E4AEC 21104300 */  addu       $2, $2, $3
/* E4BF0 001E4AF0 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E4BF4 001E4AF4 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E4BF8 001E4AF8 21204100 */  addu       $4, $2, $at
/* E4BFC 001E4AFC 4000A527 */  addiu      $5, $sp, 0x40
/* E4C00 001E4B00 A000998C */  lw         $25, 0xA0($4)
/* E4C04 001E4B04 A000398F */  lw         $25, 0xA0($25)
/* E4C08 001E4B08 09F82003 */  jalr       $25
/* E4C0C 001E4B0C 00000000 */   nop
/* E4C10 001E4B10 28262072 */  paddub     $4, $17, $0
/* E4C14 001E4B14 08009124 */  addiu      $17, $4, 0x8
/* E4C18 001E4B18 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E4C1C 001E4B1C 00000000 */   nop
/* E4C20 001E4B20 3000A0E7 */  swc1       $f0, 0x30($sp)
/* E4C24 001E4B24 28262072 */  paddub     $4, $17, $0
/* E4C28 001E4B28 08009124 */  addiu      $17, $4, 0x8
/* E4C2C 001E4B2C A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E4C30 001E4B30 00000000 */   nop
/* E4C34 001E4B34 3400A327 */  addiu      $3, $sp, 0x34
/* E4C38 001E4B38 000060E4 */  swc1       $f0, 0x0($3)
/* E4C3C 001E4B3C 28262072 */  paddub     $4, $17, $0
/* E4C40 001E4B40 08009124 */  addiu      $17, $4, 0x8
/* E4C44 001E4B44 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E4C48 001E4B48 00000000 */   nop
/* E4C4C 001E4B4C 3800A227 */  addiu      $2, $sp, 0x38
/* E4C50 001E4B50 000040E4 */  swc1       $f0, 0x0($2)
/* E4C54 001E4B54 3000A1C7 */  lwc1       $f1, 0x30($sp)
/* E4C58 001E4B58 4000A0C7 */  lwc1       $f0, 0x40($sp)
/* E4C5C 001E4B5C 01080046 */  sub.s      $f0, $f1, $f0
/* E4C60 001E4B60 3000A0E7 */  swc1       $f0, 0x30($sp)
/* E4C64 001E4B64 000061C4 */  lwc1       $f1, 0x0($3)
/* E4C68 001E4B68 4400A0C7 */  lwc1       $f0, 0x44($sp)
/* E4C6C 001E4B6C 01080046 */  sub.s      $f0, $f1, $f0
/* E4C70 001E4B70 000060E4 */  swc1       $f0, 0x0($3)
/* E4C74 001E4B74 000041C4 */  lwc1       $f1, 0x0($2)
/* E4C78 001E4B78 4800A0C7 */  lwc1       $f0, 0x48($sp)
/* E4C7C 001E4B7C 01080046 */  sub.s      $f0, $f1, $f0
/* E4C80 001E4B80 000040E4 */  swc1       $f0, 0x0($2)
/* E4C84 001E4B84 803F023C */  lui        $2, (0x3F800000 >> 16)
/* E4C88 001E4B88 3C00A2AF */  sw         $2, 0x3C($sp)
/* E4C8C 001E4B8C 80101000 */  sll        $2, $16, 2
/* E4C90 001E4B90 21185000 */  addu       $3, $2, $16
/* E4C94 001E4B94 80100300 */  sll        $2, $3, 2
/* E4C98 001E4B98 21106200 */  addu       $2, $3, $2
/* E4C9C 001E4B9C 00810200 */  sll        $16, $2, 4
/* E4CA0 001E4BA0 E09C828F */  lw         $2, -0x6320($gp)
/* E4CA4 001E4BA4 21105000 */  addu       $2, $2, $16
/* E4CA8 001E4BA8 0100013C */  lui        $at, (0x1E430 >> 16)
/* E4CAC 001E4BAC 30E42134 */  ori        $at, $at, (0x1E430 & 0xFFFF)
/* E4CB0 001E4BB0 21204100 */  addu       $4, $2, $at
/* E4CB4 001E4BB4 3000A527 */  addiu      $5, $sp, 0x30
/* E4CB8 001E4BB8 9285040C */  jal        sceVu0Normalize
/* E4CBC 001E4BBC 00000000 */   nop
/* E4CC0 001E4BC0 28262072 */  paddub     $4, $17, $0
/* E4CC4 001E4BC4 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E4CC8 001E4BC8 00000000 */   nop
/* E4CCC 001E4BCC E09C828F */  lw         $2, -0x6320($gp)
/* E4CD0 001E4BD0 21100202 */  addu       $2, $16, $2
/* E4CD4 001E4BD4 0200013C */  lui        $at, (0x20000 >> 16)
/* E4CD8 001E4BD8 21084100 */  addu       $at, $2, $at
/* E4CDC 001E4BDC 50E420E4 */  swc1       $f0, -0x1BB0($at)
/* E4CE0 001E4BE0 01000224 */  addiu      $2, $0, 0x1
/* E4CE4 001E4BE4 2000BF7B */  lq         $31, 0x20($sp)
/* E4CE8 001E4BE8 1000B17B */  lq         $17, 0x10($sp)
/* E4CEC 001E4BEC 0000B07B */  lq         $16, 0x0($sp)
/* E4CF0 001E4BF0 5000BD27 */  addiu      $sp, $sp, 0x50
/* E4CF4 001E4BF4 0800E003 */  jr         $31
/* E4CF8 001E4BF8 00000000 */   nop
/* E4CFC 001E4BFC 00000000 */  nop
