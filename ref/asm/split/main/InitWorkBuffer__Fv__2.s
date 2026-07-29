.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitWorkBuffer__Fv__2
/* 09BEA0 0019BDA0 D201013C */  lui         $1, %hi(EdNPCBuffer + 0x8)
/* 09BEA4 0019BDA4 58B3258C */  lw          $5, %lo(EdNPCBuffer + 0x8)($1)
/* 09BEA8 0019BDA8 00210500 */  sll         $4, $5, 4
/* 09BEAC 0019BDAC D201013C */  lui         $1, %hi(EdNPCBuffer)
/* 09BEB0 0019BDB0 50B3238C */  lw          $3, %lo(EdNPCBuffer)($1)
/* 09BEB4 0019BDB4 21206400 */  addu        $4, $3, $4
/* 09BEB8 0019BDB8 D201013C */  lui         $1, %hi(EdNPCBuffer + 0xC)
/* 09BEBC 0019BDBC 5CB3238C */  lw          $3, %lo(EdNPCBuffer + 0xC)($1)
/* 09BEC0 0019BDC0 23286500 */  subu        $5, $3, $5
/* 09BEC4 0019BDC4 83190400 */  sra         $3, $4, 6
/* 09BEC8 0019BDC8 01006324 */  addiu       $3, $3, 0x1
/* 09BECC 0019BDCC 80210300 */  sll         $4, $3, 6
/* 09BED0 0019BDD0 D201013C */  lui         $1, %hi(EdWorkBuffer)
/* 09BED4 0019BDD4 C0B324AC */  sw          $4, %lo(EdWorkBuffer)($1)
/* 09BED8 0019BDD8 FCFFA324 */  addiu       $3, $5, -0x4
/* 09BEDC 0019BDDC D201013C */  lui         $1, %hi(EdWorkBuffer + 0xC)
/* 09BEE0 0019BDE0 CCB323AC */  sw          $3, %lo(EdWorkBuffer + 0xC)($1)
/* 09BEE4 0019BDE4 D201013C */  lui         $1, %hi(EdWorkBuffer + 0x8)
/* 09BEE8 0019BDE8 C8B320AC */  sw          $0, %lo(EdWorkBuffer + 0x8)($1)
/* 09BEEC 0019BDEC D201013C */  lui         $1, %hi(EdVillagerBuffer + 0x8)
/* 09BEF0 0019BDF0 68B3238C */  lw          $3, %lo(EdVillagerBuffer + 0x8)($1)
/* 09BEF4 0019BDF4 01006018 */  blez        $3, .L0019BDFC
/* 09BEF8 0019BDF8 00000000 */   nop
.L0019BDFC:
/* 09BEFC 0019BDFC 948B848F */  lw          $4, -0x746C($28)
/* 09BF00 0019BE00 E8FF013C */  lui         $1, (0xFFE80000 >> 16)
/* 09BF04 0019BE04 21188100 */  addu        $3, $4, $1
/* 09BF08 0019BE08 D201013C */  lui         $1, %hi(EdMenuBuffer)
/* 09BF0C 0019BE0C D0B323AC */  sw          $3, %lo(EdMenuBuffer)($1)
/* 09BF10 0019BE10 0300033C */  lui         $3, (0x3A2E0 >> 16)
/* 09BF14 0019BE14 E0A26334 */  ori         $3, $3, (0x3A2E0 & 0xFFFF)
/* 09BF18 0019BE18 D201013C */  lui         $1, %hi(EdMenuBuffer + 0xC)
/* 09BF1C 0019BE1C DCB323AC */  sw          $3, %lo(EdMenuBuffer + 0xC)($1)
/* 09BF20 0019BE20 D201013C */  lui         $1, %hi(EdMenuBuffer + 0x8)
/* 09BF24 0019BE24 D8B320AC */  sw          $0, %lo(EdMenuBuffer + 0x8)($1)
/* 09BF28 0019BE28 0800E003 */  jr          $31
/* 09BF2C 0019BE2C 00000000 */   nop
