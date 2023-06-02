.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetWait__12CSHOT_EFFECTFi
/* AE2C0 001AE1C0 0100013C */  lui        $at, (0x10000 >> 16)
/* AE2C4 001AE1C4 21088100 */  addu       $at, $4, $at
/* AE2C8 001AE1C8 50A1268C */  lw         $6, -0x5EB0($at)
/* AE2CC 001AE1CC FFFF0324 */  addiu      $3, $0, -0x1
/* AE2D0 001AE1D0 0C00C310 */  beq        $6, $3, .L001AE204
/* AE2D4 001AE1D4 00000000 */   nop
/* AE2D8 001AE1D8 2118C400 */  addu       $3, $6, $4
/* AE2DC 001AE1DC 0100013C */  lui        $at, (0x10000 >> 16)
/* AE2E0 001AE1E0 21086100 */  addu       $at, $3, $at
/* AE2E4 001AE1E4 38A125A0 */  sb         $5, -0x5EC8($at)
/* AE2E8 001AE1E8 0100013C */  lui        $at, (0x10000 >> 16)
/* AE2EC 001AE1EC 21088100 */  addu       $at, $4, $at
/* AE2F0 001AE1F0 50A1238C */  lw         $3, -0x5EB0($at)
/* AE2F4 001AE1F4 21186400 */  addu       $3, $3, $4
/* AE2F8 001AE1F8 0100013C */  lui        $at, (0x10000 >> 16)
/* AE2FC 001AE1FC 21086100 */  addu       $at, $3, $at
/* AE300 001AE200 40A120A0 */  sb         $0, -0x5EC0($at)
.L001AE204:
/* AE304 001AE204 0800E003 */  jr         $31
/* AE308 001AE208 00000000 */   nop
/* AE30C 001AE20C 00000000 */  nop
