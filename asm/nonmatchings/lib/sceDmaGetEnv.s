.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDmaGetEnv
/* C798 0010C698 2500033C */  lui        $3, %hi(sceDmaCurrentEnv)
/* C79C 0010C69C 68036824 */  addiu      $8, $3, %lo(sceDmaCurrentEnv)
/* C7A0 0010C6A0 07000569 */  ldl        $5, 0x7($8)
/* C7A4 0010C6A4 0000056D */  ldr        $5, 0x0($8)
/* C7A8 0010C6A8 0F000669 */  ldl        $6, 0xF($8)
/* C7AC 0010C6AC 0800066D */  ldr        $6, 0x8($8)
/* C7B0 0010C6B0 1000078D */  lw         $7, 0x10($8)
/* C7B4 0010C6B4 070085B0 */  sdl        $5, 0x7($4)
/* C7B8 0010C6B8 000085B4 */  sdr        $5, 0x0($4)
/* C7BC 0010C6BC 0F0086B0 */  sdl        $6, 0xF($4)
/* C7C0 0010C6C0 080086B4 */  sdr        $6, 0x8($4)
/* C7C4 0010C6C4 100087AC */  sw         $7, 0x10($4)
/* C7C8 0010C6C8 0800E003 */  jr         $31
/* C7CC 0010C6CC 2D108000 */   daddu     $2, $4, $0
