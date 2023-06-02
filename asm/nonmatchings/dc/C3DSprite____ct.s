.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__9C3DSpriteFv
/* 83860 00183760 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 83864 00183764 1000BF7F */  sq         $31, 0x10($sp)
/* 83868 00183768 0000B07F */  sq         $16, 0x0($sp)
/* 8386C 0018376C 28868070 */  paddub     $16, $4, $0
/* 83870 00183770 2C0080AC */  sw         $0, 0x2C($4)
/* 83874 00183774 280080AC */  sw         $0, 0x28($4)
/* 83878 00183778 240080AC */  sw         $0, 0x24($4)
/* 8387C 0018377C 200080AC */  sw         $0, 0x20($4)
/* 83880 00183780 A48F050C */  jal        Initialize__9C3DSpriteFv
/* 83884 00183784 00000000 */   nop
/* 83888 00183788 28160072 */  paddub     $2, $16, $0
/* 8388C 0018378C 1000BF7B */  lq         $31, 0x10($sp)
/* 83890 00183790 0000B07B */  lq         $16, 0x0($sp)
/* 83894 00183794 2000BD27 */  addiu      $sp, $sp, 0x20
/* 83898 00183798 0800E003 */  jr         $31
/* 8389C 0018379C 00000000 */   nop
