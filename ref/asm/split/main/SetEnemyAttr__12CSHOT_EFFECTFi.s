.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetEnemyAttr__12CSHOT_EFFECTFi
/* 0AE3D0 001AE2D0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE3D4 001AE2D4 21088100 */  addu        $1, $4, $1
/* 0AE3D8 001AE2D8 50A1268C */  lw          $6, -0x5EB0($1)
/* 0AE3DC 001AE2DC FFFF0324 */  addiu       $3, $0, -0x1
/* 0AE3E0 001AE2E0 0600C310 */  beq         $6, $3, .L001AE2FC
/* 0AE3E4 001AE2E4 00000000 */   nop
/* 0AE3E8 001AE2E8 80180600 */  sll         $3, $6, 2
/* 0AE3EC 001AE2EC 21186400 */  addu        $3, $3, $4
/* 0AE3F0 001AE2F0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE3F4 001AE2F4 21086100 */  addu        $1, $3, $1
/* 0AE3F8 001AE2F8 10A125AC */  sw          $5, -0x5EF0($1)
.L001AE2FC:
/* 0AE3FC 001AE2FC 0800E003 */  jr          $31
/* 0AE400 001AE300 00000000 */   nop
/* 0AE404 001AE304 00000000 */  nop
/* 0AE408 001AE308 00000000 */  nop
/* 0AE40C 001AE30C 00000000 */  nop
