.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckDefaultWeapon__14CDngStatusDataFi
/* BE5B0 001BE4B0 80180500 */  sll        $3, $5, 2
/* BE5B4 001BE4B4 2700023C */  lui        $2, %hi(defWeapon_3)
/* BE5B8 001BE4B8 30B54224 */  addiu      $2, $2, %lo(defWeapon_3)
/* BE5BC 001BE4BC 21104300 */  addu       $2, $2, $3
/* BE5C0 001BE4C0 0000478C */  lw         $7, 0x0($2)
/* BE5C4 001BE4C4 A80A0224 */  addiu      $2, $0, 0xAA8
/* BE5C8 001BE4C8 1810A200 */  mult       $2, $5, $2
/* BE5CC 001BE4CC 21304400 */  addu       $6, $2, $4
/* BE5D0 001BE4D0 2110A400 */  addu       $2, $5, $4
/* BE5D4 001BE4D4 40434380 */  lb         $3, 0x4340($2)
/* BE5D8 001BE4D8 40110300 */  sll        $2, $3, 5
/* BE5DC 001BE4DC 23104300 */  subu       $2, $2, $3
/* BE5E0 001BE4E0 C0100200 */  sll        $2, $2, 3
/* BE5E4 001BE4E4 21104600 */  addu       $2, $2, $6
/* BE5E8 001BE4E8 0C454284 */  lh         $2, 0x450C($2)
/* BE5EC 001BE4EC 0400E214 */  bne        $7, $2, .L001BE500
/* BE5F0 001BE4F0 00000000 */   nop
/* BE5F4 001BE4F4 28160070 */  paddub     $2, $0, $0
/* BE5F8 001BE4F8 02000010 */  b          .L001BE504
/* BE5FC 001BE4FC 00000000 */   nop
.L001BE500:
/* BE600 001BE500 01000224 */  addiu      $2, $0, 0x1
.L001BE504:
/* BE604 001BE504 0800E003 */  jr         $31
/* BE608 001BE508 00000000 */   nop
/* BE60C 001BE50C 00000000 */  nop
