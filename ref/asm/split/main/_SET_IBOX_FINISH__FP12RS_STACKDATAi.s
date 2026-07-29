.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_IBOX_FINISH__FP12RS_STACKDATAi
/* 0BD840 001BD740 F0C1043C */  lui         $4, (0xC1F00000 >> 16)
/* 0BD844 001BD744 C89C838F */  lw          $3, -0x6338($28)
/* 0BD848 001BD748 D501013C */  lui         $1, %hi(BtEventInfo + 0xAC)
/* 0BD84C 001BD74C EC67228C */  lw          $2, %lo(BtEventInfo + 0xAC)($1)
/* 0BD850 001BD750 80110200 */  sll         $2, $2, 6
/* 0BD854 001BD754 21104300 */  addu        $2, $2, $3
/* 0BD858 001BD758 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BD85C 001BD75C 21084100 */  addu        $1, $2, $1
/* 0BD860 001BD760 8CB624AC */  sw          $4, -0x4974($1)
/* 0BD864 001BD764 C89C838F */  lw          $3, -0x6338($28)
/* 0BD868 001BD768 D501013C */  lui         $1, %hi(BtEventInfo + 0xAC)
/* 0BD86C 001BD76C EC67228C */  lw          $2, %lo(BtEventInfo + 0xAC)($1)
/* 0BD870 001BD770 80110200 */  sll         $2, $2, 6
/* 0BD874 001BD774 21104300 */  addu        $2, $2, $3
/* 0BD878 001BD778 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BD87C 001BD77C 21084100 */  addu        $1, $2, $1
/* 0BD880 001BD780 84B620AC */  sw          $0, -0x497C($1)
/* 0BD884 001BD784 01000224 */  addiu       $2, $0, 0x1
/* 0BD888 001BD788 0800E003 */  jr          $31
/* 0BD88C 001BD78C 00000000 */   nop
