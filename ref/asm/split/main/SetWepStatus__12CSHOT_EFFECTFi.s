.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetWepStatus__12CSHOT_EFFECTFi
/* 0AE480 001AE380 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE484 001AE384 21088100 */  addu        $1, $4, $1
/* 0AE488 001AE388 50A1268C */  lw          $6, -0x5EB0($1)
/* 0AE48C 001AE38C FFFF0324 */  addiu       $3, $0, -0x1
/* 0AE490 001AE390 0600C310 */  beq         $6, $3, .L001AE3AC
/* 0AE494 001AE394 00000000 */   nop
/* 0AE498 001AE398 80180600 */  sll         $3, $6, 2
/* 0AE49C 001AE39C 21186400 */  addu        $3, $3, $4
/* 0AE4A0 001AE3A0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE4A4 001AE3A4 21086100 */  addu        $1, $3, $1
/* 0AE4A8 001AE3A8 30A025AC */  sw          $5, -0x5FD0($1)
.L001AE3AC:
/* 0AE4AC 001AE3AC 0800E003 */  jr          $31
/* 0AE4B0 001AE3B0 00000000 */   nop
/* 0AE4B4 001AE3B4 00000000 */  nop
/* 0AE4B8 001AE3B8 00000000 */  nop
/* 0AE4BC 001AE3BC 00000000 */  nop
