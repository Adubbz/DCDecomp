.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetVsMonster__12CSHOT_EFFECTFPc
/* 0AE4C0 001AE3C0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE4C4 001AE3C4 21088100 */  addu        $1, $4, $1
/* 0AE4C8 001AE3C8 50A1268C */  lw          $6, -0x5EB0($1)
/* 0AE4CC 001AE3CC FFFF0324 */  addiu       $3, $0, -0x1
/* 0AE4D0 001AE3D0 0600C310 */  beq         $6, $3, .L001AE3EC
/* 0AE4D4 001AE3D4 00000000 */   nop
/* 0AE4D8 001AE3D8 80180600 */  sll         $3, $6, 2
/* 0AE4DC 001AE3DC 21186400 */  addu        $3, $3, $4
/* 0AE4E0 001AE3E0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE4E4 001AE3E4 21086100 */  addu        $1, $3, $1
/* 0AE4E8 001AE3E8 90A025AC */  sw          $5, -0x5F70($1)
.L001AE3EC:
/* 0AE4EC 001AE3EC 0800E003 */  jr          $31
/* 0AE4F0 001AE3F0 00000000 */   nop
/* 0AE4F4 001AE3F4 00000000 */  nop
/* 0AE4F8 001AE3F8 00000000 */  nop
/* 0AE4FC 001AE3FC 00000000 */  nop
