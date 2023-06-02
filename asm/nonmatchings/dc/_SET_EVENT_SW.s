.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_EVENT_SW__FP12RS_STACKDATAi
/* BC6D0 001BC5D0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* BC6D4 001BC5D4 2000BF7F */  sq         $31, 0x20($sp)
/* BC6D8 001BC5D8 1000B17F */  sq         $17, 0x10($sp)
/* BC6DC 001BC5DC 0000B07F */  sq         $16, 0x0($sp)
/* BC6E0 001BC5E0 08009124 */  addiu      $17, $4, 0x8
/* BC6E4 001BC5E4 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BC6E8 001BC5E8 00000000 */   nop
/* BC6EC 001BC5EC 28864070 */  paddub     $16, $2, $0
/* BC6F0 001BC5F0 28262072 */  paddub     $4, $17, $0
/* BC6F4 001BC5F4 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BC6F8 001BC5F8 00000000 */   nop
/* BC6FC 001BC5FC D09C848F */  lw         $4, -0x6330($gp)
/* BC700 001BC600 282E0072 */  paddub     $5, $16, $0
/* BC704 001BC604 28364070 */  paddub     $6, $2, $0
/* BC708 001BC608 6432070C */  jal        SearchDataSwitch__16CDungeonEventManFii
/* BC70C 001BC60C 00000000 */   nop
/* BC710 001BC610 01000224 */  addiu      $2, $0, 0x1
/* BC714 001BC614 2000BF7B */  lq         $31, 0x20($sp)
/* BC718 001BC618 1000B17B */  lq         $17, 0x10($sp)
/* BC71C 001BC61C 0000B07B */  lq         $16, 0x0($sp)
/* BC720 001BC620 3000BD27 */  addiu      $sp, $sp, 0x30
/* BC724 001BC624 0800E003 */  jr         $31
/* BC728 001BC628 00000000 */   nop
/* BC72C 001BC62C 00000000 */  nop
