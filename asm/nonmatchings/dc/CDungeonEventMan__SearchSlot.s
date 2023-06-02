.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SearchSlot__16CDungeonEventManFv
/* CCA40 001CC940 282E0070 */  paddub     $5, $0, $0
/* CCA44 001CC944 09000010 */  b          .L001CC96C
/* CCA48 001CC948 00000000 */   nop
.L001CC94C:
/* CCA4C 001CC94C 80110500 */  sll        $2, $5, 6
/* CCA50 001CC950 21104400 */  addu       $2, $2, $4
/* CCA54 001CC954 3C00438C */  lw         $3, 0x3C($2)
/* CCA58 001CC958 03006014 */  bnez       $3, .L001CC968
/* CCA5C 001CC95C 00000000 */   nop
/* CCA60 001CC960 06000010 */  b          .L001CC97C
/* CCA64 001CC964 00000000 */   nop
.L001CC968:
/* CCA68 001CC968 0100A524 */  addiu      $5, $5, 0x1
.L001CC96C:
/* CCA6C 001CC96C 4000A228 */  slti       $2, $5, 0x40
/* CCA70 001CC970 F6FF4014 */  bnez       $2, .L001CC94C
/* CCA74 001CC974 00000000 */   nop
/* CCA78 001CC978 28160070 */  paddub     $2, $0, $0
.L001CC97C:
/* CCA7C 001CC97C 0800E003 */  jr         $31
/* CCA80 001CC980 00000000 */   nop
/* CCA84 001CC984 00000000 */  nop
/* CCA88 001CC988 00000000 */  nop
/* CCA8C 001CC98C 00000000 */  nop
