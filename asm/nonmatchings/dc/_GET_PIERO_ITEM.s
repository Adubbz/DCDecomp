.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_PIERO_ITEM__FP12RS_STACKDATAi
/* BD890 001BD790 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* BD894 001BD794 1000BF7F */  sq         $31, 0x10($sp)
/* BD898 001BD798 0000B07F */  sq         $16, 0x0($sp)
/* BD89C 001BD79C 28868070 */  paddub     $16, $4, $0
/* BD8A0 001BD7A0 A49D848F */  lw         $4, -0x625C($gp)
/* BD8A4 001BD7A4 C49C858F */  lw         $5, -0x633C($gp)
/* BD8A8 001BD7A8 2800A627 */  addiu      $6, $sp, 0x28
/* BD8AC 001BD7AC 2C00A727 */  addiu      $7, $sp, 0x2C
/* BD8B0 001BD7B0 ACFE060C */  jal        GetPieroItem__FiiPiPi
/* BD8B4 001BD7B4 00000000 */   nop
/* BD8B8 001BD7B8 28260072 */  paddub     $4, $16, $0
/* BD8BC 001BD7BC 08009024 */  addiu      $16, $4, 0x8
/* BD8C0 001BD7C0 2800A58F */  lw         $5, 0x28($sp)
/* BD8C4 001BD7C4 70EE060C */  jal        SetStack__FP12RS_STACKDATAi_2
/* BD8C8 001BD7C8 00000000 */   nop
/* BD8CC 001BD7CC 28260072 */  paddub     $4, $16, $0
/* BD8D0 001BD7D0 2C00A58F */  lw         $5, 0x2C($sp)
/* BD8D4 001BD7D4 70EE060C */  jal        SetStack__FP12RS_STACKDATAi_2
/* BD8D8 001BD7D8 00000000 */   nop
/* BD8DC 001BD7DC 01000224 */  addiu      $2, $0, 0x1
/* BD8E0 001BD7E0 1000BF7B */  lq         $31, 0x10($sp)
/* BD8E4 001BD7E4 0000B07B */  lq         $16, 0x0($sp)
/* BD8E8 001BD7E8 3000BD27 */  addiu      $sp, $sp, 0x30
/* BD8EC 001BD7EC 0800E003 */  jr         $31
/* BD8F0 001BD7F0 00000000 */   nop
/* BD8F4 001BD7F4 00000000 */  nop
/* BD8F8 001BD7F8 00000000 */  nop
/* BD8FC 001BD7FC 00000000 */  nop
