.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_IBOX_FINISH__FP12RS_STACKDATAi
/* BD840 001BD740 F0C1043C */  lui        $4, (0xC1F00000 >> 16)
/* BD844 001BD744 C89C838F */  lw         $3, -0x6338($gp)
/* BD848 001BD748 D501013C */  lui        $at, (0x1D567EC >> 16)
/* BD84C 001BD74C EC67228C */  lw         $2, (0x1D567EC & 0xFFFF)($at)
/* BD850 001BD750 80110200 */  sll        $2, $2, 6
/* BD854 001BD754 21104300 */  addu       $2, $2, $3
/* BD858 001BD758 0100013C */  lui        $at, (0x10000 >> 16)
/* BD85C 001BD75C 21084100 */  addu       $at, $2, $at
/* BD860 001BD760 8CB624AC */  sw         $4, -0x4974($at)
/* BD864 001BD764 C89C838F */  lw         $3, -0x6338($gp)
/* BD868 001BD768 D501013C */  lui        $at, (0x1D567EC >> 16)
/* BD86C 001BD76C EC67228C */  lw         $2, (0x1D567EC & 0xFFFF)($at)
/* BD870 001BD770 80110200 */  sll        $2, $2, 6
/* BD874 001BD774 21104300 */  addu       $2, $2, $3
/* BD878 001BD778 0100013C */  lui        $at, (0x10000 >> 16)
/* BD87C 001BD77C 21084100 */  addu       $at, $2, $at
/* BD880 001BD780 84B620AC */  sw         $0, -0x497C($at)
/* BD884 001BD784 01000224 */  addiu      $2, $0, 0x1
/* BD888 001BD788 0800E003 */  jr         $31
/* BD88C 001BD78C 00000000 */   nop
