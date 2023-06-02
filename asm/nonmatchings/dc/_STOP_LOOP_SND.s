.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _STOP_LOOP_SND__FP12RS_STACKDATAi
/* E4840 001E4740 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E4844 001E4744 0000BF7F */  sq         $31, 0x0($sp)
/* E4848 001E4748 E09C848F */  lw         $4, -0x6320($gp)
/* E484C 001E474C 9000838C */  lw         $3, 0x90($4)
/* E4850 001E4750 00110300 */  sll        $2, $3, 4
/* E4854 001E4754 21104300 */  addu       $2, $2, $3
/* E4858 001E4758 00110200 */  sll        $2, $2, 4
/* E485C 001E475C 21104400 */  addu       $2, $2, $4
/* E4860 001E4760 0500013C */  lui        $at, (0x5EF5C >> 16)
/* E4864 001E4764 5CEF2134 */  ori        $at, $at, (0x5EF5C & 0xFFFF)
/* E4868 001E4768 21284100 */  addu       $5, $2, $at
/* E486C 001E476C 0000A48C */  lw         $4, 0x0($5)
/* E4870 001E4770 FFFF0224 */  addiu      $2, $0, -0x1
/* E4874 001E4774 04008214 */  bne        $4, $2, .L001E4788
/* E4878 001E4778 00000000 */   nop
/* E487C 001E477C 01000224 */  addiu      $2, $0, 0x1
/* E4880 001E4780 06000010 */  b          .L001E479C
/* E4884 001E4784 00000000 */   nop
.L001E4788:
/* E4888 001E4788 0000A2AC */  sw         $2, 0x0($5)
/* E488C 001E478C 40280300 */  sll        $5, $3, 1
/* E4890 001E4790 2C6A050C */  jal        SndSeStop__Fii
/* E4894 001E4794 00000000 */   nop
/* E4898 001E4798 01000224 */  addiu      $2, $0, 0x1
.L001E479C:
/* E489C 001E479C 0000BF7B */  lq         $31, 0x0($sp)
/* E48A0 001E47A0 1000BD27 */  addiu      $sp, $sp, 0x10
/* E48A4 001E47A4 0800E003 */  jr         $31
/* E48A8 001E47A8 00000000 */   nop
/* E48AC 001E47AC 00000000 */  nop
