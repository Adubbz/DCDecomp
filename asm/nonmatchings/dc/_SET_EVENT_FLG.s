.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_EVENT_FLG__FP12RS_STACKDATAi
/* BBD10 001BBC10 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* BBD14 001BBC14 2000BF7F */  sq         $31, 0x20($sp)
/* BBD18 001BBC18 1000B17F */  sq         $17, 0x10($sp)
/* BBD1C 001BBC1C 0000B07F */  sq         $16, 0x0($sp)
/* BBD20 001BBC20 08009124 */  addiu      $17, $4, 0x8
/* BBD24 001BBC24 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BBD28 001BBC28 00000000 */   nop
/* BBD2C 001BBC2C 28864070 */  paddub     $16, $2, $0
/* BBD30 001BBC30 28262072 */  paddub     $4, $17, $0
/* BBD34 001BBC34 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BBD38 001BBC38 00000000 */   nop
/* BBD3C 001BBC3C 789C838F */  lw         $3, -0x6388($gp)
/* BBD40 001BBC40 08000006 */  bltz       $16, .L001BBC64
/* BBD44 001BBC44 00000000 */   nop
/* BBD48 001BBC48 3200012A */  slti       $at, $16, 0x32
/* BBD4C 001BBC4C 05002010 */  beqz       $at, .L001BBC64
/* BBD50 001BBC50 00000000 */   nop
/* BBD54 001BBC54 21180302 */  addu       $3, $16, $3
/* BBD58 001BBC58 0100013C */  lui        $at, (0x10000 >> 16)
/* BBD5C 001BBC5C 21086100 */  addu       $at, $3, $at
/* BBD60 001BBC60 A48A22A0 */  sb         $2, -0x755C($at)
.L001BBC64:
/* BBD64 001BBC64 01000224 */  addiu      $2, $0, 0x1
/* BBD68 001BBC68 2000BF7B */  lq         $31, 0x20($sp)
/* BBD6C 001BBC6C 1000B17B */  lq         $17, 0x10($sp)
/* BBD70 001BBC70 0000B07B */  lq         $16, 0x0($sp)
/* BBD74 001BBC74 3000BD27 */  addiu      $sp, $sp, 0x30
/* BBD78 001BBC78 0800E003 */  jr         $31
/* BBD7C 001BBC7C 00000000 */   nop
