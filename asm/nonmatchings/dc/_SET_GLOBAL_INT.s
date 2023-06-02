.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_GLOBAL_INT__FP12RS_STACKDATAi
/* E5290 001E5190 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* E5294 001E5194 2000BF7F */  sq         $31, 0x20($sp)
/* E5298 001E5198 1000B17F */  sq         $17, 0x10($sp)
/* E529C 001E519C 0000B07F */  sq         $16, 0x0($sp)
/* E52A0 001E51A0 08009124 */  addiu      $17, $4, 0x8
/* E52A4 001E51A4 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E52A8 001E51A8 00000000 */   nop
/* E52AC 001E51AC 28864070 */  paddub     $16, $2, $0
/* E52B0 001E51B0 28262072 */  paddub     $4, $17, $0
/* E52B4 001E51B4 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E52B8 001E51B8 00000000 */   nop
/* E52BC 001E51BC 80201000 */  sll        $4, $16, 2
/* E52C0 001E51C0 D901033C */  lui        $3, %hi(GL_INT)
/* E52C4 001E51C4 80FC6324 */  addiu      $3, $3, %lo(GL_INT)
/* E52C8 001E51C8 21186400 */  addu       $3, $3, $4
/* E52CC 001E51CC 000062AC */  sw         $2, 0x0($3)
/* E52D0 001E51D0 01000224 */  addiu      $2, $0, 0x1
/* E52D4 001E51D4 2000BF7B */  lq         $31, 0x20($sp)
/* E52D8 001E51D8 1000B17B */  lq         $17, 0x10($sp)
/* E52DC 001E51DC 0000B07B */  lq         $16, 0x0($sp)
/* E52E0 001E51E0 3000BD27 */  addiu      $sp, $sp, 0x30
/* E52E4 001E51E4 0800E003 */  jr         $31
/* E52E8 001E51E8 00000000 */   nop
/* E52EC 001E51EC 00000000 */  nop
