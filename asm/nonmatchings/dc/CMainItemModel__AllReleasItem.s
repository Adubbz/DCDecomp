.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AllReleasItem__14CMainItemModelFv
/* D4A40 001D4940 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* D4A44 001D4944 2000BF7F */  sq         $31, 0x20($sp)
/* D4A48 001D4948 1000B17F */  sq         $17, 0x10($sp)
/* D4A4C 001D494C 0000B07F */  sq         $16, 0x0($sp)
/* D4A50 001D4950 288E8070 */  paddub     $17, $4, $0
/* D4A54 001D4954 28860070 */  paddub     $16, $0, $0
/* D4A58 001D4958 0E000010 */  b          .L001D4994
/* D4A5C 001D495C 00000000 */   nop
.L001D4960:
/* D4A60 001D4960 80181000 */  sll        $3, $16, 2
/* D4A64 001D4964 21187100 */  addu       $3, $3, $17
/* D4A68 001D4968 4800648C */  lw         $4, 0x48($3)
/* D4A6C 001D496C 01000324 */  addiu      $3, $0, 0x1
/* D4A70 001D4970 03008310 */  beq        $4, $3, .L001D4980
/* D4A74 001D4974 00000000 */   nop
/* D4A78 001D4978 05000010 */  b          .L001D4990
/* D4A7C 001D497C 00000000 */   nop
.L001D4980:
/* D4A80 001D4980 28262072 */  paddub     $4, $17, $0
/* D4A84 001D4984 282E0072 */  paddub     $5, $16, $0
/* D4A88 001D4988 DC51070C */  jal        DeleteModel__14CMainItemModelFi
/* D4A8C 001D498C 00000000 */   nop
.L001D4990:
/* D4A90 001D4990 01001026 */  addiu      $16, $16, 0x1
.L001D4994:
/* D4A94 001D4994 1000032A */  slti       $3, $16, 0x10
/* D4A98 001D4998 F1FF6014 */  bnez       $3, .L001D4960
/* D4A9C 001D499C 00000000 */   nop
/* D4AA0 001D49A0 2000BF7B */  lq         $31, 0x20($sp)
/* D4AA4 001D49A4 1000B17B */  lq         $17, 0x10($sp)
/* D4AA8 001D49A8 0000B07B */  lq         $16, 0x0($sp)
/* D4AAC 001D49AC 3000BD27 */  addiu      $sp, $sp, 0x30
/* D4AB0 001D49B0 0800E003 */  jr         $31
/* D4AB4 001D49B4 00000000 */   nop
/* D4AB8 001D49B8 00000000 */  nop
/* D4ABC 001D49BC 00000000 */  nop
