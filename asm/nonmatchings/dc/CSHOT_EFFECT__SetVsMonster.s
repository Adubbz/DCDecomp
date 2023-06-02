.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetVsMonster__12CSHOT_EFFECTFPc
/* AE4C0 001AE3C0 0100013C */  lui        $at, (0x10000 >> 16)
/* AE4C4 001AE3C4 21088100 */  addu       $at, $4, $at
/* AE4C8 001AE3C8 50A1268C */  lw         $6, -0x5EB0($at)
/* AE4CC 001AE3CC FFFF0324 */  addiu      $3, $0, -0x1
/* AE4D0 001AE3D0 0600C310 */  beq        $6, $3, .L001AE3EC
/* AE4D4 001AE3D4 00000000 */   nop
/* AE4D8 001AE3D8 80180600 */  sll        $3, $6, 2
/* AE4DC 001AE3DC 21186400 */  addu       $3, $3, $4
/* AE4E0 001AE3E0 0100013C */  lui        $at, (0x10000 >> 16)
/* AE4E4 001AE3E4 21086100 */  addu       $at, $3, $at
/* AE4E8 001AE3E8 90A025AC */  sw         $5, -0x5F70($at)
.L001AE3EC:
/* AE4EC 001AE3EC 0800E003 */  jr         $31
/* AE4F0 001AE3F0 00000000 */   nop
/* AE4F4 001AE3F4 00000000 */  nop
/* AE4F8 001AE3F8 00000000 */  nop
/* AE4FC 001AE3FC 00000000 */  nop
