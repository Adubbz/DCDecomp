.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CheckDefaultWeapon__14CDngStatusDataFi
/* 0BE5B0 001BE4B0 80180500 */  sll         $3, $5, 2
/* 0BE5B4 001BE4B4 2700023C */  lui         $2, %hi(defWeapon__3)
/* 0BE5B8 001BE4B8 30B54224 */  addiu       $2, $2, %lo(defWeapon__3)
/* 0BE5BC 001BE4BC 21104300 */  addu        $2, $2, $3
/* 0BE5C0 001BE4C0 0000478C */  lw          $7, 0x0($2)
/* 0BE5C4 001BE4C4 A80A0224 */  addiu       $2, $0, 0xAA8
/* 0BE5C8 001BE4C8 1810A200 */  mult        $2, $5, $2
/* 0BE5CC 001BE4CC 21304400 */  addu        $6, $2, $4
/* 0BE5D0 001BE4D0 2110A400 */  addu        $2, $5, $4
/* 0BE5D4 001BE4D4 40434380 */  lb          $3, 0x4340($2)
/* 0BE5D8 001BE4D8 40110300 */  sll         $2, $3, 5
/* 0BE5DC 001BE4DC 23104300 */  subu        $2, $2, $3
/* 0BE5E0 001BE4E0 C0100200 */  sll         $2, $2, 3
/* 0BE5E4 001BE4E4 21104600 */  addu        $2, $2, $6
/* 0BE5E8 001BE4E8 0C454284 */  lh          $2, 0x450C($2)
/* 0BE5EC 001BE4EC 0400E214 */  bne         $7, $2, .L001BE500
/* 0BE5F0 001BE4F0 00000000 */   nop
/* 0BE5F4 001BE4F4 28160070 */  paddub      $2, $0, $0
/* 0BE5F8 001BE4F8 02000010 */  b           .L001BE504
/* 0BE5FC 001BE4FC 00000000 */   nop
.L001BE500:
/* 0BE600 001BE500 01000224 */  addiu       $2, $0, 0x1
.L001BE504:
/* 0BE604 001BE504 0800E003 */  jr          $31
/* 0BE608 001BE508 00000000 */   nop
/* 0BE60C 001BE50C 00000000 */  nop
