.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetWait__12CSHOT_EFFECTFi
/* 0AE2C0 001AE1C0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE2C4 001AE1C4 21088100 */  addu        $1, $4, $1
/* 0AE2C8 001AE1C8 50A1268C */  lw          $6, -0x5EB0($1)
/* 0AE2CC 001AE1CC FFFF0324 */  addiu       $3, $0, -0x1
/* 0AE2D0 001AE1D0 0C00C310 */  beq         $6, $3, .L001AE204
/* 0AE2D4 001AE1D4 00000000 */   nop
/* 0AE2D8 001AE1D8 2118C400 */  addu        $3, $6, $4
/* 0AE2DC 001AE1DC 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE2E0 001AE1E0 21086100 */  addu        $1, $3, $1
/* 0AE2E4 001AE1E4 38A125A0 */  sb          $5, -0x5EC8($1)
/* 0AE2E8 001AE1E8 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE2EC 001AE1EC 21088100 */  addu        $1, $4, $1
/* 0AE2F0 001AE1F0 50A1238C */  lw          $3, -0x5EB0($1)
/* 0AE2F4 001AE1F4 21186400 */  addu        $3, $3, $4
/* 0AE2F8 001AE1F8 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE2FC 001AE1FC 21086100 */  addu        $1, $3, $1
/* 0AE300 001AE200 40A120A0 */  sb          $0, -0x5EC0($1)
.L001AE204:
/* 0AE304 001AE204 0800E003 */  jr          $31
/* 0AE308 001AE208 00000000 */   nop
/* 0AE30C 001AE20C 00000000 */  nop
