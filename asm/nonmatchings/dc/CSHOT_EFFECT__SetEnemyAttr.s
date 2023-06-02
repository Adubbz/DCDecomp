.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetEnemyAttr__12CSHOT_EFFECTFi
/* AE3D0 001AE2D0 0100013C */  lui        $at, (0x10000 >> 16)
/* AE3D4 001AE2D4 21088100 */  addu       $at, $4, $at
/* AE3D8 001AE2D8 50A1268C */  lw         $6, -0x5EB0($at)
/* AE3DC 001AE2DC FFFF0324 */  addiu      $3, $0, -0x1
/* AE3E0 001AE2E0 0600C310 */  beq        $6, $3, .L001AE2FC
/* AE3E4 001AE2E4 00000000 */   nop
/* AE3E8 001AE2E8 80180600 */  sll        $3, $6, 2
/* AE3EC 001AE2EC 21186400 */  addu       $3, $3, $4
/* AE3F0 001AE2F0 0100013C */  lui        $at, (0x10000 >> 16)
/* AE3F4 001AE2F4 21086100 */  addu       $at, $3, $at
/* AE3F8 001AE2F8 10A125AC */  sw         $5, -0x5EF0($at)
.L001AE2FC:
/* AE3FC 001AE2FC 0800E003 */  jr         $31
/* AE400 001AE300 00000000 */   nop
/* AE404 001AE304 00000000 */  nop
/* AE408 001AE308 00000000 */  nop
/* AE40C 001AE30C 00000000 */  nop
