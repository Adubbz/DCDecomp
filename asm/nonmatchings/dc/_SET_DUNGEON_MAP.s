.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_DUNGEON_MAP__FP12RS_STACKDATAi
/* BC5A0 001BC4A0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* BC5A4 001BC4A4 1000BF7F */  sq         $31, 0x10($sp)
/* BC5A8 001BC4A8 0000B07F */  sq         $16, 0x0($sp)
/* BC5AC 001BC4AC 08008324 */  addiu      $3, $4, 0x8
/* BC5B0 001BC4B0 6CEE060C */  jal        GetStackString__FP12RS_STACKDATA_2
/* BC5B4 001BC4B4 00000000 */   nop
/* BC5B8 001BC4B8 28864070 */  paddub     $16, $2, $0
/* BC5BC 001BC4BC 28266070 */  paddub     $4, $3, $0
/* BC5C0 001BC4C0 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BC5C4 001BC4C4 00000000 */   nop
/* BC5C8 001BC4C8 F89382AF */  sw         $2, -0x6C08($gp)
/* BC5CC 001BC4CC D501023C */  lui        $2, %hi(BtLoadMapFileName)
/* BC5D0 001BC4D0 80694424 */  addiu      $4, $2, %lo(BtLoadMapFileName)
/* BC5D4 001BC4D4 282E0072 */  paddub     $5, $16, $0
/* BC5D8 001BC4D8 5A15040C */  jal        strcpy
/* BC5DC 001BC4DC 00000000 */   nop
/* BC5E0 001BC4E0 F893828F */  lw         $2, -0x6C08($gp)
/* BC5E4 001BC4E4 DD01013C */  lui        $at, (0x1DD09CC >> 16)
/* BC5E8 001BC4E8 CC0922AC */  sw         $2, (0x1DD09CC & 0xFFFF)($at)
/* BC5EC 001BC4EC 01000224 */  addiu      $2, $0, 0x1
/* BC5F0 001BC4F0 1000BF7B */  lq         $31, 0x10($sp)
/* BC5F4 001BC4F4 0000B07B */  lq         $16, 0x0($sp)
/* BC5F8 001BC4F8 2000BD27 */  addiu      $sp, $sp, 0x20
/* BC5FC 001BC4FC 0800E003 */  jr         $31
/* BC600 001BC500 00000000 */   nop
/* BC604 001BC504 00000000 */  nop
/* BC608 001BC508 00000000 */  nop
/* BC60C 001BC50C 00000000 */  nop
