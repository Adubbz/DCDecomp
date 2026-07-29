.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FishingGetEsaItemNo__Fv
/* 0A9130 001A9030 5093828F */  lw          $2, -0x6CB0($28)
/* 0A9134 001A9034 04004104 */  bgez        $2, .L001A9048
/* 0A9138 001A9038 00000000 */   nop
/* 0A913C 001A903C FFFF0224 */  addiu       $2, $0, -0x1
/* 0A9140 001A9040 07000010 */  b           .L001A9060
/* 0A9144 001A9044 00000000 */   nop
.L001A9048:
/* 0A9148 001A9048 C0180200 */  sll         $3, $2, 3
/* 0A914C 001A904C 2700023C */  lui         $2, %hi(esa_info)
/* 0A9150 001A9050 90AE4224 */  addiu       $2, $2, %lo(esa_info)
/* 0A9154 001A9054 21104300 */  addu        $2, $2, $3
/* 0A9158 001A9058 0000428C */  lw          $2, 0x0($2)
/* 0A915C 001A905C 00000000 */  nop
.L001A9060:
/* 0A9160 001A9060 0800E003 */  jr          $31
/* 0A9164 001A9064 00000000 */   nop
/* 0A9168 001A9068 00000000 */  nop
/* 0A916C 001A906C 00000000 */  nop
